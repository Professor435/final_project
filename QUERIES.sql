---DELETE QUERY----

DELETE FROM affiliations
WHERE function = 'Professor';

---JOIN QUERY-------

SELECT a.firstname, a.lastname, a.function, u.university, u.university_city
FROM affiliations a
JOIN universities u ON a.university_shortname = u.university_shortname
LIMIT 5;

---REFRENTIAL INTEGRITY---

------------------------ADDING FOREIGN KEY CONSTRAINTS------------------

ALTER TABLE affiliations
ADD CONSTRAINT fk_university
FOREIGN KEY (university_shortname) 
REFERENCES universities(university_shortname);

ALTER TABLE affiliations
ADD CONSTRAINT fk_organization
FOREIGN KEY (organization) REFERENCES organizations(organization);

-------INSERT,UPDATE AND DELETE-------------

INSERT INTO university_professors (firstname, lastname, university, university_shortname, university_city, function, organization, organization_sector)
VALUES ('Alice', 'Smith', 'Harvard University', 'HU', 'Cambridge', 'Lecturer', 'Harvard', 'Education');

UPDATE university_professors
SET function = 'Senior Lecturer'
WHERE firstname = 'Alice' AND lastname = 'Smith';

DELETE FROM university_professors
WHERE firstname = 'Alice' AND lastname = 'Smith';
