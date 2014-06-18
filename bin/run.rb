require_relative '../lib/grading'
require 'json'

input = JSON.parse(File.read('data/grades.json'))

decline_count = 0
not_decline_count = 0

input.each do |student|
  evaluation = Grading.new(student[1])
  evaluation.differences
  if evaluation.evaluate == 'in decline'
    decline_count += 1
  else
    not_decline_count += 1
  end
end

p decline_count
p not_decline_count