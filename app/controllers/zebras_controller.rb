class ZebrasController < ApplicationController
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

  def destroy
    @zebra = Zebra.find(params[:id])
    @zebra.destroy!

    respond_to do |format|
      format.html { redirect_to zebras_url, notice: "Zebra was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def zebra_params
      params.require(:zebra).permit(:name)
    end
end
