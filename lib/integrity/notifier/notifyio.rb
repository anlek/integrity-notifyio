require 'httparty'
require 'md5'

module Integrity
  class Notifier
    class Notifyio < Notifier::Base
      attr_reader :config

      def self.to_haml
        @haml ||= File.read(File.dirname(__FILE__) + "/notifyio.haml")
      end

      def deliver!
        post(config['email'], config['api_key'], short_message, full_message, :link => build_url) if announce_build?
      end

      def to_s
        'Notifyio'
      end
      
      #######
      private
      #######
      
      def short_message
        "#{build.project.name} :: #{build.human_status}"
      end
      
      def full_message
        msg = []
        msg << "== #{build.failed? ? "Failed" : "Passed!"} =="
        msg << ''
        msg << "Commit Author: #{build.commit.author.name}"
        msg << "Commit Date: #{build.commit.committed_at}"
        msg << "Commit Message: #{build.commit.message}"
        msg << ''
        msg << "Link: #{build_url}"
        
        msg.join("\n")
      end
      
      def post(emails, api_key, title, body, options={})
        return if emails.nil? || emails.empty? || api_key.nil? || api_key.empty?
        emails.split(',').each do |email|
          email_hash = MD5.hexdigest(email.strip)
          HTTParty.post "http://api.notify.io/v1/notify/#{email_hash}",   :headers => {'content-type' => 'application/x-www-form-urlencoded'},
                                                                          :body => {:api_key => api_key},
                                                                          :query => {
                                                                                      :api_key => api_key,
                                                                                      :title => title,
                                                                                      :text => body,
                                                                                      :link => options[:link]
                                                                                    }
          
        end
      end
      
      def announce_build?
        build.failed? || config["announce_success"]
      end
      
    end

    register Notifyio
  end
end
