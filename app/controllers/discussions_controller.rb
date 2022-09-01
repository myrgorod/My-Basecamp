class DiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
    @discussion = @project.discussions.create(discussion_params)
    @discussion.user = current_user
    if @discussion.save
      flash[:notice]= 'Discussion has been created'
      redirect_to project_path(@project)
    else
      flash[:alert]='Discussion has not created'
      redirect_to project_path(@project)
    end
  end

  def update 
    @discussion = @project.discussions.find(params[:id])
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html{redirect_to project_url(@project), notice: 'Discussion has been updated.'}
      else
        format.html{redirect_to project_url(@project), alert: 'Discussion was not updated.'}
      end
    end
  end

  def destroy
    @discussion = @project.discussions.find(params[:id])
    @discussion.destroy
    redirect_to project_path(@project)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def discussion_params
    params.require(:discussion).permit(:body)
  end
end
