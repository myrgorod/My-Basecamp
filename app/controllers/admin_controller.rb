class AdminController < ApplicationController
  def index
  end

  def projects
    @projects = Project.all.includes(:user, :discussions)
  end

  def discussions
  end

  def users
  end

  def show_project
    @project = Project.includes(:user, :discussions).find(params[:id])
  end
end
