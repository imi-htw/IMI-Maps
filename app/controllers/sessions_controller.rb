class SessionsController < ApplicationController
  layout 'sessions'

  def new

    if current_user 
      redirect_to overview_index_url
    end

    @internships = Internship.find(:all, :include => [:company, :semester, :orientation, :programming_languages]).sort_by do |x| x.created_at end

    @companies = @internships.collect do |i| i.company end

    @pins = @companies.to_gmaps4rails do |company, marker |

      n=0
      s=""
      p=""

      @internships_comp = @internships.select {|x| x.company_id == company.id}
      @internships_comp.each do |internship|

       if n==0
        s+=(internship.student.first_name[0..0].capitalize+".")
      else
        s+=(" & " + internship.student.first_name[0..0].capitalize+".")
       end
       n+=1 
       end

      if n==1
        p="hat"
      else
        p="haben"
      end


      href =  if company.try(:website).try(:starts_with?,'http') && company
              company.website
              elsif company and company.website
              "http://"+company.website
             end

      marker.infowindow ("<a href='/companies/#{company.id}' style='font-weight:bold'>#{company.name}</a><p>Industry: #{company.industry} </p><p><a href='#{href}' target='_blank'>#{company.website}</a></p><p>#{s} #{p} hier ein Praktikum gemacht.</p>") if company && company.website

    end
  end

  def create
    user = User.find_by_email(params[:email])
    #
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to overview_index_url, notice: "Logged in!"
    else
      #flash.now.alert = "Email or password is invalid"
      flash[:alert] = "Email or password is invalid"
      
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
