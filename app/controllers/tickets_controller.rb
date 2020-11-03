class TicketsController < ApplicationController
    before_action :require_login

    def index
        @tickets = Ticket.all
    end

    def show
        @ticket = Ticket.find_by_id(params[:id])
    end
    
    def new
        @ticket = Ticket.new
    end

    def create
        # binding.pry
        if !current_user.nil?
            @ticket = Ticket.new(ticket_params)
            @ticket.user_id = current_user.id
            @ticket.is_open = true
            if @ticket.save
                redirect_to tickets_path
            end
        else
            redirect_to '/users/sign_in'
        end
    end

    private

    def ticket_params
        params.require(:ticket).permit(:title, :description, :is_open, :issue_type)
    end
end
