class Post < ApplicationRecord
    has_many :comments
    belongs_to :member

    validates :title, presence: true
    validates :body, length: { minimum: 10 }

    def snippet(len = 200)

      if longer_than?(len)
        body[0...(len - 3)] + "..."
      else
        body
      end
    end

    def longer_than?(len)
        body.length > len
    end

end
