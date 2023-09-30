class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # User cant like post 2+ times
  validates :user_id, uniqueness: { scope: :post_id }
end
