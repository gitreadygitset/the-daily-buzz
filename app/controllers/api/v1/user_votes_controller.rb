class Api::V1::UserVotesController < ApplicationController
  def create

    user_vote = UserVote.new(secure_params)
    review = Review.find(params[:review_id])
    user_vote.vote_value = (params[:value])
    user_vote.user = User.find(current_user.id)
    user_vote.review = review

    review.update(score: review.score + user_vote.vote_value)

    if user_vote.save
      render json: { review_score: user_vote.review.score }
    else
      render json: { error: user_vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
    def secure_params
      params.require(:user_vote).permit(:review_id)
    end
  
end