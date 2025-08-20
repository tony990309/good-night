# frozen_string_literal: true

Rpdoc.configure do |config|
 
  # (Optional) You can disable rpdoc generation process manually.
  # config.rpdoc_enable = true

  # (Optional) Apikey for your Postman account, used if want to push collection to the Postman server.
  config.postman_apikey = 'PMAK-689de8403ae26e00017b8ff1-6b77c620d5d5556c79c7d08e021806b58e'

  # (Optional) Workspace that your collection will be pushed to. Default your account's personal workspace.
  config.collection_workspace = 'bfb75a9f-db33-4995-89b1-164370a84f1d'

  # (Optional) Your existing collection uid. Will update it when using :push_and_update push strategy.
  config.collection_uid = '23687423-f8fa7ee5-1410-43d0-ba63-00a0f0d66318'

  # (Optional) Collection name.
  config.collection_name = 'Good Night'

  # (Optional) Your Rails server API host.
  config.rspec_server_host = '{{api_host}}'

  # (Optional) Since Rspec generates many noisy headers, you can filter them.
  # config.rspec_request_allow_headers = ['User-Agent', 'Content-Type', 'Authorization']

  # (Optional) Folder that Rpdoc use for json data generation and save.
  # config.rpdoc_root = 'rpdoc'

  # (Optional) Filename to store RSpec request json data.
  # config.rpdoc_request_filename = 'request.json'

  # (Optional) Filename to store Postman description markdown data.
  config.rpdoc_description_filename = 'description.md'

  # (Optional) Filename to store RSpec collection json data.
  # config.rpdoc_collection_filename = 'collection.json'

  # (Optional) Clean empty folders. You can specify folder names which will be ignored when cleaning.
  config.rpdoc_clean_empty_folders = true
  config.rpdoc_clean_empty_folders_except = ['Schemas']

  # (Optional) Auto push collection to Postman server or not.
  # config.rpdoc_auto_push = true

  # (Optional) Auto push strategy, including :push_and_create and :push_and_update
  config.rpdoc_auto_push_strategy = :push_and_update
end
