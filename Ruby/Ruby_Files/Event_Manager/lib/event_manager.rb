require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

csv_content = CSV.open "event_attendees.csv", {headers: true, header_converters: :symbol}

template_letter = File.read("form_letter.erb")
erb_template = ERB.new template_letter

def clean_zip(zipcode)
  
  zipcode.to_s.rjust(5,"0") [0..4]
  
end

def format_leg(zipcode)
  
  legobj_arr = Sunlight::Congress::Legislator.by_zipcode(zipcode)
  
  # legobj_arr.collect! do |legislator|
#
#     "#{legislator.first_name} #{legislator.last_name}"
#
#   end
#
#   legobj_arr.join(',')
  
end

def save_thank_you(index,personal_letter)
  
  Dir.mkdir("output") unless Dir.exists? "output"
 
  filename = "thanks_#{index}.html"
 
  File.open("output/#{filename}","w") do |f|
    f.puts personal_letter
  end
  
end


csv_content.each_with_index do |row,index|
 
  name = row[:first_name]
  
  zipcode = clean_zip row[:zipcode]
  
  legislators = format_leg(zipcode)
  
  # puts "#{name}  #{zipcode} ---  #{legistring}"
  
  # personal_letter= template_letter.gsub('FIRST_NAME',name)
 #  personal_letter.gsub!('LEGISLATORS',legistring)
 personal_letter = erb_template.result(binding)
 

 Dir.mkdir("output") unless Dir.exists? "output"
 
 filename = "ouput/thanks_#{index}.html"

 File.open("output/#{filename}","w") do |f|
   f.puts personal_letter
 end

  
end






