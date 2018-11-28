require './example_base'

class CreateSigningUrl < ExampleBase

  def create(envelope_id)
    check_token
    api = DocuSign_eSign::EnvelopesApi.new(@@api_client)

  end
end
