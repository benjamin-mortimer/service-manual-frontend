require 'test_helper'
require 'gds_api/test_helpers/rummager'

class RecentlyUpdatedGuidesHelperTest < ActionView::TestCase
  include GdsApi::TestHelpers::Rummager

  test "#recently_updated_guides calls Rummager with the correct parameters" do
    stub_any_rummager_search_to_return_no_results

    recently_updated_guides

    assert_rummager_search(
      query: {
        filter_document_type: 'service_manual_guide',
        order: '-public_timestamp',
        fields: 'title,description,public_timestamp,service_manual_topic',
        count: 5
      }
    )
  end
end
