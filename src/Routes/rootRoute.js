import express from 'express';
import likeResRoute from './LikeResRoute.js';
import rateResRoute from './RateResRoute.js';
import orderRoute from './OrderController.js';
const rootRoutes = express.Router();

rootRoutes.use("/like", likeResRoute);
rootRoutes.use("/rate", rateResRoute);
rootRoutes.use("/order", orderRoute);

export default rootRoutes;