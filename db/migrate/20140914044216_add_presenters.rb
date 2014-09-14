class AddPresenters < ActiveRecord::Migration
  def change
    add_column :workshops, :presenter, :string
  end
end
