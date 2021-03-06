# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{integrity-notifyio}
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Kalek"]
  s.date = %q{2010-07-15}
  s.description = %q{Let Integrity post notifications to your Notifiy.io account after each build}
  s.email = %q{andrew.kalek@anlek.com}
  s.extra_rdoc_files = [
    "Changelog"
  ]
  s.files = [
    ".gitignore",
     "Changelog",
     "LICENSE",
     "README.markdown",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "integrity-notifyio.gemspec",
     "lib/integrity/notifier/notifyio.haml",
     "lib/integrity/notifier/notifyio.rb",
     "test/integrity-notifyio_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/anlek/integrity-notifyio}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Notifiy.io notifier for the Integrity continuous integration server}
  s.test_files = [
    "test/integrity-notifyio_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
  end
end

