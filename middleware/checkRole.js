const jwt = require('jsonwebtoken');
const UserRole = require('../models/userRoles'); 
const secretKey = 'SECRET_KEY_RANDOM'; 

exports.checkAdminRole = async (req, res, next) => {
  const token = req.headers.authorization;

  if (!token) {
    return res.status(401).json({ message: 'Unauthorized. Token is missing.' });
  }

  try {
    const decodedToken = jwt.verify(token, secretKey);
    const userId = decodedToken.userId;

    const userRole = await UserRole.findOne({ where: { UserID: userId } });

    if (userRole.RoleID === 2) {
      req.user = decodedToken;
      next();
    } else {
      res.status(403).json({ message: 'у вас нет на это прав.' });
    }
  } catch (error) {
    console.error(error);
    res.status(401).json({ message: 'Unauthorized. Invalid token.' });
  }
};

exports.checkAuthentication = (req, res, next) => {
  const token = req.headers.authorization;

  if (!token) {
    return res.status(401).json({ message: 'Несанкционированный доступ. Токен отсутствует.' });
  }

  try {
    const decodedToken = jwt.verify(token, secretKey);
    req.user = decodedToken;
    next();
  } catch (error) {
    console.error(error);
    res.status(401).json({ message: 'Несанкционированный доступ. Недействительный токен.' });
  }
};
