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
    @document_version.comment = params[:document_version][:comment]
    @document_version.project_id = params[:document_version][:project_id]
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

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_document_version
    @document_version = DocumentVersion.find(params[:id])
  end

    def document_version_params
      params.require(:document_version).permit(:document_name, :version_document_name, :file_location, :comment, :created_by_id, :updated_by_id, :document_id_id, :file)
    end
end

