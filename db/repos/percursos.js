'use strict';
var sql = require('../sql').percursos;
module.exports = (rep, pgp) => {
  return {
    find: values => rep.manyOrNone(sql.find, values),
    findOne: values => rep.one(sql.findOne, values),
    save: values => rep.one(sql.save, values, percurso => percurso),
    update: values => rep.one(sql.update, values, percurso => percurso),
    remove: values => rep.none(sql.remove, values)
  };
};