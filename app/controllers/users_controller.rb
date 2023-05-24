class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :show, :edit, :update, :destroy ]
  before_action :chk_admin

  def index
    @users = User.all.eager_load(:tasks).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to @user, flash: { notice: 'Success Create' }
    else
      redirect_to new_user_path, flash: { error: 'Failed Create' }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, flash: { notice: 'Success Changes' }
    else
      redirect_to new_user_path, flash: { error: 'Failed Changes' }
    end
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy!
      redirect_to user_index_path, notice: "Success Delete"
    else
      redirect_to user_index_path, alert: "Failed Delete"
    end
  end
  private 
  def user_params
    patams.require(:user).permit(:email, :role)
  end
  
  def chk_admin
    render_404 if !current_user.is_admin?
  end

  def render_404
    render template: 'static_pages/error', status: 404, layout: 'application', content_type: 'text/html'
  end
end
