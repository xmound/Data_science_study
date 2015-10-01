.output matrix.txt

select val
from (
select a.row_num as row, b.col_num as col, sum(a.value * b.value) as val
from a join b on a.col_num = b.row_num
group by a.row_num, b.col_num
)
where row =2 and col=3;
