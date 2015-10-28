#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello World of Mine! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/about' do
  @error = "Something wrong"
  erb :about
end

get '/visit' do
  erb :visit
end

post '/visit' do
  @user_name = params[:username];
  @user_phone = params[:userphone];
  @user_date = params[:userdate];
  @barbername = params[:barbername]


  if @user_name.empty?
    @error = "Username cannot be empty"
    erb :visit
    elsif @user_phone.empty?
    @error = "Phone number cannot be empty"
    erb :visit
    elsif @user_date.empty?
    @error = "Date cannot be empty"
    erb :visit
    else

    combined_data = "#{@user_name} - #{@user_phone} - #{@user_date} - #{@barbername}\n\n"

    users_file = File.open "public/visits.txt", "a" do |file|
        file.write(combined_data)
        file.write "\n"
      end
      @message = "Complete"
      erb :thankyou
  end

end

get '/contacts' do
  erb :contacts
end

get '/thankyou' do
  erb :thankyou
end