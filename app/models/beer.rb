class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings

  def average_rating
    all = ratings.collect { |rating| rating.score }
    all.inject(0.0) {|sum, el| sum + el} / all.size
  end

  def to_s
    name + " (" + brewery.name + ")"
  end
end
