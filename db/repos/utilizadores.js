'use strict';
var sql = require('../sql').utilizadores;
module.exports = (rep, pgp) => {
  return {
    find: values => rep.manyOrNone(sql.find, values),
    findOne: values => rep.oneOrNone(sql.findOne, values)
  };
};