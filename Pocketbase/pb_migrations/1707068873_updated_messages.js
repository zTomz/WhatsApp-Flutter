/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("43pdvt4jorjas94")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "wv1j7hye",
    "name": "chat",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "5esaffo3jczhs70",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("43pdvt4jorjas94")

  // remove
  collection.schema.removeField("wv1j7hye")

  return dao.saveCollection(collection)
})
