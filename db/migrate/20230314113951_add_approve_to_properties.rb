class AddApproveToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :approve, :boolean
  end
end
