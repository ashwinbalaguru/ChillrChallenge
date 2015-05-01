class DetailsController < ApplicationController
  def index
  	@details = Detail.where("status = 'success'")
  	@total_success_trans = total_success_trans
  end

  def total_success_trans
    no_successful_trans = Detail.where("status = 'success'").count
    total_trans = Detail.all.count
    total_percent_success_trans = (no_successful_trans.to_f / total_trans)*100
  end
end
