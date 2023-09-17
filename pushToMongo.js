const mongoose = require('mongoose');
const fs = require('fs');

const fileToPushPath = process.argv[2];
const mongodbUri = process.argv[3];

// Create a Mongoose model representing your data structure
const YourModel = mongoose.model('YourModel', {
  // Define the schema for your data here
  // For example, if your JSON file has a "name" and "content" field:
  name: String,
  content: String,
});

console.log(`Connecting to MongoDB at ${mongodbUri}`);

mongoose.connect(mongodbUri, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Connected to MongoDB');

    // Read the content of the file
    const fileContent = fs.readFileSync(fileToPushPath, 'utf8');

    // Create a new document with the file content
    const newDocument = new YourModel({
      name: 'Example Name', // You can set the name as you like
      content: fileContent,
    });

    // Save the document to MongoDB
    newDocument.save()
      .then(() => {
        console.log('File added to MongoDB successfully');
        mongoose.connection.close();
      })
      .catch((error) => {
        console.error('Error saving document to MongoDB:', error);
        mongoose.connection.close();
      });
  })
  .catch((error) => {
    console.error('Error connecting to MongoDB:', error);
    process.exit(1); // Exit with an error code
  });
