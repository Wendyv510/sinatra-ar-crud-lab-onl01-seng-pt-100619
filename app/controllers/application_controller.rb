
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    
    erb :new
  end
  
  post '/articles' do 
    @article = Article.create(title: params[:title], content: params[:content])
    
    erb :show  
  end 
  
  get '/articles' do 
    @articles = Article.all 

    erb :index 
  end 
  
  get '/articles/:id/edit' do 
    
    erb :edit 
  end 
  
  delete '/articles/:id' do
    article = Article.find(params[:id].to_i)
    @title = article.title 
    article.destroy 
    
    erb :delete 
  end 
    
  
end
