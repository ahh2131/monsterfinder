class ChangeColumnActivityTypeToInteger < ActiveRecord::Migration
  def change
    change_column :activities, :activity_type, 'integer USING CAST(activity_type AS integer)', null: false
  end
end
