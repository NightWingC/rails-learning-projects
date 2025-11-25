# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  slug        :string
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_products_on_slug  (slug) UNIQUE
#
class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: { message: "Name is required" }
  validates :description, presence: { message: "Description is required" }

  validates :name, length: { minimum: 5, maximum: 200 }

  has_one_attached :image, :dependent => :destroy

  # uniqueness
  # length
  # presence
  # format - Regex

  has_many :product_categories, :dependent => :destroy
  has_many :categories, through: :product_categories
  has_many :comments, -> { order("id DESC") }, :dependent => :destroy
  has_many :votes, as: :votable, :dependent => :destroy

  accepts_nested_attributes_for :categories

  scope :visible, -> { where(visible: true) }

  def category_default
    return self.categories.first.name if self.categories.any?
    "None category"
  end

  def self.populars
    joins("LEFT JOIN votes ON votes.votable_id = products.id AND votes.votable_type = 'Product'")
    .select("products.*, count(votes.id) as total")
    .group("products.id")
    .order("total DESC")
  end
end
