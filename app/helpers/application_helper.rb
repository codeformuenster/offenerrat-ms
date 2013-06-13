# encoding: UTF-8
module ApplicationHelper
  def listing_title(klass, count=2)
    klass.model_name.human(count: count)
  end

  def page_title
    "Offener Rat Münster"
  end
  def page_description

  end
  def page_keywords
    "Münster, Rat"
  end
  def set_twitter_card
    set_meta_tags :twitter => {
      :card => "summary",
      :site => "@offenerratms"
    }
  end
  def set_open_graph
    set_meta_tags(:open_graph => {
      title: @page_title,
      description: @page_description,
      locale: "de_DE",
      site_name: "Offener Rat Münster",
      url: url_for
    })
  end

  def set_default_meta_tags
    @page_title       = page_title
    @page_description = page_description
    @page_keywords    = page_keywords
  end
end
