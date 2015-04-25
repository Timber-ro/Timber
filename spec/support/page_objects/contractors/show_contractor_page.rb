class ShowContractorPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  attr_reader :title

  def initialize(contractor)
    @contractor =     contractor
    @page_url =       contractor_path contractor
    @title =          @contractor.name
  end

  def visit_page
    visit @page_url
  end

  def visit_page_as(user)
    user.present? ? login_as(user) : logout
    visit @page_url
  end

  def has_the_proper_title?
    has_title? @title
  end
end
