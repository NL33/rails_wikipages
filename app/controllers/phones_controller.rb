class PhonesController < ApplicationController
  def new
    contact = Contact.find(params[:contact_id])
    @phone = contact.phones.new  #entered here so there is a reference point for the error message
    render('phones/new.html.erb')
  end

  def create
    @phone = Phone.new(:number => params[:number],
                       :contact_id => params[:contact_id])
    if @phone.save
      render('phones/success.html.erb')
    else
      render('phones/new.html.erb')
    end
  end

 def edit
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:phone_id])
    render('phones/edit.html.erb') 
 end

  def update
    #@contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:phone_id])
    if @phone.update(:number => params[:number])
      render('phones/success.html.erb')
    else
      render('phones/edit.html.erb')
    end
  end

end