# SQL-Developer-Internship-Task-5

# Task 5: SQL Joins (Inner, Left, Right, Full)

## Objective
Learn how to combine data from related tables using different types of SQL joins.

## Files

- `task5_joins.sql`: Queries using INNER, LEFT, RIGHT, FULL OUTER JOINs
- `inner_join` : Queries and description of **INNER JOIN**
- `left_join` : Queries and description of **LEFT JOIN**
- `right_join` : Queries and description of **RIGHT JOIN**
- `full_outer_join` : Queries and description of **FULL OUTER JOIN**
- `output for task5_joins.png` : Output screenshot of task5_joins.sql
- `joins_types` : Description for types of joins and query

## Tables Used
- Members
- Loans

## Queries Include:
- INNER JOIN : Books + Members on Loans
- LEFT JOIN : Members with or without loans
- RIGHT JOIN : loans and any staff who issued them
- FULL OUTER JOIN : Using UNION for unmatched records

## What I did :

- INNER JOIN      - Only matching rows (members with loans) 
- LEFT JOIN       - All members, even those without loans  
- RIGHT JOIN      - All loans, even if member doesn't exist 
- FULL OUTER JOIN - All members + all loans, matched or not

## Tools Used
- One Compiler , SQLiteStudio
