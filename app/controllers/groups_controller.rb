class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      current_user.join!(@group)
      redirect_to groups_path
      flash[:notice] = "Group created"
    else
      render :new
    end
  end

  def edit
    @group = current_user.groups.find(params[:id])
  end

  def update
    @group = current_user.groups.find(params[:id])

    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
  end

  def destroy
    @group = current_user.groups.find(params[:id])
    @group.destroy
    redirect_to groups_path
    flash[:alert] = "Group has been removed"
  end

  def join
    @group = Group.find(params[:id])

    if !current_user.is_member_of?(@group)
      current_user.join!(@group)
      flash[:notice] = "Joined"
    else
      flash[:warning] = "You've been member already."
    end

    redirect_to group_path(@group)
  end

  def quit
    @group = Group.find(params[:id])

    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
      flash[:alert] = "Hope to see you soon."
    else
      flash[:warning] = "Join us first."
    end

    redirect_to group_path(@group)
  end

  private

  def group_params
    params.require(:group).permit(:title, :body)
  end
end
