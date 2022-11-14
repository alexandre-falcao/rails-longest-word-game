require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    @random_letters = ('a'..'z').to_a.sample(10)
    @letters = @random_letters.join(" ")
  end

  def score
    # raise
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @search = JSON.parse(URI.open(url).read)
    if @search["found"] == true
      @answer = "Congratulations! #{@word} is a valid English word!"
    else
      @answer = "Failed!"
    end

  end

end
