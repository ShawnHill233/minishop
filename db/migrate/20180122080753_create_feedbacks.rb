class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :cate
      t.string :content
      t.string :mobile

      t.timestamps
    end
  end
end
