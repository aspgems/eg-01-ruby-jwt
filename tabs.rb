require './example_base'

class Tabs < ExampleBase
  def initialize(api_client, recipient_id, template_id)
    super(api_client)
    check_token
    @api = DocuSign_eSign::TemplatesApi.new(@@api_client)
    @recipient_id, @template_id = recipient_id, template_id
  end

  def list_tabs
    @api.list_tabs(@@account_id, @recipient_id, @template_id)
  end

  def update_tabs(tabs)
    @api.update_tabs(@@account_id, @recipient_id, @template_id, tabs)
  end
end
