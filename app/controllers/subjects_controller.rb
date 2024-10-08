class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to @subject, notice: "Subject was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
      if @subject.update(subject_params)
        redirect_to @subject, notice: "Subject was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @subject.destroy!

    redirect_to subjects_path, status: :see_other, notice: "Subject was successfully destroyed."
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:name)
    end
end
