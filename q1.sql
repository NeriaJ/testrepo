/* 在accounts表中，有一个列包含每个公司的网站。
最后三位数字指定他们使用的网址类型。
取这些并提供accounts表中存在的每种网站类型的数量。*/

SELECT  RIGHT (website,3) AS web_type,
        COUNT(1) num_company
FROM    accounts
GROUP BY 1