module CrudActions
  # Module to shere basic actions where don't need addtional informations
  # or something similiar
  # This module is inherited to every controler by the ApplicationController
  extend ActiveSupport::Concern

  def index; end
  def show; end
  def edit; end
end
