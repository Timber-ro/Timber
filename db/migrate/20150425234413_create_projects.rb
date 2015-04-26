class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :contractor, index: true
      t.string :title
      t.string :description
      t.attachment :picture
    end
  end
end
