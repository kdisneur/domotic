guard 'spork', :wait => 120 do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb')
end

group 'backend' do
  guard 'rspec', :cli => '--drb' do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})             { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch(%r{^app/controllers/(.+)\.rb$}) { |m| "spec/controllers/#{m[1]}_spec.rb" }
    watch(%r{^app/helpers/(.+)\.rb$})     { |m| "spec/helpers/#{m[1]}_spec.rb" }
    watch(%r{^app/models/(.+)\.rb$})      { |m| "spec/models/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')          { "spec" }
  end

  guard 'cucumber', :cli => '--format progress --no-profile' do
    watch(%r{^features/.+\.feature$})
    watch(%r{^features/support/.+$})                      { 'features' }
    watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
  end
end
