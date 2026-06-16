# frozen_string_literal: true

formulae = FileList["Formula/*.rb"].map { |f| File.basename(f, ".rb") }
tap = "rsanheim/tap"

desc "Run brew audit --strict on all formulae"
task :audit do
  formulae.each do |name|
    sh "brew", "audit", "--strict", "#{tap}/#{name}"
  end
end

desc "Run brew style on all formulae"
task :style do
  formulae.each do |name|
    sh "brew", "style", "#{tap}/#{name}"
  end
end

desc "Load all formulae for every supported platform"
task :readall do
  sh "brew", "readall", tap
end

desc "Run brew test on all formulae"
task :test do
  formulae.each do |name|
    sh "brew", "test", "#{tap}/#{name}"
  end
end

desc "Run local tap checks"
task default: [:style, :readall]
