import sequelize from "../Models/index.js";
import initModels from "../Models/init-models.js";

import { Sequelize } from "sequelize";

const op = Sequelize.Op;
const model = initModels(sequelize);

const createRateRestaurant = async (req, res) => {
    try {
        let { user_id, res_id, amount, date_rate } = req.body;
        let checkUserId = await model.user.findAll({
            where: {
                user_id
            }
        })
        if (checkUserId.length === 0) {
            return res.status(404).json({ error: 'User not found' });
        }
        let checkRestaurantId = await model.restaurant.findAll({
            where: {
                res_id
            }
        })
        if (checkRestaurantId.length === 0) {
            return res.status(404).json({ error: 'Restaurant not found' });
        }
        await model.rate_res.create({ user_id, res_id, amount, date_rate });
        return res.status(203).json("Rated successfully!");
    } catch (e) {
        res.status(500).send(e.message);
    }
}

const deleteRateRestaurant = async (req, res) => {
    try {
        let { user_id, res_id, amount, date_rate } = req.body;
        let checkUserId = await model.like_res.findAll({
            where: {
                user_id
            }
        })
        if (checkUserId.length === 0) {
            return res.status(404).json({ error: 'User not found' });
        }
        let checkRestaurantId = await model.like_res.findAll({
            where: {
                res_id
            }
        })
        if (checkRestaurantId.length === 0) {
            return res.status(404).json({ error: 'Restaurant not found' });
        }
        await model.rate_res.destroy({
            where: {
                user_id, res_id, amount, date_rate
            }
        });
        return res.status(203).json("Deleted successfully!");
    } catch (e) {
        res.status(500).send(e.message);
    }
}

const getRateListByUser = async (req, res) => {
    try {
        let { user_id } = req.params;
        let checkUserId = await model.rate_res.findAll({
            where: {
                user_id
            }
        })
        if (checkUserId.length === 0) {
            return res.status(404).json({ error: 'User not found' });
        }
        let data = await model.rate_res.findAll({
            where: { user_id },
            include: [{
                model: model.user,
                as: 'user',
                attributes: ['user_id', 'full_name']
            },
            {
                model: model.restaurant,
                as: 're',
                attributes: ['res_id', 'res_name']
            }
            ]
        })
        return res.status(200).json(data);
    } catch (e) {
        res.status(500).send(e.message);
    }
}

const getRateListByRestaurant = async (req, res) => {
    try {
        let { res_id } = req.params;
        let checkResId = await model.like_res.findAll({
            where: {
                res_id
            }
        })
        if (checkResId.length === 0) {
            return res.status(404).json({ error: 'Restaurant not found' });
        }
        let data = await model.rate_res.findAll({
            where: { res_id },
            include: [{
                model: model.user,
                as: 'user',
                attributes: ['user_id', 'full_name']
            },
            {
                model: model.restaurant,
                as: 're',
                attributes: ['res_id', 'res_name']
            }
            ]
        })
        return res.status(200).json(data);
    } catch (e) {
        res.status(500).send(e.message);
    }
}

export { createRateRestaurant, deleteRateRestaurant, getRateListByUser, getRateListByRestaurant };