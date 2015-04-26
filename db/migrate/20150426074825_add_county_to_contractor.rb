class AddCountyToContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :county, :string
  end
end
