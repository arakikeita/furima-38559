class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.string     :post     , null: false
      t.integer    :area_id  , null: false
      t.string     :city     , null: false
      t.string     :num      , null: false
      t.string     :building 
      t.string     :telephone, null: false
      t.references :buy      , null: false, foreign_key: true 

    end
  end
end
