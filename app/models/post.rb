class Post < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3, maximum: 100 }
    validates :description, :keywords, presence: true, length: { minimum: 4, maximum: 400 }

    has_many_attached :images
end
