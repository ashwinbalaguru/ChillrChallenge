class DetailsController < ApplicationController
  def index
  	@details = Detail.all
  	@total_success_trans = total_success_trans
  	@highest_value_trans = highest_value_trans
    @highest_no_trans = highest_no_trans
  end

  def total_success_trans
    no_successful_trans = Detail.where("status = 'success'").count
    total_trans = Detail.all.count
    total_percent_success_trans = (no_successful_trans.to_f / total_trans)*100
  end

  def highest_value_trans
		@city = Detail.all.collect {|p| p.city}.uniq
		# @city_count = Detail.all.collect {|p| p.city}.uniq.count
		@select_city = []
		@city.each do |city|
			scity = Detail.where(["city = ? and status = ?", city, "success"])
			@select_city +=scity if scity
		end
	end

  def highest_no_trans
    @allcity = Detail.all.collect {|p| p.city}.uniq
    @select_no_city = []
    @allcity.each do |no_city|
      scity = Detail.where(["city = ?", no_city])
      @select_no_city +=scity if scity
    end
  end

end
