# Packer boxes for AEM

## Overview

This project maintains my definitions of packer builds for my other projects, specifically the [vagrant-aem](https://github.com/bstopp/vagrant-aem) and [Puppet AEM](https://github.com/bstopp/puppet-aem) module.

Credit goes to [shiguredo/packer-templates](https://github.com/shiguredo/packer-templates) and PuppetLab's own [templates](https://github.com/puppetlabs/puppetlabs-packer) because without those examples, this wouldn't exist.

### Running

Ensure that the ATLAS_USERNAME and ATLAS_TOKEN environment variables are set. Then run

* `bin/vmbuilder`
