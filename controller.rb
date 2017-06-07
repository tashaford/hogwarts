require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative './models/student'

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/student/new' do
  @houses = House.all()
  erb(:new)
end

post '/students' do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

get '/student/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

get '/student/:id/edit' do
  @student = Student.find(params[:id])
  @houses = House.all()
  erb(:edit)
end

post '/student/:id' do
  @student = Student.find(params[:id])
  @student.update(params)
  redirect to "student/#{params[:id]}"
end

post '/student/:id/delete' do
  @student = Student.find(params[:id])
  @student.delete()
  redirect to "/students"
end