.output big_documents.txt

select count(*)
from (
select *
from Frequency
group by docid
having sum(count)>300
);