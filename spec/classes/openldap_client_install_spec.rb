require 'spec_helper'

describe 'openldap::client::install' do

  on_puppet_supported_platforms.each do |version, platforms|
    platforms.each do |platform, facts|
      context "on #{version} #{platform}" do
        let(:facts) do
          facts
        end

        context 'with no parameters' do
          let :pre_condition do
            "class {'openldap::client':}"
          end

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('openldap::client::install') }
          it { is_expected.to contain_package('libldap-2.4-2').with({
            :ensure => :present,
          })
          }
        end

        context 'when overriding package name' do
          let :pre_condition do
            "class {'openldap::client': package => 'foo', }"
          end

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('openldap::client::install') }
          it { is_expected.to contain_package('foo').with({
            :ensure => :present,
          })
          }
        end
      end
    end
  end
end
