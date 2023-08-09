import  express  from "express";
import { createRateRestaurant, deleteRateRestaurant, getRateListByRestaurant, getRateListByUser } from "../Controllers/RateResController.js";

const rateResRoute = express.Router();

rateResRoute.post("/rate-restaurant", createRateRestaurant);
rateResRoute.delete("/delete-rate-restaurant", deleteRateRestaurant);
rateResRoute.get("/get-rate-by-user/:user_id", getRateListByUser);
rateResRoute.get("/get-rate-by-restaurant/:res_id", getRateListByRestaurant);

export default rateResRoute;