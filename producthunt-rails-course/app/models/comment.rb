class Comment < ApplicationRecord
  belongs_to :product

  has_many :votes, as: :votable
end
