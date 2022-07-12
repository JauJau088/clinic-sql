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
