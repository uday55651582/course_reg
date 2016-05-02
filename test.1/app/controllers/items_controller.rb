class ItemsController < ApplicationController

  def create
     @user = User.find_by(params[:session])
     #@item.email= @user.email
   
    @item = Item.new(item_params)
    @item.xemail = @user.email
    @item.email = @item.xemail
    @item.lbidderemail = @item.xemail
    @item.xprice = @item.baseprice
    @item.cbiddingprice = @item.xprice
    if @item.save
      redirect_to items_path 
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
  
  def edit
    @item = Item.find_by(params[:id])

  end
  
  
  
  def update
    @item = Item.find_by(params[:id])
    @item.lbidderemail = current_user.email
    #if pricecheck
    if @item.update_attributes(item_params)
      
      flash[:success] = "You have successfully placed your bid"
      redirect_to items_path
    else
      render 'edit'
    end
    #else
     # flash.now[:danger] = "Bid more than baseprice"
    #  render 'edit'
    #end
  end
  
  
  def item_params
      params.require(:item).permit(:productname, :baseprice,
                                   :cdays , :chours, :cminutes, :category, :cbiddingprice )
  end

end
