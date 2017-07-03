desc "run ruby and sass linters"
task :lint do
  next if ENV["JENKINS"]
  sh "govuk-lint-ruby --format clang Gemfile app test config"
end

Rake::Task[:default].enhance [:lint]
