DELIMITER //

CREATE PROCEDURE GenerateDailySalesReport (
    IN report_date DATE
)
BEGIN
    SELECT 
        p.product_id,
        p.product_name,
        COALESCE(SUM(s.quantity), 0) AS total_quantity_sold
    FROM 
        products p
    LEFT JOIN 
        sales s ON p.product_id = s.product_id
        AND DATE(s.sale_date) = report_date
    GROUP BY 
        p.product_id, p.product_name;
END //

DELIMITER ;
