class InitialTables < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.belongs_to :user
      t.belongs_to :location
      t.belongs_to :slot
      t.text :description
      t.string :title
      t.string :duration
      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.timestamps
    end

    create_table :locations do |t|
      t.string :address
      t.timestamps
    end

    create_table :slots do |t|
      t.datetime :time
      t.timestamps
    end
  end
end
