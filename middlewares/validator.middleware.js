const { body, validationResult } = require('express-validator');

// Utils
const { AppError } = require('../util/appError');

// User routes validations
exports.createUserValidations = [
  body('email').isEmail().notEmpty().withMessage('Enter a valid email'),
  body('password')
    .isAlphanumeric()
    .withMessage(`Password must include letters and numbers`)
    .isLength({ min: 6, max: 20 })
    .withMessage('Password must be 8 characters long')
];

exports.loginUserValidations = [
  body('email').isEmail().notEmpty().withMessage('Credentials are not valid'),
  body('password').notEmpty().withMessage('Credentials are not valid')
];

exports.createProductValidation = [
  // Title can't be empty
  body('title').isString().notEmpty().withMessage('Enter a valid name'),
  // Description can't be empty
  body('description')
    .isString()
    .notEmpty()
    .withMessage('Enter a valid description'),
  body('price')
    .isDecimal()
    .withMessage('Price must be a decimal')
    .custom((value) => value > 0)
    .withMessage('Enter a valid price'),
  body('quantity')
    .isNumeric()
    .withMessage('Quantity must be a number')
    .custom((value) => value > 0)
    .withMessage('Enter a valid price')
];




exports.validateResult = (req, res, next) => {
  const errors = validationResult(req);

  if (!errors.isEmpty()) {
    const message = errors
      .array() // [ { msg, ... }, { msg, ... }, { msg, ... } ]
      .map(({ msg }) => msg) // [msg, msg, msg]
      .join('. '); // 'msg. msg. msg'

    return next(new AppError(message, 400));
  }

  next();
};
