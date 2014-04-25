$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# require before 'metasploit/erd' so coverage is shown for files required by 'yard/metasploit/erd'
require 'simplecov'

require 'yard/metasploit/erd'