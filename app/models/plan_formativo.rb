class PlanFormativo < ActiveRecord::Base
	self.table_name = "Plan_Formativo"
    has_many :curso, foreign_key: "codigo_plan_formativo"
end