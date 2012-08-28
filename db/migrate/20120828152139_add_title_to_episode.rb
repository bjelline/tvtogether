class AddTitleToEpisode < ActiveRecord::Migration
  def up
    add_column :episodes, :title,  :string
  end
  def down
    remove_column :episodes, :title
  end
end
