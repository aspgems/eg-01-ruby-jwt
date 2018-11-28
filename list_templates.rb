require './example_base'

class ListTemplates < ExampleBase

  def list
    check_token
    envelope_api = DocuSign_eSign::TemplatesApi.new(@@api_client)
    options =  DocuSign_eSign::ListTemplatesOptions.new
    options.from_date = (Date.today - 30).strftime("%Y/%m/%d")
    puts "@@account_id = #{@@account_id}"
    envelope_api.list_templates(@@account_id, options)
  end
end