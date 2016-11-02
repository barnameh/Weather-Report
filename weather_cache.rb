require 'active_record'

class WeatherReportMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :type
      t.string :zipcode
      t.text :json_report
      t.timestamps null: false
    end
  end
end
