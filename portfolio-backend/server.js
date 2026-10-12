require('dotenv').config();
const express = require('express');
const cors = require('cors');
const nodemailer = require('nodemailer');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json()); // Allows the server to read JSON data from your frontend
app.use(cors());         // Allows your frontend to connect without security blockages

// Configure the Email Transporter
const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: process.env.EMAIL_USER, 
    pass: process.env.EMAIL_PASS 
  }
});

// The actual route that receives the form data
app.post('/api/contact', async (req, res) => {
  // 1. Extract the data sent from your frontend JavaScript
  const { name, email, subject, message } = req.body;

  // 2. Validate that the required fields aren't empty
  if (!name || !email || !message) {
    return res.status(400).json({ error: 'Name, email, and message are required.' });
  }

  // 3. Format the email
  const mailOptions = {
    from: email,
    to: process.env.EMAIL_USER, // This sends the email TO your own inbox
    subject: `Portfolio Contact: ${subject || 'New Message'} from ${name}`,
    text: `You have a new message from your portfolio site.\n\nName: ${name}\nEmail: ${email}\n\nMessage:\n${message}`
  };

  // 4. Send the email and respond to the frontend
  try {
    await transporter.sendMail(mailOptions);
    res.status(200).json({ success: true, message: 'Message sent successfully!' });
  } catch (error) {
    console.error('Error sending email:', error);
    res.status(500).json({ error: 'Failed to send message.' });
  }
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is live and listening on port ${PORT}`);
});