require 'test_helper'
require 'gds_api/test_helpers/rummager'

class HomepageTest < ActionDispatch::IntegrationTest
  include GdsApi::TestHelpers::Rummager

  test 'the homepage displays the introductory text' do
    stub_any_rummager_search_to_return_no_results
    setup_and_visit_example('service_manual_homepage', 'service_manual_homepage')

    assert page.has_content? <<-TEXT
      Helping government teams create and run
      great digital services that meet the Digital Service Standard.
    TEXT
  end

  test 'the homepage includes a feedback link' do
    stub_any_rummager_search_to_return_no_results
    setup_and_visit_example('service_manual_homepage', 'service_manual_homepage')

    assert page.has_content?(
      "Contact the service manual team with any comments or questions."
    )

    assert page.has_link? 'service manual team', href: '/contact/govuk'
  end

  test 'the homepage displays the five most recently updated guides' do
    stub_any_rummager_search_to_return_latest_changes
    setup_and_visit_example('service_manual_homepage', 'service_manual_homepage')

    within ('.recently-updated') do
      assert page.has_content? 'Recently updated guides'

      assert page.has_content? 'Making source code open and reusable part of Technology'
      assert page.has_content? 'Deciding how to host your service part of Technology'
      assert page.has_content? 'Spend controls: check if you need approval to spend money on a service part of Agile delivery'
      assert page.has_content? 'Protecting your service against fraud part of Technology'
      assert page.has_content? 'Making your service accessible: an introduction part of Helping people to use your service'
    end
  end

private

  def stub_any_rummager_search_to_return_latest_changes
    stub_any_rummager_search.to_return(
      body: {
        results: [
          {
            title: "Making source code open and reusable",
            public_timestamp: "2016-10-01T15:01:48Z",
            service_manual_topic: "Technology",
            _id: "/service-manual/technology/making-source-code-open-and-reusable",
          },
          {
            title: "Deciding how to host your service",
            public_timestamp: "2016-09-30T14:50:01Z",
            service_manual_topic: "Technology",
            _id: "/service-manual/technology/deciding-how-to-host-your-service",
          },
          {
            title: "Spend controls: check if you need approval to spend money on a service",
            public_timestamp: "2016-08-26T13:44:56Z",
            service_manual_topic: "Agile delivery",
            _id: "/service-manual/agile-delivery/spend-controls-check-if-you-need-approval-to-spend-money-on-a-service",
          },
          {
            title: "Protecting your service against fraud",
            public_timestamp: "2016-08-25T14:03:41Z",
            service_manual_topic: "Technology",
            _id: "/service-manual/technology/protecting-your-service-against-fraud",
          },
          {
            title: "Making your service accessible: an introduction",
            public_timestamp: "2016-08-23T10:17:42Z",
            service_manual_topic: "Helping people to use your service",
            _id: "/service-manual/helping-people-to-use-your-service/making-your-service-accessible-an-introduction",
          },
        ]
      }.to_json
    )
  end
end
