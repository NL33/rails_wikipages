class Phone < ActiveRecord::Base
  belongs_to :contact

  validates :number, :presence => true
  validates :contact_id, :presence => true

def show_name
  id = self.contact_id
  contact = Contact.where({:id => id}).first  #Employee.where({:name => employee_name}).first
  contact.name
end

end