/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("5esaffo3jczhs70")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "hxrgydop",
    "name": "image",
    "type": "file",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "mimeTypes": [],
      "thumbs": [],
      "maxSelect": 1,
      "maxSize": 5242880,
      "protected": false
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("5esaffo3jczhs70")

  // remove
  collection.schema.removeField("hxrgydop")

  return dao.saveCollection(collection)
})
