use company;
CREATE TABLE regex_samples (
id INT AUTO_INCREMENT PRIMARY KEY,
sample_text VARCHAR(100)
);

INSERT INTO regex_samples (sample_text) VALUES
('apple'),
('Banana'),
('cherry'),
('elderberry'),
('fig'),
('grape'),
('Chaneydew'),
('running'),
('123abc');

select *
from regex_samples
where sample_text regexp '^a';

select *
from regex_samples
where sample_text regexp 'e$';

select *
from regex_samples
where sample_text regexp '^[0-9]';

select *
from regex_samples
where sample_text regexp '(.)\\1';

select *
from regex_samples
where sample_text regexp '^[A-Za-z]+$';

select *
from regex_samples
where sample_text regexp '^.{5}$';

select *
from regex_samples
where sample_text regexp '^(apple|banana)$';

select *
from regex_samples
where sample_text regexp '^[0-9]{3}[A-Za-z]+$';

