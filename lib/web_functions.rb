class WebFunctions
  include FirePoll
  include PageObject

  text_field(:google_search, :id => "#lst-ib")

  def search_google(search)
    self.google_search = search
  end

end