// Import modules using ESM syntax
import express from 'express';
import cors from 'cors';
import rootRoutes from './Routes/rootRoute.js';

const app = express();
app.use(express.json());

app.use(cors());

// Use the imported rootRoutes
app.use('/api', rootRoutes);

const PORT = 8080;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});