class CreateTables < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.column :name, :string
      t.column :start, :datetime
      t.column :stop, :datetime
      t.column :category_id, :integer


      t.timestamps
    end
  end
end
