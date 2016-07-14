class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :uuid, null: false
      t.text :activity_type, null: false
      t.references :monster, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
