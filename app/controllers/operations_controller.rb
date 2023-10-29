class OperationsController < ApplicationController
    def new
        @operation = Operation.new
        @operation.group_operations.build
    end

    def create
        @operation = current_user.operations.build(operation_params)
        extra_data = params[:operation][:extra_field]
        if @operation.save 
            @group_op = GroupOperation.new(operation: Operation.last, group_id: extra_data)
            if  @group_op.save
                redirect_to groups_path
            end
        else
          render 'new'
        end
        
      end
      
      private
      
      def operation_params
        params.require(:operation).permit(:name, :amount, group_operations_attributes: [:group_id])
      end
  
end
