# Include hook code here
ActionController::Base::extend(
  ExtCrud::ClassMethods)
ActionView::Base.send(:include, ExtCrud::JavascriptBuilder)

