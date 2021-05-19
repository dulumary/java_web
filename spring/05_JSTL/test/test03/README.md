### 1. JSTL Formatter 숫자, 비율

* 아래와 같이 선거의 득표수가 기호순서대로 저장되어 있다. 

```
List<Integer> candidates = new ArrayList<>();
candidates.add(263001);
candidates.add(173942);	
candidates.add(563057);	
```

* 해당 리스트를 컨트롤러에서 Model을 통해서 jsp 에 전달하고, 아래와 같은 화면을 구성하세요. 
* 총 100,000 명이 투표하였다. 이를 기반으로 투표율을 계산하세요. 
* 득표수와 득표율은 fomatter 를 통해서 출력하세요. 

> 출력 예시 

![test1](/material/images/dulumary/web/jstl/test03_1_result.png)


### 2. JSTL Formatter 통화, 날짜

* 아래와 같이 카드 사용 명세서가 저장되어 있다. 

```
List<Map<String, Object>> cardBills = new ArrayList<>();
		
Map<String, Object> cardBill = new HashMap<>();
cardBill.put("store", "GS48");
cardBill.put("pay", 7800);
cardBill.put("date", "2025-09-14");
cardBill.put("installment", "일시불");
cardBills.add(cardBill);

cardBill = new HashMap<>();
cardBill.put("store", "현태백화점");
cardBill.put("pay", 2750000);
cardBill.put("date", "2025-09-18");
cardBill.put("installment", "3개월");
cardBills.add(cardBill);

cardBill = new HashMap<>();
cardBill.put("store", "요촌치킨");
cardBill.put("pay", 180000);
cardBill.put("date", "2025-09-20");
cardBill.put("installment", "일시불");
cardBills.add(cardBill);
```

* 해당 리스트를 컨트롤러에서 Model을 통해서 jsp 에 전달하고, 아래와 같은 화면을 구성하세요. 
* 날짜 정보는 문자열로 저장되어 있다. formatter 를 이용해서 date 객체로 만들고, 아래와 같은 형태로 출력하세요. 
* 사용금액은 통화 format으로 출력하세요.

![test2](/material/images/dulumary/web/jstl/test03_2_result.png)