json.extract! funding_info, :id, :fund_code, :department_code, :program_code, :project_code, :account_code, :client_id, :created_at, :updated_at
json.url funding_info_url(funding_info, format: :json)
