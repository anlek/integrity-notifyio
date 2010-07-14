require 'httparty'
require 'md5'
module Integrity
  class Notifier
    class NotifyioClient
      def self.post(emails, api_key, title, body)
        emails.split(',').each do |email|
          email_hash = MD5.hexdigest(email.strip!)
          HTTParty.post "http://api.notify.io/v1/notify/#{email_hash}?api_key=#{api_key}", :body => {
                                                                                                      :type => 'regular',
                                                                                                      :title => title,
                                                                                                      :body => body,
                                                                                                      :generator => 'integrity-notifyio notifier' 
                                                                                                    }
          
        end
      end
    end
  end
end
