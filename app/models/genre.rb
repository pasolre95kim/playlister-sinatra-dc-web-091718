class Genre < ActiveRecord::Base
  include Slugifiable
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  has_many :song_genres

  def self.find_by_slug(str)
    name = str.gsub!("-"," ").split(" ").map do |str|
      str.capitalize
    end.join(" ")
    self.find_by(name: name)
  end
end
