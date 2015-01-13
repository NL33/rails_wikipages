class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render('contacts/index.html.erb')
  end

  def new 
    @contact = Contact.new  #we include this variable here so that if there are errors in the submission, rails knows what contact to attribute the errors to (even though this contact is not yet saved.)
    render('contacts/new.html.erb')
  end

  def create
  	@contact = Contact.new(:name => params[:name], 
                              :email => params[:email],
                              :phone => params[:phone])
    #note this is equivalent to:
    #  @contact = Contact.new(params[:contact])

    if @contact.save
      redirect_to("/contacts/#{@contact.id}") #redirects to url with id of contact just created here
    else
      render('contacts/new.html.erb')
    end
  end

  def show
    @contact = Contact.find(params[:id]) #ie, the contact when this action occurs is the Contact matching the id that was entered (correponding to the ":id" in the route)
    render('contacts/show.html.erb')
  end

  def edit
    @contact = Contact.find(params[:id])
    render('contacts/edit.html.erb') 
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(:name => params[:name],
                       :email => params[:email],
                       :phone => params[:phone])
      
      redirect_to("/contacts/#{@contact.id}")
    else
      render('contacts/edit.html.erb')
    end
  end

 def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to("/contacts") #this is the common path for redirect when destroy
 end

end