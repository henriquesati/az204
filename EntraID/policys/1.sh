{
    "Name": "first-ppol",
    "Description": "A simple policy for testing",
    "Actions": [
        "Microsoft.Storage/StorageAccounts/read",
   ].
   "NotActions":[],
   "DataActions": [], 
   "NotDataActions": [],
   "AssignableScopes": [
    "/subscriptions/<subscription.id>"
   ],
}

#az role definition create -role-definition myrole.json                                                                                             