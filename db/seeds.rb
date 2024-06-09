require 'roo'

file_path = Rails.root.join('db', 'seeds_data', 'happy_hours_data.xlsx')
xlsx = Roo::Spreadsheet.open(file_path.to_s)

happy_hour_mapping = {}

# Happy Hours
puts "Seeding Happy Hours..."
happy_hours_sheet = xlsx.sheet('happy_hours')
happy_hours_sheet.each_row_streaming(offset: 1) do |row|
  happy_hour = HappyHour.create!(
    name: row[0].value,
    location: row[1].value,
    description: row[2].value
  )
  happy_hour_mapping[row[0].value] = happy_hour.id  # Assuming name is unique
rescue ActiveRecord::RecordInvalid => e
  puts "Failed to create HappyHour: #{e.message}"
end

# Happy Hour Timings
puts "Seeding Happy Hour Timings..."
happy_hour_timings_sheet = xlsx.sheet('happy_hour_timings')
happy_hour_timings_sheet.each_row_streaming(offset: 1) do |row|
  happy_hour_id = happy_hour_mapping[row[0].value]  # Assuming first column is the Happy Hour name
  if happy_hour_id
    HappyHourTiming.create!(
      happy_hour_id: happy_hour_id,
      day_of_week: row[1].value,
      start_time: row[2].value,
      end_time: row[3].value
    )
  else
    puts "Invalid HappyHour name for HappyHourTiming: #{row[0].value}"
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Failed to create HappyHourTiming: #{e.message}"
end

# Features
puts "Seeding Features..."
features_sheet = xlsx.sheet('features')
features_sheet.each_row_streaming(offset: 1) do |row|
  Feature.create!(
    feature_name: row[0].value
  )
rescue ActiveRecord::RecordInvalid => e
  puts "Failed to create Feature: #{e.message}"
end

# Happy Hour Features
puts "Seeding Happy Hour Features..."
happy_hour_features_sheet = xlsx.sheet('happy_hour_features')
happy_hour_features_sheet.each_row_streaming(offset: 1) do |row|
  happy_hour_id = happy_hour_mapping[row[0].value]  # Assuming first column is the Happy Hour name
  if happy_hour_id
    HappyHourFeature.create!(
      happy_hour_id: happy_hour_id,
      feature_id: row[1].value
    )
  else
    puts "Invalid HappyHour name for HappyHourFeature: #{row[0].value}"
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Failed to create HappyHourFeature: #{e.message}"
end

# Rooftops
puts "Seeding Rooftops..."
rooftops_sheet = xlsx.sheet('rooftops')
rooftops_sheet.each_row_streaming(offset: 1) do |row|
  happy_hour_id = happy_hour_mapping[row[0].value]  # Assuming first column is the Happy Hour name
  if happy_hour_id
    Rooftop.create!(
      happy_hour_id: happy_hour_id
    )
  else
    puts "Invalid HappyHour name for Rooftop: #{row[0].value}"
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Failed to create Rooftop: #{e.message}"
end

# Patios
puts "Seeding Patios..."
patios_sheet = xlsx.sheet('patios')
patios_sheet.each_row_streaming(offset: 1) do |row|
  happy_hour_id = happy_hour_mapping[row[0].value]  # Assuming first column is the Happy Hour name
  if happy_hour_id
    Patio.create!(
      happy_hour_id: happy_hour_id
    )
  else
    puts "Invalid HappyHour name for Patio: #{row[0].value}"
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Failed to create Patio: #{e.message}"
end

# Activities
puts "Seeding Activities..."
activities_sheet = xlsx.sheet('activities')
activities_sheet.each_row_streaming(offset: 1) do |row|
  happy_hour_id = happy_hour_mapping[row[0].value]  # Assuming first column is the Happy Hour name
  if happy_hour_id
    Activity.create!(
      happy_hour_id: happy_hour_id,
      activity_name: row[1].value
    )
  else
    puts "Invalid HappyHour name for Activity: #{row[0].value}"
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Failed to create Activity: #{e.message}"
end

puts "Seeding completed."
