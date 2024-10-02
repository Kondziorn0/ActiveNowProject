class ApplicationController < ActionController::Base
  include CrudActions
  before_action :authenticate_user! unless :home_page_controller?
  before_action :authorize_user!, only: %i[ new edit create update destroy ] unless :home_page_controller?
  allow_browser versions: :modern

  private
    def home_page_controller?
      self.class == HomePageController
    end

    def authorize_user!
      unless current_user.admin? || current_user.teacher?
        redirect_to lessons_path, alert: "You are not authorized to access this page."
      end
    end
end
