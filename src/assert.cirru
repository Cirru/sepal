
var
  _ $ require :lodash

= exports.array $ \ (x comment)
  if
    not $ _.isArray x
    do
      console.log x
      throw $ new Error
        + comment ":: supposed to be array"

= exports.string $ \ (x comment)
  if
    not $ _.isString x
    do
      console.log x
      throw $ new Error
        + comment ":: supposed to be string"

= exports.defined $ \ (x comment)
  if
    not $ _.isUndefined x
    do
      throw $ new Error
        + comment ":: supposed to be defined"

= exports.func $ \ (x comment)
  if
    not $ _.isFunction x
    do
      throw $ new Error
        + comment ":: supposed to be function"

= exports.isObject $ \ (x comment)
  if
    not $ _.isObject x
    do
      console.log x
      throw $ new Error
        + comment ":: supposed to be object"
