module Dashboard
  class SessionsController < ::DashboardController
    skip_before_action :authenticate_user!, only: [:new, :create]

    layout "application"

    def new
      redirect_to dashboard_path if user_signed_in?
    end

    def create
      user = User.find_by(email: params[:user][:email])

      if user&.authenticate(params[:user][:password])
        login_user(user)
        redirect_to dashboard_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      logout
      redirect_to dashboard_login_path
    end

    private

    def login_user(user)
      session[:user_id] = user.id
    end

    def logout
      session.delete(:user_id)
    end
  end
end
