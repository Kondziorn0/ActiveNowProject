require 'rails_helper'

RSpec.describe LessonsController, type: :controller do
  let!(:student_group) { create(:student_group) }
  let!(:user) { create(:user) }
  let!(:classroom) { create(:classroom) }
  let!(:subject) { create(:subject) }
  let!(:lesson) { create(:lesson, student_group: student_group, user: user, classroom: classroom, subject: subject) }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
      expect(assigns(:lessons)).to include(lesson)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
      expect(assigns(:lesson)).to be_a_new(Lesson)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_attributes) { { lesson: { title: "New Lesson", description: "Lesson description", start_time: Time.zone.now, end_time: Time.zone.now + 1.hour, student_group_id: lesson.student_group_id, user_id: lesson.user_id, classroom_id: lesson.classroom_id, subject_id: lesson.subject_id } } }

      it "creates a new Lesson" do
        expect {
          post :create, params: valid_attributes
        }.to change(Lesson, :count).by(1)
      end

      it "redirects to the new lesson" do
        post :create, params: valid_attributes
        expect(response).to redirect_to(Lesson.last)
        expect(flash[:notice]).to eq("Lesson was successfully created.")
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { lesson: { title: "", description: "", start_time: nil, end_time: nil } } }

      it "does not create a new Lesson" do
        expect {
          post :create, params: invalid_attributes
        }.not_to change(Lesson, :count)
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
      let(:new_attributes) { { lesson: { title: "Updated Lesson" } } }

      it "updates the requested lesson" do
        patch :update, params: { id: lesson.id, lesson: new_attributes[:lesson] }
        lesson.reload
        expect(lesson.title).to eq("Updated Lesson")
      end

      it "redirects to the lesson" do
        patch :update, params: { id: lesson.id, lesson: new_attributes[:lesson] }
        expect(response).to redirect_to(lesson)
        expect(flash[:notice]).to eq("Lesson was successfully updated.")
      end
    end
  end
end
