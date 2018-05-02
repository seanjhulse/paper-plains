class EmployeeHour < ApplicationRecord
  belongs_to :job
  monetize :cost_per_hour_cents, :allow_nil => true

end
