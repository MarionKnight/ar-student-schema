require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, :format => { :with => /.+@.+[.].{2,}/, :message => "Only valid emails!" }
  
  validates :email, :uniqueness => true
  
  validates :age, :numericality => { :greater_than_or_equal_to => 5 }

  # validate :validate_numbies
  # validates :phone, :format => { :with => /\(?[0-9]{3}\)?[-. ]?[0-9]{3}[-. ]?[0-9]{4}/, :message => "please enter a valid number"}
                                    
  
  def name
    "#{first_name} #{last_name}"
  end

  def age
    Time.now.year - birthday.year
  end
end