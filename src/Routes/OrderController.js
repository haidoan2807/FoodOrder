import  express  from "express";
import { createOrder } from "../Controllers/OrderController.js";

const orderRoute = express.Router();

orderRoute.post("/create-order", createOrder);

export default orderRoute;