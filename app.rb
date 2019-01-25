require 'sinatra'
require_relative 'lib/player'
require_relative 'lib/game'

class RockPaperScissors < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/log_in_one_player' do
    erb :log_in_one_player
  end

  post '/player_name' do
    player_1 = Player.new(params[:name])
    @game = Game.create(player_1)
    redirect '/play_one_player'
  end

  get '/play_one_player' do
    @game = Game.instance
    erb :play_one_player
  end

end
