-- 고객테이블 생성
create table 고객 (
	고객아이디 varchar(20) not null,
	고객이름 varchar(10) not null,
	나이 int,
	등급 varchar(10) not null,
	직업 varchar(20),
	적립금 int default 0,
	primary key(고객아이디)
);
	-- 데이터 입력
INSERT INTO 고객 VALUES ('apple', '정소화', 20, 'gold', '학생', 1000);
INSERT INTO 고객 VALUES ('banana', '김선우', 25, 'vip', '간호사', 2500);
INSERT INTO 고객 VALUES ('carrot', '고명석', 28, 'gold', '교사', 4500);
INSERT INTO 고객 VALUES ('orange', '김용욱', 22, 'silver', '학생', 0);
INSERT INTO 고객 VALUES ('melon', '성원용', 35, 'gold', '회사원', 5000);
INSERT INTO 고객 VALUES ('peach', '오형준', NULL, 'silver', '의사', 300);
INSERT INTO 고객 VALUES ('pear', '채광주', 31, 'silver', '회사원', 500);

-- 제품테이블 생성
create table 제품 (
	제품번호 char(3) not null,
	제품명 varchar(20),
	재고량 int,
	단가 int,
	제조업체 varchar(20),
	primary key(제품번호),
	check(재고량 >= 0 and 재고량 <= 10000)
);
	-- 데이터 입력
INSERT INTO 제품 VALUES ('p01', '그냥만두', 5000, 4500, '대한식품');
INSERT INTO 제품 VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드');
INSERT INTO 제품 VALUES ('p03', '쿵떡파이', 3600, 2600, '한빛제과');
INSERT INTO 제품 VALUES ('p04', '맛난초콜릿', 1250, 2500, '한빛제과');
INSERT INTO 제품 VALUES ('p05', '얼큰라면', 2200, 1200, '대한식품');
INSERT INTO 제품 VALUES ('p06', '통통우동', 1000, 1550, '민국푸드');
INSERT INTO 제품 VALUES ('p07', '달콤비스킷', 1650, 1500, '한빛제과');

-- 주문테이블 생성
create table 주문 (
	주문번호 char(3) not null,
	주문고객 varchar(20),
	주문제품 char(3),
	수량 int,
	배송지 varchar(30),
	주문일자 date,
	primary key(주문번호),
	foreign key(주문고객) references 고객(고객아이디),
	foreign key(주문제품) references 제품(제품번호)
);
	-- 데이터 입력
INSERT INTO 주문 VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', '22/01/01');
INSERT INTO 주문 VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구', '22/01/10');
INSERT INTO 주문 VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시', '22/01/11');
INSERT INTO 주문 VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구', '22/02/01');
INSERT INTO 주문 VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시', '22/02/20');
INSERT INTO 주문 VALUES ('o06', 'banana', 'p01', 19, '충청북도 보은군', '22/03/02');
INSERT INTO 주문 VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구', '22/03/15');
INSERT INTO 주문 VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시', '22/04/10');
INSERT INTO 주문 VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시', '22/04/11');
INSERT INTO 주문 VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', '22/05/22');



-- 예제
	-- 7-10: 고객 테이블에서 고객아이디, 고객이름, 등급 속성을 검색해보자.
select  고객아이디, 고객이름, 등급 속성 from 고객;

	-- 7-11: 고객 테이블에 존재하는 모든 속성을 검색해보자.
select  고객아이디, 고객이름, 나이, 등급, 직업, 적립금 from 고객; 

	-- 7-12: 고객 테이블에 존재하는 모든 속성을 검색해보자.
select * from 고객; 

	-- 7-13: 제품 테이블에서 제조업체를 검색해보자.
select 제조업체 from 제품; 

	-- 7-14: 제품 테이블에서 제조업체를 검색하되, ALl키워드를 사용해보자.
select all 제조업체 from 제품; 

	-- 7-15: 제품 테이블에서 제조업체 속성을 중복 없이 검색해보자.
select distinct 제조업체 from 제품; 

	-- 7-16: 제품 테이블에서 제품명과 단가 속성을 검색하되, 단가를 가격이라는 새 이름으로 출력해보자.
select 제품명, 단가 as 가격 from 제품; 

	-- 7-17: 제품 테이블에서 제품명과 단가 속성을 검색하되, 단가에 500원을 더해 "조정 단가"라는 새 이름으로 출력해보자.
select 제품명, 단가 + 500 as "조정 단가" from 제품; 

	-- 7-18: 제품 테이블에서 한빛제과가 제조한 제품의 제품명, 재고량, 단가를 검색해보자.
select all 제품명, 재고량, 단가 from 제품 where 제조업체 = '한빛제과';

	-- 7-19: 주문 테이블에서 apple 고객이 15개 이상 주문한 주문제품, 수량, 주문일자를 검색해보자.
select 주문제품, 수량, 주문일자 from 주문 where 주문고객 = 'apple' AND 수량 >= 15;

	-- 7-20: 주문 테이블에서 apple 고객이 주문했거나 15개 이상 주문된 제품의 주문제품, 수량, 주문일자, 주문고객을 검색해보자.
select 주문제품, 수량, 주문일자 from 주문 where 주문고객 = 'apple' OR 수량 >= 15;

	-- 7-21: 제품 테이블에서 단가가 2000원 이상이면서 3000원 이하인 제품의 제품명, 단가, 제조업체를 검색해보자.
select 제품명, 단가, 제조업체 from 제품 where 단가 >= 2000 AND 단가 <= 3000;

	-- 7-22: 고객 테이블에서 성이 김 씨인 고객의 고객이름, 나이, 등급, 적립금을 검색해보자.
select 고객이름, 나이, 등급, 적립금 from 고객 where 고객이름 like '김%';

	-- 7-23: 고객 테이블에서 고객아이디가 5자인 고객의 고객아이디, 고객이름, 등급을 검색해보자.
select 고객아이디, 고객이름, 등급 from 고객 where 고객아이디 like '_____';

	-- 7-24: 고객 테이블에서 나이가 아직 입력되지 않은 고객의 고객이름을 검색해보자.
select 고객이름 from 고객 where 나이 is null;

	-- 7-25: 고객 테이블에서 나이가 이미 입력된 고객의 고객이름을 검색해보자.
select 고객이름 from 고객 where 나이 is not null;