class Profile < ApplicationRecord
    validates :bio, presence: true
end
