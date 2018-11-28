require 'docusign_esign'
require './send_envelope'
require './example_base'
require './list_envelopes'
require './list_templates'
require './list_documents'
require './create_envelope'
require './create_signing_url'
require './tabs'
require 'yaml'

class MainCreateEnvelopeWithInputTemplate
  def run
    configuration = DocuSign_eSign::Configuration.new
    @api_client = DocuSign_eSign::ApiClient.new(configuration)

    prodigy_recipient_id = '1f98482d-4dec-46a2-b3df-6f96f6485827'

    template_id = 'e54c60b6-88f1-4b34-b6fa-c873fa147303'

    api_tabs = Tabs.new(@api_client, prodigy_recipient_id, template_id)

    tabs = api_tabs.list_tabs
    tabs.text_tabs[0].value = 'helloooo'
    api_tabs.update_tabs(tabs)
    a = CreateEnvelope.new(@api_client).create(template_id)
    puts a.inspect

  rescue DocuSign_eSign::ApiError => err
    print "DocuSign SDK Error!\n   code: #{err.code}\n   message: #{err.response_body}\n\n"
  end
end

if __FILE__ == $0
  @main = MainCreateEnvelopeWithInputTemplate.new()
  @main.run
end