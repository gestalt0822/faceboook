class RemoveNameFromoTopics < ActiveRecord::Migration
  def change
        remove_column :topics, :name, :integer
  end
end
