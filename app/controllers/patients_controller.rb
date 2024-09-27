class PatientsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_id, only: [:show, :edit, :update, :destroy]
	before_action :require_receptionist, only: [:new, :create, :edit, :update, :destroy]

	def index
		@patients = Patient.all
		@patients_today = Patient.where(created_at: Date.today.all_day)
		@graph_data_day = Patient.group_by_day(:created_at).count
		@graph_data_minute = Patient.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
                            .group_by_minute(:created_at)
                            .count
	end

	def show
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

	def patient
		@patients = Patient.all
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
