# Temporarily Disable Firebase (Local Storage Only)

## Quick Fix: Force Local Storage Mode

If you want to temporarily disable Firebase and use only local storage:

### Option 1: Comment Out Firebase Code
In index.html, find line ~365 and comment out the Firebase initialization:

```javascript
// Comment out this entire section:
/*
const firebaseConfig = {
    apiKey: "AIzaSyBdjQoKx1ORU3gCvK5-JP6dGfg1xkqL8Lk",
    authDomain: "gatepass-146df.firebaseapp.com",
    projectId: "gatepass-146df",
    // ... rest of config
};
*/

// Add this line to force local storage:
let useLocalStorage = true;
```

### Option 2: Set Local Storage Flag
Add this line after the Firebase config:
```javascript
useLocalStorage = true; // Force local storage mode
```

## Benefits of Local Storage Mode:
- ✅ No sync errors
- ✅ Instant saving
- ✅ Works offline
- ✅ No network dependency
- ✅ Data persists in browser

## Limitations:
- ❌ Data not backed up to cloud
- ❌ No cross-device sync
- ❌ Data lost if browser cache cleared
- ❌ No multi-user access
