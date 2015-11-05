class ProjectsController < ApplicationController
  before_action :find_projects, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @projects = Project.all.order("created_at desc")
  end

  def show
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "That is looking even better!"
    else
      render "edit", notice: "Shoot, nice try."
    end
  end

  def edit
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: "NICE PROJECT!"
    else
      render 'new', notice: "UH OH! Better luck next time!"
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :link, :slug)
  end

  def find_projects
    @project = Project.friendly.find(params[:id])
  end
end
