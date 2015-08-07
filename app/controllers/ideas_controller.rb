class IdeasController < ApplicationController
    
    def index
        @ideas = Idea.all    
    end
    
    def show
        @idea = Idea.find(params[:id])
    end

    def new
        @idea = Idea.new
    end
  
    def create
        @idea = Idea.new(idea_params)
        @idea.chef = current_user
    
        if @idea.save
        flash[:success] = "Your idea was created succesfully!"
        redirect_to ideas_path
    else
        render :new
        end
    end
  
    def edit
    
    end
  
    def update
        if @idea.update(idea_params)
        flash[:success] = "Your idea was updated succesfully!"
        redirect_to idea_path(@idea)
    else
        render :edit
        end
    end
  
    def like
     like = Like.create(like: params[:like], marketer: current_user, idea: @idea)
     if like.valid?
      flash[:success] = "Your selection was succesful"
      redirect_to :back
     else
      flash[:danger] = "You can only like/dislike a idea once"
      redirect_to :back
     end
    end
  
    def destroy
        Idea.find(params[:id]).destroy
        flash[:success] = "Idea Deleted"
        redirect_to ideas_path
    end
  
    private
  
    def idea_params
      params.require(:idea).permit(:name, :summary, :description, :picture, ingredient_ids:[], style_ids:[])
    end
    
    def set_idea
      @idea = Idea.find(params[:id])
    end
    
    def require_same_user
      if current_user != @idea.marketer and !current_user.admin?
        flash[:danger] = "You can only edit your own ideas"
        redirect_to ideas_path
      end
    end
  
    def require_user_like
        if !logged_in?
        flash[:danger] = "You must be logged in to perform that action"
        redirect_to :back
        end
    end
  
  
  def admin_user
      redirect_to ideas_path unless current_user.admin?
  end
  
end
