class SignSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration

  def duration
    return 
  end
end
