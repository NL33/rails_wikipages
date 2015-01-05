Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'contacts#index'}) #sets home page to the index page
  match('contacts', {:via => :get, :to => 'contacts#index'}) # This says: Whenever server receives a request 
  				#to localhost:3000/contacts via a GET request (when type url or click on link), it should go 
  				#to the contacts controller and run the index action
  match('contacts/new', {:via => :get, :to => 'contacts#new'})  
  match('contacts', {:via => :post, :to => 'contacts#create'})
  match('contacts/:id', {:via => :get, :to => 'contacts#show'})
  match('contacts/:id/edit', {:via => :get, :to => 'contacts#edit'}) #route for the edit page
  match('contacts/:id', {:via => [:patch, :put], :to => 'contacts#update'})#to update. We enter both patch and put to cover bases as some services support one or the other
  match('contacts/:id', {:via => :delete, :to => 'contacts#destroy'})
end
