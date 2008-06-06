#    Brightbox - Easy Ruby Web Application Deployment
#    Copyright (C) 2008, Neil Wilson, Brightbox Systems
#
#    This file is part of the Brightbox deployment system
#
#    Brightbox gem is free software: you can redistribute it and/or modify it
#    under the terms of the GNU Affero General Public License as published
#    by the Free Software Foundation, either version 3 of the License,
#    or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#    Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General
#    Public License along with this program.  If not, see
#    <http://www.gnu.org/licenses/>.
#
def add_common(spec)
  spec.version = "2.0.0"
  spec.authors = ["John Leach","Neil Wilson"]
  spec.email = "support@brightbox.co.uk"
  spec.homepage = "http://wiki.brightbox.co.uk/docs:thebrightboxgem"
  spec.rubyforge_project = 'brightbox'
  spec.has_rdoc = false
end

@server = Gem::Specification.new do |s|
  add_common(s)
  s.name = "brightbox-server-tools"
  s.files = FileList["LICENSE", "Rakefile", "*.rb", "bin/brightbox-*","{lib,spec}/**/*.rb"].exclude(/recipe/).to_a
  s.add_dependency("ini", ">=0.1.1")
  s.summary = "Brightbox Server configuration scripts"
  s.executables = FileList["bin/brightbox-*"].sub(/bin\//,'')
end

@client = Gem::Specification.new do |s|
  add_common(s)
  s.name = "brightbox"
  s.files = FileList["LICENSE", "Rakefile", "*.rb", "lib/**/*.rb","bin/brightbox"].exclude("lib/brightbox/database*").to_a
  s.autorequire = "brightbox/recipes"
  s.add_dependency("capistrano", ">= 2.3")
  s.summary = "Brightbox rails deployment scripts for Capistrano"
  s.executable = 'brightbox'
end

