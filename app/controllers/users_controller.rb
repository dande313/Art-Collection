
class UsersController < Sinatra::Base

  enable :sessions
  set :session_secret, "Mimir"

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  helpers do
    def current_user
      User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!current_user
    end
  end

  get '/signup' do
      if logged_in?
        redirect '/art_work/index'
      else
        erb :'users/new'
      end
    end

    post '/signup' do
      if params[:username].empty? || params[:email].empty? || params[:password].empty? || User.find_by(username: params[:username]) || User.find_by(email: params[:email])
        redirect '/signup'
      else
        @user = User.new(params)
        if @user.save
          session[:user_id] = @user.id
          redirect '/art_work/index'
        else 
          redirect '/signup'
        end
      end
    end

    get '/login' do
      if logged_in?
        redirect '/art_work/index'
      else
        erb :'users/login'
      end
    end

    post '/login' do
      @user = User.find_by(username: params[:username])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect '/art_work/index'
      else
        redirect 'login'
      end
    end

    get '/logout' do
      if logged_in?
        session.clear
      end
      redirect '/'
    end

end