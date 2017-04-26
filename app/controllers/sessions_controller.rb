class SessionsController < Clearance::SessionsController
  def create
    @user = authenticate(params)
    sign_in(@user) do |status|
      if status.success?
      	flash[:notice] = "Successfully signed in"
        redirect_back_or url_after_create
      else
        flash.now.notice = status.failure_message
        render template: "sessions/new", status: :unauthorized
      end
    end
  end

  def destroy
  	flash[:notice] = "Successfully signed out"
    sign_out
    redirect_to url_after_destroy
  end

end