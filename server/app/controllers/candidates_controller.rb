class CandidatesController < ApplicationController
  def create
    user_id = params.require(:user_id)
    candidate = Candidate.new(user_id: user_id)
    candidate.save
    head 201
  end
end
