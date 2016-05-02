module ItemsHelper

  def current_item
        @current_item ||= Item.find_by(params[:id])
  end
  
  
    
end
