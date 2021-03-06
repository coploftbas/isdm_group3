class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :assign_role]
  before_filter :authenticate_user!

  helper_method :set_active
  helper_method :set_deactive

  # GET /projects
  # GET /projects.json
  
  def index
    @projects = Project.all
		@current_user_work_on_project = Project.joins("LEFT JOIN project_user_roles ON(projects.id = project_user_roles.project_id_id)").select("projects.id, projects.project_name, projects.created_by_id, project_user_roles.user_id_id, 
      project_user_roles.role_id_id, project_user_roles.project_id_id, project_user_roles.created_at,
      project_user_roles.updated_at").where("project_user_roles.user_id_id = ?", current_user.id).search(params[:search])
    @current_user_work_on_project = @current_user_work_on_project.paginate(:per_page=>5, :page => params[:page])
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @users = User.where.not(id: current_user.id)
    @members = ProjectUserRole.where(:project_id_id => params[:id])
    @documents = Document.order(:id).all
    @logRecords = DocumentVersion.joins("LEFT JOIN users ON(document_versions.updated_by_id = users.id)").select('document_versions.document_id_id, document_versions.document_name, document_versions.comment, document_versions.updated_by_id, document_versions.updated_at, users.firstname, document_versions.remark, document_versions."approveStatus"').where(:project_id => params[:id])
    @approvals = DocumentVersion.where("project_id =? and remark = ?" ,  params[:id], "Completed")
  end

  def assign_role
     @users = User.where.not(id: current_user.id)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.created_by_id = current_user.id
    @project.delete_flg = 0
    respond_to do |format|
      if @project.save
        pur = ProjectUserRole.new(:project_id_id=>@project.id,:user_id_id=>current_user.id,:role_id_id=>1)
        pur.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload_doc
    tmp = DocumentVersion.new(document_version_params)
    tmp.project_id = params[:document_version][:project_id]
    tmp.save
    redirect_to project_path(:id=>params[:document_version][:project_id])
  end

  def set_active
    pur_save = ProjectUserRole.new(:project_id_id=>params[:project_id],:user_id_id=>params[:user_id],:role_id_id=>2)

    if pur_save.save
      redirect_to project_path(:id=>params[:project_id]), :notice=> 'Assign member success'
    else
      redirect_to project_path(:id=>params[:project_id]), :alert=> 'Assign member failed'
    end
  end

  def set_deactive
    pur_destroy = ProjectUserRole.find_by(:project_id_id=>params[:project_id],:user_id_id=>params[:user_id],:role_id_id=>2)

    if pur_destroy.destroy
      redirect_to project_path(:id=>params[:project_id]), :notice=> 'Remove member success'
    else
      redirect_to project_path(:id=>params[:project_id]), :alert=> 'Remove member failed'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:project_name, :created_by, :delete_flg, :start_date, :end_date)
    end

end
