class Foxynews::PressroomsController < ApplicationController
  helper Foxynews::FoxynewsHelper

  def index
    page = (params[:page].present?) ? params[:page] : 1
    @limit = (params[:limit].present?) ? params[:limit] : 30

    @my_pressroom = my_pressroom
    @pr_contacts = my_pressroom.pr_contacts

    @press_release = Foxynews::PressReleaseSetter.find(109544, 'true')

    @timeline = Foxynews::PressroomSetter.timeline(page, @limit)
    @next_page = page.to_i + 1
    @next_timeline_page = Foxynews::PressroomSetter.timeline(@next_page, @limit)

    @presskits = presskit.data
    @presskits_paging = presskit.paging
  end


  def show
    @press_release = Foxynews::PressReleaseSetter.find(params[:id], 'true')

    unless @press_release.present?
      redirect_to root_path, flash: { error: I18n.t('error')}
    end
  end


  private

  def my_pressroom
    @my_pressroom ||= Foxynews::PressroomSetter.my_pressroom
  end

  def presskit
    @presskit ||= Foxynews::PresskitSetter.all
  end
end
