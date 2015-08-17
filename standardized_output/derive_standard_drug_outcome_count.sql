------------------------------
--
-- This SQL script creates drug/outcome combination counts (counts for pairs of drug RxNorm concept_id, outcome (reaction) Meddra concept_id) and store the counts in a new table called standard_drug_outcome_count
--
-- LTS COMPUTING LLC
------------------------------

set search_path = faers;

drop table if exists standard_drug_outcome_count;
create table standard_drug_outcome_count as
(
	with cte1 as (
	select a.concept_id, b.outcome_concept_id, count(*) as drug_outcome_pair_count
	from standard_drug a
	inner join standard_drug_outcome b
	on a.primaryid = b.primaryid
	group by a.concept_id, b.outcome_concept_id
	)
select * from cte1
)