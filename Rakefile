# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'HighTower'
  app.libs += ['/usr/lib/libz.dylib']
  app.vendor_project 'vendor/Box2d', :static
  app.provisioning_profile = '/Users/ortuna/Library/MobileDevice/Provisioning Profiles/80C4CAB5-526E-40C2-B79C-B1972B07BDDA.mobileprovision'
  app.codesign_certificate = 'iPhone Developer: Sumeet Singh (529LJXN5H6)'
  app.info_plist['UIStatusBarHidden'] = true
  # app.info_plist['UILaunchImageFile'] = 'Default@2x.png'
end
