# 📌 Primary Key

A **Primary Key** is a column (or set of columns) that uniquely identifies each row in a table.

## ✅ Characteristics:
- Must be unique (no duplicates)
- Cannot be NULL
- Only one primary key per table
- Used to identify each record clearly

## 💡 Example:
```sql
CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY,
    order_id INT,
    pizza_id VARCHAR(50),
    quantity INT
);
```

👉 Here, `order_details_id` is the primary key.

# 📌 Secondary Key (Also called Non-Primary Key / Alternate Key / Index)

A **Secondary Key** is any column that is not a primary key but is used for:
- Searching
- Filtering
- Indexing

## ✅ Characteristics:
- Can have duplicate values
- Can be NULL
- A table can have multiple secondary keys
- Improves query performance

## 💡 Example:
```sql
CREATE INDEX idx_order_id ON order_details(order_id);
```

👉 Here, `order_id` is a secondary key (indexed column).



| Feature          | Primary Key           | Secondary Key        |
| ---------------- | --------------------- | -------------------- |
| Uniqueness       | Must be unique        | Can have duplicates  |
| NULL allowed     | ❌ No                  | ✅ Yes                |
| Number per table | Only 1                | Multiple allowed     |
| Purpose          | Identify each row     | Improve search/query |
| Index            | Automatically indexed | Optional indexing    |






