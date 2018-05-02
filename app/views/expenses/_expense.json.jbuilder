json.extract! expense, :id, :description, :cost_cents, :cost_currency, :job_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
