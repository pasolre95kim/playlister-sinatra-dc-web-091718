class Artist < ActiveRecord::Base
  include Slugifiable
  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(str)
    name = str.gsub!("-"," ").split(" ").map do |str|
      str.capitalize
    end.join(" ")
    self.find_by(name: name)
  end


end
