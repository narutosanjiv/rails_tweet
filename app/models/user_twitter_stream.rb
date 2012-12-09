class UserTwitterStream
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: StrinG
   
end
