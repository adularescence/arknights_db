CREATE TABLE hq(
    hq_skill TEXT PRIMARY KEY,
    morale NUMERIC(3, 2) NOT NULL,
    trade NUMERIC(1, 0) NOT NULL,
    notes TEXT
);

CREATE TABLE plant(
    plant_skill TEXT PRIMARY KEY,
    efficiency NUMERIC(2, 0) NOT NULL
);

CREATE TABLE factory(
    factory_skill TEXT PRIMARY KEY,
    metal NUMERIC(2, 0) NOT NULL,
    record NUMERIC(2, 0) NOT NULL,
    originium NUMERIC(2, 0) NOT NULL,
    capacity NUMERIC(2, 0) NOT NULL,
    morale NUMERIC(3, 2) NOT NULL,
    notes TEXT
);

CREATE TABLE trade(
    trade_skill TEXT PRIMARY KEY,
    efficiency NUMERIC(2, 0) NOT NULL,
    capacity NUMERIC(1, 0) NOT NULL,
    morale NUMERIC(3, 2) NOT NULL,
    notes TEXT
);

CREATE TABLE dorm(
    dorm_skill TEXT PRIMARY KEY,
    self_morale NUMERIC(3, 2) NOT NULL,
    random_morale NUMERIC(3, 2) NOT NULL,
    all_morale NUMERIC(3, 2) NOT NULL
);

CREATE TABLE reception(
    reception_skill TEXT PRIMARY KEY,
    efficiency NUMERIC(2, 0) NOT NULL,
    focus NUMERIC(1, 0) CHECK (focus >= 1 AND focus <= 7)
);

CREATE TABLE workshop(
    workshop_skill TEXT PRIMARY KEY,
    base NUMERIC(2, 0) NOT NULL,
    elite NUMERIC(2, 0) NOT NULL,
    skill NUMERIC(2, 0) NOT NULL,
    chip NUMERIC(2, 0) NOT NULL
);

CREATE TABLE office(
    office_skill TEXT PRIMARY KEY,
    efficiency NUMERIC(2, 0) NOT NULL
);

CREATE TABLE training(
    training_skill TEXT PRIMARY KEY,
    guard NUMERIC(2, 0) NOT NULL,
    medic NUMERIC(2, 0) NOT NULL,
    vanguard NUMERIC(2, 0) NOT NULL,
    caster NUMERIC(2, 0) NOT NULL,
    sniper NUMERIC(2, 0) NOT NULL,
    defender NUMERIC(2, 0) NOT NULL,
    supporter NUMERIC(2, 0) NOT NULL,
    specialist NUMERIC(2, 0) NOT NULL
);

CREATE TABLE operator(
    op_skill VARCHAR(11) NOT NULL,
    elite NUMERIC(1, 0) CHECK (elite >= 0 AND elite <= 2) NOT NULL,
    hq TEXT REFERENCES hq,
    plant TEXT REFERENCES plant,
    factory TEXT REFERENCES factory,
    trade TEXT REFERENCES trade,
    dorm TEXT REFERENCES dorm,
    reception TEXT REFERENCES reception,
    workshop TEXT REFERENCES workshop,
    office TEXT REFERENCES office,
    training TEXT REFERENCES training,
    PRIMARY KEY (op_skill, elite)
);