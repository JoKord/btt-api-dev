'use strict';
var sql = require('../sql').percursos;
module.exports = (rep, pgp) => {
  return {
    find: values => rep.manyOrNone(sql.find, values),
    findOne: values => rep.oneOrNone(sql.findOne, values),
    save: values => rep.oneOrNone(sql.save, values, percurso => percurso),
    remove: values => rep.none(sql.remove, values)
  };
};