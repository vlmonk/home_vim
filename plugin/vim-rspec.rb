require "rubygems"
require "hpricot"

def parse_code(code)
  lines = []
  code.each_child do |c|
    case c
    when Hpricot::Text
      lines.last[:text] += c.to_s if lines.last
    when Hpricot::Elem
      if c[:class] == 'linenum'
        lines.push({:number => c.inner_html, :text => ""})
      elsif c[:class] == 'offending'
        lines.push parse_code(c).first
      else
        lines.last[:text] += c.inner_html if lines.last
      end
    end
  end
  return lines
end

doc		= Hpricot(STDIN.read)
h1			= (doc/"h1")
classes	= {"spec passed"=>"+","spec failed"=>"-","spec not_implemented"=>"#"}

puts "* #{h1.inner_html}"

stats = (doc/"script").select {|script| script.innerHTML =~ /duration|totals/ }.map {|script| script.inner_html.scan(/".*"/).first.gsub(/<\/?strong>/,"") }
stats.each do |stat|
	puts "* #{stat.gsub(/\"/,'')}"
end
puts "* Parsed with Hpricot (http://wiki.github.com/why/hpricot)"
puts " "

(doc/"div[@class='example_group']").each do |example|
	puts "[#{(example/"dl/dt").inner_html}]"
	(example/"dd").each do |dd|
		txt = (dd/"span:first").inner_html
		puts "#{classes[dd[:class]]} #{txt}"
		next if dd[:class]!="spec failed"
		failure  = (dd/"div[@class='failure']")
		msg		= (failure/"div[@class='message']/pre").inner_text
		back		= (failure/"div[@class='backtrace']/pre").inner_html
                puts "  #{msg}"
                puts "  #{back}"
                (failure/"pre[@class='ruby']/code").each do |c|
                   parse_code(c).each{|line| puts "  #{line[:number]} #{line[:text]}"}
                end
	end
	puts " "
end
