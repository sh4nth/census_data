SELECT state_code, district_code,(array_agg(language_code ORDER BY p_total DESC))[1] AS language_code, (array_agg(p_total ORDER BY p_total DESC))[1] AS p_total, (array_agg(language_code ORDER BY p_total DESC))[2] AS language_code_2, (array_agg(p_total ORDER BY p_total DESC))[2] AS p_total_2 INTO TEMP t1 FROM c_16 GROUP BY state_code, district_code;

SELECT d.district_name, language_code, p_total, language_code_2,  p_total_2 INTO TEMP t2 FROM t1 JOIN districts d ON d.state_code=t1.state_code AND d.district_code=t1.district_code;

SELECT t2.district_name, language AS L1, language_color AS C1, p_total, language_code_2,  p_total_2 INTO TEMP t3 FROM t2 JOIN languages l ON l.language_code=t2.language_code;

SELECT t3.district_name, L1, C1, p_total, language AS L2, language_color AS C2, p_total_2 INTO TEMP t4 FROM t3 JOIN languages l ON l.language_code=t3.language_code_2;

SELECT * FROM t4;
