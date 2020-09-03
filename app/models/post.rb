class Post < ApplicationRecord
  validates :secret, presence: true, length: {minimum:3, maximum:450}
  belongs_to :user
end
