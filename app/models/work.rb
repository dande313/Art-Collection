class Work < ActiveRecord::Base
	belongs_to :user

  def slug
    title.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|work| work.slug == slug}
  end
end