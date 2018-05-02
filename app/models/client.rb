class Client < ApplicationRecord
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :jobs, dependent: :nullify
  has_one  :funding_info, dependent: :destroy

  accepts_nested_attributes_for :funding_info

	def name
		return "#{first_name} #{last_name}"
	end

end
