# Puppet Multiple Template Source Function #

The `multitemplate` Puppet function allows you to list multiple template
sources and use the first one that exists.

[![Build Status](https://travis-ci.org/deanwilson/puppet-multitemplate.svg?branch=main)](https://travis-ci.org/deanwilson/puppet-multitemplate)
[![Puppet Forge](https://img.shields.io/puppetforge/v/deanwilson/multitemplate.svg)](https://forge.puppetlabs.com/deanwilson/multitemplate)

    class ssh::config {
    
      file { "/etc/ssh/sshd_config" :
        ensure  => present,
        mode    => '0600',
        content => multitemplate( "ssh/${::fqdn}",
                                  "ssh/${::domain}",
                                  'ssh/default_sshdconfig'
                                ),
      }
    
    }


While it's currently possible to invoke `template` with multiple sources
specified it does not behave as most people expect. Instead of selecting
the first existing match it concatenates the templates together when used as below:

    class ssh::config {

      file { "/etc/ssh/sshd_config" :
        ensure  => present,
        content => template( "ssh/${::fqdn}",
                             "ssh/${::domain}",
                             'ssh/default_sshdconfig'
                           ),
      }

    }

This Puppet function was originally written by 
[R.I.Pienaar](http://www.devco.net/) and raised as 
[Allow multiple sources for a template and only use the first template if it exists](http://projects.puppetlabs.com/issues/1818)
in the Puppet Issue tracker.

I've added all the usual module boilerplate scaffolding with permission.

Note:
I will be more than happy to take this module down when the functionality is in core Puppet.

## Installation

You can install this module from [PuppetForge](https://forge.puppet.com/):

    puppet module install deanwilson-multitemplate

### License ###

Apache 2.0 - [Dean Wilson](http://www.unixdaemon.net)
