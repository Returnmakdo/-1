회원별 매출합계 
SELECT custno, sum(price) from money_tbl_02 mt
group by custno;

정렬기준 확인
select custno, sum(price) asum from money_tbl_02 mt
group by custno
order by asum desc;

custno 컬럼으로 위와 고객테이블 조인하여 고객정보 전체 가져오기
select * from member_tbl_02 mt,
	(select custno, sum(price) as asum from money_tbl_02 mt
	group by custno
	order by asum desc) sale
where mt.custno = sale.custno;

-- 또는
select * from member_tbl_02 mt join
	(select custno, sum(price) as asum from money_tbl_02 mt
	group by custno
	order by asum desc) sale
on mt.custno = sale.custno;



select mt.CUSTNO , 
        mt.CUSTNAME,
        decode(mt.GRADE,'A','VIP','B','일반','C','직원')  AS agrade,
        sale.asum 
from member_tbl_02 mt,
	(select custno, sum(price) as asum from money_tbl_02
	group by custno
	order by asum desc) sale
where mt.custno = sale.custno;