class UsersController < Clearance::UsersController
	def new
	    @user = User.new
	    render template: "users/new"
	end

	def create
	    @user = User.new(user_from_params)
	    if @user.save
	      sign_in @user
	      flash[:notice] = "Successfully signed up"
	      redirect_back_or url_after_create
	    else
	    	# flash[:notice] = @user.errors.full_messages.first
	      @message = @user.errors.full_messages.first
	      respond_to do |format|
	      	format.js
	      	format.html
	      end
	    end
	end

	def show
		
	end

	private

	def user_from_params
	    params.require(:user).permit(:name,:email,:password,:avatar)
	end

end