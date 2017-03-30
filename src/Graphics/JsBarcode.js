"use strict";

exports.mkJsBarcodeImpl = function (elm, val, options) {
  return function () {
    JsBarcode(elm, val, options);
    return {};
  };
};

exports.mkJsBarcodeSimpleImpl = function (elm, val) {
  return function () {
    JsBarcode(elm, val);
    return {};
  };
};
