title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Upcoming Products &gt; SimpleData &gt; Developer's Guide
--------------------------------------------------------

> ※ This document contains information on alpha development in process. For those interested in use, please contact \*\*support@cloud.toast.com\*\*.

Condition of Use
----------------

| Condition title                   | Value                                                                                                                                |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Max number of Class production    | 50                                                                                                                                   |
| Max number of Object production   | None                                                                                                                                 |
| Max number of Property production | 50 per 1 Class                                                                                                                       |
| Class Name condition              | Max string length of 32 letters. The first letter must be capital/small letter in English or number but \_-. characters can be used. |
| Object Name condition             | Max string length of 64 letters. The first letter must be capital/small letter in English or number but \_-. characters can be used. |
| Property Key condition            | Max string length of 32 letters. The first letter must be capital/small letter in English or number but \_-. characters can be used. |
| Property Value condition          | Max string length of 512 letters. No character format restrictions.                                                                  |

Restful API List
----------------

### Bring all Class Information.

\[Request\]

    method : GET
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes

\[Response\]

    content-type : application/json;charset-utf8
    body :
    {
      "header" : {
          "resultCode": 0,
          "resultMessage": "SUCCESS"
          "isSuccessful": true
      },
      "result" : {
          classNameString : {
              "state" : "CREATED or DELETED"
          },
          ...
      }
    }

### Bring Class Information.

\[Request\]

    method : GET
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}

\[Response\]

    content-type :
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            },
            "result" : {
                "state" : "CREATED or DELETED",
                "properties" : {
                    propertyKeyString : {
                        "type" : "TEXT",
                        "state" : "CREATED or DELETED"
                    },
                    ...
                }
            }
        }

### Create Class.

\[Request\]

    method : POST
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            }
        }

### Delete Class.

\[Request\]

    method : DELETE
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            }
        }

### Bring Property Key list.

\[Request\]

    method : GET
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/properties

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            },
            "result" : [
                propertyKeyString,
                ...
            ]
        }

### Bring Multiple Property Information at Once.

\[Request\]

    method : GET
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/properties?key={propertyKey1}&key=...

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            },
            "result" : {
                propertyKeyString : {
                    "state" : "CREATED or DELETED",
                    "type" : "TEXT"
                },
                ...
            }
        }

### Create Property.

\[Request\]

    method : POST
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/properties/{propertyKey}

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            }
        }

### Delete Property.

\[Request\]

    method : DELETE
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/properties/{propertyKey}

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            }
        }

### Bring Object Name List. (Max. 10000 and unstructured list)

\[Request\]

    method : GET
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            },
            "result" : [
                objectNameString,
                ...
            ]
        }

### Bring Multiple Objects’ Information at Once. (Max. 10000 and unstructured list)

\[Request\]

    method : GET
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects?name={objectName1}&name=...

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            },
            "result" : {
                objectNameString : {
                    "__created" : String,
                    "__updated" : String,
                    propertyKeyString : propetyValueString,
                    ...
                },
                ...
            }
        }

### Delete Multiple Objects at Once.

\[Request\]

    method : DELETE
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects?name={objectName1}&name=...

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            }
        }

### Bring Object Contents.

\[Request\]

    method : GET
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            },
            "result" : {
                "__created" : String,
                "__updated" : String,
                propertyKeyString : propertyValueString,
                ...
            }
        }

### Create Object.

\[Request\]

    method : POST
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}
    body :
        {
            "properties" : {
                propertyKeyString : propertyValueString,
                ...
            }
        }

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            }
        }

### Edit Object Contents.

\[Request\]

    method : PUT
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}
    body :
        {
            "properties" : {
                propertyKeyString : propertyValueString,
                ...
            }
        }

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            }
        }

### Delete Object.

\[Request\]

    method : DELETE
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            }
        }

### Bring Multiple Property Values at once.

\[Request\]

    method : GET
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}/properties?key={propertyKey1}&key=...

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            },
            "result" : {
                    propertyKeyString : propertyValueString,
                    ...
                }
        }

### Bring Property Value.

\[Request\]

    method : GET
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}/properties/{properkeyKey}

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            },
            "result" : propertyValueString
        }

### Edit Property Value.

\[Request\]

    method : PUT
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}/properties/{propertyKey}
    body :
        {
            "propertyValue" : String
        }

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            }
        }

### Delete Property Value.

\[Request\]

    method : DELETE
    url : https://api-simpledata.cloud.toast.com/simpledata/v1.0/appkeys/{appkey}/classes/{className}/objects/{objectName}/properties/{propertyKey}

\[Response\]

    content-type : application/json;charset-utf8
    body :
        {
            "header" : {
                "resultCode": 0,
                "resultMessage": "SUCCESS"
                "isSuccessful": true
            }
        }

Response’s Header Error Message Types
-------------------------------------

| resultMessage                     | resultCode | Meaning                                                                                   |
|-----------------------------------|------------|-------------------------------------------------------------------------------------------|
| Interal server exception.         | -1         | Unexpected error occurred in the server.                                                  |
| Invalid appkey.                   | -2         | Occurs when wrong App key is used.                                                        |
| Class is not exists.              | -12002     | Class does not exist.                                                                     |
| Class is already exists.          | -12004     | Class with the same name already exists.                                                  |
| Class is already disabled.        | -12005     | No operations possible as deleting all data in the applicable class is in process.        |
| Class name don't have to empty.   | -12006     | No empty string can be used for class name.                                               |
| Invalid class name length.        | -12007     | Invalid length of class name.                                                             |
| Invalid class name pattern.       | -12009     | Invalid format of class name.                                                             |
| Property key is not exists.       | -13002     | The applicable property key does not exist.                                               |
| Property key is already exists.   | -13004     | Property key with the same name already exists.                                           |
| Property key is already disabled. | -13005     | No operations possible as deleting the applicable property key is applied to all objects. |
| Property key don't have to empty. | -13006     | Exceeded the number of permissible property keys for applicable class.                    |
| Invalid property key length.      | -13007     | Invalid length of property key name.                                                      |
| Invalid property key pattern.     | -13009     | Invalid format of property key name.                                                      |
| Object is not exists.             | -14002     | Object does not exist.                                                                    |
| Object is already exists.         | -14003     | Object with the same name already exists.                                                 |
| Object name don't have to empty.  | -14004     | No empty string can be used for object name.                                              |
| Invalid object name length.       | -14005     | Invalid length of object name.                                                            |
| Invalid object name pattern.      | -14006     | Invalid format of object name.                                                            |
| Invalid objects number.           | -14008     | Call invalid number of objects.                                                           |
| Invalid property value length.    | -15002     | Invalid length of property value.                                                         |


