require 'spec_helper'

describe 'openldap::client' do

  on_puppet_supported_platforms.each do |version, platforms|
    platforms.each do |platform, facts|
      context "on #{version} #{platform}" do
        let(:facts) do
          facts
        end

        context 'with no parameters' do
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('openldap::client').with({
            :package    => 'libldap-2.4-2',
            :file       => '/etc/ldap/ldap.conf',
            :base       => nil,
            :uri        => nil,
            :tls_cacert => nil,
          })
          }
          it { is_expected.to contain_class('openldap::client::install').that_comes_before('Class[openldap::client::config]') }
          it { is_expected.to contain_class('openldap::client::config').that_comes_before('Class[openldap::client]') }
        end
      end
    end
  end
end
