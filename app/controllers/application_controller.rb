class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def group_joined?
    group = Group.find_by(id: params[:group_id])
    if group.users.where(id: current_user.id).present?
    else
      redirect_to group, notice: 'グループに参加していなければそのアクションはできません'
    end
  end
end
