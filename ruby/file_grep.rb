class FileGrep
    attr_accessor :file, :search_term
   
    def initialize(file, search_term)
        @file = file
        @search_term = Regexp.new(search_term)
    end    
    
    def grep
        line_num = 1
        puts "Grepping #{file} for '#{search_term}'" 
        File.open(file, 'r').each do |line|
            puts "#{line_num} : #{line}" if line.match @search_term
            line_num += 1
        end
    end
end

grepper = FileGrep.new(ARGV[0], ARGV[1])
grepper.grep
