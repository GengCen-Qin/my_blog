class Post < ApplicationRecord
  has_many :tag_posts
  has_many :tags, through: :tag_posts
  belongs_to :category

  before_destroy :check_tag_and_category

  def check_tag_and_category
    p self.category
    self.category.delete if (self.category && self.category.posts.count == 1)
    self.tags.each { |tag| tag.delete if (tag.posts.count == 1) }
  end
end
