require 'gds_api/rummager'

module RecentlyUpdatedGuidesHelper
  def recently_updated_guides
    response = rummager.search(
      filter_document_type: 'service_manual_guide',
      order: '-public_timestamp',
      fields: 'title,description,public_timestamp,service_manual_topic',
      count: 5
    )

    response['results'] || []
  end

private

  def rummager
    @rummager ||= GdsApi::Rummager.new(Plek.current.find("rummager"))
  end
end
