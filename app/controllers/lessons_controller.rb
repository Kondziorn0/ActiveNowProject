class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]

  def index
    @lessons = Lesson.where("start_time < ?", Date.beginning_of_week)
    @lessons_today = @lessons.where(start_time: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to @lesson, notice: "Lesson was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to @lesson, notice: "Lesson was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson.destroy!

    redirect_to lessons_path, status: :see_other, notice: "Lesson was successfully destroyed."
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:title, :description, :start_time, :end_time, :student_group_id, :user_id, :classroom_id, :subject_id)
    end
end
