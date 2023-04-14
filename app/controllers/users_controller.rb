class UsersController < ApplicationController
  def index
    # c = current_user
    # c.roles.create(role:params[:role])
    @user = User.all
  end
  def show 
    @user=User.find(params[:id]) 
  end
  def new 
    @user=User.new 
  end 
  def create 
    @user=User.create(user_params) 
    if @user.save 
      redirect_to @user
    else 
      render :"new" 
    end
  end
  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role)
    end
end
