require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do
  let!(:classroom) { create(:classroom) }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
      expect(assigns(:classrooms)).to include(classroom)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
      expect(assigns(:classroom)).to be_a_new(Classroom)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_attributes) { { classroom: { name: "New Classroom", description: "A description", school_id: school.id } } }
      let!(:school) { create(:school) }

      it "creates a new Classroom" do
        expect {
          post :create, params: valid_attributes
        }.to change(Classroom, :count).by(1)
      end

      it "redirects to the new classroom" do
        post :create, params: valid_attributes
        expect(response).to redirect_to(Classroom.last)
        expect(flash[:notice]).to eq("Classroom was successfully created.")
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { classroom: { name: "", description: "", school_id: nil } } }

      it "does not create a new Classroom" do
        expect {
          post :create, params: invalid_attributes
        }.not_to change(Classroom, :count)
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
      let(:new_attributes) { { classroom: { name: "Updated Classroom" } } }

      it "updates the requested classroom" do
        patch :update, params: { id: classroom.id, classroom: new_attributes[:classroom] }
        classroom.reload
        expect(classroom.name).to eq("Updated Classroom")
      end

      it "redirects to the classroom" do
        patch :update, params: { id: classroom.id, classroom: new_attributes[:classroom] }
        expect(response).to redirect_to(classroom)
        expect(flash[:notice]).to eq("Classroom was successfully updated.")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested classroom" do
      classroom
      expect {
        delete :destroy, params: { id: classroom.id }
      }.to change(Classroom, :count).by(-1)
    end

    it "redirects to the classrooms list" do
      delete :destroy, params: { id: classroom.id }
      expect(response).to redirect_to(classrooms_path)
      expect(flash[:notice]).to eq("Classroom was successfully destroyed.")
    end
  end
end
