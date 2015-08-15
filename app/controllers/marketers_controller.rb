class MarketersController < ApplicationController
  before_action :set_marketer, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @marketers = Marketer.paginate(page: params[:page], per_page: 3)
  end
  
  def new
    @marketer = Marketer.new
  end
  
  def create
    @marketer = Marketer.new(marketer_params)
    if @marketer.save
      flash[:success] = "Your account has been created succesfully"
      session[:marketer_id] = @marketer.id
      redirect_to ideas_path
    else
      render 'new'
    end
  end
  
  def edit
    @marketer = Marketer.find(params[:id])
  end
  
  def update
    if @marketer.update(marketer_params)
      flash[:success] = "Your profile has been updated succesfully"
      redirect_to marketer_path(@marketer)
    else
      render 'edit'
    end
  end
  
  def show
    @marketer = Marketer.find(params[:id])
    @ideas = @marketer.ideas.paginate(page: params[:page], per_page: 3)
  end
  
  private
  
    def marketer_params
      params.require(:marketer).permit(:marketername, :email, :password)  
    end
    
    def set_marketer
      @marketer = Marketer.find(params[:id])
    end
    
    def require_same_user
      if current_user != @marketer
        flash[:danger] = "You can only edit your own profile"
        redirect_to root_path
      end
    end
end