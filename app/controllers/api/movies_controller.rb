module Api
  class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :favorite, :unfavorite]

    # GET /movies.json
    def index
      @movies = Movie.all
      if params[:favorite]
        @movies = @movies.select do |movie|
          movie.users.include? @current_user
        end
      end

      respond_to do |format|
        format.json { render 'movies/index', status: :ok }
      end
    end

    # GET /movies/1
    # GET /movies/1.json
    def show
      respond_to do |format|
        format.json { render 'movies/show', status: :ok }
      end
    end

    # GET /movies/new
    def new
      @movie = Movie.new
    end

    # GET /movies/1/edit
    def edit
    end

    # POST /movies
    # POST /movies.json
    def create
      @movie = Movie.new(movie_params)

      respond_to do |format|
        if @movie.save
          format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
          format.json { render :show, status: :created, location: @movie }
        else
          format.html { render :new }
          format.json { render json: @movie.errors, status: :unprocessable_entity }
        end
      end
    end

    def favorite
      unless @movie.users.include? @current_user
        @movie.users << @current_user
        @movie.save!
      end
      respond_to do |format|
        format.json { render 'movies/show', status: :ok }
      end
    end

    def unfavorite
      if @movie.users.include? @current_user
        @movie.users.delete(@current_user)
      end
      respond_to do |format|
        format.json { render 'movies/show', status: :ok }
      end
    end

    # PATCH/PUT /movies/1
    # PATCH/PUT /movies/1.json
    def update
      respond_to do |format|
        if @movie.update(movie_params)
          format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
          format.json { render :show, status: :ok, location: @movie }
        else
          format.html { render :edit }
          format.json { render json: @movie.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_movie
        @movie = Movie.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def movie_params
        params.require(:movie).permit(:name, :year)
      end
  end
end