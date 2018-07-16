"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const functions = require("firebase-functions");
const admin = require("firebase-admin");
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
exports.testFcm = functions.https.onRequest((request, response) => {
    var message = {
        webpush: {
            notification: {
                title: '$GOOG up 1.43% on the day',
                body: '$GOOG gained 11.80 points to close at 835.67, up 1.43% on the day.',
                icon: 'https://my-server/icon.png'
            }
        },
        topic: 'industry-tech'
    };
    admin.messaging().send(message)
        .then((result) => {
        // Response is a message ID string.
        console.log('Successfully sent message:', result);
        response.send(`Successfully sent message: ${result}`);
    })
        .catch((error) => {
        console.log('Error sending message:', error);
        response.send(`Error sending message: ${error}`);
    });
    //  response.send("Hello from Firebase!");
});
//# sourceMappingURL=index.js.map