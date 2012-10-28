class ChangeWorldProjectsController < ApplicationController
  before_filter :authenticate_user!

  # GET /change_world_projects
  def index
    if current_user.has_role?('admin')
      @change_world_projects = ChangeWorldProject.all
    else
      @change_world_projects = current_user.change_world_projects.all
    end
  end

  # GET /change_world_projects/new
  def new
    @change_world_project = ChangeWorldProject.new
  end

  # GET /change_world_projects/1/edit
  def edit
    user_can_perform_action?

    @change_world_project = ChangeWorldProject.find(params[:id])
  end

  # POST /change_world_projects
  def create
    @change_world_project = ChangeWorldProject.new(params[:change_world_project])
    @change_world_project.users << current_user

    respond_to do |format|
      if @change_world_project.save
        format.html { redirect_to @change_world_project, notice: 'Проект был успешно добавлен!' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /change_world_projects/1
  def update
    user_can_perform_action?

    @change_world_project = ChangeWorldProject.find(params[:id])

    respond_to do |format|
      if @change_world_project.update_attributes(params[:change_world_project])
        format.html { redirect_to @change_world_project, notice: 'Проект был успешно обновлен!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # GET /change_world_projects/1
  def show
    user_can_perform_action?

    @change_world_project = ChangeWorldProject.find(params[:id])
  end

  # DELETE /change_world_projects/1
  def destroy
    validate_admin!

    @change_world_project = ChangeWorldProject.find(params[:id])
    @change_world_project.destroy

    respond_to do |format|
      format.html { redirect_to change_world_projects_url }
    end
  end

  protected
  def user_can_perform_action?
    return if current_user.has_role?('admin')

    current_user.change_world_projects.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to change_world_projects_url, notice: 'У вас нет прав для выполнения этого действия' }
    end
  end
end
