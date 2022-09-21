CREATE TABLE medical_histories(
  id INT,
  admitted_at TIMESTAMP,
  patient_id INT REFERENCES patients (id),
  status VARCHAR,
  PRIMARY KEY(id)
);

CREATE TABLE patients(
  id INT,
  name VARCHAR,
  date_of_birth DATE,
  PRIMARY KEY(id)
);

CREATE TABLE invoices(
  id INT,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP;
  medical_history_id INT REFERENCES medical_histories (id),
  PRIMARY KEY(id)
)

CREATE TABLE treatments(
  id SERIAL PRIMARY KEY,
  type VARCHAR(50),
  name VARCHAR(100)
);

CREATE TABLE treatment_histories(
  treatment_id INT REFERENCES treatments(id),
  medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL(3, 2),
  quantity INT,
  total_price DECIMAL(3, 2),
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id)
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON treatment_histories (treatment_id);
CREATE INDEX ON treatment_histories (medical_history_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON invoice_items (invoice_id);
