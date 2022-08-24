require "rails_helper"

RSpec.describe Subscriber, type: :model do

  describe Subscriber do
    let(:valid_subscriber) { Subscriber.create(name: "Danika Silva",
                                              email: "danika@beehiiv.com",
                                              status: "active") }
    let(:invalid_subscriber) { Subscriber.create(name: "Danika Silva",
                                              email: "danikabeehiiv",
                                              status: "active") }

    it "persists a subscriber when the user data is valid" do
      valid_subscriber
      expect(valid_subscriber).to be_present
    end
    it "does not persist a subscriber when the user inputs an invalid email" do
      expect { valid_subscriber.update!(email: "danikabeehiiv") }.to raise_error
    end
    it "does not persist a subscriber when the user does not input a name" do
      expect { valid_subscriber.update!(name: nil) }.to raise_error
    end
  end
end
