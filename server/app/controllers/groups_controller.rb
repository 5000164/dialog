class GroupsController < ApplicationController
  def index
    user_id = params.require(:user_id)
    groups = UserGroup.where(user_id: user_id).map { |user_group| user_group.group_id }
    render status: 200, json: { groups: groups }
  end
end
