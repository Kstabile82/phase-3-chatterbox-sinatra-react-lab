class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do 
    messages = Message.all.order(:created_at)
    messages.to_json
  end

  post '/messages' do 
    mess = Message.create(
      body: params[:body],
      username: params[:username]
    )
    mess.to_json
  end

  patch '/messages/:id' do 
    mess = Message.find(params[:id])
    mess.update(
      body: params[:body]
      )
    mess.to_json
  end

  delete '/messages/:id' do 
    mess = Message.find(params[:id])
    mess.destroy
    mess.to_json
  end

  
end
