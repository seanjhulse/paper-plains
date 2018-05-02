json.extract! job, :id, :title, :description, :job_number, :job_type, :artist_approval, :editor_approval, :vendor_approval, :client_id, :vendor_id, :created_at, :updated_at
json.url job_url(job, format: :json)
