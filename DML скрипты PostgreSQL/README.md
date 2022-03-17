#### Напишите запрос по своей базе с использованием LEFT JOIN и INNER JOIN, как порядок соединений в FROM влияет на результат? Почему?

select 
	sv.name_en as "Название сорта (en)",
	sv.name_ru as "Название сорта (ru)",
	gv."name" as "Название группы",
	hv.name_en as "Категория (en)",
	hv.name_ru as "Категория (ru)"
from sub_varieties sv 
left join group_varieties gv on (sv.group_variety = gv.id)
left join head_varieties hv on (gv.head_variety = hv.id)

