class AddPresenters < ActiveRecord::Migration
  def change
    add_column :workshops, :presenters, :string 
  end
end
