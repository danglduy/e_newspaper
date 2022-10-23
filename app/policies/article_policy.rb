# frozen_string_literal: true

class ArticlePolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def request_review?
    article.draft?
  end

  def approve?
    user.moderator? && article.review?
  end

  def publish?
    user.moderator? && !article.draft? && !article.published?
  end
end
