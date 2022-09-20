CREATE TABLE medical_histories(
  id INT,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR,
  PRIMARY KEY(id)
);

CREATE TABLE patients(
  id INT,
  name VARCHAR,
  date_of_birth DATE,
  PRIMARY KEY(id)
);

ALTER TABLE medical_histories
ADD CONSTRAINT patients_fk 
FOREIGN KEY (patient_id) 
REFERENCES patients (id);

