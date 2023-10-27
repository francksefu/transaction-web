class OperationsController < ApplicationController
    def new
        @operation = Operation.new
        @operation.group_operations.build
    end

    def create
        @operation = current_user.operations.build(operation_params)
        if @operation.save
            redirect_to groups_path
        else
            render 'new'
        end
    end

    private 
    def operation_params
        params.require(:operation).permit(:name, amount, group_operations_attributes: [:group_id])
    end
end
