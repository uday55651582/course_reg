class ItemsController < ApplicationController

  def create
     #@user = User.find(params[:id])
     #@item.email= @user.email
   
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item 
    else 
      render 'new'
     # @item.productname = "No Products
    end
  end
  
  def index
    @items = Item.paginate(page: params[:page])
    
  end
  
  def show
   if item_check?
    @item = Item.find(params[:id])
   #else
    # @item.productname = "No Products"
   end
  end
  
  def item_check?
   unless @item.nil?
   end
  end
  
  def new
     @item = Item.new
     @user = User.all
  end
  
  def item_params
      params.require(:item).permit(:productname, :baseprice, :email,
                                   :cdays , :chours, :cminutes, :category )
  end

end
