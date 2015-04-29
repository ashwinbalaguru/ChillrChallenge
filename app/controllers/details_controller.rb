class DetailsController < ApplicationController
  def index
  	@details = Detail.all
  end
end
