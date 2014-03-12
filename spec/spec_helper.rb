require 'puppetlabs_spec_helper/module_spec_helper'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

RSpec.configure do |c|

  c.hiera_config = File.join(fixture_path, 'hiera.yaml') 

  c.before(:all) do
    data = YAML.load_file(c.hiera_config)
    
    data[:yaml][:datadir] = File.join(fixture_path, 'hieradata')
    File.open(c.hiera_config, 'w') do |f|
      f.write data.to_yaml
    end
  end
end

