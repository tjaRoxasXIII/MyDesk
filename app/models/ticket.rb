class Ticket < ApplicationRecord
    belongs_to :user
    belongs_to :superuser, class_name: "User", foreign_key: :user_admin_id, optional: true
    belongs_to :issue_type

    validates :title, presence: true
    validates :description, presence: true

    def self.most_common_issue
        @counter = Hash.new(0) 
        self.all.each do |ticket|
            @counter[ticket.issue_type] += 1
        end
        # binding.pry
        @counter.sort_by { |issue, number| number}.last
    end
end
