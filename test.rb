def import_dict(lang)
    f = File.open("ko_dict.txt", 'r')
    dict = {}
    while !f.eof?
       line = f.readline
       words = line.split(',')
       words[1] = words[1].strip
       lang == 'korean' ? dict[words[0]] = words[1] : dict[words[1]] = words[0]
    end
    dict
end

puts import_dict('korean')
