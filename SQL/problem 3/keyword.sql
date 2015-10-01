.output keyword.txt

create view if not exists K as
SELECT * FROM frequency
UNION
SELECT 'q' as docid, 'washington' as term, 1 as count 
UNION
SELECT 'q' as docid, 'taxes' as term, 1 as count
UNION 
SELECT 'q' as docid, 'treasury' as term, 1 as count;

select sum(count) as similarity
from (
    select D1.docid as docid1,
           D2.docid as docid2,
           sum(D1.count * D2.count) count
    from K D1 join K D2 using (term)
    where D1.docid < D2.docid and (docid1 = 'q' or docid2 = 'q')
    group by D1.docid, D2.term
)
group by docid1
order by similarity desc
limit 1;