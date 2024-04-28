-- 코드를 입력하세요
SELECT DISTINCT BOOK_ID, AUTHOR_NAME, SUBSTR(PUBLISHED_DATE, 1, 10)
FROM BOOK AS B
INNER JOIN AUTHOR AS A
ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE B.CATEGORY = '경제'
ORDER BY PUBLISHED_DATE