class CreatePostcards < ActiveRecord::Migration[5.2]
  def change
    create_table :postcards do |t|
      t.text :message
      t.string :name
      t.belongs_to :address, foreign_key: true

      t.timestamps
    end
  end
end
