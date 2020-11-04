class Ticket < ApplicationRecord
    belongs_to :user
    belongs_to :superuser, class_name: "User", foreign_key: :user_admin_id, optional: true
    belongs_to :issue_type
end
