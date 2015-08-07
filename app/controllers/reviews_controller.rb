class ReviewsController < ApplicationController
  before_action :require_user, except: [:show]
    
    def create
      @idea = Idea.find(params[:recipe_id])
      @review = @idea.reviews.new(review_params)
      @review.marketer = current_user
      
      respond_to do |format|
        if @review.save
          format.html { redirect_to @idea, notice: 'Your Review was successfully created.' }
        else
          flash[:danger] = "Your review must be between 10 and 500 characters long."
          format.html {redirect_to :back}
        end
      end
    end
  
  private
    def review_params
      params.require(:review).permit(:recipe_id, :body, :chef_id)
    end
  
end