module ApplicationHelper
  def listing_title(klass, count=2)
    klass.model_name.human(count: count)
  end
end
