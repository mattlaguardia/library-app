class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]

  def index
    ## grabs all the users in the database ##
    ## renders the symbol index which is our index page ##
    ## rules for instance variable or local variable - if we only need the local - then just use the local ##
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  # def create
  #   ## allows us to choose which attributes should be updated for mass updating and permit acts as a limiter ##
  #   user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
  #   @user = User.create(user_params)
  #
  #   redirect_to '/users'
  # end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user = User.create(user_params)
    login(@user)
    redirect_to "/users/#{@user.id}"
  end

end
