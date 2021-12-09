--Task10
create index if not exists name_idx on student (name)
--pros: faster search
--cons: due, "name" column is not  unique - when table will contain  lots of items with the same "names" the efficiency of index will reduce
