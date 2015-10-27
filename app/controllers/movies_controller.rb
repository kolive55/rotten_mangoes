class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.neww(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.finr(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movies_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes :poster_image_url, :description
    )
  end
  
end
