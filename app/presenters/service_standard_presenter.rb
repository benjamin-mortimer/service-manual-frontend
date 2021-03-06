class ServiceStandardPresenter < ContentItemPresenter
  attr_reader :poster_url

  def initialize(*)
    super
    @poster_url = details["poster_url"]
  end

  def points
    Point.load(points_attributes).sort
  end

  def breadcrumbs
    [
      { title: "Service manual", url: "/service-manual" },
      { title: title }
    ]
  end

  def email_alert_signup_link
    signups = content_item['links'].fetch('email_alert_signup', [])
    signups.first['base_path'] if signups.any?
  end

private

  def points_attributes
    @_points_attributes ||= links["children"] || []
  end

  class Point
    include Comparable

    attr_reader :title, :description, :base_path

    def self.load(points_attributes)
      points_attributes.map { |point_attributes| new(point_attributes) }
    end

    def initialize(attributes)
      @title = attributes["title"]
      @description = attributes["description"]
      @base_path = attributes["base_path"]
    end

    def <=>(other)
      number <=> other.number
    end

    def title_without_number
      @_title_without_number ||= title.sub(/\A(\d*)\.(\s*)/, '')
    end

    def number
      @_number ||= Integer(title.scan(/\A(\d*)/)[0][0])
    end
  end
end
