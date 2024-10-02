class StudentGroupsController < ApplicationController
  before_action :set_student_group, only: %i[ show edit update destroy ]

  def index
    @student_groups = StudentGroup.all
  end

  def new
    @student_group = StudentGroup.new
  end

  def create
    @student_group = StudentGroup.new(student_group_params)

    if @student_group.save
      redirect_to @student_group, notice: "Student group was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @student_group.update(student_group_params)
      redirect_to @student_group, notice: "Student group was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student_group.destroy!

    redirect_to student_groups_path, status: :see_other, notice: "Student group was successfully destroyed."
  end

  private
    def set_student_group
      @student_group = StudentGroup.find(params[:id])
    end

    def student_group_params
      params.require(:student_group).permit(:name, :school_id)
    end
end
