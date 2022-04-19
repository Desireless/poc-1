const express = require('express');
const router = express.Router();

const app = express();

app.use(router);

router.get( "/" , ( req , resp )=>{
    resp.send('Hola Mundo')
})


app.listen(9000);
