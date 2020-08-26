class TagAliasesController < ApplicationController
  before_action :set_tag_alias, only: [:show, :edit, :update, :destroy]
  before_action :logged_in

  # GET /tag_aliases
  # GET /tag_aliases.json
  def index
    @tag_aliases = TagAlias.all
  end

  # GET /tag_aliases/1
  # GET /tag_aliases/1.json
  def show
  end

  # GET /tag_aliases/new
  def new
    @tag_alias = TagAlias.new
    @tags = Tag.all
  end

  # GET /tag_aliases/1/edit
  def edit
    @tags = Tag.all
  end

  # POST /tag_aliases
  # POST /tag_aliases.json
  def create
    @tag_alias = TagAlias.new(tag_alias_params)

    respond_to do |format|
      if @tag_alias.save
        format.html { redirect_to @tag_alias, notice: 'Tag alias was successfully created.' }
        format.json { render :show, status: :created, location: @tag_alias }
      else
        format.html { render :new }
        format.json { render json: @tag_alias.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_aliases/1
  # PATCH/PUT /tag_aliases/1.json
  def update
    respond_to do |format|
      if @tag_alias.update(tag_alias_params)
        format.html { redirect_to @tag_alias, notice: 'Tag alias was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag_alias }
      else
        format.html { render :edit }
        format.json { render json: @tag_alias.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_aliases/1
  # DELETE /tag_aliases/1.json
  def destroy
    @tag_alias.destroy
    respond_to do |format|
      format.html { redirect_to tag_aliases_url, notice: 'Tag alias was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_alias
      @tag_alias = TagAlias.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_alias_params
      params.require(:tag_alias).permit(:tag_id, :alias)
    end
end
