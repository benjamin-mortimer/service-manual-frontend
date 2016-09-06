class ServiceManualHomepagePresenter < ContentItemPresenter
  def breadcrumbs
    []
  end

  def topics
    @_topics ||= links["service_manual_topics"] || []
  end
end
