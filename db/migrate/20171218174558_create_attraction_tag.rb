class CreateAttractionTag < ActiveRecord::Migration[5.1]
  def change
    create_table(:attraction_tags) do |t|
      t.column(:attraction_id, :integer)
      t.column(:tag_id, :integer)
      t.timestamps
    end
  end
end
