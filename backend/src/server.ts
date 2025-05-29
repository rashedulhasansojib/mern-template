import cors from 'cors';
import 'dotenv/config';
import type { Request, Response } from 'express';
import express from 'express';
import mongoose from 'mongoose';
import logger from './utils/logger';

// Connect to MongoDB
const mongoUri = process.env.MONGODB_URI as string;
if (!mongoUri) {
  throw new Error('MONGODB_URI is not defined in environment variables');
}
mongoose
  .connect(mongoUri)
  .then(() => {
    logger.info('Connected to MongoDB');
  })
  .catch((error) => {
    logger.error('Error connecting to MongoDB:', error);
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
const PORT = process.env.PORT ?? 5000;
app.listen(PORT, () => {
  logger.info(`Server is running on port ${PORT}`);
});
