sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

yum -y install gcc make gcc-c++ kernel-devel-`uname -r`
yum -y install perl git ruby-devel rubygems

gem update --system --no-document
gem update --no-document
gem install librarian-puppet --no-document

