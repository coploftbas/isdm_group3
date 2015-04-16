class DocumentVersionsController < InheritedResources::Base

  before_action :set_document_version, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @document_versions = DocumentVersion.all
  end

  def show
  end

  def new
    @document_version = DocumentVersion.new
  end

  def edit
  end

  def create
    @document_version = DocumentVersion.new(document_version_params)
    @document_version.document_name = params[:document_version][:document_name]
    @document_version.remark = params[:document_version][:remark]
    @document_version.comment = params[:document_version][:comment]
    @document_version.project_id = params[:document_version][:project_id]
    @document_version.document_id_id = params[:document_version][:document_id_id]
    max_version = DocumentVersion.where(:project_id => params[:document_version][:project_id], :document_id_id => params[:document_version][:document_id_id]).maximum(:version)
    max_version = max_version.to_i
    #binding.pry
    #if max_version.nil?
    #  @document_version.version = 1
    #else
    @document_version.version = max_version+1
    tmp_name = Document.find(@document_version.document_id_id).file_location
    tmp_name = tmp_name[0,tmp_name.length-5]
    tmp_name = @document_version.project_id.to_s+'_'+tmp_name+'_v'+@document_version.version.to_s
    #binding.pry
    @document_version.setDocumentName(tmp_name)
    #end
    respond_to do |format|
      if @document_version.save
        #binding.pry
        format.html { redirect_to project_path(:id=>params[:document_version][:project_id]), notice: 'Document version was successfully created.' }
        format.json { render :show, status: :created, location: @document_version }
      else
        format.html { render :new }
        format.json { render json: @document_version.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @document_version.update(document_version_params)
        format.html { redirect_to @document_version, notice: 'Document version was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_version }
      else
        format.html { render :edit }
        format.json { render json: @document_verison.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document_version.destroy
    respond_to do |format|
      format.html { redirect_to document_versions_url, notice: 'Document version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_active_doc
    pur_save = DocumentVersion.find(params[:document_id])
    # pur_save.update_attribute(:approveStatus, "Approved")
    if pur_save.update_attribute(:approveStatus, "Approved")
      redirect_to project_path(:id=>params[:project_id]), :notice=> 'Document approved successfully'
    else
      redirect_to project_path(:id=>params[:project_id]), :alert=> 'Document approval failed!'
    end
  end

  def set_deactive_doc
    # pur_destroy = ProjectUserRole.find_by(:project_id_id=>params[:project_id],:user_id_id=>params[:user_id],:role_id_id=>2)
    pur_save = DocumentVersion.find(params[:document_id])
    if pur_save.update_attribute(:remark, "Processing")
      redirect_to project_path(:id=>params[:project_id]), :notice=> 'Reject document success'
    else
      redirect_to project_path(:id=>params[:project_id]), :alert=> 'Reject document failed'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_document_version
    @document_version = DocumentVersion.find(params[:id])
  end

    def document_version_params
      params.require(:document_version).permit(:document_name, :version_document_name, :file_location, :comment, :created_by_id, :updated_by_id, :document_id_id, :file)
    end
end

