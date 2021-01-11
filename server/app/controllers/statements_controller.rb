class StatementsController < ApplicationController
  def index
    statements_params = params.permit(:group_id).tap { |p| p.require(:group_id) }.to_h
    group_id = statements_params[:group_id].to_i
    statements = Statement.where(group_id: group_id).map { |statement| statement.content }
    render status: 200, json: { statements: statements }
  end

  def create
    statements_params = params.permit(:group_id, :user_id, :content).tap { |p| p.require([:group_id, :user_id, :content]) }.to_h
    group_id = statements_params[:group_id].to_i
    user_id = statements_params[:user_id].to_i
    content = statements_params[:content]
    statement = Statement.new(user_id: user_id, group_id: group_id, content: content)
    statement.save
    head 201
  end
end
