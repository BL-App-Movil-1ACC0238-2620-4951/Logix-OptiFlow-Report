-- Esquema implementado de OptiFlow: solo estructura, sin datos ni credenciales.
-- Backend develop: 706ada927d4fd49807035e79d4313fbe463e9e54.
-- Copia de V1-V4 en orden; Inventory no implementado, no incluido.

-- Fuente: V1__search_booking_schema.sql
CREATE TABLE patients (
  id UUID PRIMARY KEY,
  full_name VARCHAR(80) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  phone VARCHAR(20) NOT NULL,
  password_hash VARCHAR(100) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE optical_stores (
  id UUID PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  address VARCHAR(200) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  rating NUMERIC(3, 2) NOT NULL,
  status VARCHAR(20) NOT NULL,
  CONSTRAINT optical_stores_rating_chk CHECK (rating >= 0 AND rating <= 5),
  CONSTRAINT optical_stores_status_chk CHECK (status IN ('ACTIVE', 'INACTIVE'))
);

CREATE TABLE time_slots (
  id UUID PRIMARY KEY,
  optical_store_id UUID NOT NULL,
  start_date_time TIMESTAMP WITH TIME ZONE NOT NULL,
  end_date_time TIMESTAMP WITH TIME ZONE NOT NULL,
  status VARCHAR(20) NOT NULL,
  CONSTRAINT time_slots_store_fk FOREIGN KEY (optical_store_id) REFERENCES optical_stores (id),
  CONSTRAINT time_slots_range_chk CHECK (end_date_time > start_date_time),
  CONSTRAINT time_slots_status_chk CHECK (status IN ('AVAILABLE', 'RESERVED', 'BLOCKED'))
);

CREATE TABLE appointments (
  id UUID PRIMARY KEY,
  patient_id UUID NOT NULL,
  optical_store_id UUID NOT NULL,
  time_slot_id UUID NOT NULL,
  status VARCHAR(20) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT appointments_patient_fk FOREIGN KEY (patient_id) REFERENCES patients (id),
  CONSTRAINT appointments_store_fk FOREIGN KEY (optical_store_id) REFERENCES optical_stores (id),
  CONSTRAINT appointments_slot_fk FOREIGN KEY (time_slot_id) REFERENCES time_slots (id),
  CONSTRAINT appointments_status_chk CHECK (status IN ('PENDING', 'CONFIRMED', 'CANCELLED', 'COMPLETED'))
);

CREATE TABLE favorite_stores (
  patient_id UUID NOT NULL,
  optical_store_id UUID NOT NULL,
  saved_at TIMESTAMP WITH TIME ZONE NOT NULL,
  PRIMARY KEY (patient_id, optical_store_id),
  CONSTRAINT favorite_stores_patient_fk FOREIGN KEY (patient_id) REFERENCES patients (id),
  CONSTRAINT favorite_stores_store_fk FOREIGN KEY (optical_store_id) REFERENCES optical_stores (id)
);

CREATE TABLE store_ratings (
  patient_id UUID NOT NULL,
  optical_store_id UUID NOT NULL,
  score NUMERIC(3, 2) NOT NULL,
  comment VARCHAR(280),
  created_at TIMESTAMP WITH TIME ZONE NOT NULL,
  PRIMARY KEY (patient_id, optical_store_id),
  CONSTRAINT store_ratings_patient_fk FOREIGN KEY (patient_id) REFERENCES patients (id),
  CONSTRAINT store_ratings_store_fk FOREIGN KEY (optical_store_id) REFERENCES optical_stores (id),
  CONSTRAINT store_ratings_score_chk CHECK (score >= 1 AND score <= 5)
);

CREATE INDEX time_slots_store_status_idx ON time_slots (optical_store_id, status);
CREATE INDEX appointments_patient_idx ON appointments (patient_id);
CREATE INDEX appointments_time_slot_idx ON appointments (time_slot_id);

-- Fuente: V2__clinical_commercial_schema.sql
CREATE TABLE clinical_records (
  id UUID PRIMARY KEY,
  patient_id UUID NOT NULL,
  appointment_id UUID NOT NULL UNIQUE,
  examination_date TIMESTAMP WITH TIME ZONE,
  observations VARCHAR(500),
  status VARCHAR(30) NOT NULL,
  CONSTRAINT clinical_records_status_chk CHECK (status IN ('PENDING', 'OPEN', 'CLOSED'))
);

CREATE TABLE medical_histories (
  clinical_record_id UUID PRIMARY KEY,
  allergies VARCHAR(1000),
  previous_conditions VARCHAR(1000),
  family_ocular_history VARCHAR(1000),
  last_updated TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT medical_histories_record_fk
    FOREIGN KEY (clinical_record_id) REFERENCES clinical_records (id)
);

CREATE TABLE optical_prescriptions (
  clinical_record_id UUID PRIMARY KEY,
  sphere_od NUMERIC(5, 2) NOT NULL,
  sphere_os NUMERIC(5, 2) NOT NULL,
  cylinder_od NUMERIC(5, 2) NOT NULL,
  cylinder_os NUMERIC(5, 2) NOT NULL,
  axis_od SMALLINT NOT NULL,
  axis_os SMALLINT NOT NULL,
  addition NUMERIC(5, 2),
  treatment VARCHAR(255),
  recommended_frame_type VARCHAR(255),
  CONSTRAINT optical_prescriptions_record_fk
    FOREIGN KEY (clinical_record_id) REFERENCES clinical_records (id),
  CONSTRAINT optical_prescriptions_axis_chk
    CHECK (axis_od BETWEEN 0 AND 180 AND axis_os BETWEEN 0 AND 180)
);

CREATE TABLE quotations (
  id UUID PRIMARY KEY,
  clinical_record_id UUID NOT NULL,
  discount_type VARCHAR(30),
  discount_value NUMERIC(10, 2),
  discount_reason VARCHAR(255),
  total NUMERIC(10, 2) NOT NULL,
  status VARCHAR(30) NOT NULL,
  rejection_reason VARCHAR(255),
  CONSTRAINT quotations_record_fk
    FOREIGN KEY (clinical_record_id) REFERENCES clinical_records (id),
  CONSTRAINT quotations_status_chk CHECK (status IN ('DRAFT', 'APPROVED', 'REJECTED')),
  CONSTRAINT quotations_discount_type_chk
    CHECK (discount_type IS NULL OR discount_type IN ('PERCENTAGE', 'FIXED_AMOUNT')),
  CONSTRAINT quotations_total_chk CHECK (total >= 0)
);

CREATE TABLE quotation_items (
  id UUID PRIMARY KEY,
  quotation_id UUID NOT NULL,
  line_number INTEGER NOT NULL,
  item_type VARCHAR(30) NOT NULL,
  product_sku VARCHAR(60),
  description VARCHAR(255) NOT NULL,
  unit_price NUMERIC(10, 2) NOT NULL,
  quantity INTEGER NOT NULL,
  CONSTRAINT quotation_items_quotation_fk
    FOREIGN KEY (quotation_id) REFERENCES quotations (id),
  CONSTRAINT quotation_items_line_uq UNIQUE (quotation_id, line_number),
  CONSTRAINT quotation_items_type_chk
    CHECK (item_type IN ('FRAME', 'LENS', 'TREATMENT', 'SERVICE')),
  CONSTRAINT quotation_items_price_chk CHECK (unit_price >= 0),
  CONSTRAINT quotation_items_quantity_chk CHECK (quantity BETWEEN 1 AND 100)
);

CREATE TABLE sales (
  id UUID PRIMARY KEY,
  quotation_id UUID NOT NULL UNIQUE,
  patient_id UUID NOT NULL,
  status VARCHAR(30) NOT NULL,
  closed_at TIMESTAMP WITH TIME ZONE,
  payment_method VARCHAR(30),
  payment_amount NUMERIC(10, 2),
  transaction_reference VARCHAR(255),
  paid_at TIMESTAMP WITH TIME ZONE,
  CONSTRAINT sales_quotation_fk FOREIGN KEY (quotation_id) REFERENCES quotations (id),
  CONSTRAINT sales_status_chk CHECK (status IN ('PENDING_PAYMENT', 'PAID', 'CLOSED')),
  CONSTRAINT sales_payment_method_chk
    CHECK (payment_method IS NULL OR payment_method IN ('CASH', 'CARD', 'YAPE', 'PLIN'))
);

CREATE TABLE electronic_receipts (
  id UUID PRIMARY KEY,
  sale_id UUID NOT NULL UNIQUE,
  receipt_number VARCHAR(100) NOT NULL UNIQUE,
  issue_date TIMESTAMP WITH TIME ZONE NOT NULL,
  tax_amount NUMERIC(10, 2) NOT NULL,
  total_amount NUMERIC(10, 2) NOT NULL,
  CONSTRAINT electronic_receipts_sale_fk FOREIGN KEY (sale_id) REFERENCES sales (id)
);

CREATE INDEX clinical_records_patient_idx ON clinical_records (patient_id);
CREATE INDEX quotations_record_idx ON quotations (clinical_record_id);

-- Fuente: V3__production_tracking_schema.sql
CREATE TABLE technicians (
  id UUID PRIMARY KEY,
  name VARCHAR(120) NOT NULL
);

CREATE TABLE laboratories (
  id UUID PRIMARY KEY,
  name VARCHAR(120) NOT NULL
);

-- Technician, laboratory and delivery delay are embedded in the work order, as in the
-- document model of the report: they are snapshots, not foreign keys.
CREATE TABLE work_orders (
  id UUID PRIMARY KEY,
  sale_id UUID NOT NULL UNIQUE,
  patient_id UUID NOT NULL,
  optical_store_id UUID,
  technician_id UUID,
  technician_name VARCHAR(120),
  laboratory_id UUID,
  laboratory_name VARCHAR(120),
  status VARCHAR(30) NOT NULL,
  estimated_delivery_date DATE NOT NULL,
  delay_reason VARCHAR(255),
  delay_reported_at TIMESTAMP WITH TIME ZONE,
  delay_new_estimated_date DATE,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
  delivered_at TIMESTAMP WITH TIME ZONE,
  CONSTRAINT work_orders_status_chk CHECK (status IN (
    'PENDING', 'IN_WORKSHOP', 'QUALITY_CONTROL', 'READY_FOR_DELIVERY', 'DELIVERED'))
);

CREATE TABLE work_order_lenses (
  id UUID PRIMARY KEY,
  work_order_id UUID NOT NULL,
  line_number INTEGER NOT NULL,
  specifications VARCHAR(500) NOT NULL,
  completed BOOLEAN NOT NULL,
  CONSTRAINT work_order_lenses_order_fk FOREIGN KEY (work_order_id) REFERENCES work_orders (id),
  CONSTRAINT work_order_lenses_line_uq UNIQUE (work_order_id, line_number)
);

CREATE TABLE work_order_status_history (
  work_order_id UUID NOT NULL,
  sequence_number INTEGER NOT NULL,
  status VARCHAR(30) NOT NULL,
  changed_at TIMESTAMP WITH TIME ZONE NOT NULL,
  PRIMARY KEY (work_order_id, sequence_number),
  CONSTRAINT work_order_status_history_order_fk
    FOREIGN KEY (work_order_id) REFERENCES work_orders (id)
);

CREATE INDEX work_orders_status_idx ON work_orders (status);
CREATE INDEX work_orders_patient_idx ON work_orders (patient_id);
CREATE INDEX work_orders_technician_idx ON work_orders (technician_id);

-- Fuente: V4__notification_loyalty_schema.sql
CREATE TABLE loyalty_accounts (
  patient_id UUID PRIMARY KEY,
  balance INT NOT NULL,
  last_birthday_discount_year INT,
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
  CONSTRAINT loyalty_accounts_patient_fk FOREIGN KEY (patient_id) REFERENCES patients (id),
  CONSTRAINT loyalty_accounts_balance_chk CHECK (balance >= 0)
);

CREATE TABLE notifications (
  id UUID PRIMARY KEY,
  patient_id UUID NOT NULL,
  type VARCHAR(40) NOT NULL,
  title VARCHAR(120) NOT NULL,
  body VARCHAR(500) NOT NULL,
  appointment_id UUID,
  work_order_id UUID,
  status VARCHAR(10) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL,
  read_at TIMESTAMP WITH TIME ZONE,
  CONSTRAINT notifications_patient_fk FOREIGN KEY (patient_id) REFERENCES patients (id),
  CONSTRAINT notifications_type_chk CHECK (type IN (
    'APPOINTMENT_REMINDER',
    'LENS_ORDER_PROGRESS',
    'BIRTHDAY_DISCOUNT',
    'DELIVERY_DELAY'
  )),
  CONSTRAINT notifications_status_chk CHECK (status IN ('UNREAD', 'READ'))
);

CREATE UNIQUE INDEX notifications_patient_appointment_uq
  ON notifications (patient_id, appointment_id)
  WHERE appointment_id IS NOT NULL;
