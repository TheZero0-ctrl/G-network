class Post < ApplicationRecord
    validates :body, presence: true, length: {minimum: 12}
    validates :user_id, presence: true
    validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" },
        size:
        { less_than: 5.megabytes,
        message:
        "should be less than 5MB" }
    belongs_to :user
    has_one_attached :image

    default_scope -> { order(created_at: :desc) }
end
