class Operation < ApplicationRecord
  belongs_to :user
  has_many :group_operations
  has_many :groups, through: :group_operations
  accepts_nested_attributes_for :group_operations

  attr_accessor :extra_field

  validates :name, presence: true, length: { in: 0..250 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
