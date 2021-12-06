class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only: [:show, :search]

  def show
    @profile = current_user.profile
    if @profile&.nickname?
      @profile = current_user.profile
    else
      redirect_to edit_profile_path
    end
  end

  def edit
    @profile = current_user.profile || current_user.build_profile
  end

  def update
    @profile = current_user.profile || current_user.build_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィール更新'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def search
    @results = @q.result
    @profile = 
    if params[:q][:'my_id_eq'] == ""
      redirect_to profile_path, notice: "検索キーワードがありません。"
    elsif @results.present?
      @results
    else
      redirect_to profile_path, notice: '存在しません'
    end
  end

  private

  def set_q
    @q = Profile.ransack(params[:q])
  end

  def profile_params
    params.require(:profile).permit(:avatar, :nickname, :my_id)
  end
end