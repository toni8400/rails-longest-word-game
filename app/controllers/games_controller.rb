require 'open-uri'
require 'json'


class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
    $letters_global = @letters
  end

  def score
    # @letters
    # params[:word]
    params[:word].upcase!
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
    json = JSON.parse(response.read)
    # raise

    # $letters_global
    if params[:word].chars.all? { |letter| params[:word].count(letter) <= params[:letters].count(letter) } == false
      @result = "You can't create this word with the letters"
    elsif json['found'] == false
      @result = "No english word"
    else
      @result = "it is an english word"
    end




  end
end
