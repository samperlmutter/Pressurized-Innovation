class Article < ApplicationRecord
    has_many :comments
    belongs_to :user
    has_many :likes
    
    has_one_attached :avatar
    validates :title, presence: true, length: { minimum: 5 }
    validates :text, presence: true, length: { minimum: 10 }
    
    def is_liked(user)
        return Like.exists?(article_id: self.id, user_id: user.id)
    end
end
