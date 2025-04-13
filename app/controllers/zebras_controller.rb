class ZebrasController < ApplicationController
  before_action :set_zebra, only: [:edit, :update, :destroy]

  def index
    @zebras = Zebra.order(created_at: :asc)
    @zebra = Zebra.new
  end

  def create
    @zebra = Zebra.new(zebra_params)

    respond_to do |format|
      if @zebra.save
        format.html { redirect_back fallback_location: zebras_url, notice: "Zebra was successfully created." }
        format.json { render :show, status: :created, location: @zebra }
        # format.turbo_stream { render turbo_stream: turbo_stream.refresh(request_id: nil) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @zebra.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.turbo_stream
    end
  end

  def update
    respond_to do |format|
      if @zebra.update(zebra_params)
        format.html { redirect_to zebras_url, notice: "Zebra was successfully updated." }
        format.json { render :show, status: :ok, location: @zebra }
        # format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @zebra.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @zebra.destroy!

    respond_to do |format|
      format.html { redirect_to zebras_url, notice: "Zebra was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_zebra
      @zebra = Zebra.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def zebra_params
      params.require(:zebra).permit(:name)
    end
end
