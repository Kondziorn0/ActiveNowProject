class SchoolsController < ApplicationController
  before_action :set_school, only: %i[ show edit update destroy ]

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to @school, notice: "School was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @school.update(school_params)
      redirect_to @school, notice: "School was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @school.destroy!

    redirect_to schools_path, status: :see_other, notice: "School was successfully destroyed."
  end

  private
    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :localization, :description)
    end
end
