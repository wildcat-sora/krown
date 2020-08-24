class CreateDisplayControls < ActiveRecord::Migration[5.2]
  def change
    create_table :display_controls do |t|
      t.string  :control_type
      t.string  :control_value
      t.string  :yobi_1
      t.timestamps
    end
  end
end
