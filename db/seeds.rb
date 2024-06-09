require 'rubyXL'

# Load the workbook
workbook = RubyXL::Parser.parse(Rails.root.join('db', 'seeds_data', 'happy_hours_data.xlsx'))

puts "Sheet names in workbook: #{workbook.worksheets.map(&:sheet_name).inspect}"

# Find the specific sheets
happy_hours_sheet = workbook.worksheets.find { |sheet| sheet.sheet_name == 'happy_hours' }
happy_hours_timing_sheet = workbook.worksheets.find { |sheet| sheet.sheet_name == 'happy_hour_timings' }

def safe_value(cell)
  cell&.value || ''
end

if happy_hours_sheet.nil?
  puts "Sheet 'happy_hours' not found!"
else
  puts "Seeding HappyHours..."
  # Seed HappyHours
  happy_hours_sheet.each_with_index do |row, index|
    next if index == 0 # Skip header row
    happy_hour = HappyHour.create(
      name: safe_value(row[1]),
      location: safe_value(row[2]),       # Changed from address to location
      description: safe_value(row[5])     # Changed from deal to description
    )
    puts "Created HappyHour: #{happy_hour.name}"
  end
end

if happy_hours_timing_sheet.nil?
  puts "Sheet 'happy_hour_timings' not found!"
else
  puts "Seeding HappyHourTimings..."
  # Seed HappyHourTimings
  happy_hours_timing_sheet.each_with_index do |row, index|
    next if index == 0 # Skip header row
    happy_hour = HappyHour.find_by(name: safe_value(row[3]))
    if happy_hour
      HappyHourTiming.create(
        day_of_week: safe_value(row[0]),
        start_time: safe_value(row[1]),
        end_time: safe_value(row[2]),
        happy_hour_id: happy_hour.id
      )
      puts "Created HappyHourTiming for: #{happy_hour.name} on #{safe_value(row[0])}"
    else
      puts "HappyHour not found for: #{safe_value(row[3])}"
    end
  end
end
