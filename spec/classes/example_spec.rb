require 'spec_helper'

describe 'godot' do
  context 'supported operating systems' do
    ['RedHat'].each do |osfamily|
      describe "godot class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should include_class('godot::params') }

        it { should contain_class('godot::install') }
        it { should contain_class('godot::config') }
        it { should contain_class('godot::service') }
      end
    end
  end
end
