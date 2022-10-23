module Dashboard
  class RootController < ::DashboardController
    def index
      redirect_to dashboard_articles_path
    end
  end
end
