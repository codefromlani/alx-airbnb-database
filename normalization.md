# Database Normalization to 3NF

## Objective
This document explains how the database schema was normalized to achieve Third Normal Form (3NF), ensuring data consistency, eliminating redundancy, and improving query efficiency.

## Normalization Steps

### 1. First Normal Form (1NF)
- Each table has a primary key, ensuring uniqueness of rows.
- All attributes contain atomic values (no arrays, lists, or repeating groups).
- Example: fields like email, phone_number, and address are stored as single values.

### 2. Second Normal Form (2NF)
- Built on 1NF by ensuring that all non-key attributes fully depend on the entire primary key.
- No partial dependencies are present.
- Example: when using a single-column primary key (e.g., user_id), all other attributes in that table depend only on user_id.

### 3. Third Normal Form (3NF)
- Removed transitive dependencies (non-key attributes depending on other non-key attributes).
- Ensured that every attribute depends only on the primary key.
- Used foreign keys (e.g., user_id, recipient_id, property_id) to maintain relationships instead of duplicating data.


## Conclusion
By applying the steps above, the schema meets the requirements of 3NF:
- Data is stored without redundancy.
- Relationships are enforced through primary/foreign keys.
- The design supports scalability, integrity, and efficient querying.