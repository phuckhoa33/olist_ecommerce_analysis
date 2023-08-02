-- Hãy viết một truy vấn trong SQL để truy xuất tất cả các hàng và cột từ bảng 
-- DimEmployee trong cơ sở dữ liệu Adventureworks. Sắp xếp tập kết quả theo thứ tự tăng dần theo title.
use AdventureWorksDW2019
SELECT * 
FROM DimEmployee
ORDER BY title DESC 

-- Từ bảng DimProduct, hãy viết một truy vấn SQL để chỉ trả về các hàng cho sản phẩm có ngày bán không phải
-- là NULL và tên sản phẩm chứa ‘Hex’. Trả lại productkey, productalternatekey và englishproductname.
SELECT productkey, productalternatekey, englishproductname
FROM DimProduct
WHERE StartDate IS NOT NULL AND englishproductname != 'Hex'

-- Hãy viết một truy vấn SQL để tạo danh sách các công việc duy nhất trong bảng DimEmployee trong cơ sở dữ liệu Adventureworks. 
-- Trả lại cột tiêu đề công việc (title). 
SELECT DISTINCT Title
FROM DimEmployee
-- Hãy viết câu truy vấn SQL để trả ra danh sách employeekey và salesamountquota ở bảng FactSalesQuota trong đó mức 
-- salesamountquota lớn hn 28,000 và nhỏ hơn 600,000.
SELECT employeekey, salesamountquota
FROM FactSalesQuota
WHERE salesamountquota BETWEEN 28000 AND 600000
-- Viết câu truy vấn SQL đánh giá mức độ thời gian trả lời các vấn đề (AverageTimePerIssue) 
-- của call center từ bảng FactCallCenter theo thông tin sau:
--Từ 0-44 giây > Nhanh
--Từ 45 – 60 giây > Trung Bình
--Từ 61 – 120 giây > Chậm.
SELECT AverageTimePerIssue,     
    CASE 
        WHEN AverageTimePerIssue BETWEEN 0 AND 44 THEN "Nhanh"
        WHEN AverageTimePerIssue BETWEEN 45 AND 60 THEN "Trung Binh"
        WHEN AverageTimePerIssue BETWEEN 61 AND 120 THEN "Cham"
    END AS assessemnt
FROM FactCallCenter