require 'spec_helper'

describe ShowtimesController do

  let(:movie) { Movie.create }

  it 'creates a @showtime for a movie' do
    showtimes = movie.showtimes.create(time: "10/10/2013 10:00pm", movie_id: movie.id) 

    expect(assigns("showtimes")).to eq([showtime])
  end


end
