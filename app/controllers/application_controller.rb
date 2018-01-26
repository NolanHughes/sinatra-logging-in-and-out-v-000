require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    password = params[:password]
    
    if @user && password == @user.password
      session[:user_id] = @user[:id]
      redirect to '/account'
    end
      erb :'error'
  end

  get '/account' do
    # @current_user = Helpers.current_user(session)
    binding.pry
    erb :'account'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
