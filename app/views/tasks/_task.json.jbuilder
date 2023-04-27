json.extract! task, :id, :user_id, :display_text, :discription, :start_date_time, :end_date_time, :status_id, :level, :label, :created_at, :updated_at
json.url task_url(task, format: :json)
