class UserSerializer < ActiveModel::Serializer
    attributes :name, :username, :birthdate
end 