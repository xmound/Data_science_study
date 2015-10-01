.output two_words.txt

select count(*)

from (
select docid
from Frequency
where term = 'transactions'
) 

join (
select docid
from Frequency
where term = 'world'
)
using (docid);