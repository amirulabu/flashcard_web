post '/login' do
  if User.authentication(params[:username],params[:password])
    User.where(username:params[:username]).each do |x|
      session[:loginid] = x.id
    end
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
