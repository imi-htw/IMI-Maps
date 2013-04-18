class ContactPeopleController < ApplicationController
  # GET /contact_people
  # GET /contact_people.json
  def index
    @contact_people = ContactPerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contact_people }
    end
  end

  # GET /contact_people/1
  # GET /contact_people/1.json
  def show
    @contact_person = ContactPerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact_person }
    end
  end

  # GET /contact_people/new
  # GET /contact_people/new.json
  def new
    @contact_person = ContactPerson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact_person }
    end
  end

  # GET /contact_people/1/edit
  def edit
    @contact_person = ContactPerson.find(params[:id])
  end

  # POST /contact_people
  # POST /contact_people.json
  def create
    @contact_person = ContactPerson.new(params[:contact_person])

    respond_to do |format|
      if @contact_person.save
        format.html { redirect_to @contact_person, notice: 'Contact person was successfully created.' }
        format.json { render json: @contact_person, status: :created, location: @contact_person }
      else
        format.html { render action: "new" }
        format.json { render json: @contact_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contact_people/1
  # PUT /contact_people/1.json
  def update
    @contact_person = ContactPerson.find(params[:id])

    respond_to do |format|
      if @contact_person.update_attributes(params[:contact_person])
        format.html { redirect_to @contact_person, notice: 'Contact person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_people/1
  # DELETE /contact_people/1.json
  def destroy
    @contact_person = ContactPerson.find(params[:id])
    @contact_person.destroy

    respond_to do |format|
      format.html { redirect_to contact_people_url }
      format.json { head :no_content }
    end
  end
end
