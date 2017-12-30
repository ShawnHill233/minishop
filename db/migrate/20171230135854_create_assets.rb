class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :assets do |t|
      t.references :viewable,               polymorphic: true
      t.integer    :attachment_width
      t.integer    :attachment_height
      t.integer    :attachment_file_size
      t.integer    :position
      t.string     :attachment_content_type
      t.string     :attachment_file_name
      t.string     :type,                   limit: 75
      t.datetime   :attachment_updated_at
      t.text       :alt

      t.timestamps
    end

  end
end
