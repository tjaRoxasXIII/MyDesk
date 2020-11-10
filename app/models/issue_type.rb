class IssueType < ApplicationRecord
    has_many :tickets
    has_many :users, through: :tickets
    validates :name, presence: true 

    def self.most_common_occurrence
        @counter = Hash.new(0) 
        self.tickets.each do |ticket|
            @counter[ticket.issue_type_id] += 1
        end
        @counter.sort_by { |issue, number| number}.last[0]
    end
end
