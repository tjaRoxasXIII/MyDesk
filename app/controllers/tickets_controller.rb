class TicketsController < ApplicationController
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
        @ticket = Ticket.new(ticket_params)
        binding.pry
        @ticket.user_id = current_user.id
        if @ticket.save
            redirect_to tickets_path
        else
            render new_ticket_path
        end
    end

    private

    def ticket_params
        params.require(:ticket).permit(:title, :description, :is_open, :issue_type)
    end
end
