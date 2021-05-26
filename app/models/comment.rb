class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :member

    validates :body, length: { minimum: 1, too_short: "needs to include at least one character."}
end
