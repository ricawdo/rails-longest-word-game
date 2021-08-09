require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    letters = ('a'...'z').to_a
    @letters = letters.sample(10)
  end


  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:letters]}"
    word_serialized = URI.open(url).read
    word_exists = JSON.parse(word_serialized)['found']
    if word_exists == true
      @answer = "You win"
    else
      @answer = "You lose"
    end
  end
end
