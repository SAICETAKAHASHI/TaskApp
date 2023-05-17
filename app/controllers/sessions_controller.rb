class SessionsController < ApplicationController
  def new
    
  end

  def create
    respond_to do |format|

      user = User.find_by(user_name: params[:session][:user_name])
      password = params[:session][:password]
      #binding.pry
      if user && user.authenticate(password)
        log_in user
        #ユーザーを絞ってタスク一覧を表示させたい
        format.html { redirect_to "/tasks", notice: "" }
      else
        format.html { redirect_to '', notice: "ユーザー名又はパスワードが違います" }
      end
    end
  end

  def destroy
  end
end
