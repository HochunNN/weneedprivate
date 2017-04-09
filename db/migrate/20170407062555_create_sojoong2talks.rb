class CreateSojoong2talks < ActiveRecord::Migration
  def change
    create_table :sojoong2talks do |t|
      t.string :talk_thumbnail
      t.string :talk_content

      t.timestamps null: false
    end
  end
end
