class Task < ApplicationRecord
    belongs_to :user
    belongs_to :status

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "discription", "display_text", "end_date_time", "id", "label", "level", "start_date_time", "status_id", "updated_at", "user_id"]
      end
end
