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

CREATE TABLE invoices(
  id INT,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP;
  medical_history_id INT,
  PRIMARY KEY(id)
)

ALTER TABLE medical_histories
ADD CONSTRAINT medical_histories_fk 
FOREIGN KEY (medical_history_id) 
REFERENCES medical_histories (id);

CREATE TABLE invoices(
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL(3, 2),
  generated_at TIMESTAMP,
  paid_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id)
);
