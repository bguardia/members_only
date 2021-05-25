class Post < ApplicationRecord
    has_many :comments
    belongs_to :member

    validates :title, presence: true
    validates :body, length: { minimum: 10 }

end
