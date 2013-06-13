class SessionsController < ApplicationController
  layout 'sessions'

  def new
    @companies = []

    @internships = Internship.all

    @internships.each do |i|
      @companies << i.company
    end

    @pins = @companies.to_gmaps4rails do |company, marker |

      href =  if company.website.starts_with?'http' 
              company.website  
            else 
              "http://"+company.website 
             end
             
      marker.infowindow ("<a href='/companies/#{company.id}' style='font-weight:bold'>#{company.name}</a><p>Industry: #{company.industry}</p><p>Employees: #{company.number_employees}</p><a href='#{href}' target='_blank'>#{company.website}</a>")

    end
  end

  def create
    user = User.find_by_email(params[:email])
    #userSignUp = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], last_name: params[:last_name], first_name: params[:first_name] )
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to overview_index_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end