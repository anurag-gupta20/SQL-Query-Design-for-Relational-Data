📘 Repository Overview  
This repository presents a curated collection of advanced SQL exercises designed around realistic data models across multiple domains. Each script focuses on schema creation, data population, and query logic ranging from foundational operations to complex subqueries and multi-table joins.

🔍 File Descriptions  
1) SQL_Exercise_01.sql — Product & Manufacturer Database
- Designs a product catalog with manufacturer relationships. Exercises cover:
- Aggregate queries (AVG, COUNT)
- Joins between related entities
- Price-based filtering, discount computation
- Data modification operations (INSERT, UPDATE)

2) SQL_Exercise_02.sql — Employee & Department Analysis
- Explores HR-related data by linking employees with departmental budgets. Key topics:
- Multi-condition filtering, DISTINCT usage
- Budget aggregation, department reassignment
- Subqueries to extract hierarchical insights (e.g., second-lowest budget)
- Deletion and update scenarios

3) SQL_Exercise_03.sql — Warehouse Inventory System
- Models a logistics warehouse and box inventory environment. Practice includes:
- Average and conditional aggregation per location
- Saturation detection (capacity vs. occupancy)
- Location-based filtering, cascading deletes
- Index creation and performance considerations

4) SQL_Exercise_04.sql — Movie-Theater Management
- Captures movie ratings and screenings across theaters. Highlights:
- Handling NULL values and missing references
- Identifying unassigned entities
- Filtering theaters by movie rating and status
- Managing theater schedules and unrated entries

5) SQL_Exercise_05.sql — Parts & Providers Supply Chain
- Focuses on a classic many-to-many relationship via a Provides junction table. Concepts covered:
- Provider-specific pricing
- Identifying the most expensive suppliers per part
- Data consistency in foreign key relationships
- Incremental updates and deletions with referential integrity

6) SQL_Exercise_06.sql — Scientific Projects & Assignments
- A project tracking schema with scientists and their research involvement. Emphasis on:
- Multi-table joins with dual key constraints
- Identification of unassigned projects
- Ordered relational output for reporting use cases

7) SQL_Exercise_07.sql — Interplanetary Shipment Logistics
- A complex simulation involving employees, clients, packages, and planetary shipments. Features:
- Composite primary keys and cross-entity relationships
- Clearance-level logic for access control
- Shipment handling with multi-recipient logistics
- Advanced join strategies for real-world systems modeling
