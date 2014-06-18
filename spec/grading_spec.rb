require 'rspec'
require_relative '../lib/grading'

describe Grading do
  it 'determines differences in grades' do
    grades = [10, 9, 9, 10]

    actual = Grading.new(grades).differences

    expected = [:down, :even, :up]

    expect(actual).to eq expected
  end

  it 'returns empty arrays when given empty arrays' do
    grades = []

    actual = Grading.new(grades).differences

    expected = []

    expect(actual).to eq expected
  end

  it 'knows a student is in decline' do
    grades = [10, 9, 8, 7]

    test = Grading.new(grades)

    test.differences

    actual = test.evaluate

    expected = 'in decline'

    expect(actual).to eq expected
  end

  it 'knows a student is not in decline' do
    grades = [10, 9, 8]

    test = Grading.new(grades)

    test.differences

    actual = test.evaluate

    expected = 'not in decline'

    expect(actual).to eq expected


    grades = [10, 9, 8, 7, 8]

    test = Grading.new(grades)

    test.differences

    actual = test.evaluate

    expected = 'not in decline'

    expect(actual).to eq expected
  end
end