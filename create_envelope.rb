require './example_base'

class CreateEnvelope < ExampleBase

  def create(template_id)
    check_token
    api = DocuSign_eSign::EnvelopesApi.new(@@api_client)
    template_role = {
      "clientUserId": "1234",
      "email": "shernade@gmail.com",
      "name": "Sergio",
      "roleName": "Signer"
    }

    envelope = api.create_envelope(@@account_id, {status: 'sent', templateId: template_id, templateRoles: [template_role]} )
    puts 'envelope created'
    puts envelope.inspect
    envelope_view = {
      "authenticationMethod": "email",
      "clientUserId": "1234",
      "email": "shernade@gmail.com",
      "returnUrl": "https://www.docusign.com/devcenter",
      "userName": "Sergio"
    }
    api.create_recipient_view(@@account_id, envelope.envelope_id, envelope_view )
  end
end
