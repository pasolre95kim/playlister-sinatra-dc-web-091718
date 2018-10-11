class ChangeColumnNameSongGenre < ActiveRecord::Migration
  def change
    rename_column :song_genres, :artist_id, :genre_id
  end
end
