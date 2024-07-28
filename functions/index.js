const functions = require('firebase-functions');
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');
require('dotenv').config();

admin.initializeApp();

// Configure Nodemailer transporter
const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: process.env.EMAIL_ADDRESS,
    pass: process.env.EMAIL_PASSWORD,
  },
});

exports.sendContactEmail = functions.firestore
  .document('contacts/{contactId}')
  .onCreate((snap, context) => {
    const data = snap.data();

    const mailOptions = {
      from: process.env.EMAIL_ADDRESS,
      to: 'recipient-email@example.com',
      subject: `New contact form submission: ${data.subject}`,
      text: `You have received a new message from ${data.name} (${data.email}, ${data.phone}):\n\n${data.message}`,
    };

    return transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.error('Error sending email:', error);
      } else {
        console.log('Email sent:', info.response);
      }
    });
  });
