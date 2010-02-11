require "rubygems"
require "hpricot"

doc = Hpricot(STDIN.read)
h1 = (doc/"h1")
classes	= {"spec passed"=>"+","spec failed"=>"-","spec not_implemented"=>"#"}

puts "* #{h1.inner_html}"

stats = (doc/"script").select {|script| script.innerHTML =~ /duration|totals/ }.map do |script| 
  script.inner_html.scan(/".*"/).first.gsub(/<\/?strong>/,"") 
end

stats.each do |stat|
  puts "* #{stat.gsub(/\"/,'')}"
end

puts "* Parsed with Hpricot (http://wiki.github.com/why/hpricot)"
puts " "

(doc/"div[@class='example_group']").each do |example|
  puts "[#{(example/"dl/dt").inner_html}]"
  (example/"/dd").each do |dd|
    txt = (dd/"span:first").inner_html
    puts "#{classes[dd[:class]]} #{txt}"
    next if dd[:class]!="spec failed"
    failure  = (dd/"div[@class='failure']")
    msg	= (failure/"div[@class='message']/pre").inner_text.gsub /\n/, "\n  "
    puts "  #{msg}"
#     back = (failure/"div[@class='backtrace']/pre").inner_text.gsub /\s+/, ''
#     ruby = (failure/"pre[@class='ruby']/code").inner_html.
#       scan(/(<span class="linenum">)(\d+)(<\/span>)([^<]+)/).map do |elem|
#         "  " + elem[1] + ": " + elem[3].chomp + "\n"
#       end.join
#     puts "  #{back}"
#     puts ruby
  end
  puts " "
end
