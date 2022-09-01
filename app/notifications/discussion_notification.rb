# To deliver this notification:
#
# DiscussionNotification.with(post: @post).deliver_later(current_user)
# DiscussionNotification.with(post: @post).deliver(current_user)

class DiscussionNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @project    = Project.find(params[:discussion][:project_id])
    @discussion = Discussion.find(params[:discuccion][:id])
    @user       = User.find(@discussion.user_id) 
    "#{@user.email} commented on #{@project.title.truncate(10)}"
  end
  #
  def url
    project_path(Project.find(params[:discussion][:project_id]))
  end
end
