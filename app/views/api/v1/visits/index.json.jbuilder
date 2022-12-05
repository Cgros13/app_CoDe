json.array! @visits do |visit|
  json.extract! visit, :id, :url, :cleaner_than, :green, :bytes, :statistics, :created_at
end
