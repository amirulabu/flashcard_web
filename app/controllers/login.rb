post '/login' do
  if User.authentication(params[:username],params[:password])
    session[:loginid] = User.where(username:params[:username]).first.id
    session[:logindata] = "yes"
    redirect to ('/')
  else
    session[:logindata] = "no"
    redirect to ('/')
  end
end

get '/logout' do
    session[:logindata] = "no"
    session[:loginid] = nil
    redirect to ('/')
end
