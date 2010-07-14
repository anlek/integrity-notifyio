require File.dirname(__FILE__) + '/notifyio_client.rb'

module Integrity
  class Notifier
    class Notifyio < Notifier::Base
      attr_reader :config

      def self.to_haml
        @haml ||= File.read(File.dirname(__FILE__) + "/config.haml")
      end

      def deliver!
        NotifyioClient.post(config['email'], config['api_key'], short_message, full_message)
      end

      def to_s
        'Notifyio'
      end
    end

    register Notifyio
  end
end
