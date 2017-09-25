class WorksController < Sinatra::Base

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

    get '/art_work/submissions' do
      if logged_in?
        @works = current_user.works.sort_by{|obj| obj.title}
        erb :'/art_work/submissions'
      else
        redirect '/login'
      end
    end

    get '/art_work/index' do
      if logged_in?
        erb :'/art_work/index'
      else
        redirect '/login'
      end
    end

    get '/art_work/new' do
      if logged_in?
        erb :'/art_work/new'
      else
        redirect '/login'
      end
    end

    get '/art_work/new' do
      if logged_in?
        erb :'/art_work/new'
      else
        redirect '/login'
      end
    end

    post '/art_work' do
      if params[:title].empty?
        redirect '/art_work/new'
      else
        @work = Work.create(params)
        @work.user_id = current_user.id
        @work.save
        redirect '/art_work/index'
      end
    end

    get '/art_work/:slug' do
      @work = Work.find_by_slug(params[:slug])
      puts @work.title
      if logged_in?
        erb :'/art_work/show'
      else
        redirect '/login'
      end
    end

    get '/art_work/:slug/edit' do
      @work = Work.find_by_slug(params[:slug])
      puts @work.title
      if logged_in? && @work.user == current_user
        erb :"/art_work/edit"
      elsif logged_in?
        redirect "/art_work/#{@work.slug}"
      else  
        redirect '/login'
      end
    end

   put '/art_work/:slug' do
      @work = Work.find_by_slug(params[:slug])
      if  @work.user == current_user
        @work.update(title: params[:title], year: params[:year], artist: params[:artist], description: params[:description], medium: params[:medium])
        @work.save
        redirect "/art_work/index"
      elsif logged_in?
        redirect "/art_work/index"
      else
        redirect "/"
      end
    end

    get '/art_work/:slug/delete' do
      @work = Work.find_by_slug(params[:slug])
      if logged_in? && @work.user == current_user
        @work.delete
        redirect '/art_work/index'
      else
        redirect "/art_work/#{@work.slug}"
      end
    end


end