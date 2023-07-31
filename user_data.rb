module UserData
  def get_students_info
    print 'Age: '
    person_age = gets.chomp.to_i
    print 'Name: '
    person_name = gets.chomp.to_s
    print 'Has parent permission? [Y/N]: '
    person_permission = gets.chomp.to_s.capitalize
    return [person_age, person_name, person_permission]
  end

  def get_teacher_info
    print 'Age: '
    person_age = gets.chomp.to_i
    print 'Name: '
    person_name = gets.chomp.to_s.capitalize
    print 'Specialization: '
    person_specialization = gets.chomp.to_s.capitalize
    return [person_age, person_name, person_specialization]
  end
end