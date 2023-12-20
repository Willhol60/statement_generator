# frozen_string_literal: true

class CreateExpenditures < ActiveRecord::Migration[7.0]
  def change
    create_table :expenditures do |t|
      t.string :name
      t.integer :amount_pennies
      t.references :statement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
