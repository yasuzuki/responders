class User < ActiveRecord::Base
  attr_accessible :name, :updated_at
  before_destroy do
    if self.name == "Undestroyable"
      self.errors.add(:base, "is undestroyable")
      false
    end
  end
end
