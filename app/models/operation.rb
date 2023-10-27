class Operation < ApplicationRecord

  

  belongs_to :user
  has_many :group_operations
  has_many :groups, through: :group_operations
  accepts_nested_attributes_for :group_operations
end
