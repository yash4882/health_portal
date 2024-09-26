class PatientsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_id, only: [:edit, :update, :destroy]
	before_action :require_receptionist, only: [:new, :create, :edit, :update, :destroy]

	def index
		@patients = Patient.all
	end

	def new
		@patient = Patient.new
	end

	def create
		@patient = Patient.new(patient_params)
			if @patient.save
			redirect_to patients_path, notice: 'Patient registered successfully.'
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
	end

	def update
		if @patient.update(patient_params)
		 	redirect_to patients_path, notice: 'Patient updated successfully.'
		else
		 	render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@patient.destroy
		redirect_to patients_path, notice: 'Patient deleted successfully.'
	end

	def graph
		@patients = Patient.all 
		@graph_data = Patient.group_by_day(:created_at).count
		# @graph_data = Patient.group_by_minute(:created_at).count
	end


	private

	def set_id
		@patient = Patient.find(params[:id])
	end

	def patient_params
		params.require(:patient).permit(:name, :age, :gender, :contact, :health_issue)
	end

	def require_receptionist
		redirect_to root_path, alert: 'Access denied.' unless current_user.receptionist?
	end
end
