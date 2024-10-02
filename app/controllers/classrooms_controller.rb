class ClassroomsController < ApplicationController
  before_action :set_classroom, only: %i[ show edit update destroy ]

  def index
    @classrooms = Classroom.all
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      redirect_to @classroom, notice: "Classroom was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @classroom.update(classroom_params)
      redirect_to @classroom, notice: "Classroom was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @classroom.destroy!

    redirect_to classrooms_path, status: :see_other, notice: "Classroom was successfully destroyed."
  end

  private
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    def classroom_params
      params.require(:classroom).permit(:name, :description, :school_id, subject_ids: [])
    end
end
