class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.update_attribute(:name, @user.name.capitalize)
      log_in(@user)
      flash[:success] = "You've successfully signed up!"
      redirect_to @user
    else
      flash.now[:danger] = 'Unsuccessful sign up.'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
    @upcoming_events = @user.upcoming_events
    @prev_events = @user.previous_events
    @invited_events = @user.attended_events.where('pending')
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
