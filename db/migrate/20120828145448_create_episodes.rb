class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :season
      t.integer :no
      t.integer :tvshow_id

      t.timestamps
    end
  end
end
