class User < ApplicationRecord
  class User < ApplicationRecord
    has_secure_password
    validates :email, :username, presence: true
    validates :email, :username, uniqueness: true
  
    # Should this be refactored/moved to a serializer?
    def user_serializer
      {
        username: username,
        email: email,
        id: id
      }
    end
  end
end
