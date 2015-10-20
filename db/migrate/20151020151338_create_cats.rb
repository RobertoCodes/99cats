class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :birth_date, presence: true
      t.string :color, presence: true
      t.string :name, presence: true
      t.string :sex, limit: 1, inclusion: { in: %w(m f)}, presence: true
      t.text :description, presence: true

      t.timestamps
    end
  end
end
