class Detail < ActiveRecord::Base
	require 'csv'    

	csv_text = File.read('db/MOCK_DATA.csv')
	csv = CSV.parse(csv_text, :headers => true)
	csv.each do |row|
		Detail.create!(row.to_hash)
	end
end