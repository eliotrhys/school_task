require('sinatra')
require('sinatra/reloader')
require( 'pry-byebug' )

require_relative('./models/student.rb')

get '/students' do #index
  @students = Student.all()
  erb(:index)
end

get '/students/new' do # new
  @houses = House.all
  erb( :new )
end

post '/students' do # create
  @student = Student.new( params )
  @student.save()
  redirect to "/students"
end
