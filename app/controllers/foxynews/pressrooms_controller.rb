class Foxynews::PressroomsController < ApplicationController
  helper Foxynews::FoxynewsHelper

  helper_method :pressroom, :presskit

  def index

    feature_id = Foxynews::FeaturedItem.where(featured: true).pluck(:article_id).first
    @press_release = feature_id ? Foxynews::PressReleaseSetter.find(feature_id, 'true') : nil

    page = params[:page] || 1
    @limit = params[:limit] || 30
    @timeline, @next_timeline_page, @next_page = pagination_content(page, @limit)
  end


  def show
    unless @press_release = Foxynews::PressReleaseSetter.find(params[:id], 'true')
      redirect_to root_path, flash: { error: I18n.t('error')}
    end
  end

  def archive
    page = params[:page] || 1
    @limit = params[:limit] || 30
    @timeline, @next_timeline_page, @next_page = pagination_content(page, @limit)
  end

  private

  def pressroom
    @pressroom ||= Foxynews::PressroomSetter.pressroom
  end

  def presskit
    @presskit ||= Foxynews::PresskitSetter.all
  end

  def pagination_content(page, limit)
    timeline = Foxynews::PressroomSetter.timeline({page: page, limit: limit})
    next_page = page.to_i + 1
    next_timeline_page = Foxynews::PressroomSetter.timeline({page: next_page, limit: limit})

    [timeline, next_timeline_page, next_page]
  end
end
