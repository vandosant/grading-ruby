class Grading
  def initialize(grades)
    @grades = grades
    @differences = []
  end

  def differences
    result = []

    @grades.each_with_index do |grade, index|
      if index == 0
        next
      elsif grade > (@grades[index-1])
        result << :up
      elsif grade < (@grades[index-1])
        result << :down
      elsif grade == (@grades[index-1])
        result << :even
      end
    end

    @differences = result
  end

  def evaluate
    pertinent_changes = @differences.select do |difference|
      difference == :down || difference == :up
    end

    pertinent_changes = pertinent_changes.last(3)

    if pertinent_changes.count(:down) >= 3
      result = 'in decline'
    else
      result = 'not in decline'
    end

    result
  end
end