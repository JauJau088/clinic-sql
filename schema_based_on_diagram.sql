CREATE TABLE patients (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE medical_histories (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admittted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(100),
    CONSTRAINT fk_patient 
    FOREIGN KEY (patient_id)
    REFERENCES patients(id)
);
 
CREATE TABLE invoices (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount DEC,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    CONSTRAINT fk_history 
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(100),
    name VARCHAR(100)
);

CREATE TABLE medical_treatments (
    medical_id INT,
    treatment_id INT,
    CONSTRAINT fk_medical
    FOREIGN KEY (medical_id)
    REFERENCES medical_histories(id),

    CONSTRAINT fk_treatment
    FOREIGN KEY (treatment_id)
    REFERENCES treatments(id) 
);

CREATE TABLE invoice_items (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price DEC,
    quantity INT,
    total_price DEC,
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT fk_invoice 
    FOREIGN KEY (invoice_id)
    REFERENCES invoices(id),

    CONSTRAINT fk_treatment
    FOREIGN KEY (treatment_id)
    REFERENCES treatments(id)
);

CREATE INDEX medical_histories_patient_id_asc ON medical_histories(patient_id ASC);
CREATE INDEX medical_treatments_medical_id_asc ON medical_treatments(medical_id ASC);
CREATE INDEX medical_treatments_treatment_id_asc ON medical_treatments(treatment_id ASC);
