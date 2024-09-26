names = ["John", "Jane", "Alice", "Bob", "Charlie"]
ages = ["18", "23", "32", "54", "22"]
gender = ["male", "female"]
health_issue = ["cold", "cough", "fiver", "asthma", "headache", "Kidney Disease", "Lung Diseases"]
date = ["2024-09-26 06:14:30.032237000 +0000",
 "2024-09-12 06:14:30.032237000 +0000",
 "2024-09-18 06:14:30.032237000 +0000",
 "2024-09-21 06:14:30.032237000 +0000",
 "2024-09-05 06:14:30.032237000 +0000"] 

(1..10).each do |i|
	Patient.create(name: "#{names.sample}", age: "#{ages.sample}", gender: "#{gender.sample}", contact: "#{rand(99999999999)}", health_issue: "#{health_issue.sample}", created_at: "#{date.sample}")
end