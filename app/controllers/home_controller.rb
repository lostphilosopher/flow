class HomeController < ApplicationController
  def index
    @cm = Cm.find_by(name: 'home')
  end
end
