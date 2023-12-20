# frozen_string_literal: true

class StatementsController < ApplicationController
  def index
    @statements = Statement.where(user_id: current_user.id)
    @statement = current_user.statements.build
  end

  def show
    @statement = Statement.find(params[:id])
    @expenditures = @statement.expenditures
    @incomes = @statement.incomes
  end

  def new
    @statement = current_user.statements.build
    5.times do
      @incomes = @statement.incomes.build
      @expenditures = @statement.expenditures.build
    end
  end

  def create
    @statement = current_user.statements.new(statement_params)

    respond_to do |format|
      if @statement.save
        format.html { redirect_to statements_url, notice: 'Statement successfully created.' }
        format.json { render :index, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @statement = Statement.find(params[:id])
    @statement.destroy!

    respond_to do |format|
      format.html { redirect_to statements_url, notice: 'Statement successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def statement_params
    params.require(:statement).permit(:name, incomes_attributes: %i[name amount_pennies],
                                             expenditures_attributes: %i[name amount_pennies])
  end
end
