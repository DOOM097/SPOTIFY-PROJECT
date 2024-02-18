 
const express = require('express');
const bodyParser = require('body-parser');
const authRoutes = require('./routes/authRoutes');
const errorHandler = require('./middleware/errorHandler');
const swaggerSetup = require('./swagger/swagger');
const app = express();

 
app.use(bodyParser.json());

 
app.use('/auth', authRoutes);

 
app.use(errorHandler);
swaggerSetup(app);
 
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
