class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts

def last_5_posts
    self.posts.order(created_at: :desc).reverse_order.limit(5).reverse 
end


def most_liked_post
    self.posts.max_by(&:likes)
end


def bloggers_avg_age
    total = self.bloggers.uniq.reduce(0) { |sum, blogger| sum + blogger.age }
    total / self.bloggers.uniq.count
end 
end
