require_relative '../lib/constants'
require_relative '../lib/database'
require_relative '../lib/dialogs/main_menu'

# Database.new(Constants::PATH_TO_DATABASE)
MainMenu.new(Database.new(Constants::PATH_TO_DATABASE))
