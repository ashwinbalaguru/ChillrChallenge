class DetailsController < ApplicationController
  def index
  	@details = Detail.all
  	@total_success_trans = total_success_trans
  	@highest_value_trans = highest_value_trans
    @highest_no_trans = highest_no_trans
    @avg_no_success_trans = avg_no_success_trans
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

  def avg_no_success_trans
    @arr_months = []
    @arr_months_total = []
    @divided_value = []
    # @years = Detail.where("strftime('%Y', timestamp)     = ?", 2014)
    for i in 1..12
      months_success = Detail.where("strftime('%m', timestamp) + 0 = ? and status = ?", i, 'success').count
      @arr_months[i] = months_success

      months_total = Detail.where("strftime('%m', timestamp) + 0 = ?", i).count
      @arr_months_total[i] = months_total

      @divided_value[i] = @arr_months[i]/@arr_months_total[i].to_f
    end
  end

end
