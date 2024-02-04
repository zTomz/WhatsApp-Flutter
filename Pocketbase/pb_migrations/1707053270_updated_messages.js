/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("43pdvt4jorjas94")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "zbvx48f2",
    "name": "images",
    "type": "file",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "mimeTypes": [],
      "thumbs": [],
      "maxSelect": 99,
      "maxSize": 5242880,
      "protected": false
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("43pdvt4jorjas94")

  // remove
  collection.schema.removeField("zbvx48f2")

  return dao.saveCollection(collection)
})
