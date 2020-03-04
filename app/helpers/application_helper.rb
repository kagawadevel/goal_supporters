module ApplicationHelper

  def already_joined?
    if UserGroupRelation.find_by(user_id: current_user.id, group_id: group.id)
      true
    else
      false
    end
  end
end
