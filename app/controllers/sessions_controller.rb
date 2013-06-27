class SessionsController < ApplicationController
  layout 'sessions'

  def new
    @internships = Internship.find(:all, :include => [:company, :semester, :orientation, :programming_languages]).sort_by do |x| x.created_at end

    @companies = @internships.collect do |i| i.company end

    @pins = @companies.to_gmaps4rails do |company, marker |

      n=0
      s=""
      p=""

      @internships_comp = @internships.select {|x| x.company_id == company.id}
      @internships_comp.each do |internship|
      
       if n==0
        s+=(internship.user.first_name[0..0].capitalize+".")
      else
        s+=(" & " + internship.user.first_name[0..0].capitalize+".")
       end
       n+=1 
       end

      if n==1
        p="hat"
      else
        p="haben"
      end


      href =  if company.website.starts_with?'http' 
              company.website  
            else 
              "http://"+company.website 
             end
             
    
      marker.infowindow ("<a href='/companies/#{company.id}' style='font-weight:bold'>#{company.name}</a><p>Industry: #{company.industry} </p><p><a href='#{href}' target='_blank'>#{company.website}</a></p><p>#{s} #{p} hier ein Praktikum gemacht.</p>")

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
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end