module Dashboard
  class ArticlesController < ::DashboardController
    def index
      @articles = Article.all
    end

    def new; end

    def show; end

    def create; end

    def edit; end

    def update; end

    def destroy; end
  end
end
