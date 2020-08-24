class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, succcess: 'ログイン成功'
    else
      flash.now[:danger] = "ログイン失敗"
      render :new
    end
  end
  
  private
  def log_in(user)
    session[:user_id] =user.id
  end
end
