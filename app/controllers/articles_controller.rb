class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :logged_in
  

  # GET /articles
  # GET /articles.json
  def index
    # @articles = Article.all
    @articles = Search::SearchArticle.new(params).find
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
    @tags = Tag.all
  end

  # GET /articles/1/edit
  def edit
  end

  # This is not used anymore actually, I route search to the index, and use it to display results
  def search
    # query_param = params[:query].downcase
    # @found_articles = Article.all.where("lower(title) LIKE :query", query: query_param)
    # render "search"
  end

  def filter_tags
    q = params[:query]
    @articles = Article.joins(:tags).where("tags.id = ?", q)
    render "articles/index"
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.article_image.attach(params[:article][:article_image])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :article_image, :tag_ids => [])
    end
end
