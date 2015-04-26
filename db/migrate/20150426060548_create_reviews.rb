class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to    :contractor, index: true
      t.string        :commenter_email
      t.text          :body
      t.integer       :quality_rating
      t.integer       :efficiency_rating
      t.integer       :friendliness_rating

      t.timestamps null: false
    end
  end
end
