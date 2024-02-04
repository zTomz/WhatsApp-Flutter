/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("43pdvt4jorjas94")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "mxozfn6f",
    "name": "status",
    "type": "select",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "send",
        "received",
        "read"
      ]
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("43pdvt4jorjas94")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "mxozfn6f",
    "name": "read",
    "type": "select",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "received"
      ]
    }
  }))

  return dao.saveCollection(collection)
})
