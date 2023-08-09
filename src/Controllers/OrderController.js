import sequelize from "../Models/index.js";
import initModels from "../Models/init-models.js";

import { Sequelize } from "sequelize";

const op = Sequelize.Op;
const model = initModels(sequelize);

const createOrder = async (req, res) => {
    try {
        let { user_id, food_id, amount, code, arr_sub_id } = req.body;
        let checkUserId = await model.user.findAll({
            where: {
                user_id
            }
        })
        if (checkUserId.length === 0) {
            return res.status(404).json({ error: 'User not found' });
        }
        let checkFoodId = await model.food.findAll({
            where: {
                food_id
            }
        })
        if (checkFoodId.length === 0) {
            return res.status(404).json({ error: 'Food not found' });
        }
        await model.order.create({ user_id, food_id, amount, code, arr_sub_id });
        return res.status(203).json("Created order successfully!");
    } catch (e) {
        res.status(500).send(e.message);
    }
}


export { createOrder };