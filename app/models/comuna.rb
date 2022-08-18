class Comuna < ActiveRecord::Base
	self.table_name = "Comuna"
    has_many :estudiante, foreign_key: "codigo_comuna"
    belongs_to :region, foreign_key: "codigo_region"
end