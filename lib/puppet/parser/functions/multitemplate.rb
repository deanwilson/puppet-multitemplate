module Puppet::Parser::Functions
  require 'erb'

  newfunction(:multitemplate, :type => :rvalue, :doc => <<-EOD
    A Puppet function that allows you to list multiple template sources and
    use the first one that exists.

      class ssh::config {

        file { '/etc/ssh/sshd_config':
          ensure  => present,
          mode    => '0600',
          content => multitemplate( "ssh/${::fqdn}",
                                    "ssh/${::domain}",
                                    'ssh/default_sshdconfig'
                                  ),
        }

      }

  EOD
  ) do |args|
    contents    = nil
    environment = self.compiler.environment
    sources     = args

    sources.each do |file|
      Puppet.debug("Looking for #{file} in #{environment}")
      if filename = Puppet::Parser::Files.find_template(file, environment)
        wrapper = Puppet::Parser::TemplateWrapper.new(self)
        wrapper.file = file

        begin
          contents = wrapper.result
        rescue => detail
          raise Puppet::ParseError, "Failed to parse template %s: %s" % [file, detail]
        end

        break
      end
    end

    raise Puppet::ParseError, "multitemplate: No match found for files: #{sources.join(', ')}" if contents == nil

    contents
  end
end
