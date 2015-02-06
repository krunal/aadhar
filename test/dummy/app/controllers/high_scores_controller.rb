class HighScoresController < ApplicationController
  before_filter :authenticate
  before_action :set_high_score, only: [:show, :edit, :update, :destroy]

  # GET /high_scores
  def index
    @high_scores = HighScore.all
  end

  # GET /high_scores/1
  def show
  end

  # GET /high_scores/new
  def new
    @high_score = HighScore.new
  end

  # GET /high_scores/1/edit
  def edit
  end

  # POST /high_scores
  def create
    @high_score = HighScore.new(high_score_params)

    if @high_score.save
      redirect_to @high_score, notice: 'High score was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /high_scores/1
  def update
    if @high_score.update(high_score_params)
      redirect_to @high_score, notice: 'High score was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /high_scores/1
  def destroy
    @high_score.destroy
    redirect_to high_scores_url, notice: 'High score was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_high_score
      @high_score = HighScore.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def high_score_params
      params.require(:high_score).permit(:game, :score)
    end
end
