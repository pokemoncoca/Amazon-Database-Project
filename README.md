# Amazon SQL Database Project

## Overview
This project models a relational database inspired by Amazon’s e-commerce operations.  
It covers critical entities such as **Customers, Orders, Products, Payments, Shipments, Employees, and Third-Party Sellers**, enabling data integrity and business insights.

## Repository Contents
- `Amazon_Tables.sql` → Complete schema with `CREATE TABLE` statements.
- `Project_Amazon.pdf` → Entity-Relationship Diagram (ERD) and table definitions.
- `Proposal.pdf` → Project proposal describing business context and objectives.
- `sample_queries.sql` → Example queries demonstrating use cases and analysis.

## Database Features
- **Customers** with Prime membership status and order history.
- **Orders & Payments** with support for multiple payment methods.
- **Products** tracked by category, price, and stock levels.
- **Third-Party Sellers** with registration details, performance metrics, and FBA participation.
- **Employees** categorized by role (customer service, delivery, warehouse).
- **Shipments** linked to carriers, tracking numbers, products, and staff.
- Many-to-many relationships resolved with **junction tables** (e.g., Products_Orders, Seller_Products).

## Example Insights
- Top-selling products and categories.
- Average order value per customer.
- Seller performance and FBA adoption.
- Shipment tracking and logistics analysis.
- Workforce allocation and employee responsibilities.


