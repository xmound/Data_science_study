.output similarity.txt

create view if not exists D as
select *
from Frequency 
where docid in ('10080_txt_crude', '17035_txt_earn');

select sum(value)
from (
    select D1.docid, D2.docid, sum(D1.count * D2.count) as value
    from D D1 join D D2 using (term)
    where D1.docid < D2.docid
    group by D1.docid, D2.term
);