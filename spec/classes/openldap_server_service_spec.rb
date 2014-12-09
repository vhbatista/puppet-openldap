require 'spec_helper'

describe 'openldap::server::service' do

  on_puppet_supported_platforms.each do |version, platforms|
    platforms.each do |platform, facts|
      context "on #{version} #{platform}" do
        let(:facts) do
          facts
        end

        context 'with no parameters' do
          let :pre_condition do
            "class {'openldap::server':}"
          end
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('openldap::server::service') }
          it { is_expected.to contain_service('slapd').with({
            :ensure => :running,
            :enable => true,
          })}
        end
      end
    end
  end
end
