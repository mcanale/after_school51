class PresencesController < ApplicationController
  before_action :set_params, only: [:new, :edit]
  before_action :authenticate_user!
  
  def index
  end

  def new
  	redirect_to presences_edit_path(params) and return if params[:modify_button]
  	destroy if params[:destroy_button] #and return
  	redirect_to presences_index_path, notice: 'Presences already created.' and return if !set_presences.empty? 
  		
    students = Student.where(course_id: params[:course_id]).order(:surname, :name)
	@presences = []
	students.each do |student| 
	   @presences.push Presence.new(student_id: student.id, date: Date.parse(params[:date]))
	end
  end

  def create
  	params[:presences].values.each do |presence_data|
  		presence = Presence.new(
  			student_id: presence_data[:student_id],
  			date:       presence_data[:date],
  			absent:     presence_data[:absent],
  			user_id:    current_user.id,
  			note:       presence_data[:note],
  		)
  		presence.save
  		subjects_array = presence_data[:subject_ids].drop(1)
  		subjects_array.each do |sub_id|
  			PresencesSubjects.create(presence_id: presence.id, subject_id: sub_id)
  		end
    end
  	redirect_to presences_index_path, notice: 'Presences was successfully created.'
  end

  def edit
    @presences = set_presences
    redirect_to presences_index_path, notice: "Presences doesn't exists." and return if @presences.empty? 
  end

  def update
   	params[:presences].values.each do |presence_data|
  		presence = Presence.find(presence_data[:id])
   		presence.update(absent: presence_data[:absent], note: presence_data[:note])
  		
  		PresencesSubjects.where(presence_id: presence.id).delete_all
  		subjects_array = presence_data[:subject_ids].drop(1)
  		subjects_array.each do |sub_id|
  			PresencesSubjects.create(presence_id: presence.id, subject_id: sub_id)
  		end
  	end
  	redirect_to presences_index_path, notice: "Presences was successfully updated."
  end

  def destroy
	presences = set_presences
	redirect_to presences_index_path, notice: "Presences doesn't exists." and return if presences.empty? 
	
	presences.each do |presence|
		PresencesSubjects.where(presence_id: presence.id).delete_all
	end
	presences.delete_all
  	redirect_to presences_index_path, notice: "Presences was successfully deleted."
  end

private

  def set_params
    params.permit(:course_id, :date)
    @course = Course.find(params[:course_id])
    @date = Date.parse(params[:date]).strftime("%a %e %b %Y")
  end

  def set_presences
  	Presence.joins(:student).where(students: {course_id: params[:course_id]},
												   date: params[:date])
  end

end
