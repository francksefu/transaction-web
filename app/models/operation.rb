class Operation < ApplicationRecord
  belongs_to :user
  has_many :group_operations
end
