class UserController < ApplicationController
  def logout
    session.clear
    redirect_to controller: "twit", action: "list"
  end
  
  def create
    if params[:email].blank? || params[:password].blank? || params[:repassword].blank? || params[:username].blank?
      @message = "정보를 입력해주세요."
    else
      @email = params[:email]
      @password = params[:password]
      @repassword = params[:repassword]
      @username = params[:username]
      
      if User.find_by email: @email
        @message = "동일한 아이디가 있습니다."
      elsif @password != @repassword
        @message = "비밀번호를 확인해주세요."
      else
        user = User.new
        user.username = @username
        user.password = Digest::SHA256.hexdigest @password
        user.email = @email
        user.save
        @message = "회원가입이 완료되었습니다."
      end
    end
  end

  def login
    if params[:email].blank? || params[:password].blank?
      @message = "정보를 입력해주세요."
    else
      @email = params[:email]
      @password = params[:password]
      
      @user = User.find_by email: @email
      if @user
        @password = Digest::SHA256.hexdigest @password
        if @password == @user.password
          session[:username] = @user.username
          session[:email] = @user.email
          session[:logined] = true
        else
          @message = "비밀번호가 일치하지 않습니다."
        end
      else
        @message = "존재하지 않는 사용자입니다."
      end  
    end
  end
end
