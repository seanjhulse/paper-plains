class Job < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :vendor, optional: true
  has_many :expenses, dependent: :destroy
  has_many :employee_hours, dependent: :destroy

  enum job_type: [ :non_institutional, :institutional ]

	def job_type_keys(key)
		return key.humanize
	end
end
