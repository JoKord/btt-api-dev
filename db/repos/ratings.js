'use strict';
var sql = require('../sql').ratings;
module.exports = (rep, pgp) => {
  return {
    find: values => rep.manyOrNone(sql.find, values),
    findOne: values => rep.oneOrNone(sql.findOne, values),
    save: values => rep.one(sql.save, values, rating => rating),
    update: values => rep.one(sql.update, values, rating => rating),
    remove: values => rep.none(sql.remove, values)
  };
};