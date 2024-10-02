require 'rails_helper'

RSpec.describe SubjectsController, type: :controller do
  let!(:subject) { create(:subject) }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
      expect(assigns(:subjects)).to include(subject)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
      expect(assigns(:subject)).to be_a_new(Subject)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_attributes) { { subject: { name: "New Subject" } } }

      it "creates a new Subject" do
        expect {
          post :create, params: valid_attributes
        }.to change(Subject, :count).by(1)
      end

      it "redirects to the new subject" do
        post :create, params: valid_attributes
        expect(response).to redirect_to(Subject.last)
        expect(flash[:notice]).to eq("Subject was successfully created.")
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:new_attributes) { { subject: { name: "Updated Subject" } } }

      it "updates the requested subject" do
        patch :update, params: { id: subject.id, subject: new_attributes[:subject] }
        subject.reload
        expect(subject.name).to eq("Updated Subject")
      end

      it "redirects to the subject" do
        patch :update, params: { id: subject.id, subject: new_attributes[:subject] }
        expect(response).to redirect_to(subject)
        expect(flash[:notice]).to eq("Subject was successfully updated.")
      end
    end
  end
end