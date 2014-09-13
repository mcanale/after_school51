json.array!(@students) do |student|
  json.extract! student, :id, :name, :surname, :course_id, :awaited_Mon, :awaited_Tue, :awaited_Wed, :awaited_Thu, :awaited_Fri, :awaited_Sat, :awaited_Sun
  json.url student_url(student, format: :json)
end
