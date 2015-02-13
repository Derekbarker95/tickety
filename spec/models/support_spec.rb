require 'rails_helper'

RSpec.describe Support, type: :model do

  describe "Validations" do

    def ticket_attributes(new_attributes)
      valid_attributes = {name: "valid title",
                          message: "valid desc",
                          email: "derekbarker95@gmail.com",
                          department: "Sales",
                        }
      valid_attributes.merge(new_attributes)
    end

    it "requires a title" do
      ticket = Support.new(ticket_attributes({name: nil}))
      expect(ticket).to be_invalid
    end

    it "requires a message" do
      ticket = Support.new(ticket_attributes({message: nil}))
      expect(ticket).to be_invalid
    end

    it "requires a email" do
      ticket = Support.new(ticket_attributes({email: nil}))
      expect(ticket).to be_invalid
    end

  end

end#for RSpec
