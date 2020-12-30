class UserSerializer < ActiveModel::Serializer
    attributes :name, :username, :birthdate, :sign


    def sign
        Sign.find_sign(self.object.birthday)
    end
end 