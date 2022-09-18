1. Download a service account key (JSON file) from your Firebase console and add to the example/scripts directory
```var serviceAccount = require('./google-services.json');```
2. Copy the token for your device that is printed in the console on app start (`flutter run`) for the FirebaseMessaging example
```const token = '<ADD YOUR TOKEN HERE>';```

3. From your terminal, root to example/scripts directory & run `npm install`.
4. Run `npm run send-message` in the example/scripts directory and your app will receive messages in any state; foreground, background, terminated.
If you find your messages have stopped arriving, it is extremely likely they are being throttled by the platform. iOS in particular
are aggressive with their throttling policy.