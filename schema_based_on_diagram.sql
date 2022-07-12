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
 