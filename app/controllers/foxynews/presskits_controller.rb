class Foxynews::PresskitsController < ApplicationController
  helper Foxynews::FoxynewsHelper


  def show
    unless @presskit = Foxynews::PresskitSetter.find(params[:id])
      redirect_to root_path, flash: { error: I18n.t('error')}
    end
  end
end
