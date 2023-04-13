class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_article, only: %i[ show edit update destroy ]
  # before_action :set_tag, only: %i[ update ]


  # GET /articles or /articles.json
  def index
    articles = Article.all
    articles = articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    @articles = articles.page params[:page]
  end

  # GET /articles/1 or /articles/1.json
  def show
    @articles = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
      @article = current_user.articles.new(article_params)
      # @article = Tag.new(params[:tag_ids])

      respond_to do |format|
        if @article.save
          format.html { redirect_to article_url(@article), notice: "#{t('activerecord.models.article')}を作成しました。" }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
      respond_to do |format|
        if @article.update(article_params)
          format.html {redirect_to articles_url(@article), notice: "#{t('activerecord.models.article')}を編集しました。"}
        else
          render :edit, status: :unprocessable_entity
        end
      end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。" }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    # def set_tag
    #   @tag = TagArticle.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def article_params
      # binding.pry
      params.require(:article).permit(:title, :content, tag_ids:[])
    end

    # def tag_params
    #   params.require(:article).permit(tag_id:[])
    # end
end
