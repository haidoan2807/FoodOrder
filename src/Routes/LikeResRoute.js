import  express  from "express";
import { createLikeRestaurant, deleteLikeRestaurant, getLikeListByRestaurant, getLikeListByUser } from "../Controllers/LikeResController.js";

const likeResRoute = express.Router();

likeResRoute.post("/like-restaurant", createLikeRestaurant);
likeResRoute.delete("/unlike-restaurant", deleteLikeRestaurant);
likeResRoute.get("/get-like-by-user/:user_id", getLikeListByUser);
likeResRoute.get("/get-like-by-restaurant/:res_id", getLikeListByRestaurant);

export default likeResRoute;