import { getKnex } from '../../knex'

export default async function handler(req, res) {
    const knex = getKnex();
    try {
        const posts = await knex.select().table('posts');
        res.status(200).json(posts)
    } catch (e) {
        console.log(e);
    }
}
