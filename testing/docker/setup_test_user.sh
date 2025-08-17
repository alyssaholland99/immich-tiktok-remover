curl -L '${IMMICH_URL}/api/admin/users' \
-H 'Content-Type: application/json' \
-H 'Accept: application/json' \
--data-raw '{
  "avatarColor": "primary",
  "email": "user@example.com",
  "isAdmin": false,
  "name": "string",
  "notify": false,
  "password": "string",
  "quotaSizeInBytes": 0,
  "shouldChangePassword": false,
  "storageLabel": "string"
}'