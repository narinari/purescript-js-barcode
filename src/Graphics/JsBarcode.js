"use strict";

exports.mkJsBarcodeImpl = function (elm, val, options) {
  return function () {
    var JsBarcode = require('jsbarcode');
    JsBarcode(elm, val, options);
    return {};
  };
};

exports.mkJsBarcodeSimpleImpl = function (elm, val) {
  return function () {
    var JsBarcode = require('jsbarcode');
    JsBarcode(elm, val);
    return {};
  };
};
