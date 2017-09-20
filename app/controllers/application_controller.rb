require './config/environment'

class ApplicationController < Sinatra::Base

	enable :sessions
	set :session_secret, "Mimir"

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
	end

	get '/' do
		erb :index
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
        redirect '/art/index'
      else
        erb :'users/new'
      end
    end



    post '/signup' do
      if params[:username].empty? || params[:email].empty? || params[:password].empty? || User.find_by(username: params[:username])
        redirect '/signup'
      else
        @user = User.create(params)
        session[:user_id] = @user.id
        redirect '/art/index'
      end
    end

    get '/login' do
      if logged_in?
        redirect '/art/index'
      else
        erb :'users/login'
      end
    end

    post '/login' do
      @user = User.find_by(username: params[:username])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect '/art/index'
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

    get '/art/submissions' do
      @user = current_user
      if logged_in?
        erb :'/art/submissions'
      else
        redirect '/login'
      end
    end

    get '/art/index' do
      if logged_in?
        erb :'/art/index'
      else
        redirect '/login'
      end
    end

    get '/art/new' do
      if logged_in?
        erb :'/art/new'
      else
        redirect '/login'
      end
    end

    get '/art/new' do
      if logged_in?
        erb :'/art/new'
      else
        redirect '/login'
      end
    end

    post '/art' do
      @user = current_user
      if params[:title].empty?
        redirect '/art/new'
      else
        @work = Work.create(params)
        @work.user_id = @user.id
        @work.save
        redirect '/art/index'
      end
    end

    get '/art/:slug' do
      @user = current_user
      @work = Work.find_by_slug(params[:slug])
      puts @work.title
      if logged_in?
        erb :'/art/show'
      else
        redirect '/login'
      end
    end

    get '/art/:slug/edit' do
      @user = current_user
      @work = Work.find_by_slug(params[:slug])
      puts @work.title
      if logged_in? && @work.user_id == @user.id
        erb :"/art/edit"
      elsif logged_in?
        redirect "/art/#{@work.slug}"
      else  
        redirect '/login'
      end
    end


    post '/art/:slug/edit' do
      @user = current_user
      @work = Work.find_by_slug(params[:slug])
      if  @work.user_id == @user.id
        @work.update(title: params[:title], year: params[:year], artist: params[:artist], description: params[:description], medium: params[:medium])
        @work.save
        redirect "/art/index"
      elsif logged_in?
        redirect "/art/index"
      else
        redirect "/"
      end
    end

    get '/art/:slug/delete' do
      @user = current_user
      @work = Work.find_by_slug(params[:slug])
      if logged_in? && @work.user_id == @user.id
        @work.delete
        redirect '/art/index'
      else
        redirect "/art/#{@work.slug}"
      end
    end




    

end