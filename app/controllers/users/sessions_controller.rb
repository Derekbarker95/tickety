class Users::SessionsController < Devise::SessionsController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email params[:user][:email]
    if @user
      sign_in @user
      redirect_to root_path, notice: "Logged in!"
    else
      flash[:alert] = "Wrong email or password"
      render :new
    end
  end

  def destroy
    sign_out current_user 
    redirect_to root_path, notice: "Logged out!"
  end


end
