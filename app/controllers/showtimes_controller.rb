class ShowtimesController < ApplicationController 
  # before_action :set_showtime, only: [:show, :edit, :update, :destroy]

  def create
    @movie = Movie.find(params[:movie_id])
    @showtime = @movie.showtimes.new(showtime_params)

    if @showtime.save
      redirect_to @showtime.movie, notice: 'Showtime was successfully created.'
    else
      redirect_to @showtime.movie, alert: 'Showtime was not successfully created'
    end
  end

  private
  def set_showtime
    @showtime = Showtime.find(params[:id])
  end

  def showtime_params
    params[:showtime].permit(:location, :time, :movie_id)
  end
end
