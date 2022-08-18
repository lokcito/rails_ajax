class Estudiante < ActiveRecord::Base
	self.table_name = "Estudiante"
    belongs_to :comuna, foreign_key: "codigo_comuna"

end