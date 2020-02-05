class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts
validates :name, uniqueness: true
validates :bio, length: { minimum: 30 }
validates :age, numericality: { greater_than: 0 }

def blogger_likes
    self.posts.reduce(0) { |sum, post| sum + post.likes }
end

def featured_most_liked_post
    self.posts.max_by(&:likes)
end

def most_written_destinations(limit=3)
    destinations
      .group("destinations.id")
      .order("count(destinations.id) DESC")
      .limit(limit)
  end

end
