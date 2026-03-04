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

desc "Run brew test on all formulae"
task :test do
  formulae.each do |name|
    sh "brew", "test", "#{tap}/#{name}"
  end
end

desc "Run audit and style checks"
task default: [:audit, :style]
