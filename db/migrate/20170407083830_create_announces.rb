class CreateAnnounces < ActiveRecord::Migration
  def change
    create_table :announces do |t|
      t.string :announce_title
      t.string :announce_content

      t.timestamps null: false
    end
  end
end
