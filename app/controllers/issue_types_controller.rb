class IssueTypesController < ApplicationController
    def index
        @issue_types = IssueType.all
    end

    def new
        @issue_type = IssueType.new
    end

    def create
        @issue_type = IssueType.new(issue_params)
        if @issue_type.save
            redirect_to issue_types_path
        else
            redirect_to new_issue_type_path
            flash[:alert] = "Field cannot be blank"
        end
    end

    def destroy
        @issue_type = IssueType.find_by_id(params["id"])
        @issue_type.destroy
        redirect_to issue_types_path
    end

    def issue_params
        params.require(:issue_type).permit(:name)
    end
end
