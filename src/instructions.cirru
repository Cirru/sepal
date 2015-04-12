
var
  _ $ require :lodash
  assert $ require :./assert

var $ dictionary $ object
  :type-define $ \ (env name retType argTypes)
    = (. env name) $ object
      :define $ array
      :text name
      :type :function
      :typeInfo $ object
        :ret retType
        :args argTypes

  :define $ \ (env name (args))
  :type-variable $ \ (env name type)
    = (. env name) $ object
      :depend $ array
      :text name
      :type type

  :@ $ \ (env name valueExpr)
    var
      value $ findVariable valueExpr
    return $ object
      :depend $ array
      :text $ + ":@" name ": = " value.type ": " value.text
      :type :void

  :% $ \ (env name valueExpr)
  :ret $ \ (env valueExpr)
  :+ $ \ (env leftExpr rightExpr)

var $ findVariable $ \ (env x)
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
    if (is x :void) $ do $ return $ object
      :depend $ array
      :text :void
      :type :void

    if (is x :true) $ do $ return $ object
      :depend $ array
      :text :true
      :type :bool

    if (is x :false) $ do $ return $ object
      :depend $ array
      :text :false
      :type :bool

    if (is (. x 0) ::) $ do $ return $ object
      :depend $ array
      :text $ JSON.stringify (x.substr 1)
      :type :string

    if
      ? $ x.match "/[+-]?\d+(.\d*)?"
      do $ return $ object
        :depend $ array
        :text x
        :type :float

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
