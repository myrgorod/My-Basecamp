class RemoveBodyFromProject < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :body, :text
  end
end
