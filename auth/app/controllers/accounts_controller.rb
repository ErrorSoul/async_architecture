class AccountsController < ApplicationController
  before_action :check_auth, only: %i[index show update destroy]
  before_action :set_account, only: %i[ show edit update destroy ]
  # before_action :doorkeeper_authorize!, only: %i[index ]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  def current

    render json: current_account
  end

  def sign_up
    @account = Account.new
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(user_params)

    respond_to do |format|
      if @account.save
        session[:account_id] = @account.id
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :sign_up, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def log_out
    session.delete(:account_id)
    @current_account = nil
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:email, :password_digest, :role)
    end

    def user_params
      params.require(:account).permit(:email, :password, :password_confirmation)
    end
end
