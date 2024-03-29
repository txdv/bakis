require 'json'

#puts JSON.parse(File.read("resi;t)
tail = "& read & lex & parse & ast & class & write"
puts "Classes & Methods & Official & New & Cache & Diff #{tail}\\\\"
lines = File.read("results.json").lines
lines.each do |line|
  obj = JSON.parse(line, object_class: OpenStruct)
  classes = obj.classes.to_s.rjust(4, ' ')
  methods = obj.methods.to_s.rjust(3, ' ')
  new = obj.new.clock.to_s.rjust(5, ' ')
  cache = obj.new_cached.clock.to_s.rjust(5, ' ')
  old = obj.old.clock.to_s.rjust(5, ' ')

  diff = (obj.new.clock - obj.new_cached.clock).to_s.rjust(5, ' ')


  read = obj.new.read
  lex = obj.new.lex.to_s.rjust(3, ' ')
  parse = obj.new.parse.to_s.rjust(3, ' ')
  ast = obj.new.ast.to_s.rjust(3, ' ')
  clazz = obj.new.class.to_s.rjust(3, ' ')
  write = obj.new.write.to_s.rjust(2)

  cache_ast   = obj.new_cached.ast
  cache_class = obj.new_cached.class
  cache_write = obj.new_cached.write

  last = "& #{read} & #{lex} & #{parse} & #{ast}/#{cache_ast} & #{clazz}/#{cache_class} & #{write}/#{cache_write}"

  puts "#{classes} & #{methods} & #{old} & #{new} & #{cache} & #{diff} #{last} \\\\"
end
