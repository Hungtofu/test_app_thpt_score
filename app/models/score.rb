class Score < ApplicationRecord
    self.primary_key = "sbd"

    validates :sbd, presence: true, uniqueness: true
    validates :toan, :ngu_van, :ngoai_ngu, :vat_li, :hoa_hoc, :sinh_hoc, 
    :lich_su, :dia_li, :gdcd,
    numericality: {greater_than_or_equal_to: 0, less_than_or_euqal_to: 10}, allow_nil: true
end