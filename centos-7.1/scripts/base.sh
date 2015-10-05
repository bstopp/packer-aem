sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

yum -y install gcc make gcc-c++ kernel-devel-`uname -r`
yum -y install perl git ruby-devel rubygems

gem update --system --no-document
gem update --no-document
gem install librarian-puppet --no-document

rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum -y install puppet-agent
echo 'PATH=$PATH:/opt/puppetlabs/bin' >> ~/.bash_profile
echo 'export PATH' >> ~/.bash_profile
. ~/.bash_profile
