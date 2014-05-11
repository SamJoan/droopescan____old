# encoding: UTF-8

class WpItem
  module Output

    # @return [ Void ]
    def output(verbose = false)
      puts
      puts "#{green('[+]')} Name: #{self}" #this will also output the version number if detected
      puts " |  Location: #{url}"
      #puts " | WordPress: #{wordpress_url}" if wordpress_org_item?
      puts " |  Readme: #{readme_url}" if has_readme?
      puts " |  Changelog: #{changelog_url}" if has_changelog?
      puts "#{red('[!]')} Directory listing is enabled: #{url}" if has_directory_listing?
      puts "#{red('[!]')} An error_log file has been found: #{error_log_url}" if has_error_log?

      additional_output(verbose) if respond_to?(:additional_output)

      vulnerabilities.output
    end
  end
end
