require 'sinatra'
require 'mongo'

set :public_folder, File.dirname(__FILE__) + '/public'

if development?
  db = Mongo::Connection.new('localhost').db("sideshow_landing_development")
  coll = db.collection("subscribers")
else
  db = Mongo::Connection.new('linus.mongohq.com', 10048).db("sideshow_landing")
  auth = db.authenticate("sideshow", "asd89213jkajsd-0123l")
  coll = db.collection("subscribers")
end


# Need to add code to insert into the collection

get '/' do
  @title = 'Run a online sale for your store and sell more stuff with Sideshow'
  @description = 'Sideshow helps businesses sell more stuff by running online popup sales for their store. Creating an online sale page is as easy as posting a photo to Facebook!'
 erb :index
end

post '/welcome' do
  @title = 'Welcome to Sideshow'

  @email = params[:email]
  coll.insert(params)
  erb :signedup
end

post '/complete' do
  @title = 'Sideshow Signup Complete'

  @email = params[:email]
  coll.update({"email" => @email}, {
    "$addToSet" => { "survey" => params }
  })

  erb :surveycomplete
end

error 400..510 do
  @title = 'Sideshow'
  erb :error
end
