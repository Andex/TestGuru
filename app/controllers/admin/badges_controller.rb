class Admin::BadgesController < Admin::BaseController

  before_action :set_badge, only: %i[edit update destroy]
  before_action :set_rules, only: %i[new create edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_badge_not_found

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.success_create')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.success_update')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success_delete')
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :picture, :rule_name, :parameter)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_rules
    @rules = Badge::RULES
  end

  def rescue_with_badge_not_found
    render plain: t('.not_found')
  end
end