class CreateTables < ActiveRecord::Migration
 def change

    create_table :events do |t|
      t.column :name, :string
      t.column :start, :datetime
      t.column :stop, :datetime
      t.column :category_id, :integer

      t.timestamps
    end

    create_table :todos do |t|
      t.column :name, :string
      t.column :done, :boolean

      t.timestamps
    end
    
    create_table :notes do |t|
      t.column :name, :string
      t.column :notable_id, :integer
      t.column :notable_type, :string

      t.timestamps
    end

    create_table :categories do |t|
      t.column :name, :string

      t.timestamps
    end

  end
end
