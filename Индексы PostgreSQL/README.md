#### 1. Создать индекс к какой-либо из таблиц вашей БД
create index on sub_varieties(group_variety);
#### 2. Прислать текстом результат команды explain, в которой используется данный индекс
Запрос:  
  explain (costs, verbose, format json, analyse)
  select * from sub_varieties sv 
  left join group_varieties gv on (sv.group_variety = gv.id)
Результат:  

