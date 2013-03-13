class HillController < ApplicationController
  
  def visit
  	DoingIt.perform_async
  end

end
