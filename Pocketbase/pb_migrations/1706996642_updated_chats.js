/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("5esaffo3jczhs70")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "xf1geoss",
    "name": "message",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "43pdvt4jorjas94",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": null,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("5esaffo3jczhs70")

  // remove
  collection.schema.removeField("xf1geoss")

  return dao.saveCollection(collection)
})
