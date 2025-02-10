class OrderAdjustmentsController < ApplicationController
  before_action :set_order_adjustment, only: %i[ show edit update destroy ]

  # GET /order_adjustments or /order_adjustments.json
  def index
    @order_adjustments = OrderAdjustment.all
  end

  # GET /order_adjustments/1 or /order_adjustments/1.json
  def show
  end

  # GET /order_adjustments/new
  def new
    @order_adjustment = OrderAdjustment.new
  end

  # GET /order_adjustments/1/edit
  def edit
  end

  # POST /order_adjustments or /order_adjustments.json
  def create
    @order_adjustment = OrderAdjustment.new(order_adjustment_params)

    respond_to do |format|
      if @order_adjustment.save
        format.html { redirect_to @order_adjustment, notice: "Order adjustment was successfully created." }
        format.json { render :show, status: :created, location: @order_adjustment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_adjustment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_adjustments/1 or /order_adjustments/1.json
  def update
    respond_to do |format|
      if @order_adjustment.update(order_adjustment_params)
        format.html { redirect_to @order_adjustment, notice: "Order adjustment was successfully updated." }
        format.json { render :show, status: :ok, location: @order_adjustment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_adjustment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_adjustments/1 or /order_adjustments/1.json
  def destroy
    @order_adjustment.destroy!

    respond_to do |format|
      format.html { redirect_to order_adjustments_path, status: :see_other, notice: "Order adjustment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_adjustment
      @order_adjustment = OrderAdjustment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def order_adjustment_params
      params.expect(order_adjustment: [ :order_id, :discount_id, :amount ])
    end
end
