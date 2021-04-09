# 1. 매물 정보 확인 

SELECT A.`office`, A.`phoneNumber`, B.`address`, B.`area`, B.`price`
FROM `realtor` AS A
JOIN `real_estate` AS B 
ON A.`id` = B.`realtorId`
WHERE B.`type` = '매매' AND B.`price` <= 130000
ORDER BY B.`price`


# 2. 안심 중개사 

SELECT A.`office`, A.`phoneNumber`, B.`address`, B.`price`, B.`rentPrice`, B.`area`
FROM `realtor` AS A
JOIN `real_estate` AS B 
    ON A.`id` = B.`realtorId`
WHERE B.`type` = '월세' 
    AND A.`grade` = '안심중개사'
ORDER BY B.`rentPrice`


# 3. 매물 확인

SELECT A.`office`, A.`phoneNumber`, B.`address`, B.`price`, B.`area`
FROM `realtor` AS A
JOIN `real_estate` AS B 
ON A.`id` = B.`realtorId`
WHERE B.`type` = '전세' AND B.`price` <= 70000 
    AND A.`address` = '서울시 서초구'
ORDER BY B.`price` 

# 4. 공인중개상 매물 개수

SELECT A.`office`, count(1)
FROM `realtor` AS A
JOIN `real_estate` AS B 
    ON A.`id` = B.`realtorId`
GROUP BY A.`office`
ORDER BY count(1) DESC

# 5. 매물 확인

SELECT A.`office`, A.`phoneNumber`, B.`address`, B.`price`, B.`area`
FROM `realtor` AS A
JOIN `real_estate` AS B 
ON A.`id` = B.`realtorId`
WHERE B.`type` IN ('매매', '전세')
    AND B.`area` >= 100
    AND A.`office` = '대박공인중개사'
ORDER BY B.`price` 



