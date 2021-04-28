class Api::V1::UserVotesController < ApplicationController
  def create
    user_vote = UserVote.new(secure_params)
    user_vote.review = Post.find(params[:post_id])

    if user_vote.save
      render json: { user_vote: user_vote.review.score }
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
    end
  end

  def destroy
  end

  private
    def secure_params
      params.require(:user_votes).permit(:user, :review)
    end
  end
end