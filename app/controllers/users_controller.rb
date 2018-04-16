# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  uuid                   :string
#  slug                   :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(:page => params[:page], :per_page => params[:per_page] ||= 30).order(created_at: :desc)
    respond_to do |format|
      format.json {render json: User.all}
      format.html {}
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.json {render json: @user}
      format.html {@user}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      begin
        @user = User.friendly.find(params[:id])
      rescue
        respond_to do |format|
          format.json {render status: 404, json: {alert: "The user you're looking for cannot be found"}}
          format.html {redirect_to users_path, alert: "The user you're looking for cannot be found"}
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
