class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_and_belongs_to_many :tags

	validates :name, presence: true, length: {minimum: 3}, uniqueness: true
	validates :description, :price_range, :opening_hours, presence: true
	geocoded_by :address
	after_validation :geocode


  def tag_names
    tags.map {|tag| tag.name}.join(', ')
  end

  def tag_names=(tag_names)
    self.tags = tag_names.split(/,\s?/).map do |tag_name|
      tag_name.downcase.gsub(/[^a-z]/, '')
      Tag.find_or_create_by(name: tag_name)
    end
  end

  def self.for_tag_or_all(tag_name)
    tag_name.nil? ?  all.order('promoted DESC') :  Tag.find_by(name: tag_name).restaurants.order('promoted DESC')
  end

	def average_rating
   	reviews.average('rating') || 'Unrated'
  end
    #avarange rating save as rating not to repeating same code
  alias_method :rating, :average_rating

end
