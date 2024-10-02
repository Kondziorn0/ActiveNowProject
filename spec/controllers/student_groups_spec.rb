require 'rails_helper'

RSpec.describe StudentGroupsController, type: :controller do
  let!(:student_group) { create(:student_group) }
  let(:valid_attributes) { { student_group: { name: "New Student Group", school_id: student_group.school_id } } }
  let(:invalid_attributes) { { student_group: { name: "", school_id: nil } } }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
      expect(assigns(:student_groups)).to include(student_group)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
      expect(assigns(:student_group)).to be_a_new(StudentGroup)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new StudentGroup" do
        expect {
          post :create, params: valid_attributes
        }.to change(StudentGroup, :count).by(1)
      end

      it "redirects to the new student_group" do
        post :create, params: valid_attributes
        expect(response).to redirect_to(StudentGroup.last)
        expect(flash[:notice]).to eq("Student group was successfully created.")
      end
    end

    context "with invalid parameters" do
      it "does not create a new StudentGroup" do
        expect {
          post :create, params: invalid_attributes
        }.not_to change(StudentGroup, :count)
      end

      it "renders the new template with unprocessable entity status" do
        post :create, params: invalid_attributes
        expect(response).to render_template(:new)
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:new_attributes) { { student_group: { name: "Updated Student Group" } } }

      it "updates the requested student_group" do
        patch :update, params: { id: student_group.id, student_group: new_attributes[:student_group] }
        student_group.reload
        expect(student_group.name).to eq("Updated Student Group")
      end

      it "redirects to the student_group" do
        patch :update, params: { id: student_group.id, student_group: new_attributes[:student_group] }
        expect(response).to redirect_to(student_group)
        expect(flash[:notice]).to eq("Student group was successfully updated.")
      end
    end

    context "with invalid parameters" do
      it "does not update the student_group" do
        patch :update, params: { id: student_group.id, student_group: invalid_attributes[:student_group] }
        student_group.reload
        expect(student_group.name).not_to eq("")
      end

      it "renders the edit template with unprocessable entity status" do
        patch :update, params: { id: student_group.id, student_group: invalid_attributes[:student_group] }
        expect(response).to render_template(:edit)
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested student_group" do
      student_group
      expect {
        delete :destroy, params: { id: student_group.id }
      }.to change(StudentGroup, :count).by(-1)
    end

    it "redirects to the student_groups list" do
      delete :destroy, params: { id: student_group.id }
      expect(response).to redirect_to(student_groups_path)
      expect(flash[:notice]).to eq("Student group was successfully destroyed.")
    end
  end
end
