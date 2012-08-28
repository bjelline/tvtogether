class CreateTvshows < ActiveRecord::Migration
  def change
    create_table :tvshows do |t|
      t.string :title
      t.string :imdb_url

      t.timestamps
    end
  end
end
