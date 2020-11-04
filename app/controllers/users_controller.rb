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

  def link_show
    @user = User.find_by(url_slug: params[:url_slug])
    if @user.present?
      redirect_to @user.website_url
    else
      redirect_to root_path()
    end
  end

  def search_expert

    current_user = User.find(params[:user_id])
    user = User.search(params[:topic])
    user = User.search(params[:topic]).notCurrent(current_user.friends.pluck(:id).push(params[:user_id]))
    binding.pry
    render json: user
  end


private

 def contact_params
   params.require(:user).permit(:name, :website_url)
 end

end
