class RelationshipBetweenCategoriesAndContractors < ActiveRecord::Migration
  def change
    create_table :categories_contractors, id: false do |t|
      t.belongs_to :contractor, index: true
      t.belongs_to :category, index: true
    end
  end
end
