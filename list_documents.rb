require './example_base'

class ListDocuments < ExampleBase

  def list(template_id)
    check_token
    templates_api = DocuSign_eSign::TemplatesApi.new(@@api_client)
    templates_api.list_documents(@@account_id, template_id)
  end
end