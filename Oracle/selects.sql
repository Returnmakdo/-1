ȸ���� �����հ� 
SELECT custno, sum(price) from money_tbl_02 mt
group by custno;

���ı��� Ȯ��
select custno, sum(price) asum from money_tbl_02 mt
group by custno
order by asum desc;

custno �÷����� ���� �����̺� �����Ͽ� ������ ��ü ��������
select * from member_tbl_02 mt,
	(select custno, sum(price) as asum from money_tbl_02 mt
	group by custno
	order by asum desc) sale
where mt.custno = sale.custno;

-- �Ǵ�
select * from member_tbl_02 mt join
	(select custno, sum(price) as asum from money_tbl_02 mt
	group by custno
	order by asum desc) sale
on mt.custno = sale.custno;



select mt.CUSTNO , 
        mt.CUSTNAME,
        decode(mt.GRADE,'A','VIP','B','�Ϲ�','C','����')  AS agrade,
        sale.asum 
from member_tbl_02 mt,
	(select custno, sum(price) as asum from money_tbl_02
	group by custno
	order by asum desc) sale
where mt.custno = sale.custno;