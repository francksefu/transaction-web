class Group < ApplicationRecord

    belongs_to :user
    has_many :group_operations
    has_many :operations, through: :group_operations

    validates :name, presence: true, length: { in: 0..250 }
    validates :icon, presence: true, length: { in: 0..250 }

    def group_total
        # This is the purchases sum of one category
        operations.sum(:amount)
    end
end

#@total_purchases = current_user.purchases.includes(:categories).pluck(:amount).sum
