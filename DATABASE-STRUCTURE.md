# Grain Procurement System - Database Structure

## Overview
This system uses **Firebase Firestore** as the cloud database with the following main collections:

## Database Collections

### 1. **users** Collection
**Purpose**: Store user authentication and profile information

**Document Structure**:
```javascript
{
  username: string,           // Unique username for login
  password: string,           // Plain text password (⚠️ Should be hashed in production)
  name: string,              // Full name of the user
  role: string,              // User role: 'admin', 'user1', 'user2'
  email: string,             // Email address (optional)
  isActive: boolean,         // Account status (default: true)
  createdAt: Date            // Account creation timestamp
}
```

**Default Users**:
- **admin**: Full access to all features
- **user1**: Full access to all features  
- **user2**: View-only access

---

### 2. **suppliers** Collection
**Purpose**: Store party/supplier information for grain transactions

**Document Structure**:
```javascript
{
  name: string,              // Party/Supplier name (unique identifier)
  city: string,              // City location
  state: string,             // State location
  address: string,           // Full address
  gstPan: string,            // GST/PAN number
  createdAt: string,         // ISO timestamp of creation
  createdBy: string,         // User ID who created this record
  createdByRole: string      // Role of the creating user
}
```

---

### 3. **gate_passes** Collection
**Purpose**: Store all grain gate pass transactions (incoming/outgoing)

**Document Structure**:
```javascript
{
  id: string,                // Unique gate pass ID (timestamp-based)
  firebaseId: string,        // Firebase document ID
  type: string,              // 'Incoming' or 'Outgoing'
  item: string,              // Grain type: 'Maize', 'Wheat', 'Rice'
  purchasedFrom: string,     // Supplier/Party name
  truckNumber: string,       // Vehicle registration number
  date: string,              // Transaction date (YYYY-MM-DD format)
  partyWeight: number,       // Weight from party (quintals) - only for Incoming
  ownWeight: number,         // Own weight measurement (quintals)
  remarks: string,           // Additional notes (optional)
  userId: string,            // User who created this record
  userRole: string,          // Role of the creating user
  createdAt: string,         // ISO timestamp of creation
  
  // Additional fields for Outgoing transactions
  itemRate: number,          // Rate per quintal (₹) - only for Outgoing
  brokerName: string,        // Broker name - only for Outgoing
  soldTo: string,            // Customer name - only for Outgoing
  dueDate: string,           // Payment due date - only for Outgoing
  
  // Payment tracking fields
  paymentStatus: string,     // 'pending', 'partial', 'received', 'overdue'
  amountReceived: number,    // Amount received (₹)
  totalAmount: number        // Total amount due (₹)
}
```

---

## Database Relationships

### User Management
- **users** collection stores authentication data
- Each user has a unique `username` and `role`
- Roles determine access levels:
  - `admin`: Full CRUD access
  - `user1`: Full CRUD access
  - `user2`: Read-only access

### Party/Supplier Management
- **suppliers** collection stores all parties
- Referenced by `purchasedFrom` field in gate passes
- Auto-created when new party is used in gate pass

### Gate Pass Transactions
- **gate_passes** collection stores all transactions
- Links to suppliers via `purchasedFrom` field
- Tracks user who created each record
- Supports both Incoming and Outgoing transactions

## Data Flow

1. **User Authentication**: Login validates against `users` collection
2. **Party Creation**: New parties added to `suppliers` collection
3. **Gate Pass Creation**: New transactions added to `gate_passes` collection
4. **Real-time Updates**: Firebase listeners update UI automatically
5. **Payment Tracking**: Payment status updated in existing gate pass documents

## Security Rules

The system uses Firebase Security Rules to control access:
- Anonymous access for basic operations
- User-based access control through authentication
- Role-based permissions for different user types

## Key Features

- **Real-time synchronization** across all connected clients
- **Offline support** with automatic sync when connection restored
- **User role management** with different access levels
- **Payment tracking** for outgoing transactions
- **Inventory management** through weight calculations
- **Audit trail** with creation timestamps and user tracking

## Data Validation

- **Required fields** are enforced at the application level
- **Unique constraints** on usernames and party names
- **Data type validation** for numeric fields
- **Date format validation** for transaction dates
