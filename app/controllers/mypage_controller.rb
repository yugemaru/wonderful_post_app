class MypageController < ApplicationController
  # before_action :set_article, only: %i[ index show edit update destroy ]

  # GET /articles/1 or /articles/1.json
  def show
    @articles = current_user.articles
    @articles = Article.page(params[:page]).per(10)
  end


end
