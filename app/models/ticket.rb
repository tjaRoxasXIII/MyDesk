class Ticket < ApplicationRecord
    belongs_to :user
    belongs_to :admin, class_name: "User", foreign_key: :user_admin_id
end
