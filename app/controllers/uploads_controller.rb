require 'fileutils'

class UploadsController < ApplicationController
  UPLOADS_PATH = Rails.root.join('public', 'uploads')
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all.reverse_order.page params[:page]
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create
    uploaded_io = params[:upload][:file]

    @upload = Upload.create(file: uploaded_io.original_filename, es_index: upload_params['es_index'])
    path = Rails.root.join(UPLOADS_PATH, @upload.id.to_s, uploaded_io.original_filename)

    dirname = File.dirname(path)
    unless File.directory?(dirname)
      FileUtils.mkdir_p(dirname)
    end

    File.open(path, 'wb') do |file|
      file.write(uploaded_io.read)
    end


    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    path = Rails.root.join(UPLOADS_PATH, @upload.id.to_s)
    FileUtils.rm_r path

    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:file, :es_index)
    end
end
