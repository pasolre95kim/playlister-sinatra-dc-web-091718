class Song < ActiveRecord::Base
  include Slugifiable
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres


  def self.find_by_slug(str)
    # name = str.gsub!("-"," ").split(" ").map do |str|
    #   str.capitalize
    # end.join(" ")
    # self.find_by(name: name)
    Song.all.find do |song|
      song.slug == str
    end
  end
end
