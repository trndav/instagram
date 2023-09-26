class Post < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5, maximum: 100 }
    validates :description, :keywords, presence: true, length: { minimum: 5, maximum: 400 }
end
