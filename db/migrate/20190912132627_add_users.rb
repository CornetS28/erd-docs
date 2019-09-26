class AddUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :surname
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.string :image_url
      t.string :address

      t.timestamps
    end
  end
end
