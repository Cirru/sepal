
var
  assert $ require :./assert

= exports.concat $ \ (a b)
  assert.array a ":a to concat"
  assert.array b ":b to concat"
  a.concat b
