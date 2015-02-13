require 'rails_helper'

RSpec.describe SupportsController, type: :controller do

let(:ticket)   { create(:ticket) }
  let(:ticket_1) { create(:ticket) }

  describe "#new" do
  
      it "renders a new template" do
        get :new
        expect(response).to render_template(:new)
      end
      it "assigns a new ticket instance" do
        get :new
        expect(assigns(:ticket)).to be_a_new(Support)
      end
  end

  describe "#create" do

      context "with valid parameters" do
        def valid_request
          post :create, {ticket: {name: "valid title",
                          message: "valid desc",
                          email: "derekbarker95@gmail.com",
                          department: "Sales",
                        }}
        end

        it "adds a ticket to the database" do
          expect { valid_request }.to change { ticket.count }.by(1)
        end

        it "redirect to campaign show page" do
          valid_request
          expect(response).to redirect_to(supports_path(Support.last))
        end


      end

      context "with invalid parameters" do
        def invalid_request
          post :create, {ticket: {name: "",
                          message: "valid desc",
                          email: "derekbarker95@gmail.com",
                          department: "Sales",
                        }}
        end
        it "doesn't create a record in the database" do
          expect { invalid_request }.not_to change {Support.count}
        end

        it "renders the new template" do
          invalid_request
          expect(response).to render_template(:new)
        end

      end

  end

  
  describe "#destroy" do
    let!(:campaign)   { create(:campaign, user: user) }
    context "with signed in user" do
      before { login(user) }
      context "deleting own campaign" do
        it "deletes the campaign from the database" do
          expect { delete :destroy, id: campaign.id }.to change { Campaign.count }.by(-1)
        end
        it "redirect to the home page (root path)" do
          delete :destroy, id: campaign.id
          expect(response).to redirect_to root_path
        end
        it "sets a flash message" do
          delete :destroy, id: campaign.id
          expect(flash[:notice]).to be
        end
      end

      context "deleting non-owned campaign" do
        it "throws an error" do
          expect { delete :destroy, id: campaign_1.id }.to raise_error
        end
      end
    end

    context "with no signed in user" do
      it "redirect to sign in page" do
        delete :destroy, id: campaign.id
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

end
