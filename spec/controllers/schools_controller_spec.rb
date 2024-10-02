require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  let!(:school) { create(:school) }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
      expect(assigns(:schools)).to include(school)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
      expect(assigns(:school)).to be_a_new(School)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_attributes) { { school: { name: "New School", localization: "New Location", description: "New Description" } } }

      it "creates a new School" do
        expect {
          post :create, params: valid_attributes
        }.to change(School, :count).by(1)
      end

      it "redirects to the new school" do
        post :create, params: valid_attributes
        expect(response).to redirect_to(School.last)
        expect(flash[:notice]).to eq("School was successfully created.")
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:new_attributes) { { school: { name: "Updated School" } } }

      it "updates the requested school" do
        patch :update, params: { id: school.id, school: new_attributes[:school] }
        school.reload
        expect(school.name).to eq("Updated School")
      end

      it "redirects to the school" do
        patch :update, params: { id: school.id, school: new_attributes[:school] }
        expect(response).to redirect_to(school)
        expect(flash[:notice]).to eq("School was successfully updated.")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested school" do
      school
      expect {
        delete :destroy, params: { id: school.id }
      }.to change(School, :count).by(-1)
    end

    it "redirects to the schools list" do
      delete :destroy, params: { id: school.id }
      expect(response).to redirect_to(schools_path)
      expect(flash[:notice]).to eq("School was successfully destroyed.")
    end
  end
end
