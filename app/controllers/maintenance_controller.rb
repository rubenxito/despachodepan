class MaintenanceController < ApplicationController
  layout false
  before_filter :authenticate

  def read_only

  end

end