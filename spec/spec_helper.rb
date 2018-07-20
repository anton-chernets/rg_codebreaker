require 'bundler/setup'
require 'codebreaker'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  def get_codes
    array = [{ code: '1335', secret_code: '1134', res: '+-+' },
             { code: '6464', secret_code: '6141', res: '+---' },
             { code: '5412', secret_code: '5431', res: '++-' },
             { code: '6565', secret_code: '5566', res: '-++-' },
             { code: '3124', secret_code: '3312', res: '+--' },
             { code: '5263', secret_code: '6344', res: '--' },
             { code: '6134', secret_code: '3614', res: '---+' },
             { code: '6321', secret_code: '1632', res: '----' },
             { code: '5412', secret_code: '3466', res: '+' },
             { code: '5463', secret_code: '1232', res: '-' },
             { code: '1234', secret_code: '5566', res: '' },
             { code: '2164', secret_code: '2154', res: '+++' }]
  end
end
