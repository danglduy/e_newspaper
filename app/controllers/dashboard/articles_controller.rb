module Dashboard
  class ArticlesController < ::DashboardController
    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def show
      @article = Article.find(params[:id])
    end

    def create
      @article = Article.new(article_params.merge(user: current_user))

      if @article.save
        redirect_to dashboard_article_path(@article)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to dashboard_article_path(@article)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy; end

    def request_review
      article = Article.find(params[:id])

      authorize(article)

      if article.draft? && article.review!
        redirect_to dashboard_article_path(article)
      end
    end

    def approve
      article = Article.find(params[:id])

      authorize(article)

      if article.review? && article.scheduled!
        redirect_to dashboard_article_path(article)
      end
    end

    def publish
      article = Article.find(params[:id])

      authorize(article)

      if article.update(status: :published, published_at: Time.current)
        redirect_to dashboard_article_path(article)
      end
    end

    private

    def article_params
      params.require(:article).permit(:title, :content, :scheduled_published_at, :published_at)
    end
  end
end
