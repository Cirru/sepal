
var
  _ $ require :lodash
  assert $ require :./assert

var $ dictionary $ object
  :type-define $ \ (env name retType argTypes)
  :define $ \ (env name args)
  :type-variable $ \ (env name type)
  :@ $ \ (env name valueExpr)
  :% $ \ (env name valueExpr)
  :ret $ \ (env valueExpr)
  :+ $ \ (env leftExpr rightExpr)
  :+. $ \ (env leftExpr rightExpr)

var $ findSolution $ \ (env x)
  assert.defined x ":searching for solution"

  if (_.isArray x) $ do
    var
      head $ _.head x
      args $ _.tail x
    assert.string head ":a function solution"
    var
      func $ . dictionary head
    assert.func func ":a function solution"
    return $ func env (... args)

  if (_.isString x) $ do
    var
      info $ . env x
    assert.isObject info ":info of a variable"
    return $ object
      :depend $ array
      :text info.text
      :type info.type

  console.log x env
  throw $ new Error ":have no solution"

var $ compile $ \ (env expr)
  assert.array expr ":array to run"

= exports.compile $ \ (ast)
  var
    globalEnv $ object
    irLines $ ast.map $ \ (line)
      assert.array line ":first level of ast"
      console.log line
  return $ irLines.join ":\n"
