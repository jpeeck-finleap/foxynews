class Foxynews::PresskitsController < ApplicationController
  helper Foxynews::FoxynewsHelper


  def show
    @presskit = Foxynews::PresskitSetter.find(params[:id])

    unless @presskit.present?
      redirect_to root_path, flash: { error: I18n.t('error')}
    end
  end
end
