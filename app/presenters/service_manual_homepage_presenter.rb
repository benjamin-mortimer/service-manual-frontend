class ServiceManualHomepagePresenter < ContentItemPresenter
  def breadcrumbs
    []
  end

  def topics
    @_topics ||= links["children"] || []
  end
end
