class User < ApplicationRecord
    class User < ApplicationRecord
        validates :first_name, :last_name, :username, :email, presence: true
        validates :username, :phone, :email, uniqueness: true
      
      
        has_secure_password
      end
end
