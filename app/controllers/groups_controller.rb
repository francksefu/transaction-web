class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @groups = Group.where(user_id: current_user.id).order(created_at: :desc)
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path, notice: 'Category created successfully '
    else
      render 'new'
    end
  end

  def group_operations
    @group = Group.find(params[:id])
    @operation_group = Operation.left_outer_joins(:group_operations).where(group_operations: { group_id: @group.id },
                                                                           operations: { user_id: current_user.id })
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
