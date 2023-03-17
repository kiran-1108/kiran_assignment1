class AddImageToProperties < ActiveRecord::Migration[7.0]
  def up
       add_column :properties, :image_file_name, :string
       add_column :properties, :image_file_size, :integer
       add_column :properties, :image_content_type, :string
       add_column :properties, :image_updated_at, :datetime
    end

    def down
       remove_column :properties, :image_file_name, :string
       remove_column :properties, :image_file_size, :integer
       remove_column :properties, :image_content_type, :string
       remove_column :properties, :image_updated_at, :datetime
    end
end
