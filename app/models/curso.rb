class Curso < ActiveRecord::Base
	self.table_name = "Curso"
    has_many :estudiante, foreign_key: "codigo_curso"
    belongs_to :plan_formativo, foreign_key: "codigo_plan_formativo"
end