class User < ApplicationRecord
  enum role: [:guest, :employee, :administrator, :super_administrator]
  
  validates :netid, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
end
