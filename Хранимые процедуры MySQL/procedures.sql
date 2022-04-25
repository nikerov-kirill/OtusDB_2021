
# Процедура get_products 
DROP PROCEDURE adventureworks.get_products;


DELIMITER $$
USE adventureworks $$
CREATE PROCEDURE get_products(
	categoryID INT,
	minCost DECIMAL(10,2),
	maxCost DECIMAL(10,2),
	sellStartDate DATE,
	sellFinishDate DATE,
	orderColumn VARCHAR(255),
	pageLimit INT,
	pageOffset INT
)
BEGIN
	DROP TABLE IF EXISTS result_tbl;
	CREATE TEMPORARY TABLE result_tbl
		SELECT 
			p.ProductID as ID,
			p.Name as ProductName,
			CAST(p.StandardCost AS DECIMAL(10,2)) as Cost,
			p.SellStartDate as SellDate,
			p_sub.Name as SubCatName,
			p_cat.Name as CatName
		FROM product p 
		LEFT JOIN productsubcategory p_sub ON (p.ProductSubcategoryID = p_sub.ProductSubcategoryID)
		LEFT JOIN productcategory p_cat ON (p_sub.ProductCategoryID = p_cat.ProductCategoryID)
		WHERE p_cat.ProductCategoryID = categoryID
		AND p.StandardCost BETWEEN minCost AND maxCost
		AND p.sellStartDate BETWEEN sellStartDate AND sellFinishDate
		ORDER BY orderColumn DESC
		LIMIT  pageLimit, pageOffset;
END $$
DELIMITER ;


SET @categoryID = 1; # Категория товара
SET @minCost = 100; # Минимальная  стоимость товара
SET @maxCost = 2000; # Максимальная стоимость товара
SET @sellStartDate = '1998-01-01'; # Дата начала продажи товара 
SET @sellFinishDate = '2004-01-01'; # Дата окончания продажи товара
SET @orderColumn = 'p.SellStartDate'; # Поле сортировки результатов
SET @pageLimit = 10; # Количество выводимых результатов
SET @pageOffset = 15; # С какой записи начать вывод результатов

CALL get_products(@categoryID, @minCost, @maxCost, @sellStartDate, @sellFinishDate, @orderColumn, @pageLimit, @pageOffset);
SELECT * FROM result_tbl;


# Процедура get_orders 
DROP PROCEDURE adventureworks.get_orders;

DELIMITER $$
USE adventureworks $$
CREATE PROCEDURE get_orders(
	period VARCHAR(25),
	dateStart DATE,
	dateFinish DATE,
	groupBy VARCHAR(25)
)
BEGIN 
	DROP TABLE IF EXISTS result_tbl;
	
	IF (groupBy = 'product') THEN
	SET @query = CONCAT('CREATE TEMPORARY TABLE result_tbl
		SELECT 
			s_detail.ProductID as ProductID,
			p.Name as ProductName,
			count(*) as Amount,
			EXTRACT(', period , ' FROM s_header.OrderDate) as Period
		FROM salesorderheader s_header
		LEFT JOIN salesorderdetail s_detail ON (s_header.SalesOrderID = s_detail.SalesOrderID)
		LEFT JOIN product p ON (s_detail.ProductID = p.ProductID)
		WHERE s_header.OrderDate BETWEEN \'', dateStart, '\' AND  \'', dateFinish ,'\'
		GROUP BY EXTRACT(', period , ' FROM s_header.OrderDate), s_detail.ProductID, p.Name;');
	ELSEIF (groupBy = 'category') THEN 
	SET @query = CONCAT('CREATE TEMPORARY TABLE result_tbl
		SELECT 
			p_cat.ProductCategoryID as CatID,
			p_cat.Name as CatName,
			count(*) as Amount,
			EXTRACT(', period , ' FROM s_header.OrderDate) as Period
		FROM salesorderheader s_header
		LEFT JOIN salesorderdetail s_detail ON (s_header.SalesOrderID = s_detail.SalesOrderID)
		LEFT JOIN product p ON (s_detail.ProductID = p.ProductID)
		LEFT JOIN productsubcategory p_sub ON (p.ProductSubcategoryID = p_sub.ProductSubcategoryID)
		LEFT JOIN productcategory p_cat ON (p_sub.ProductCategoryID = p_cat.ProductCategoryID)
		WHERE s_header.OrderDate BETWEEN \'', dateStart, '\' AND  \'', dateFinish ,'\'
		GROUP BY EXTRACT(', period , ' FROM s_header.OrderDate), p_cat.ProductCategoryID, p_cat.Name;');
	END IF;

	PREPARE get_orders FROM @query;
    EXECUTE get_orders;
    DEALLOCATE PREPARE get_orders;
   
END $$
DELIMITER ;


SET @period = 'DAY'; 
SET @dateStart  = '2004-07-01';
SET @dateFinish = '2004-07-31';
SET @groupBy = 'product';

CALL get_orders(@period, @dateStart, @dateFinish, @groupBy);
SELECT * FROM result_tbl;


