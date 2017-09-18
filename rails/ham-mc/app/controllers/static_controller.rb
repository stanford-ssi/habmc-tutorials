class StaticController < ApplicationController
  def home
    @date = DateTime.current
  end
end
