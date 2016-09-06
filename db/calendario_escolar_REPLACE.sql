SELECT * FROM calendario_escolar

SELECT REPLACE(img,'http://www.uttab.edu.mx/ITSLV_api/resources/img/calendario_escolar/','') FROM calendario_escolar

UPDATE calendario_escolar SET img = REPLACE(img,'http://www.uttab.edu.mx/ITSLV_api/resources/img/calendario_escolar/','')

SELECT REPLACE('http://www.uttab.edu.mx/ITSLV_api/resources/img/calendario_escolar/2016-2017/agosto_2016.png','http://www.uttab.edu.mx/ITSLV_api/resources/img/calendario_escolar/','')