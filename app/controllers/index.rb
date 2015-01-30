enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/play' do
  if session[:logindata] == "yes"
    erb :play
  else
    redirect to ('/')
  end
end

get '/play/deck/:number' do
  @thedeck = params[:number]
  Round.create(deck_id: params[:number].to_s, user_id: session[:loginid].to_s)
  session[:roundid] = Round.last.id
  erb :deck
end

get '/play/deck/:number/:card' do
  @thedeck = params[:number]
  @thecard = params[:card]
  @thenextcard = @thecard.to_i+1


  erb :deckplay
end

post '/play/deck/:number/:card/check' do
  @thedeck1 = params[:number]
  @thecard1 = params[:card]

  x = Card.where(deck_id:@thedeck1.to_s).find(@thecard1)

  if params[:answer] == x.answer
    Guess.create(round_id: session[:roundid].to_s, card_id: @thecard1.to_s, correct: "Yes")
  else
    Guess.create(round_id: session[:roundid].to_s, card_id: @thecard1.to_s, correct: "No")
  end
  redirect back
end

get '/result' do
  erb :result

end

