CREATE TABLE EMPLOYEE (
    "EMPLOYEE_ID" INT,
    "NAME" VARCHAR(50) NOT NULL,
    "SURNAME" VARCHAR(50) NOT NULL,
    "USERNAME" VARCHAR(50) NOT NULL,
    "PASSWORD" VARCHAR(50) NOT NULL,
    "HIRE_DATE" DATE NOT NULL,
    "MAIL_ADDRESS" VARCHAR(100) NOT NULL,
    "TEL_NO" VARCHAR(20) NOT NULL,
    "ROLE_ID" INT NOT NULL,
    "MANAGER_ID" INT NULL,
    "RAL" NUMBER(10,2) NOT NULL,
    "MISCONDUCT_NUM" INT DEFAULT 0 NOT NULL,
    "MISCONDUCT_DESC" VARCHAR2(255) DEFAULT NULL,
    "BRANCH_ID" CHAR(2) NOT NULL,
    CONSTRAINT PK_EMP PRIMARY KEY("EMPLOYEE_ID"),
    CONSTRAINT FK_ROLE FOREIGN KEY ("ROLE_ID") REFERENCES ROLE("ROLE_ID"),
    CONSTRAINT FK_EMP FOREIGN KEY ("MANAGER_ID") REFERENCES EMPLOYEE("EMPLOYEE_ID") ON DELETE SET NULL,
    CONSTRAINT U_MAIL UNIQUE("MAIL_ADDRESS"),
    CONSTRAINT U_TEL UNIQUE("TEL_NO"),
    CONSTRAINT CK_BRANCH CHECK ("BRANCH_ID" IN ('MI', 'RO')),
    CHECK ("ROLE_ID" IN (1, 2, 3, 4))
);


INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SURNAME, USERNAME, PASSWORD, HIRE_DATE, MAIL_ADDRESS, TEL_NO, ROLE_ID, MANAGER_ID, RAL, MISCONDUCT_NUM, MISCONDUCT_DESC, BRANCH_ID) 
VALUES (1, 'Mario', 'Rossi', 'mario_rossi', 'TopManager2025!1', TO_DATE('15-06-2015', 'DD-MM-YYYY'), 'm.rossi@bank.com', '+39 345 6789012', 1, 1, 85000.00, 0, NULL, 'MI');

INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SURNAME, USERNAME, PASSWORD, HIRE_DATE, MAIL_ADDRESS, TEL_NO, ROLE_ID, MANAGER_ID, RAL, MISCONDUCT_NUM, MISCONDUCT_DESC, BRANCH_ID) 
VALUES (2, 'Luca', 'Bianchi', 'luca_bianchi', 'MiddleManager2025!1', TO_DATE('20-09-2017', 'DD-MM-YYYY'), 'l.bianchi@bank.com', '+39 320 9876543', 2, 1, 60000.00, 1, 'Unjustified delay in reporting', 'MI');

INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SURNAME, USERNAME, PASSWORD, HIRE_DATE, MAIL_ADDRESS, TEL_NO, ROLE_ID, MANAGER_ID, RAL, MISCONDUCT_NUM, MISCONDUCT_DESC, BRANCH_ID) 
VALUES (3, 'Anna', 'Verdi', 'anna_verdi', 'Cashier2025!1', TO_DATE('10-03-2019', 'DD-MM-YYYY'), 'a.verdi@bank.com', '+39 331 2233445', 3, 2, 32000.00, 2, 'Cash handling error; Unauthorized break', 'MI');

INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SURNAME, USERNAME, PASSWORD, HIRE_DATE, MAIL_ADDRESS, TEL_NO, ROLE_ID, MANAGER_ID, RAL, MISCONDUCT_NUM, MISCONDUCT_DESC, BRANCH_ID) 
VALUES (4, 'Giulia', 'Neri', 'giulia_neri', 'Auditor2025!1', TO_DATE('25-07-2020', 'DD-MM-YYYY'), 'g.neri@bank.com', '+39 366 7788990', 4, 1, 40000.00, 0, NULL, 'MI');

INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SURNAME, USERNAME, PASSWORD, HIRE_DATE, MAIL_ADDRESS, TEL_NO, ROLE_ID, MANAGER_ID, RAL, MISCONDUCT_NUM, MISCONDUCT_DESC, BRANCH_ID) 
VALUES (5, 'Stefano', 'Moretti', 'stefano_moretti', 'MiddleManager2025!2', TO_DATE('12-05-2018', 'DD-MM-YYYY'), 's.moretti@bank.com', '+39 377 8899001', 2, 1, 59000.00, 1, 'Late approval of timesheets', 'RO');

INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SURNAME, USERNAME, PASSWORD, HIRE_DATE, MAIL_ADDRESS, TEL_NO, ROLE_ID, MANAGER_ID, RAL, MISCONDUCT_NUM, MISCONDUCT_DESC, BRANCH_ID) 
VALUES (6, 'Elisa', 'Conti', 'elisa_conti', 'Cashier2025!2', TO_DATE('30-09-2021', 'DD-MM-YYYY'), 'e.conti@bank.com', '+39 388 9900112', 3, 2, 31000.00, 0, NULL, 'RO');

INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SURNAME, USERNAME, PASSWORD, HIRE_DATE, MAIL_ADDRESS, TEL_NO, ROLE_ID, MANAGER_ID, RAL, MISCONDUCT_NUM, MISCONDUCT_DESC, BRANCH_ID) 
VALUES (7, 'Paolo', 'De Luca', 'paolo_de_luca', 'Auditor2025!2', TO_DATE('18-11-2016', 'DD-MM-YYYY'), 'p.deluca@bank.com', '+39 399 0011223', 4, 1, 43000.00, 1, 'Unauthorized system access attempt', 'MI');

INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SURNAME, USERNAME, PASSWORD, HIRE_DATE, MAIL_ADDRESS, TEL_NO, ROLE_ID, MANAGER_ID, RAL, MISCONDUCT_NUM, MISCONDUCT_DESC, BRANCH_ID) 
VALUES (8, 'Francesco', 'Ricci', 'francesco_ricci', 'Cashier2025!3', TO_DATE('20-04-2014', 'DD-MM-YYYY'), 'f.ricci@bank.com', '+39 322 3344556', 3, 2, 33000.00, 0, NULL, 'RO');

INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SURNAME, USERNAME, PASSWORD, HIRE_DATE, MAIL_ADDRESS, TEL_NO, ROLE_ID, MANAGER_ID, RAL, MISCONDUCT_NUM, MISCONDUCT_DESC, BRANCH_ID) 
VALUES (9, 'Martina', 'Ferrari', 'martina_ferrari', 'Cashier2025!4', TO_DATE('05-01-2022', 'DD-MM-YYYY'), 'm.ferrari@bank.com', '+39 355 5443322', 3, 5, 30000.00, 1, 'Late arrival on multiple days', 'MI');

INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SURNAME, USERNAME, PASSWORD, HIRE_DATE, MAIL_ADDRESS, TEL_NO, ROLE_ID, MANAGER_ID, RAL, MISCONDUCT_NUM, MISCONDUCT_DESC, BRANCH_ID) 
VALUES (10, 'Alessandro', 'Romano', 'alessandro_romano', 'Cashier2025!5', TO_DATE('11-12-2013', 'DD-MM-YYYY'), 'a.romano@bank.com', '+39 366 4332211', 3, 5, 34000.00, 0, NULL, 'RO');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE CONTEXT emp_ctx USING set_emp_ctx_pkg;


CREATE OR REPLACE PACKAGE set_emp_ctx_pkg IS
  PROCEDURE set_emp;
END;


CREATE OR REPLACE PACKAGE BODY set_emp_ctx_pkg IS
  PROCEDURE set_emp IS
    v_username   VARCHAR2(50);
    v_emp_id     EMPLOYEE.EMPLOYEE_ID%TYPE;
    v_role_desc  VARCHAR2(50);
    v_branch_id  EMPLOYEE.BRANCH_ID%TYPE;
  BEGIN
    v_username := SYS_CONTEXT('USERENV', 'SESSION_USER');

    SELECT e.EMPLOYEE_ID, r.ROLE_DESCRIPTION, e.BRANCH_ID
    INTO v_emp_id, v_role_desc, v_branch_id
    FROM EMPLOYEE e
    JOIN ROLE r ON e.ROLE_ID = r.ROLE_ID
    WHERE UPPER(e.USERNAME) = UPPER(v_username);

    DBMS_SESSION.SET_CONTEXT('emp_ctx', 'emp_id', v_emp_id);
    DBMS_SESSION.SET_CONTEXT('emp_ctx', 'emp_role', v_role_desc);
    DBMS_SESSION.SET_CONTEXT('emp_ctx', 'branch_id', v_branch_id);
	
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No employee found for ' || v_username);
  END;
END;




CREATE OR REPLACE TRIGGER set_emp_ctx_trig
AFTER LOGON ON DATABASE
BEGIN
  set_emp_ctx_pkg.set_emp;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Trigger failed');
END;





--VPD1
CREATE OR REPLACE FUNCTION audit_log_policy (
  schema_var VARCHAR2,
  table_var  VARCHAR2
) RETURN VARCHAR2 IS
  v_role VARCHAR2(50);
BEGIN
  v_role := SYS_CONTEXT('emp_ctx', 'emp_role');

  IF v_role = 'Auditor' THEN
    RETURN '1=1'; -- accesso totale
  ELSE
    RETURN '1=0'; -- accesso negato
  END IF;
END;


BEGIN
  DBMS_RLS.ADD_POLICY(
    object_schema    => 'ADMIN',
    object_name      => 'AUDIT_LOG',
    policy_name      => 'vpd_audit_log',
    function_schema  => 'ADMIN',
    policy_function  => 'audit_log_policy'
  );
END;


--VPD2
CREATE OR REPLACE FUNCTION employee_access_policy (
  schema_var VARCHAR2,
  table_var  VARCHAR2
) RETURN VARCHAR2 IS
  v_role      VARCHAR2(50);
  v_branch_id VARCHAR2(50);
  v_emp_id VARCHAR2(50);
BEGIN
  v_role := SYS_CONTEXT('emp_ctx', 'emp_role');
  v_branch_id := SYS_CONTEXT('emp_ctx', 'branch_id');
  v_emp_id := SYS_CONTEXT('emp_ctx', 'emp_id');
  
   IF v_role = 'Top Manager' THEN
   RETURN '1=1';  

ELSIF v_branch_id = 'MI' and v_role = 'Middle Manager'  THEN
RETURN 'BRANCH_ID = ''MI''';     

ELSIF v_branch_id = 'RO' and v_role = 'Middle Manager'  THEN
RETURN 'BRANCH_ID = ''RO''';    

ELSIF   v_role = 'Cashier' THEN
 RETURN '1=1';
  ELSE
     RETURN '1=0'; -- blocco tutti gli altri
  END IF;
END;


BEGIN
  DBMS_RLS.ADD_POLICY(
    object_schema    => 'ADMIN',
    object_name      => 'TOP_MANAGER_VIEW',
    policy_name      => 'vpd_employee_access',
    function_schema  => 'ADMIN',
    policy_function  => 'employee_access_policy',
    statement_types  => 'SELECT'
  );
END;



--VPD 3
CREATE OR REPLACE VIEW MIDDLE_MANAGER_VIEW AS
SELECT e1.*
FROM EMPLOYEE e1

GRANT SELECT ON MIDDLE_MANAGER_VIEW TO luca_bianchi
GRANT SELECT ON MIDDLE_MANAGER_VIEW TO stefano_moretti



BEGIN
  DBMS_RLS.ADD_POLICY(
    object_schema    => 'ADMIN',
    object_name      => 'MIDDLE_MANAGER_VIEW',
    policy_name      => 'vpd_middle_access',
    function_schema  => 'ADMIN',
    policy_function  => 'employee_access_policy',
    statement_types  => 'SELECT'
  );
END; 
/

--VPD 4

GRANT SELECT ON TOP_MANAGER_ALL_ACCOUNT_VIEW TO mario_rossi;
 
BEGIN
  DBMS_RLS.ADD_POLICY(
    object_schema    => 'ADMIN',
    object_name      => 'TOP_MANAGER_ALL_ACCOUNT_VIEW',
    policy_name      => 'vpd_employee_access',
    function_schema  => 'ADMIN',
    policy_function  => 'employee_access_policy',
    statement_types  => 'SELECT'
  );
END;


--VPDs 5 and 6
CREATE OR REPLACE VIEW MIDDLE_MANAGER_ACCOUNT_VIEW AS
SELECT
  ah.FISCAL_CODE,
  ah.NAME,
  ah.SURNAME,
  ah.EMAIL_ADDRESS AS HOLDER_EMAIL,
  ah.TEL_NO AS HOLDER_TEL_NO,
  ah.BIRTHDAY,
  ah.ACCOUNT_NO,
  ah.BAD_PAYER,
  ah.TYPE_WORK,
  ca.OWNER_CODE,
  ca.BALANCE,
  cr.CARD_NO,
  cr.CARD_TYPE,
  cr.PAYMENT_CIRCUIT,
  cr.LIMIT,
  cr.FLAG_ACTIVE,
  cr.EXPIRATION_DATE,
  mm.EMPLOYEE_ID AS MIDDLE_MANAGER_ID,
  mm.USERNAME AS MIDDLE_MANAGER_USERNAME,
  mm.MAIL_ADDRESS AS MIDDLE_MANAGER_EMAIL,
  mm.TEL_NO AS MIDDLE_MANAGER_TEL_NO,
  cashier.BRANCH_ID
FROM ACCOUNT_HOLDER ah
LEFT JOIN CURRENT_ACCOUNT ca ON ah.ACCOUNT_NO = ca.ACCOUNT_NO
LEFT JOIN CARD cr ON ah.ACCOUNT_NO = cr.ACCOUNT_NO
LEFT JOIN EMPLOYEE cashier ON ah.EMPLOYEE_ID = cashier.EMPLOYEE_ID
LEFT JOIN EMPLOYEE mm ON cashier.MANAGER_ID = mm.EMPLOYEE_ID

 
GRANT SELECT ON MIDDLE_MANAGER_ACCOUNT_VIEW TO luca_bianchi;
GRANT SELECT ON MIDDLE_MANAGER_ACCOUNT_VIEW TO stefano_moretti;

BEGIN
  DBMS_RLS.ADD_POLICY(
    object_schema    => 'ADMIN',
    object_name      => 'MIDDLE_MANAGER_ACCOUNT_VIEW',
    policy_name      => 'vpd_employee_access',
    function_schema  => 'ADMIN',
    policy_function  => 'employee_access_policy',
    statement_types  => 'SELECT'
  );
END;


--VPD 7
CREATE OR REPLACE VIEW MIDDLE_MANAGER_TRANSACTION_VIEW AS
SELECT t.*, cashier.BRANCH_ID
FROM TRANSACTION t
JOIN EMPLOYEE cashier ON t.EMPLOYEE_ID = cashier.EMPLOYEE_ID

BEGIN
  DBMS_RLS.ADD_POLICY(
    object_schema    => 'ADMIN',
    object_name      => 'MIDDLE_MANAGER_TRANSACTION_VIEW',
    policy_name      => 'vpd_employee_access',
    function_schema  => 'ADMIN',
    policy_function  => 'employee_access_policy',
    statement_types  => 'SELECT'
  );
END;

 
GRANT SELECT ON MIDDLE_MANAGER_TRANSACTION_VIEW TO luca_bianchi;
GRANT SELECT ON MIDDLE_MANAGER_TRANSACTION_VIEW TO stefano_moretti;


--VPD 8
CREATE OR REPLACE VIEW CONTACT_CLIENT_VIEW AS
SELECT
  ah.FISCAL_CODE,
  ah.NAME,
  ah.SURNAME,
  ah.EMAIL_ADDRESS AS HOLDER_EMAIL,
  ah.TEL_NO AS HOLDER_TEL_NO,
  ah.BIRTHDAY
FROM ACCOUNT_HOLDER ah

 
GRANT SELECT ON CONTACT_CLIENT_VIEW TO anna_verdi
GRANT SELECT ON CONTACT_CLIENT_VIEW TO elisa_conti
GRANT SELECT ON CONTACT_CLIENT_VIEW TO francesco_ricci
 
GRANT SELECT ON CONTACT_CLIENT_VIEW TO martina_ferrari
GRANT SELECT ON CONTACT_CLIENT_VIEW TO alessandro_romano

BEGIN
  DBMS_RLS.ADD_POLICY(
    object_schema    => 'ADMIN',
    object_name      => 'CONTACT_CLIENT_VIEW',
    policy_name      => 'vpd_employee_access',
    function_schema  => 'ADMIN',
    policy_function  => 'employee_access_policy',
    statement_types  => 'SELECT'
  );
END;


--VPD 9
CREATE OR REPLACE VIEW TOP_MANAGER_CARD_VIEW AS
SELECT  
  e2.CARD_NO,
  e2.CARD_TYPE,
  e2.PAYMENT_CIRCUIT,
  e2.LIMIT,
  e2.FLAG_ACTIVE,
  e2.EXPIRATION_DATE
FROM CARD e2;


GRANT SELECT ON TOP_MANAGER_CARD_VIEW TO mario_rossi

BEGIN
  DBMS_RLS.ADD_POLICY(
    object_schema    => 'ADMIN',
    object_name      => 'TOP_MANAGER_CARD_VIEW',
    policy_name      => 'vpd_employee_access',
    function_schema  => 'ADMIN',
    policy_function  => 'employee_access_policy',
    statement_types  => 'SELECT'
  );
END;
