# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'motion-cocoapods'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'HighTower'
  app.libs += ['/usr/lib/libz.dylib']
  app.vendor_project 'vendor/Box2DWrapper', :static
end
