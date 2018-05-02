class Vendor < ApplicationRecord
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :jobs, dependent: :nullify

	def name
		"#{first_name} #{last_name}"
	end
end
