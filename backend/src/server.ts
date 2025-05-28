import cors from 'cors';
import 'dotenv/config';
import express, { Request, Response } from 'express';
import mongoose from 'mongoose';

// Connect to MongoDB
const mongoUri = process.env.MONGODB_CONNECTION_STRING as string;
if (!mongoUri) {
	throw new Error(
		'MONGODB_CONNECTION_STRING is not defined in environment variables'
	);
}
mongoose
	.connect(mongoUri)
	.then(() => {
		console.log('Connected to MongoDB');
	})
	.catch((error) => {
		console.error('Error connecting to MongoDB:', error);
		process.exit(1);
	});

// Initialize the Express application
const app = express();
app.use(cors());
app.use(express.json());

// Define a simple test route
app.get('/test', (req: Request, res: Response) => {
	res.json({ message: 'Hello, World!' });
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
	console.log(`Server is running on port ${PORT}`);
});
