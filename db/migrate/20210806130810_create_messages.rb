class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :user_id, null: false
      t.integer :room_id, null: false
      t.integer :company_id, null: false
      t.boolean :is_user, default: true
      t.text :message, null: false

      t.timestamps
    end
  end
end
