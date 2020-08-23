class NotesController < ApplicationController
  before_action :get_article, only: [:index, :new, :create, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = @article.notes
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.article = @article

    respond_to do |format|
      if @note.save
        format.html { redirect_to article_notes_path(@article), notice: 'Note was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    respond_to do |format|
      format.html { redirect_to article_notes_path(@article), notice: 'Note was successfully destroyed.' }
    end
  end

  private
    # Get the article, which has all the notes
    def get_article
      @article = Article.find(params[:article_id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:text, :article_id)
    end
end
