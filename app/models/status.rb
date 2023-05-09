class Status < ApplicationRecord
    has_many :tasks, dependent: :destroy
end
