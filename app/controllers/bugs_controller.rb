# frozen_string_literal: true

class BugsController < ApplicationController
  before_action :set_bug, only: %i[show edit update destroy]
  # GET /bugs
  # GET /bugs.json
  def index
    @project = Project.find(params[:project_id])
    @bugs = @project.bugs
  end

  # GET /bugs/1
  # GET /bugs/1.json
  def show; end

  # GET /bugs/new
  def new
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.new
    authorize @bug
  end

  # GET /bugs/1/edit
  def edit
    authorize @bug
  end

  # POST /bugs
  # POST /bugs.json
  def create
    @project = Project.find(params[:project_id])
    form_data = bug_params
    #form_data[:assigned_to] = User.find(bug_params[:assigned_to])
    @bug = @project.bugs.new(form_data)
    @bug.posted_by = current_user
    respond_to do |format|
      if @bug.save
        format.html {redirect_to [@project, @bug], notice: 'Bug was successfully created.'}
        format.json {render :show, status: :created, location: @bug}
      else
        format.html {render :new}
        format.json {render json: @bug.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /bugs/1
  # PATCH/PUT /bugs/1.json
  def update
    respond_to do |format|
      form_data = bug_params
      # form_data[:assigned_to] = User.find(bug_params[:assigned_to])
      if @bug.update(form_data)
        format.html {redirect_to [@project,@bug], notice: 'Bug was successfully updated.'}
        format.json {render :show, status: :ok, location: @bug}
      else
        format.html {render :edit}
        format.json {render json: @bug.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.json
  def destroy
    @bug.destroy
    respond_to do |format|
      format.html {redirect_to [@project, Bug], notice: 'Bug was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def pick
    @project = Project.find(params[:project_id].to_i)
    if @project
      @bug = @project.bugs.find(params[:id].to_i)
      if @bug
        if !(@bug.assigned_to_id?)
          @bug.assigned_to = current_user
          @bug.save
        end
      end
    end
    redirect_to [@project, @bug]
  end

  def drop
    @project = Project.find(params[:project_id].to_i)
    if @project
      @bug = @project.bugs.find(params[:id].to_i)
      if @bug
        if @bug.assigned_to == current_user
          @bug.assigned_to = nil
          @bug.save
        end
      end
    end
    redirect_to  [@project, @bug]
  end

  def status
    if params[:status].to_i >= 0 && params[:status].to_i <= 3
      @project = Project.find(params[:project_id])
      @bug = @project.bugs.find(params[:id])
      if @project && @bug
        @bug.status = params[:status].to_i
        @bug.save
      end
    end
    redirect_to  [@project, @bug]
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bug
    @project = Project.find(params[:project_id])
    @bug = Bug.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bug_params
    params[:bug][:usertype] = params[:bug][:usertype].to_i
    params.require(:bug).permit(:title, :description, :deadline, :usertype, images: [])
  end
end
