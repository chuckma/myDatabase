SELECT *,(
CASE 
WHEN score>='90'THEN '优秀'
WHEN score<'90' AND score>='60' THEN '及格'
ELSE '不及格'
END
) AS 'mark' FROM tb1;

