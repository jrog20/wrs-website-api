class UserSerializer < ActiveModel::Serializer
  # include FastJsonapi::ObjectSerializer
    attributes :id, :username, :email
  # end 
end
