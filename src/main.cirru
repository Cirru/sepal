
var
  cirru $ require :cirru-parser
  req $ fetch :examples/main.cirru
  source $ document.querySelector :#source
  compiled $ document.querySelector :#compiled
  instructions $ require :./instructions

... req
  then $ \ (res)
    var $ p (res.text)
    p.then $ \ (data)
      render data

source.addEventListener :input $ \ (event)
  render source.value

var $ render $ \ (code)
  = source.value code
  var
    ast $ cirru.pare code
    ir $ instructions.compile ast
  = compiled.value ir
