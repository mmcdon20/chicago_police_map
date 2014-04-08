class WelcomeController < ApplicationController
  def index
    require 'json'

    items = Crime.select(:beat).map(&:beat)

    @beats = items.uniq.sort

    @frequency = items.reduce(Hash.new(0)) do |beat_count, beat|
      beat_count[beat] += 1
      beat_count
    end

    max = @frequency.values.max

    @levels = [(max*1.0), (max*0.8), (max*0.6), (max*0.4), (max*0.2)].map(&:to_i)
  end

  def crimes
    @crimes = Crime.limit(10).offset(params[:offset]).where(beat:params[:beat])
  end
end
