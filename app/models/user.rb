class User < ActiveRecord::Base
   has_secure_password

   validates :first_name, presence: true
   validates :last_name, presence: true
   validates_uniqueness_of :email, case_sensitive: false
   validates :password, presence: true, length: {minimum: 5}
   validates :password_confirmation, presence: true

   def self.authenticate_with_credentials(email, password)
     email = email.lstrip.downcase
     user = User.find_by(email: email)

      if user && user.authenticate(password)
        user
     end
   end
end
