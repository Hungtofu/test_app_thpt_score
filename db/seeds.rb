# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'
require 'activerecord-import'

file_path = Rails.root.join('db','seeds','diem_thi_thpt_2024.csv')

batch_size = 10000
scores = []
count = 0


CSV.foreach(file_path, headers: true) do |row|
    scores << Score.new(
        sbd: row["sbd"],
        toan: row["toan"],
        ngu_van: row["ngu_van"],
        ngoai_ngu: row["ngoai_ngu"],
        vat_li: row["vat_li"],
        hoa_hoc: row["hoa_hoc"],
        sinh_hoc: row["sinh_hoc"],
        lich_su: row["lich_su"],
        dia_li: row["dia_li"],
        gdcd: row["gdcd"],
        ma_ngoai_ngu: row["ma_ngoai_ngu"]
    )

    count += 1
    if scores.size >= batch_size
        Score.import(scores)
        scores.clear
        puts "#{count}"
    end
end

Score.import scores unless scores.empty?

puts "data seeding cuccess!"