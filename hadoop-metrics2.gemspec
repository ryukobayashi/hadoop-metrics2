$:.push File.expand_path("../lib", __FILE__)
require "hadoop_metrics2/version"

Gem::Specification.new do |s|
  s.name        = "hadoop-metrics2"
  s.version     = HadoopMetrics2::VERSION
  s.authors     = ["Ryu Kobayashi"]
  s.email       = ["beter.max@gmail.com"]
  s.homepage    = "https://github.com/ryukobayashi/hadoop-metrics2"
  s.summary     = %q{Wrapper for Hadoop Metrics2 API}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake", ">= 0.9.2"
end
