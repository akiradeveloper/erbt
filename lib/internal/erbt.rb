def erbt(path)
  path = File.expand_path(path)
  `touch #{path}`
  template = path + '.template'
  unless File.exist?(template)
    raise ArgumentError.new(".template does not exist!")
  end
  product = `erb #{template}`
  if File.read(path) != product
    backup = path + ".backup"
    puts "#{path} will be changed."
    puts "#{path} is backed up."
    `cat #{path} > #{backup}`
  end
  f = File.open(path, 'w')
  f.write(product)
  f.close
end

if __FILE__ == $0
  erbt('test1')
end
