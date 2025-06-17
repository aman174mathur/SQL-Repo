-- normalisation : try to remove redudancy and improve data integretity
-- data integretity (how the data is connected)

-- 1 normal form : data should contain atomic values (singular values) 
-- use explode function or split function to seprate the values 


-- 2nf : remove partital dependencies 
-- no attribute should be depend on a part of primary key 
-- seprate data on the 1 pk and 1Non key Attributes

-- name depends on part of primary key(si + course)
-- aftr 2nf name is completley deoended on  sid 

-- 3nf : remove transitive dependencies:
-- any non-key att shuld not depend on another another non key attribute 
-- salary depend on the teacher name (non-key to non key)
-- create a new table for faculty 



