require 'httparty'
require 'md5'

module Integrity
  class Notifier
    class Notifyio < Notifier::Base
      attr_reader :config

      def self.to_haml
        @haml ||= File.read(File.dirname(__FILE__) + "/config.haml")
      end

      def deliver!
        post(config['email'], config['api_key'], short_message, full_message)
      end

      def to_s
        'Notifyio'
      end
      
      private
      
      def post(emails, api_key, title, body)
        return if emails.nil? || email.empty? || api_key.nil? || api_key.empty?
        emails.split(',').each do |email|
          email_hash = MD5.hexdigest(email.strip!)
          HTTParty.post "http://api.notify.io/v1/notify/#{email_hash}",   :headers => {'content-type' => 'application/x-www-form-urlencoded'},
                                                                          :body => {:api_key => api_key},
                                                                          :query => {
                                                                                      :api_key => api_key,
                                                                                      :title => title,
                                                                                      :text => body
                                                                                    }
          
        end
      end
      
    end

    register Notifyio
  end
end
