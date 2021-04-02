# 1. inner join 

SELECT store.name, store.phoneNumber, new_review.menu, new_review.userName, new_review.point, new_review.review
FROM `store` JOIN `new_review` ON store.id = new_review.storeId;


# 2. left join 

SELECT store.name, store.phoneNumber, new_review.menu, new_review.userName, new_review.point, new_review.review
FROM `store` LEFT JOIN `new_review` ON store.id = new_review.storeId;


# 3. 낮은 리뷰 추출 

SELECT new_review.menu, new_review.userName, new_review.point, new_review.review 
FROM new_review JOIN store ON new_review.storeId = store.id
WHERE new_review.point < 3.0 ORDER BY new_review.point;

# 4. 리뷰내용 있는 리스트 

SELECT store.name, new_review.menu, new_review.point, new_review.review 
FROM new_review JOIN store ON new_review.storeId = store.id
WHERE new_review.userName = '이병헌' AND new_review.point > 4.0 AND new_review.review is not NULL ORDER BY new_review.point DESC;

# 5. 맛집랭킹 

SELECT store.name, store.phoneNumber, AVG(new_review.point)
FROM new_review JOIN store ON new_review.storeId = store.id
GROUP BY store.name, store.phoneNumber ORDER BY AVG(new_review.point) DESC LIMIT 5;