class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :remote_id
      t.string :badge_url
      t.string :image_url
      t.json :skill

      t.timestamps
    end
  end
end
