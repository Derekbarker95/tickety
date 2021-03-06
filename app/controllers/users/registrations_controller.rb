class Users::RegistrationsController < Devise::RegistrationsController
 def new
    @user = User.new
    # render nothing: true
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account Created!"
    else
      flash[:alert] = "Account not created"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
                                 :email, :password,
                                 :password_confirmation)
  end
end
