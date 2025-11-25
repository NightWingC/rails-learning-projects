class ContactsController < ApplicationController
  # GET request to /contacts/new
  def new
    @contact = Contact.new
  end

  # GET request to /contacts/:id
  def show
    @contact = Contact.find(params[:id])
  end

  def index
    @contacts = Contact.all
  end

  # POST request to /contacts
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to @contact
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET request to /contacts/:id/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # PATCH request to /contacts/:id
  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to @contact
    else
      render :edit
    end
  end

  # DELETE request to /contacts/:id
  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    redirect_to contacts_path
  end

  private
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :phone)
    end
end
