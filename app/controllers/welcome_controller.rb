class WelcomeController < ApplicationController
  def index
    require 'json'

    items = Beat.all

    @beats = items.map(&:beat).sort

    @frequency = Hash.new(0)

    items.each do |item|
      @frequency[item.beat] = item.crimes
    end

    max = @frequency.values.max

    @levels = [(max*1.0), (max*0.8), (max*0.6), (max*0.4), (max*0.2)].map(&:to_i)
  end

  def crimes
    @crimes = Crime.limit(10).offset(params[:offset]).where(beat:params[:beat])
    respond_to do |format|
      format.html { render partial:'/welcome/crimes' }
      format.js
    end
  end
end
