class CreateCatRentalRequest < ActiveRecord::Migration
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id, null: false, presence: true
      t.date :start_date, null: false, presence: true
      t.date :end_date, null: false, presence: true
      t.string :status, default: "PENDING", inclusion: { in: %w(APPROVED DENIED PENDING)}, null: false

      t.timestamps
    end
    add_index :cat_rental_requests, :cat_id
  end
end
