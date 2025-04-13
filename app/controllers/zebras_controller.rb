class ZebrasController < ApplicationController
  def index
    @zebras = Zebra.order(created_at: :desc)
  end

  def destroy
    @zebra = Zebra.find(params[:id])
    @zebra.destroy!

    respond_to do |format|
      format.html { redirect_to zebras_url, notice: "Zebra was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream { head :no_content }
    end
  end
end
