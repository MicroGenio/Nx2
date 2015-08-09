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
        @idea.marketer = Marketer.find(1)
        
        if @idea.save
            flash[:success] = "Your idea was created succesfully!"
            redirect_to ideas_path
        else
         render :new
        end
    end
    
    def edit
        @idea = Idea.find(params[:id])
    end
    
    def update
        @idea = Idea.find(params[:id])
        if @idea.update(idea_params)
            #do something
            flash[:success] = "Your Idea was updated succesfully!"
            redirect_to idea_path(@idea)
        else
         render :edit
        end
    end
    
    private
        
        def idea_params
         params.require(:idea).permit(:name, :summary, :description, :picture)
        end
end