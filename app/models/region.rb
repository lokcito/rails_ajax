class Region < ActiveRecord::Base
	self.table_name = "Region"
    has_many :comuna, foreign_key: "codigo_region"
end