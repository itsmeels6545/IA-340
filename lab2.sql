-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS professor
(
    p_email VARCHAR(50) NOT NULL,
    p_name VARCHAR(100) NOT NULL,
    office VARCHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY(p_email)
);

CREATE TABLE IF NOT EXISTS Course
(
    c_number VARCHAR(10) NOT NULL,
    c_name VARCHAR(50),
    room VARCHAR(10),
    p_email VARCHAR(50) NOT NULL,
    PRIMARY KEY(c_number)
);

CREATE TABLE IF NOT EXISTS Student
(
    s_email VARCHAR(50) NOT NULL,
    s_name VARCHAR(100),
    s_major VARCHAR(10),
    PRIMARY KEY(s_email)
);

CREATE TABLE IF NOT EXISTS enroll_list
(
    s_email VARCHAR(50) NOT NULL,
    c_number VARCHAR(10) NOT NULL,
    enroll_list_s_email VARCHAR(50),
    PRIMARY KEY(s_email, c_number)
);


-- Create FKs
ALTER TABLE Course
    ADD    FOREIGN KEY (p_email)
    REFERENCES professor(p_email)
    MATCH SIMPLE
;
    
ALTER TABLE enroll_list
    ADD    FOREIGN KEY (s_email)
    REFERENCES Student(s_email)
    MATCH SIMPLE
;
    
ALTER TABLE enroll_list
    ADD    FOREIGN KEY (c_number)
    REFERENCES Course(c_number)
    MATCH SIMPLE
;
    

-- Create Indexes
