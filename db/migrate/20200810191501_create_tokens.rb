class CreateTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.integer :token_number

      t.timestamps
    end
  end
end
