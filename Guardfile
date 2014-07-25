# A sample Guardfile
# More info at https://github.com/guard/guard#readme

group :rails do

  guard 'rails', :force_run => true, :server => :thin do
    watch(/^Gemfile.lock$/)
    watch(/^config\/.*\.(rb|yml)$/) { |m| m[0] if !m[0]['/locales/'] }
  end

  guard 'livereload', :apply_css_live => true, :apply_js_live => false, :grace_period => 1 do
    watch(%r{app\/.+\.(erb|haml|coffee)$})
    watch(%r{app/assets/stylesheets/(.*)$}) { 'assets/main.css' }
    watch(%r{app/helpers/.+\.rb})
    watch(%r{app/views/.+\.haml})
    watch(%r{public/.+\.(css|js|html)})
    watch(%r{config/locales/.+\.yml})
    # Rails Assets Pipeline
    # watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|scss))).*}) { |m| "/assets/#{m[3]}" }
  end
end

#guard :rspec do
 # watch(%r{^spec/.+_spec\.rb$})
 #watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
 # watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
 # watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
 # watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
 # watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
 # watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
 # watch('config/routes.rb')                           { "spec/routing" }
 # watch('app/controllers/application_controller.rb')  { "spec/controllers" }

  # Capybara features specs
  # watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$})     { |m| "spec/features/#{m[1]}_spec.rb" }

  # Turnip features and steps
  #watch(%r{^spec/acceptance/(.+)\.feature$})
  #watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
 #end

