# frozen_string_literal: true

class CreateStatements < ActiveRecord::Migration[7.0]
  def change
    create_table :statements do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
