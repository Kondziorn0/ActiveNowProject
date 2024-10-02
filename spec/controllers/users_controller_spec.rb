require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
      expect(assigns(:users)).to include(user)
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:new_attributes) { { user: { name: "Updated Name", surname: "Updated Surname" } } }

      it "updates the requested user" do
        patch :update, params: { id: user.id }.merge(new_attributes)
        user.reload
        expect(user.name).to eq("Updated Name")
        expect(user.surname).to eq("Updated Surname")
      end

      it "redirects to the user" do
        patch :update, params: { id: user.id }.merge(new_attributes)
        expect(response).to redirect_to(user)
        expect(flash[:notice]).to eq("user was successfully updated.")
      end
    end

    context "with invalid parameters" do
      it "does not update the user" do
        patch :update, params: { id: user.id, user: { name: nil } }
        user.reload
        expect(user.name).not_to be_nil
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user
      expect {
        delete :destroy, params: { id: user.id }
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to(users_path)
      expect(flash[:notice]).to eq("user was successfully destroyed.")
    end
  end
end