class TicketsController < ApplicationController
    before_action :require_login

    def index
        @tickets = Ticket.all
        # binding.pry
        # @tickets_uao = Ticket.all.unassigned_or_owned
    end

    def home
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
            else
                redirect_to new_user_ticket_path(current_user)
                flash[:alert] = "Please fill out all fields!"
            end

        else
            redirect_to '/users/sign_in'
        end
    end

    def edit
        @ticket = Ticket.find_by_id(params[:id])
    end

    def update
        # binding.pry
        @ticket = Ticket.find_by_id(params[:id])
        if @ticket.update(ticket_params)
            redirect_to tickets_path
        else
            render edit_ticket_path(@ticket)
            flash[:alert] = "Please fill out all fields"
        end
    end

    def most_common_issue
    end

    private

    def ticket_params
        params.require(:ticket).permit(:title, :description, :user_admin_id, :is_open, :issue_type_id)
    end
end
