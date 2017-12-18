class CreateAttraction < ActiveRecord::Migration[5.1]
  def change
    create_table(:attractions) do |t|
      t.column(:name, :string)
      t.column(:description, :string)
      t.column(:season, :string)
      t.column(:price, :money)
      t.timestamps
    end
  end
end
