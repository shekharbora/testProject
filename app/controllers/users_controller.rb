class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(contact_params)  
  	if @user.save
  		redirect_to root_path(), notice: 'created !!'
  	else
  		render :new
  	end	
  end

  def profile

  	@user = User.find_by(id: params[:user_id])
  	
  end


private

 def contact_params
   params.require(:user).permit(:name, :website_url)
 end

end
