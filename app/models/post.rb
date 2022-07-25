class Post < ApplicationRecord
    validates :body, presence: true, length: {minimum: 12}
    validates :user_id, presence: true
    belongs_to :user

    default_scope -> { order(created_at: :desc) }
end
