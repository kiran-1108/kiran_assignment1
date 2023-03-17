class RemoveApproveFromProperties < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :approve, :boolean
  end
end
