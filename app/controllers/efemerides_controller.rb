class EfemeridesController < ApplicationController
  before_action :set_efemeride, only: %i[ show edit update destroy show_small_image]

  # GET /efemerides or /efemerides.json
  def index
    @efemerides = Efemeride.all
  end

  # GET /efemerides/1 or /efemerides/1.json
  def show
  end

  # GET /efemerides/new
  def new
    @efemeride = Efemeride.new
    @efemeride.image_files.build
  end

  # GET /efemerides/1/edit
  def edit
    if @efemeride.image_files.nil?
      @efemeride.image_files.build
    end
  end

  # POST /efemerides or /efemerides.json
  def create
    @efemeride = Efemeride.new(efemeride_params)

    respond_to do |format|
      if @efemeride.save
        format.html { redirect_to @efemeride, notice: "Efemeride was successfully created." }
        format.json { render :show, status: :created, location: @efemeride }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @efemeride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /efemerides/1 or /efemerides/1.json
  def update
    respond_to do |format|
      if @efemeride.update(efemeride_params)
        format.html { redirect_to @efemeride, notice: "Efemeride was successfully updated." }
        format.json { render :show, status: :ok, location: @efemeride }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @efemeride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /efemerides/1 or /efemerides/1.json
  def destroy
    @efemeride.destroy
    respond_to do |format|
      format.html { redirect_to efemerides_url, notice: "Efemeride was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def show_small_image
    if  @efemeride.image_files.first.is_image?
      send_data @efemeride.image_files.first.get_thumb_nail(250, 250).to_blob,
      filename: @efemeride.image_files.first.filename,
      type: "image/png",
      disposition: 'inline'
    else
      image = Magick::Image.new(70, 70){ self.background_color= "#AAA"}
      image.format = "PNG"
      send_data image.to_blob,
      filename: "#{@efemeride.image_files.first.id.to_s}_thumb.png",
      type: "image/png",
      disposition: 'inline'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_efemeride
      @efemeride = Efemeride.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def efemeride_params
      params.require(:efemeride).permit(:text, :longtext, :date, :category_id, image_files_attributes:
      [
        :id,
        :efemeride_id,
        :image_file,
        :_destroy
      ])
    end
end
