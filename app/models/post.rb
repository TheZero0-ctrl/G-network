class Post < ApplicationRecord
    validates :body, presence: true, length: {minimum: 12}
    belongs_to :user
end
