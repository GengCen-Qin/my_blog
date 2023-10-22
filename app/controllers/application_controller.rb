class ApplicationController < ActionController::Base
  include Pagy::Backend
  Pagy::DEFAULT[:items] = 2        # items per page
  Pagy::DEFAULT[:size]  = [1,4,4,1] # nav bar links
end
