import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
export const testFcm = functions.https.onRequest((request, response) => {
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
    .then((result: String) => {
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
