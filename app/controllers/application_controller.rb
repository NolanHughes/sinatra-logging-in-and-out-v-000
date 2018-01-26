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
    if params[:username] != nil
      binding.pry
      @user = User.find_by(username: params[:username])
      session[:user_id] = @user[:id]

      @current_user = Helpers.current_user(session[:user_id])


      redirect to '/account'
    else
      binding.pry
      erb :'error'
    end
  end

  get '/account' do
    erb :'account'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
