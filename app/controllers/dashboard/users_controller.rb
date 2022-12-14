module Dashboard
  class UsersController < ::DashboardController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def show
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to dashboard_user_path(@user)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.assign_attributes(user_params)

      authorize @user

      if @user.save
        redirect_to dashboard_user_path(@user)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy; end

    private

    def user_params
      params.require(:user).permit(:email, :role, :password)
    end
  end
end
