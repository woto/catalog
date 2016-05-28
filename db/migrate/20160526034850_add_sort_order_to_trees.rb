class AddSortOrderToTrees < ActiveRecord::Migration[5.0]
  def change
    add_column :trees, :sort_order, :integer
  end
end
