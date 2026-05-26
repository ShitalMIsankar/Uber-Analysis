# 🚖 Uber Analytical Dashboard – Power BI Report

> **Author:** Shital  
> **Tool:** Microsoft Power BI Desktop  
> **Pages:** 5 (Home, Overview, Vehicle, Revenue, Customer & Rides)

---

## 📌 Project Overview

This Power BI dashboard provides end-to-end analytical insights into Uber's ride operations, covering bookings, revenue, vehicle performance, customer behavior, and cancellation patterns. It is designed to help stakeholders make data-driven decisions across all key business areas.

---

## 📊 Key Metrics (Global KPIs)

| Metric | Value |
|---|---|
| Completed Bookings | 93K |
| Lost Bookings | 57K |
| Total Revenue | 52M |
| Total Distance | 2.51M |
| Average Distance | 24.64 |

---

## 📁 Dashboard Pages

### 1. 🏠 Home
- Landing page introducing the Uber platform.
- Navigation buttons to all report sections: Overview, Vehicle, Revenue, Customer & Rides.

---

### 2. 📋 Overview
- **Ride Status Breakdown:**
  - Completed: 38.3%
  - Cancelled: 20.1%
  - Incomplete: 11.57%
- **Completed Bookings by Month** – Line chart (Jan–Dec)
- **Revenue by Month** – Bar chart (range: 4.0M–4.6M)
- **Revenue by Vehicles** – Auto leads at 13M, followed by Bike (11M), Go Mini (10M), Go Sedan (9M), Premier (6M), Uber XL (2M)
- **Top Pickup Location:** Khandsa (600 rides)
- **Top Drop Location:** Ashram (592 rides)
- **Average Customer Rating:** ⭐ 4.40
- **Average Driver Rating:** ⭐ 4.23

---

### 3. 🚗 Vehicle
- Detailed vehicle-wise performance table:

| Vehicle | Customer Count | Revenue | Completed Booking | Cont% |
|---|---|---|---|---|
| Uber XL | 4,447 | 1,528,032 | 2,783 | 100% |
| Premier Sedan | 16,827 | 6,275,332 | 11,247 | 100% |
| Go Sedan | 23,330 | 9,369,719 | 16,666 | 100% |
| Go Mini | 28,358 | 10,338,496 | 18,529 | 100% |
| Bike | 29,138 | 11,456,182 | 20,560 | 100% |
| **Total** | **104,114** | **51,846,183** | **92,551** | **100%** |

- Sparkline trends for completed bookings per vehicle category.

---

### 4. 💰 Revenue
- **Revenue by Month** – Line chart showing monthly trends (3.97M–4.57M)
- **Revenue by Vehicles** – Auto (13M) is the top earner
- **Revenue by Payment Method:**
  - UPI: 23M (highest)
  - Cash: 13M
  - Uber Wallet: 6M
  - Credit Card: 5M
  - Debit Card: 4M
- **Revenue by Customers** – Top customer (C7828101) generating ~7K

---

### 5. 👥 Customer & Rides
- **Customer Count by Month** – Line chart (range: 10K–13.5K)
- **Customers by Payment Method:**
  - Blank/UPI: ~48K each
  - Cash: 25K
  - Uber Wallet: 12K
  - Credit Card: 10K
  - Debit Card: 8K
- **Customer Details Table** – Individual-level data (ID, Revenue, Avg Distance, Completed/Lost Bookings)
- **Ride Cancellation Analysis** (Driver / Incomplete / Customer tabs):
  - Customer related issue: 6,835 bookings
  - More than permitted people: 6,684 bookings

---

## 🗂️ Data Fields Used

- `Vehicle Details` – Vehicle types and images
- `Calendar` – Date/time axis for trend analysis
- `Cancel Ride` – Cancellation reasons and counts
- `Date Axis` – Monthly/Quarterly toggle
- `Uber` – Core bookings and ride data
- `Veh_IMG` – Vehicle image assets

---

## 🔧 Features

- ✅ Month / Quarter toggle on all time-series charts
- ✅ Vehicle image slicers for interactive filtering
- ✅ Drill-through enabled across pages
- ✅ Cross-report filtering support
- ✅ Star rating visuals for customer & driver ratings

---

## 📎 Notes

- All revenue figures are in absolute numbers (not normalized).
- "Lost Bookings" includes both cancelled and incomplete rides.
- Dashboard is filtered to **Auto** vehicle type by default on the Overview page.
