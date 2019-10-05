module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    data = JSON.parse(response.body)
    return data.with_indifferent_access if data.is_a?(Hash)
    data
  end
end