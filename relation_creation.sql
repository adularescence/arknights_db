CREATE TABLE skill(
    skill_name TEXT PRIMARY KEY,
    skill_type VARCHAR(9) CHECK (skill_type IN ('hq', 'power', 'factory', 'trade', 'dorm', 'reception', 'workshop', 'office', 'training')),
    all_morale NUMERIC(3, 2),
    efficiency NUMERIC(2, 0),
    metal_efficiency NUMERIC(2, 0),
    record_efficiency NUMERIC(2, 0),
    originium_efficiency NUMERIC(2, 0),
    capacity NUMERIC(2, 0),
    notes TEXT,
    self_morale NUMERIC(3, 2),
    random_morale NUMERIC(3, 2),
    clue_focus NUMERIC(1, 0) CHECK (clue_focus >= 0 AND clue_focus <= 7),
    base_efficiency NUMERIC(2, 0),
    elite_efficiency NUMERIC(2, 0),
    skill_efficiency NUMERIC(2, 0),
    chip_efficiency NUMERIC(2, 0),
    guard NUMERIC(2, 0),
    medic NUMERIC(2, 0),
    vanguard NUMERIC(2, 0),
    caster NUMERIC(2, 0),
    sniper NUMERIC(2, 0),
    defender NUMERIC(2, 0),
    supporter NUMERIC(2, 0),
    specialist NUMERIC(2, 0)
);

CREATE TABLE operator(
    op_name VARCHAR(12),
    elite NUMERIC(1, 0) CHECK (elite >= 0 AND elite <= 2),
    skill_name TEXT REFERENCES skill,
    PRIMARY KEY (op_name, elite, skill_name)
);

