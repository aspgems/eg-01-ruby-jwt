require 'docusign_esign'
require './send_envelope'
require './example_base'
require './list_envelopes'
require './list_templates'
require './list_documents'
require './create_envelope'
require './create_signing_url'
require 'yaml'

class MainCreateEnvelope
  def run
    configuration = DocuSign_eSign::Configuration.new
    @api_client = DocuSign_eSign::ApiClient.new(configuration)
    print("\nListing the account's templates...")
    templates_list = ListTemplates.new(@api_client).list
    print "\nResults: \n"
    puts templates_list.class
    puts templates_list.inspect
    print "\nResults2222222222: \n"
    puts templates_list.envelope_templates
    print "\nResults333333333333333: \n"
    puts templates_list.envelope_templates[0].template_id
    print "\nResults444444444444444: \n"
    print("\nDone.\n")

    a = CreateEnvelope.new(@api_client).create(templates_list.envelope_templates[0].template_id)
    b = CreateSigningUrl.new(@api_client).create(a.envelope_id)
    puts a.inspect


  rescue DocuSign_eSign::ApiError => err
    print "DocuSign SDK Error!\n   code: #{err.code}\n   message: #{err.response_body}\n\n"
  end
end

if __FILE__ == $0
  @main = MainCreateEnvelope.new()
  @main.run
end