const express = require('express');
const app = express();
const cors = require('cors');
const swaggerUi = require('swagger-ui-express');
const swaggerAutogen = require('swagger-autogen')();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));



require('./routes/playlistsroutes')(app);
require('./routes/musicroutes')(app);
require('./routes/usersroutes')(app);
require('./routes/auth')(app);
require('./routes/commentRoutes')(app); 

const swaggerOptions = {
  info: {
    version: '1.0.0',
    title: 'SPOTIFY API',
    description: 'API THE BEST CLONE APP LIKE SPOTIFY',
  },
  host: 'localhost:3000',
  basePath: '/',
};

const outputFile = './swagger.json'; 
const endpointsFiles = ['./routes/*.js']; 
swaggerAutogen(outputFile, endpointsFiles, swaggerOptions).then(() => {
  const specs = require(outputFile);
  app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(specs));
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`SERVER IS RUNNING ${PORT}.`);
});
