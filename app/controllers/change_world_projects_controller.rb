﻿class ChangeWorldProjectsController < ApplicationController
  before_filter :authenticate_user!

  # GET /change_world_projects
  def index
    if current_user.has_role?('admin')
      @change_world_projects = ChangeWorldProject.all
    else
      @change_world_projects = current_user.change_world_projects.all
    end

    respond_to do |format|
      format.html
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  def export_to_csv
    validate_admin!

    require 'csv'

    if current_user.has_role?('admin')
      @projs = ChangeWorldProject.all
    else
      @projs = current_user.change_world_projects.all
    end

    csv = CSV.generate(:force_quotes => true) do |line|
      #ar = Iconv.conv("UTF-8", "LATIN1", post.to_csv)
      @projs.map { |post| line << post.to_csv.flatten }
    end

    send_data csv,
              :type => 'text/csv; charset=cp1251; header=present',
              :disposition => "attachment; filename=projects-#{Time.now.strftime('%d-%m-%y--%H-%M')}.csv"
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

    if @change_world_project.save
      redirect_to @change_world_project, notice: 'Проект был успешно добавлен!'
    else
      render action: "new"
    end
  end

  # PUT /change_world_projects/1
  def update
    user_can_perform_action?

    @change_world_project = ChangeWorldProject.find(params[:id])

    if @change_world_project.update_attributes(params[:change_world_project])
      redirect_to @change_world_project, notice: 'Проект был успешно обновлен!'
    else
      render action: "edit"
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

    redirect_to change_world_projects_url
  end

  protected
  def user_can_perform_action?
    return if current_user.has_role?('admin')

    current_user.change_world_projects.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to change_world_projects_url,
                notice: 'У вас нет прав для выполнения этого действия'
  end
end
