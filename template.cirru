
var
  stir $ require :stir-template
  html stir.html
  head stir.head
  body stir.body
  textarea $ stir.createFactory :textarea
  link $ stir.createFactory :link
  script $ stir.createFactory :script
  meta $ stir.createFactory :meta
  style $ stir.createFactory :style
  title $ stir.createFactory :title

= module.exports $ \ (data)
  return $ stir.render
    stir.doctype
    html null
      head null
        title null :Sepal
        meta $ object (:charset :utf-8)
        script $ object (:src data.main) (:defer true)
        link $ object (:rel :stylesheet) (:href :src/layout.css)
      body null
        textarea (object (:id :source))
        textarea (object (:id :compiled))
