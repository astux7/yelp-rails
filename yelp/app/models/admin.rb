class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validate :email_valid?

  	def  email_valid?
	  	unless email.split('@')[1] == 'basta.lt'
	  		errors.add(:email, 'does not belongs to admins!')
	  	end
	end
end
