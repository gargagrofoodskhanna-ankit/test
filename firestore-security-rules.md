# Firebase Security Rules Fix

## Current Problem
Your Firebase Firestore has restrictive security rules that are blocking anonymous access, causing auto sync to fail.

## Solution: Update Firebase Security Rules

### Step 1: Go to Firebase Console
1. Open: https://console.firebase.google.com/
2. Select your project: `gatepass-146df`
3. Go to **Firestore Database** → **Rules**

### Step 2: Replace Current Rules
Replace the existing rules with this:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow read/write access to all documents for all users
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

### Step 3: Publish Rules
1. Click **"Publish"** button
2. Wait for deployment (30 seconds)
3. Test your app - auto sync should work now

## For Production (More Secure Rules)
Once testing is complete, use these more secure rules:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow authenticated users to access their own data
    match /gate_passes/{gatePassId} {
      allow read, write: if request.auth != null;
    }
    match /suppliers/{supplierId} {
      allow read, write: if request.auth != null;
    }
    match /users/{userId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

## Verification
After updating rules, you should see:
- ✅ "Data synced to cloud successfully!" message
- ✅ "All data synced" status (no pending records)
- ✅ No more "Retry Sync" button
