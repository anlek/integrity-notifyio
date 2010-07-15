require 'test_helper'
require 'integrity/notifier/test'
require 'integrity/notifier/notifyio'

begin
  require "redgreen"
rescue LoadError
end

class IntegrityNotifyioTest < Test::Unit::TestCase
  include Integrity::Notifier::Test

  def notifier
    "Notifyio"
  end

  context "A notifyio-based notifier" do
    setup { setup_database }

    should "register itself" do
      assert_equal Integrity::Notifier::Notifyio, 
                   Integrity::Notifier.available["Notifyio"]
    end

    should "have a configuration form" do
      assert_form_have_option "email",    "foo@example.org"
      assert_form_have_option "api_key",  "key123"
    end

    [:successful, :failed, :pending].each do |status|
      should "post a notification to notify.io after completing a #{status} build" do
        commit = Integrity::Commit.gen(status)
        config = { :email => "foo@example.org", :api_key => "key123" }
        notifier = Integrity::Notifier::Notifyio.new(commit, config)

        mock(Integrity::Notifier::Notifyio).post(config['email'], config['api_key'], notifier.short_message, notifier.full_message)

        notifier.deliver!
      end
    end
  end
end
