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
  erb :deck
end

get '/play/deck/:number/:card' do
  @thedeck = params[:number]
  @thecard = params[:card]

  @card = Card.where(deck_id:@thedeck.to_s)

  erb :deckplay
end

post '/play/deck/:number/:card/check' do
  if params[:answer] ==
    @correct = "Correct!"
  else
    @correct = "Wrong answer, try again"
  end
  redirect back
end

