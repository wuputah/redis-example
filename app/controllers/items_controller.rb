class ItemsController < ApplicationController

  cache_sweeper :item_sweeper

  # GET /items
  # GET /items.xml
  def index
    # use a scope to delay query execution
    @db_items = Item.scoped
    @redis_items = $redis.lrange('items', 0, -1).map do |item|
      Marshal.load(item)
    end
    @item = Item.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @db_items }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to(:action => 'index', :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end
end
