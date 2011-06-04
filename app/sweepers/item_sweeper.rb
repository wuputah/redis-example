class ItemSweeper < ActionController::Caching::Sweeper
  observe Item

  def after_create(item)
    expire_fragment(:controller => 'items', :action => 'index')
  end
end
