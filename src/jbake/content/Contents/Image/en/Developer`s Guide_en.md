title=About
date=2013-09-24
type=page
status=published
big=TCcontents
summary=IMAGEDV'sEN
~~~~~~
Contents &gt; Image &gt; Developer's Guide
------------------------------------------

Advance Preparation
-------------------

To use API, AppKey and SecretKey are required. Click on “Create” button to create SecretKey.

<img alt="[그림 1 API용 AppKey와 SecreKey 확인]" src="http://static.toastoven.net/prod_img2/img_11.png" />

\[Table 1 Confirm AppKey and SecretKey for API\]

SecretKey Verification Process
------------------------------

SecretKey is required to process verification, and request by inserting Authorization in Request Header for all API requests.

\[Request Header Common\]

| Name          | Value       | Description                                  |
|---------------|-------------|----------------------------------------------|
| Authorization | {secretKey} | secretKey created in TOAST CLOUD Web Console |

Successful Response Sample
--------------------------

    {
        "header": {
            "isSuccessful": true,
            "resultCode": 0,
            "resultMessage": "Success"
        }
    }

Response Error Sample
---------------------

    {
    "header": {
            "isSuccessful": false,
            "resultCode": 404,
            "resultMessage": "Check API URL and HTTP Method."
        }
    }

API List
--------

### Create a folder

\[Request Url\]

| Method | Request Url                                                           |
|--------|-----------------------------------------------------------------------|
| POST   | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/folders |

\[Request Header\]

| Name          | Value            | Description                                  |
|---------------|------------------|----------------------------------------------|
| Authorization | {secretKey}      | secretKey created in TOAST CLOUD Web Console |
| Content–Type  | application/json | -                                            |

\[Request Parameters\]

| Name   | Type   | Required or not | Basic value | Description                                    |
|--------|--------|-----------------|-------------|------------------------------------------------|
| appkey | string | Y               | -           | appkey created through TOAST CLOUD web console |

\[Request Body\]

Transfer as json object.

| Name | Type   | Required or not | Basic value | Description                                                              |
|------|--------|-----------------|-------------|--------------------------------------------------------------------------|
| path | string | Y               | -           | Absolute path of the folder to be created, parent folder auto generation |

\[Request Example\]

\# Create a subfolder named myfolder in the route folder.
\# Change {secretKey} and {appKey} to confirmed values in the Web Console.

    curl ‐X POST "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/folders" \
    ‐H "Authorization: {secretKey}" \
    ‐H "Content‐Type: application/json" \
    ‐data "{'path': '/myfolder'}"

\[Response Field\]

| Name   | Type   | Description        |
|--------|--------|--------------------|
| folder | object | Folder information |

\[Folder Type\]

| Name      | Type    | Description            |
|-----------|---------|------------------------|
| isFolder  | boolean | Folder existence       |
| id        | string  | Unique ID              |
| name      | string  | Folder name            |
| path      | string  | Folder’s absolute path |
| updatedAt | date    | Final date of update   |

\[Response Sample\]

    {
        "header": {
            "isSuccessful": true,
            "resultCode": 0,
            "resultMessage": "Success"
        },
        "folder": {
            "id": "c337256d-b17e-42ce-9f63-a792a05ae0ef",
            "name": "myfolder",
            "path": "/myfolder",
            "isFolder": true,
            "updatedAt": "2015-09-02T10:27:15+0900"
        }
    }

### File list within the folder (Search)

\[Request Url\]

| Method | Request Url                                                           |
|--------|-----------------------------------------------------------------------|
| GET    | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/folders |

\[Request Header\]

| Name          | Value       | Description                                  |
|---------------|-------------|----------------------------------------------|
| Authorization | {secretKey} | secretKey created in TOAST CLOUD Web Console |

\[Request Parameters\]

| Name      | Type    | Required or not | Basic value |
|-----------|---------|-----------------|-------------|
| appkey    | string  | Y               | -           |
| basepath  | string  | Y               | -           |
| createdBy | string  | N               | -           |
| name      | string  | N               | -           |
| page      | integer | N               | 1           |
| rows      | integer | N               | 100         |
| sort      | string  | N               | name:asc    |

\[Request Example\]

\# Look up a subfolder of /myfolder and files.
\# Change {secretKey} and {appKey} to confirmed values in the Web Console.

    curl ‐X GET "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/folders?basepath=/myfolder" \
    ‐H "Authorization: {secretKey}

\[Response Field\]

| Name    | Type   | Description        |
|---------|--------|--------------------|
| paging  | object | Paging information |
| folders | list   | Folder list        |
| files   | list   | Image file list    |

\[paging Type\]

| Name             | Type    | Description                   |
|------------------|---------|-------------------------------|
| page             | integer | Requested page number         |
| rows             | integer | Number of requested inquiries |
| totalFolderCount | long    | Total number of folders       |
| totalFileCount   | long    | Total number of folders       |

\[Folders Types\]

| Name      | Type    | Description            |
|-----------|---------|------------------------|
| isFolder  | boolean | Folder existence       |
| id        | string  | Unique ID              |
| name      | string  | Folder name            |
| path      | string  | Folder’s absolute path |
| updatedAt | date    | Final date of update   |

\[files Types\]

| Name          | Type    | Description                                                   |
|---------------|---------|---------------------------------------------------------------|
| isFolder      | boolean | Folder existence                                              |
| id            | string  | Unique ID                                                     |
| url           | string  | Image service URL                                             |
| name          | string  | Image name                                                    |
| path          | string  | Image’s absolute path                                         |
| bytes         | long    | Image file size                                               |
| createdBy     | string  | Image separation (U: User’s upload image, P: Operation image) |
| updatedAt     | date    | Final date of update                                          |
| operationId   | string  | createdBy === In case of P, referred operation ID             |
| imageProperty | object  | Image property                                                |
| queues        | list    | Work information list (Not used in applicable API)            |

\[imageProperty Types\]

| Name       | Type    | Description                  |
|------------|---------|------------------------------|
| width      | integer | Width size                   |
| height     | integer | Length size                  |
| coordinate | object  | GPS information              |
| createdAt  | date    | Date photographed or created |

\[coordinate Type\]

| Name | Type   | Description |
|------|--------|-------------|
| lat  | double | Latitude    |
| lng  | double | Longitude   |

\[Response Sample\]

    {
    "header": {
        // Omit
        },
            "paging": {
            "page": 1,
            "rows": 100,
            "totalFolderCount": 1,
            "totalFileCount": 1
        },
            "folders": [
            {
            "isFolder": true,
            "id": "5b6ad839‐a920‐4b88‐895d‐64ffc3f4d89a",
            "name": "banner",
            "path": "/myfolder/banner",
            "updatedAt": "2016‐02‐26T15:57:06+0900"
            }
        ],
            "files": [
            {
            "isFolder": false,
            "id": "69528a77‐0cc2‐4407‐a83d‐ea4aacbe207f",
            "url": "http://image.toast.com/aaaaaag/myfolder/toast.png",
            "name": "toast.png",
            "path": "/myfolder/toast.png",
            "bytes": 10173,
            "createdBy": "U",
            "updatedAt": "2016‐02‐26T15:57:14+0900",
            "operationId": "",
            "imageProperty": {
                "width": 90,
                "height": 90,
                "coordinate": {
                    "lat": null,
                    "lng": null
                },
                "createdAt": "2016‐02‐26T15:56:50+0900"
            },
            "queues": []
            }
        ]
    }

### Look up folder property

\[Request Url\]

| Method | Request Url                                                              |
|--------|--------------------------------------------------------------------------|
| GET    | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/properties |

\[Request Header\]

| Name          | Value       | Description                                  |
|---------------|-------------|----------------------------------------------|
| Authorization | {secretKey} | secretKey created in TOAST CLOUD Web Console |

\[Request Parameters\]

| Name   | Type   | Required or not | Basic value |
|--------|--------|-----------------|-------------|
| appkey | string | Y               | -           |
| path   | string | Y               | -           |

\[Request Example\]

\# Look up folder property of myfolder.
\# Change {secretKey} and {appKey} to confirmed values in the Web Console.

    curl ‐X GET "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/properties?path=/myfolder" \
    ‐H "Authorization: {secretKey}"

\[Response Field\]

| Name   | Type   | Description        |
|--------|--------|--------------------|
| folder | object | Folder information |

\[folder Type\]

| Name             | Type    | Description            |
|------------------|---------|------------------------|
| isFolder         | boolean | Folder existence       |
| id               | string  | Unique Id              |
| name             | string  | Folder name            |
| path             | string  | Folder’s absolute path |
| bytes            | long    | Folder size (byte)     |
| totalFolderCount | long    | Number of subfolders   |
| totalFileCount   | long    | Number of sub files    |
| updatedAt        | date    | Final date of update   |

\[Response Sample\]

    {
    "header": {
        // Omit
        },
        "folder": {
            "isFolder": true,
            "id": "996dd430‐5172‐4178‐86c9‐0704e88b28e3",
            "name": "myfolder",
            "path": "/myfolder",
            "bytes": 64857,
            "totalFolderCount": 1,
            "totalFileCount": 2,
            "updatedAt": "2016‐02‐26T15:57:06+0900"
        }
    }

### Upload a single file

\[Request Url\]

| Method | Request Url                                                          |
|--------|----------------------------------------------------------------------|
| PUT    | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/images |

\[Request Header\]

| Name          | Type        | Description                                  |
|---------------|-------------|----------------------------------------------|
| Authorization | {secretKey} | secretKey created in TOAST CLOUD Web Console |

\[Request Parameters\]

| Name         | Type    | Required or not | Basic value | Description                                                                            |
|--------------|---------|-----------------|-------------|----------------------------------------------------------------------------------------|
| appkey       | string  | Y               | -           | appkey created through TOAST CLOUD web console                                         |
| path         | string  | Y               | -           | File name of absolute path to be created                                               |
| overwrite    | boolean | N               | false       | Overwrite or not in case same name already exists                                      |
| autorename   | boolean | N               | false       | To change the file name as ‘name(1).extension’ or not in case same name already exists |
| operationIds | string  | N               | -           | Image operation ID list (separated by commas)                                          |

In case of a request with additional image operation ID, the user can create an operation file with desired option when uploading. Refer to image operation related API.

\[Request Body\]

Insert Binary Data of the image file.

\[Request Example\]

\# Upload sample.png image in /myfolder folder.
\# Change {secretKey} and {appKey} to confirmed values in the Web Console.

    curl ‐X PUT "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/images?
    path=/myfolder/sample.png&overwrite=true" \
    ‐H "Authorization: {secretKey}" \
    ‐H "Content‐Type:application/octet‐stream" \
    ‐‐data‐binary "@sample.png"

\[Response Field\]

| Name | Type   | Description            |
|------|--------|------------------------|
| file | object | Image file information |

\[files Types\]

| Name          | Type    | Description                                                   |
|---------------|---------|---------------------------------------------------------------|
| isFolder      | boolean | Folder existence                                              |
| id            | string  | Unique Id                                                     |
| url           | string  | Image service URL                                             |
| name          | string  | Image name                                                    |
| path          | string  | Image’s absolute path                                         |
| bytes         | long    | Image file size                                               |
| createdBy     | string  | Image separation (U: User’s upload image, P: Operation image) |
| updatedAt     | date    | Final date of update                                          |
| operationId   | string  | createdBy === In case of P, referred operation ID             |
| imageProperty | object  | Image property                                                |
| queues        | list    | Work information list requested by operationIds               |

\[imageProperty Type\]

| Name       | Type    | Description                  |
|------------|---------|------------------------------|
| width      | integer | Width size                   |
| height     | integer | Length size                  |
| coordinate | object  | GPS information              |
| createdAt  | date    | Date photographed or created |

\[coordinate Type\]

| Name | Type   | Description |
|------|--------|-------------|
| lat  | double | Latitude    |
| hlng | double | Longitude   |

\[queues Type\]

| Name        | Type    | Description                                                       |
|-------------|---------|-------------------------------------------------------------------|
| queueId     | string  | Work unique ID                                                    |
| queueType   | string  | Work separation (image: operation, swift: delete file and folder) |
| status      | string  | Work status (W: waiting, D: completed, P: working, F: failed)     |
| tryCount    | integer | Number of retry                                                   |
| queuedAt    | date    | Work registered date                                              |
| operationId | string  | Referred operation ID                                             |
| url         | string  | Image service URL to be serviced                                  |
| name        | string  | Name of image to be created                                       |
| path        | string  | Absolute path of image to be created                              |

\[Response Sample\]

    {
            "header": {
            // Omit
        },
    "file": {
        "isFolder": false,
        "id": "9cf11176‐045c‐4708‐8dbd‐35633f029a91",
        "url": "http://image.toast.com/aaaaach/myfolder/sample.png",
        "name": "sample.png",
        "path": "/myfolder/sample.png",
        "bytes": 54684,
        "createdBy": "U",
        "updatedAt": "2016‐02‐26T16:38:34+0900",
        "operationId": "",
            "imageProperty": {
            "width": 200,
            "height": 150,
                "coordinate": {
                "lat": null,
                "lng": null
            },
            "createdAt": "2016‐02‐26T16:38:11+0900"
        },
        "queues": [
            {
                "queueId": "0256316c‐7dcf‐4940‐975b‐673afb62e8a3",
                "queueType": "image",
                "status": "W",
                "tryCount": 0,
                "queuedAt": "2016‐02‐26T16:38:11+0900",
                "operationId": "100x100",
                "url": "http://image.toast.com/aaaaach/myfolder/sample_100x100.png",
                "name": "sample_100x100.png",
                "path": "/myfolder/sample_100x100.png"
            }
         ]
        }
    }

### Upload multiple files

| Method | Request Url                                                          |
|--------|----------------------------------------------------------------------|
| POST   | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/images |

\[Request Header\]

| Name          | Type        | Description                                  |
|---------------|-------------|----------------------------------------------|
| Authorization | {secretKey} | secretKey created in TOAST CLOUD Web Console |

\[Request Parameters\]

| Name   | Type   | Required or not | Basic value | Description                                    |
|--------|--------|-----------------|-------------|------------------------------------------------|
| appkey | string | Y               | -           | appkey created through TOAST CLOUD web console |

\[Request Body\]

| Name   | Type                  | Required or not | Basic value | Description                          |
|--------|-----------------------|-----------------|-------------|--------------------------------------|
| files  | multipart/form – data | Y               | -           | Image file list                      |
| params | string                | Y               | -           | Upload option(string in json format) |

\[params Option\]

| Name         | Type    | Required or not | Basic value | Description                                                                            |
|--------------|---------|-----------------|-------------|----------------------------------------------------------------------------------------|
| basepath     | string  | Y               | -           | Absolute path for upload                                                               |
| overwrite    | boolean | N               | false       | Overwrite or not in case same name already exists                                      |
| autorename   | boolean | N               | false       | To change the file name as ‘name(1).extension’ or not in case same name already exists |
| operationIds | list    | N               | -           | Image operation ID list (string in json format)                                        |

In case of a request with additional image operation ID, the user can create an operation file with desired option when uploading. Refer to image operation related API.

\[Request Example\]

\# Upload left.png, right.png image in /myfolder/banner folder. \# Change {secretKey} and {appKey} to confirmed values in the Web Console.

    curl ‐X POST "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/images" \
    ‐H "Authorization: {secretKey}" \
    ‐F "params={'basepath': '/myfolder/banner', 'overwrite': true}" \
    ‐F "files=@left.png" \
    ‐F "files=@right.png"

\[Response Field\]

| Name      | Type | Description            |
|-----------|------|------------------------|
| errors    | list | Upload failure list    |
| successes | list | Successful upload list |

\[errors Type\]

| Name  | Type   | Description          |
|-------|--------|----------------------|
| path  | string | File’s absolute path |
| bytes | long   | File size            |
| error | object | Error information    |

\[error Type\]

| Name          | Type    | Description   |
|---------------|---------|---------------|
| resultCode    | integer | Error code    |
| resultMessage | string  | Error message |

\[successes Type\]

| Name          | Type    | Description                                                 |
|---------------|---------|-------------------------------------------------------------|
| isFolder      | boolean | Folder existence                                            |
| id            | string  | Unique ID                                                   |
| url           | string  | Image service URL                                           |
| name          | string  | Image name                                                  |
| path          | string  | Image’s absolute path                                       |
| bytes         | long    | Image file size                                             |
| createdBy     | string  | Image separation (U: User upload image, P: Operation image) |
| updatedAt     | date    | Final date of update                                        |
| operationId   | string  | createdBy === In case of P, referred operation ID           |
| imageProperty | object  | Image property                                              |
| queues        | list    | Work information list requested by operationIds             |

\[imageProperty Type\]

| Name       | Type    | Description                  |
|------------|---------|------------------------------|
| width      | integer | Width size                   |
| height     | integer | Length size                  |
| coordinate | object  | GPS Information              |
| createdAt  | date    | Date photographed or created |

\[coordinate Type\]

| Name | Type   | Description |
|------|--------|-------------|
| lat  | double | Latitude    |
| lng  | double | Longitude   |

\[queues Type\]

| Name        | Type    | Description                                                       |
|-------------|---------|-------------------------------------------------------------------|
| queueId     | string  | Work unique ID                                                    |
| queueType   | string  | Work separation (image: Operation, swift: delete file and folder) |
| status      | string  | Work status (W: waiting, D: completed, P: working, F: failed)     |
| tryCount    | integer | Number of retry                                                   |
| queuedAt    | date    | Work registered date                                              |
| operationId | string  | Referred operation ID                                             |
| url         | string  | Image service URL to be serviced                                  |
| name        | string  | Name of image to be created                                       |
| path        | string  | Absolute path of image to be created                              |

\[Response Sample\]

    {
                "header": {
                // Omit
            },
            "errors": [],
            "successes": [
            {
                "isFolder": false,
                "id": "5fa8ce52‐d066‐490c‐85dd‐f8cef181dd28",
                "url": "http://image.toast.com/aaaaach/myfolder/banner/left.png",
                "name": "left.png",
                "path": "/myfolder/banner/left.png",
                "bytes": 7322,
                "createdBy": "U",
                "updatedAt": "2016‐02‐26T16:56:50+0900",
                "operationId": "",
                "imageProperty": {
                    "width": 60,
                    "height": 60,
                    "coordinate": {
                    "lat": null,
                    "lng": null
                },
                "createdAt": "2016‐02‐26T16:56:27+0900"
            },
            "queues": [
                {
                    "queueId": "bef1736f‐6637‐459e‐ae10‐ac0961ebf59c",
                    "queueType": "image",
                    "status": "W",
                    "tryCount": 0,
                    "queuedAt": "2016‐02‐26T16:56:29+0900",
                    "operationId": "100x100",
                    "url": "http://image.toast.com/aaaaach/myfolder/banner/left_100x100.png",
                    "name": "left_100x100.png",
                    "path": "/myfolder/banner/left_100x100.png"
                    }
                ]
            },
            {
                "isFolder": false,
                "id": "96f726bd‐93e4‐4f7c‐ad55‐56e85aa323a8",
                "url": "http://image.toast.com/aaaaach/myfolder/banner/right.png",
                "name": "right.png",
                "path": "/myfolder/banner/right.png",
                "bytes": 267801,
                "createdBy": "U",
                "updatedAt": "2016‐02‐26T16:56:51+0900",
                "operationId": "",
                "imageProperty": {
                    "width": 1440,
                    "height": 2560,
                    "coordinate": {
                    "lat": null,
                    "lng": null
              },
             "createdAt": "2016‐02‐26T16:56:28+0900"
            },
            "queues": [
                {
                    "queueId": "6691a01a‐4585‐4e26‐989c‐8ef25dd627a0",
                    "queueType": "image",
                    "status": "W",
                    "tryCount": 0,
                    "queuedAt": "2016‐02‐26T16:56:29+0900",
                    "operationId": "100x100",
                    "url": "http://image.toast.com/aaaaach/myfolder/banner/right_100x100.png",
                    "name": "right_100x100.png",
                    "path": "/myfolder/banner/right_100x100.png"
                }
            ]
            }
        ]
    }

### Single delete (Synchronize)

\[Request Url\]

| Method | Request Url                                                               |
|--------|---------------------------------------------------------------------------|
| DELETE | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/images/sync |

\[Request Header\]

| Name          | Value       | Description                                  |
|---------------|-------------|----------------------------------------------|
| Authorization | {secretKey} | secretKey created in TOAST CLOUD Web Console |

\[Request Parameters\]

| Name             | Type    | Required or not | Basic value | Description                                              |
|------------------|---------|-----------------|-------------|----------------------------------------------------------|
| appkey           | string  | Y               | -           | appkey created through TOAST CLOUD web console           |
| folderId         | integer | -               | -           | Folder ID to be deleted                                  |
| fileld           | integer | -               | -           | File ID to be deleted                                    |
| includeThumbnail | boolean | N               | false       | Delete operation files created by the file to be deleted |

Use at least one of 'folderId' and 'fileId' as a required parameter.

\[Request Example\]

-   Delete /myfolder/sample.png file.

-   Find /myfolder/sample.png ID through the list API.

-   Change {secretKey} and {appKey} to confirmed values in the Web Console.

<!-- -->

    curl ‐X DELETE "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/images/sync?fileId=9cf11176‐
    045c‐4708‐8dbd‐35633f029a91" \
    ‐H "Authorization:{secretKey}"
    [Response Sample]
    {
        "header": {
            "isSuccessful": true,
            "resultCode": 0,
            "resultMessage": "Success"
        }
    }

### Multiple delete (Desynchronize)

\[Request Url\]

| Method | Request Url                                                                |
|--------|----------------------------------------------------------------------------|
| DELETE | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/images/async |

\[Request Header\]

| Name          | Value       | Description                                  |
|---------------|-------------|----------------------------------------------|
| Authorization | {secretKey} | secretKey created in TOAST CLOUD Web Console |

\[Request Parameters\]

| Name             | Type    | Required or not | Basic value | Description                                             |
|------------------|---------|-----------------|-------------|---------------------------------------------------------|
| appkey           | string  | Y               | -           | appkey created through TOAST CLOUD web console          |
| folderIds        | string  | -               | -           | ID list of folder to be deleted (Separated by commas)   |
| fields           | string  | -               | -           | ID list of file to be deleted (Separated by commas)     |
| includeThumbnail | boolean | N               | false       | Delete operation file created by the file to be deleted |

Use at least one of 'folderIds' and 'fileIds' as a required parameter.

\[Request Example\]

-   Delete /myfolder/banner/left.png, /myfolder/banner/right.png file.

-   Find ID through the list API.

-   Change {secretKey} and {appKey} to confirmed values in the Web Console.

<!-- -->

    curl ‐X DELETE "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/images/async?
    fileIds=5fa8ce52‐d066‐490c‐85dd‐f8cef181dd28,96f726bd‐93e4‐4f7c‐ad55‐56e85aa323a8" \
    ‐H "Authorization:{secretKey}"
    [Response Sample]
    {
        "header": {
            "isSuccessful": true,
            "resultCode": 0,
            "resultMessage": "Success"
        }
    }

Image Operation
---------------

The user can create various thumbnails using the image operation API.
Provides thumbnail size, black and white filter, crop (square and circular)

### Created and edit image operation

\[Request Url\]

| Method | Request Url                                                                            |
|--------|----------------------------------------------------------------------------------------|
| PUT    | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/operations/{operationId} |

\[Request Header\]

| Name          | Value            | Description                                  |
|---------------|------------------|----------------------------------------------|
| Authorization | {secretKey}      | secretKey created in TOAST CLOUD Web Console |
| Content–Type  | application/json | -                                            |

\[Request Parameters\]

| Name        | Type   | Required or not | Basic value | Description                                    |
|-------------|--------|-----------------|-------------|------------------------------------------------|
| appkey      | string | Y               | -           | appkey created through TOAST CLOUD web console |
| operationId | string | Y               | -           | Name of operation to be created and edited     |

\[Request Body\]

Transfer as json object.

| Name            | Type    | Required or not | Basic value | Description                    |
|-----------------|---------|-----------------|-------------|--------------------------------|
| description     | string  | N               | -           | Operation description          |
| realtimeService | boolean | N               | true        | To provide live service or not |
| data            | list    | N               | -           | Operation Flow                 |

\[data option\]

\[thumbnail size\]

    {
            templateOperationId: "resize_max_fit", // (required) Foundational template ID(resize_fixed, resize_min_fit,
        resize_max_fit)
            option: {
                width: int, // (required) Width size
                height: int, // (required) Length size
                quality: double, // (optional, default: 75) Quality, 1~100(100 : Original quality)
                shrinkLargerOnly: boolean, // (optional, default: true) Possibility of enlarging beyond the original
                keepAnimation: boolean, // (optional, default: false) To keep GIF animation or not
                keepExif: boolean, // (optional, default: true) To keep meta information or not
                autoOrient: boolean, // (optional, default: false) To rotate based on Orientation information or not
                targetExtension: string // (optional, default: null) Output format(Extension)
            }
        }

\[Square crop\]

    {
            templateOperationId: "rectangle", // (required) Foundational template ID
            option: {
                gravity: string, // (optional, default: "Center") Base position (NorthWest, North, NorthEast, West,
            Center, East, SouthWest, South, SouthEast)
                offsetX: int, // (optional, default: 0) Move the base position (‐ value possible: move to the other way)
                offsetY: int, // (optional, default: 0) Move the base position (‐ value possible: move to the other way)
                width: int, // (required) Width size
                height: int // (required) Length size
            }
    }

\[Circular crop\]

    {
            templateOperationId: "circle", // (required) Foundational template ID
            option: {
                gravity: string, // (optional, default: "Center") Base position (NorthWest, North, NorthEast, West,
            Center, East, SouthWest, South, SouthEast)
                offsetX: int, // (optional, default: 0) Move the base position (‐ value possible: move to the other way)
                offsetY: int, // (optional, default: 0) Move the base position (‐ value possible: move to the other way)
                radius: int // (required) Radius
                }
    }

\[Black and white filter\]

    {
            templateOperationId: "gray", // (required) Foundational template ID
            option: {} // (required) No options
    }

\[Request Example\]

-   Based on the length of long axis, create or edit the work of reducing the size to 100x100 under the name of 100x100.

-   Change {secretKey} and {appKey} to confirmed values in the Web Console.

<!-- -->

    curl ‐X PUT "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/operations/100x100" \
    ‐H "Authorization:{secretKey}" \
    ‐H "Content‐Type: application/json" \
    ‐‐data "{'description': '', 'realtimeService': true, 'data': [{'templateOperationId': 'resize_max_fit',
    'option': {'resizeType': 'max_fit', 'width': 100, 'height': 100, 'quality': 80, 'shrinkLargerOnly':
    false}}]}"

\[Response Sample\]

    {
                "header": {
                // Omit
              },
                "operation": {
                "appKey": {appKey},
                "operationId": "100x100",
                "description": "",
                "realtimeService": true,
                "jobTemplate": [
                {
                    "templateOperationId": "resize_max_fit",
                    "jobType": "ResizeJob",
                    "option": {
                        "resizeType": "max_fit",
                        "width": 100,
                        "height": 100,
                        "quality": 80,
                        "shrinkLargerOnly": false,
                        "keepAnimation": false,
                        "keepExif": true,
                        "autoOrient": true
                        }
                    }
                ],
                "updatedAt": "2016‐02‐26T17:42:27+0900"
                }
    }

\[Response Field\]

| Name      | Type   | Description           |
|-----------|--------|-----------------------|
| operation | object | Operation information |

\[operation Type\]

| Name            | Type    | Description                    |
|-----------------|---------|--------------------------------|
| appKey          | string  | User appkey                    |
| operationId     | string  | Operation name                 |
| description     | string  | Operation description          |
| realtimeService | boolean | To provide live service or not |
| jobTemplate     | list    | Operation Flow                 |
| updatedAt       | date    | Final date of update           |

\[jobTemplate Type\]

| Name                | Type   | Description              |
|---------------------|--------|--------------------------|
| templateOperationId | string | Foundational template ID |
| jobType             | string | Work separation          |
| option              | object | Work                     |

### Image operation list (Search)

\[Request Url\]

| Method | Request Url                                                              |
|--------|--------------------------------------------------------------------------|
| GET    | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/operations |

\[Request Header\]

| Name          | Value       | Description                                  |
|---------------|-------------|----------------------------------------------|
| Authorization | {secretKey} | secretKey created in TOAST CLOUD Web Console |

\[Request Parameters\]

| Name     | Type    | Required or not | Basic value | Description                                                                        |
|----------|---------|-----------------|-------------|------------------------------------------------------------------------------------|
| appkey   | string  | Y               | -           | appkey created through TOAST CLOUD web console                                     |
| template | boolean | N               | false       | List retrieval target (true: Basic operation, false: User created operation)       |
| name     | string  | N               | -           | Name of operation for search (Starts with entry value)                             |
| page     | integer | N               | 1           | Page number                                                                        |
| rows     | integer | N               | 20          | Number of retrieval (max: 10000)                                                   |
| sort     | string  | N               | date:desc   | Alignment method (Alignment target : name or date, Alignment method : asc or desc) |

\[Request Example\]

-   Look up list of operations the user created.

-   Change {secretKey} and {appKey} to confirmed values in the Web Console.

<!-- -->

    curl ‐X GET "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/operations?template=false" \
    ‐H "Authorization:{secretKey}"

\[Response Sample\]

    {
                "header": {
                // Omit
            },
            "paging": {
                "page": 1,
                "rows": 20,
                "totalCount": 1
            },
            "operations": [
                {
                    "appKey": {appKey},
                    "operationId": "100x100",
                    "description": "",
                    "realtimeService": true,
                    "jobTemplate": [
                    {
                        "templateOperationId": "resize_max_fit",
                        "jobType": "ResizeJob",
                        "option": {
                            "resizeType": "max_fit",
                            "width": 100,
                            "height": 100,
                            "quality": 80,
                            "shrinkLargerOnly": false,
                            "keepAnimation": false,
                            "keepExif": true,
                            "autoOrient": true
                        }
                    }   
                ],
                "updatedAt": "2016‐02‐26T17:42:27+0900"
            }
        ]
    }

\[Response Field\]

| Name       | Type   | Description        |
|------------|--------|--------------------|
| paging     | object | Paging information |
| operations | list   | Operation list     |

\[paging Type\]

| Name       | Type    | Description                   |
|------------|---------|-------------------------------|
| page       | integer | Requested page number         |
| rows       | integer | Number of requested inquiries |
| totalCount | long    | Total number                  |

\[operations Type\]

| Name            | Type    | Description                    |
|-----------------|---------|--------------------------------|
| appKey          | string  | User appkey                    |
| operationId     | string  | Operation name                 |
| description     | string  | Operation description          |
| realtimeService | boolean | To provide live service or not |
| jobTemplate     | list    | Operation Flow                 |
| updatedAt       | date    | Final date of update           |

\[job Template Type\]

| Name                | Type   | Description              |
|---------------------|--------|--------------------------|
| templateOperationId | string | Foundational template ID |
| jobType             | string | Work separation          |
| option              | object | Work                     |

### Look up image operation in detail

\[Request Url\]

| Method | Request Url                                                                            |
|--------|----------------------------------------------------------------------------------------|
| GET    | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/operations/{operationId} |

\[Request Header\]

| Name          | Value       | Description                                  |
|---------------|-------------|----------------------------------------------|
| Authorization | {secretKey} | secretKey created in TOAST CLOUD Web Console |

\[Request Parameters\]

| Name        | Type   | Required or not | Basic value | Description                                    |
|-------------|--------|-----------------|-------------|------------------------------------------------|
| appkey      | string | Y               | -           | appkey created through TOAST CLOUD web console |
| operationId | string | Y               | -           | Name of operation to look up                   |

\[Request Example\]

-   Look up 100x100 operation.

-   Change {secretKey} and {appKey} to confirmed values in the Web Console.

<!-- -->

    curl ‐X GET "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/operations/100x100" \
    ‐H "Authorization:{secretKey}"

\[Response Sample\]

    {
                "header": {
                // Omit
            },
                "operation": {
                    "appKey": {appKey},
                    "operationId": "100x100",
                    "description": "",
                    "realtimeService": true,
                    "jobTemplate": [
                {
                    "templateOperationId": "resize_max_fit",
                    "jobType": "ResizeJob",
                    "option": {
                        "resizeType": "max_fit",
                        "width": 100,
                        "height": 100,
                        "quality": 80,
                        "shrinkLargerOnly": false,
                        "keepAnimation": false,
                        "keepExif": true,
                        "autoOrient": true
                    }
                }
            ],
        "updatedAt": "2016‐02‐26T17:42:27+0900"
        }
    }

\[Response Field\]

| Name      | Type   | Description           |
|-----------|--------|-----------------------|
| operation | object | Operation information |

\[operation Type\]

| Name            | Type    | Description                    |
|-----------------|---------|--------------------------------|
| appKey          | string  | User appkey                    |
| operationId     | string  | Operation name                 |
| description     | string  | Operation description          |
| realtimeService | boolean | To provide live service or not |
| jobTemplate     | list    | Operation Flow                 |
| updatedAt       | date    | Final date of update           |

\[jobTemplate Type\]

| Name                | Type   | Description              |
|---------------------|--------|--------------------------|
| templateOperationId | string | Foundational template ID |
| jobType             | string | Work separation          |
| option              | object | Work                     |

### Delete image operation

\[Request Url\]

| Method | Request Url                                                                            |
|--------|----------------------------------------------------------------------------------------|
| DELETE | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/operations/{operationId} |

\[Request Header\]

| Name          | Value       | Description                                  |
|---------------|-------------|----------------------------------------------|
| Authorization | {secretKey} | secretKey created in TOAST CLOUD Web Console |

\[Request Parameters\]

| Name        | Type   | Required or not | Basic value | Description                                    |
|-------------|--------|-----------------|-------------|------------------------------------------------|
| appkey      | string | Y               | -           | appkey created through TOAST CLOUD web console |
| operationId | string | Y               | -           | Name of operation to be deleted                |

\[Request Example\]

-   Delete 100x100 operation.

-   Change {secretKey} and {appKey} to confirmed values in the Web Console.

<!-- -->

    curl ‐X DELETE "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/operations/100x100" \
    ‐H "Authorization:{secretKey}"
    [Response Sample]
    {
        "header": {
            "isSuccessful": true,
            "resultCode": 0,
            "resultMessage": "Success"
            }
    }

### Run image operation

\[Request Url\]

| Method | Request Url                                                                   |
|--------|-------------------------------------------------------------------------------|
| POST   | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/operations‐exec |

\[Request Header\]

| Name          | Value            | Description                                  |
|---------------|------------------|----------------------------------------------|
| Authorization | {secretKey}      | secretKey created in TOAST CLOUD Web Console |
| Content–Type  | application/json | -                                            |

\[Request Parameters\]

| Name   | Type   | Required or not | Basic value |
|--------|--------|-----------------|-------------|
| appkey | string | Y               | -           |

\[Request Body\]

Transfer as json object.

| Name         | Type   | Required or not | Basic value | Description                                  |
|--------------|--------|-----------------|-------------|----------------------------------------------|
| basepath     | string | Y               | -           | Absolute path of foundational folder         |
| filepaths    | list   | Y               | -           | Folder and file list of absolute path to run |
| operationIds | list   | Y               | -           | Operation ID list to run                     |

\[Request Example\]

-   Using /myfolder/left.png, /myfolder/right.png original file, create a file which 100x100 operation option is applied

-   Change {secretKey} and {appKey} to confirmed values in the Web Console.

<!-- -->

    curl ‐X POST "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/operations‐exec" \
    ‐H "Authorization:{secretKey}" \
    ‐H "Content‐Type: application/json" \
    ‐‐data "{'basepath': '/myfolder', 'operationIds': ['100x100'], 'filepaths': ['/myfolder/left.png',
    '/myfolder/right.jpg']}"

\[Response Sample\]

    {
            "header": {
            // Omit
            },
            "paging": {
                "page": 1,
                "rows": 20,
                "totalCount": 1
            },
            "operations": [
                {
                    "appKey": {appKey},
                    "operationId": "100x100",
                    "description": "",
                    "realtimeService": true,
                    "jobTemplate": [
                    {
                        "templateOperationId": "resize_max_fit",
                        "jobType": "ResizeJob",
                        "option": {
                            "resizeType": "max_fit",
                            "width": 100,
                            "height": 100,
                            "quality": 80,
                            "shrinkLargerOnly": false,
                            "keepAnimation": false,
                            "keepExif": true,
                            "autoOrient": true
                    }
                }
            ],
            "updatedAt": "2016‐02‐26T17:42:27+0900"
        }
        ],
        "queues": [
        {
            "queueId": "6691a01a‐4585‐4e26‐989c‐8ef25dd627a0",
            "queueType": "image",
            "status": "W",
            "tryCount": 0,
            "queuedAt": "2016‐02‐26T16:56:29+0900",
            "operationId": "100x100",
            "url": "http://alpha‐image.toast.com/aaaaach/myfolder/banner/right_100x100.png",
            "name": "right_100x100.png",
            "path": "/myfolder/banner/right_100x100.png"
            }
        ]
    }

\[Response Field\]

| Name       | Type | Description               |
|------------|------|---------------------------|
| operations | list | List of operations to run |
| queues     | list | Work information list     |

\[operations Type\]

| Name            | Type    | Description                    |
|-----------------|---------|--------------------------------|
| appKey          | string  | User appkey                    |
| operationId     | string  | Operation name                 |
| description     | string  | Operation description          |
| realtimeService | boolean | To provide live service or not |
| jobTemplate     | list    | Operation Flow                 |
| updatedAt       | date    | Final date of update           |

\[jobTemplate Type\]

| Name                | Type   | Description              |
|---------------------|--------|--------------------------|
| templateOperationId | string | Foundational template ID |
| jobType             | string | Work separation          |
| option              | object | Work                     |

\[queues Type\]

| Name        | Type    | Description                                                       |
|-------------|---------|-------------------------------------------------------------------|
| queueId     | string  | Work unique ID                                                    |
| queueType   | string  | Work separation (image: Operation, swift: Delete file and folder) |
| status      | string  | Work status (W: Waiting, D: Completed, P: Working, F: Failed)     |
| tryCount    | integer | Number of retry                                                   |
| queuedAt    | date    | Work registered date                                              |
| operationId | string  | Referred operation ID                                             |
| url         | string  | Image service URL to be serviced                                  |
| name        | string  | Name of image to be created                                       |
| path        | string  | Absolute path of image to be created                              |

### Look up each user’s live service

\[Request Url\]

| Method | Request Url                                                         |
|--------|---------------------------------------------------------------------|
| GET    | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/users |

\[Request Header\]

| Name          | Value       | Description                                  |
|---------------|-------------|----------------------------------------------|
| Authorization | {secretKey} | secretKey created in TOAST CLOUD Web Console |

\[Request Parameters\]

| Name   | Type   | Required or not | Basic value | Description                                    |
|--------|--------|-----------------|-------------|------------------------------------------------|
| appkey | string | Y               | -           | appkey created through TOAST CLOUD web console |

\[Request Example\]

-   Look up user’s live service.

-   Change {secretKey} and {appKey} to confirmed values in the Web Console.

<!-- -->

    curl ‐X GET "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/users" \
    ‐H "Authorization:{secretKey}"

\[Response Sample\]

    {
            "header": {
            // Omit
        },
            "user": {
            "appKey": {appkey},
            "containerName": "aaaaach",
            "realtimeService": true
        }
    }

\[Response Field\]

| Name | Value  | Description      |
|------|--------|------------------|
| user | object | User Information |

\[Folder Type\]

| Name            | Value   | Description                    |
|-----------------|---------|--------------------------------|
| appKey          | string  | User appkey                    |
| containerName   | string  | User’s container information   |
| realtimeService | boolean | To provide live service or not |

### Change each user’s live service

\[Request Url\]

| Method | Request Url                                                         |
|--------|---------------------------------------------------------------------|
| PUT    | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/users |

\[Request Header\]

| Name          | Value            | Description                                  |
|---------------|------------------|----------------------------------------------|
| Authorization | {secretKey}      | secretKey created in TOAST CLOUD Web Console |
| Content–Type  | application/json | -                                            |

\[Request Parameters\]

| Name   | Type   | Required or not | Basic value | Description                                    |
|--------|--------|-----------------|-------------|------------------------------------------------|
| appkey | string | Y               | -           | appkey created through TOAST CLOUD web console |

\[Request Body\]

Transfer as json object.

| Name            | Type    | Required or not | Basic value | Description                    |
|-----------------|---------|-----------------|-------------|--------------------------------|
| realtimeService | boolean | Y               | -           | To provide live service or not |

\[Request Example\]

-   Change the user’s live service.

-   Change {secretKey} and {appKey} to confirmed values in the Web Console.

<!-- -->

    curl ‐X PUT "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/users" \
    ‐H "Authorization:{secretKey}" \
    ‐H "Content‐Type: application/json" \
    ‐‐data "{'realtimeService': false}"

\[Response Sample\]

    {
            "header": {
                "isSuccessful": true,
                "resultCode": 0,
                "resultMessage": "Success"
            }
    }

### Look up work

\[Request Url\]

| Method | Request Url                                                                    |
|--------|--------------------------------------------------------------------------------|
| GET    | https://api-image.cloud.toast.com/image/v2.0/appkeys/{appkey}/queues/{queueId} |

\[Request Header\]

| Name          | Value       | Description                                  |
|---------------|-------------|----------------------------------------------|
| Authorization | {secretKey} | secretKey created in TOAST CLOUD Web Console |

\[Request Parameters\]

| Name    | Type   | Required or not | Basic value | Description                                    |
|---------|--------|-----------------|-------------|------------------------------------------------|
| appkey  | string | Y               | -           | appkey created through TOAST CLOUD web console |
| queueId | string | Y               | -           | Work unique ID to be looked up                 |

\[Request Example\]

-   Look up the current status of operation request.

-   Change {secretKey} and {appKey} to confirmed values in the Web Console.

<!-- -->

    curl ‐X GET "https://api-image.cloud.toast.com/image/v2.0/appkeys/{appKey}/queues/6691a01a‐4585‐4e26‐989c‐8ef25dd627a0" \
    ‐H "Authorization:{secretKey}"

\[Response Sample\]

    {
            "header": {
                "isSuccessful": true,
                "resultCode": 0,
                "resultMessage": "Success"
            },
            "queue": {
                "queueId": "6691a01a‐4585‐4e26‐989c‐8ef25dd627a0",
                "queueType": "image",
                "status": "D",
                "tryCount": 0,
                "queuedAt": "2016‐02‐26T16:56:52+0900",
                "operationId": "100x100",
                "url": "http://image.toast.com/aaaaach/myfolder/banner/right_100x100.png",
                "name": "right_100x100.png",
                "path": "/myfolder/banner/right_100x100.png"
            }
    }

\[Response Field\]

| Name  | Type   | Description      |
|-------|--------|------------------|
| queue | object | Work information |

\[queue Type\]

| Name        | Type    | Description                                                       |
|-------------|---------|-------------------------------------------------------------------|
| queueId     | string  | Work unique ID                                                    |
| queueType   | string  | Work separation (image: Operation, swift: Delete file and folder) |
| status      | string  | Work status (W: waiting, D: completed, P: working, F: failed)     |
| tryCount    | integer | Number of retry                                                   |
| queuedAt    | date    | Work start date                                                   |
| operationId | string  | Referred operation ID                                             |
| url         | string  | Image service URL to be serviced (in service)                     |
| name        | string  | Name of image to be created (already created)                     |
| path        | string  | Absolute path of image to be created (already created)            |

Response Code
-------------

Response Code, Message

| resultCode | resultKey                      | resultMessage(English)                                | resultMessage (Korean)                                                  | Note                                                                                                                        |
|------------|--------------------------------|-------------------------------------------------------|-------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| 0          | SUCCESS                        | Success                                               | OOO Success                                                             | Success                                                                                                                     |
| 1          | PARTIAL\_SUCCESS P             | Partial Success                                       | Partial success                                                         | Among partial success list, some are successful and some failed (Considered partial success even if number of success is 0) |
| –1         | FAIL                           | Unknown error                                         | Unknown error occurred.                                                 | When internal error occurs                                                                                                  |
| 404        | NOT\_FOUND                     | Please check your API Url, Parameters or HTTP Method. | Please check API URL, parameter and HTTP Method                         | -                                                                                                                           |
| 10001      | INVALID\_PARAMETERS            | One or more parameters were invalid.                  | Check the parameter please.                                             | When wrong parameter value is sent or it is omitted                                                                         |
| 10002      | INVALID\_FILES                 | -                                                     | No file to upload or invalid file.                                      | When there is no file for upload or it is a broken image                                                                    |
| 11001      | PATH\_LENGTH\_LIMIT            | -                                                     | Maximum length of all paths is 2000 letters.                            | All path length limit (2000)­ linux system: 4096­ Browser URL Length limit: IE10:2083, IE11: 3600                           |
| 11002      | FILENAME\_LENGTH\_LIMIT        | -                                                     | Minimum length of file and folder name is 2, and maximum length is 255. | Length limit in file/folder name (2 ~ 255)­ N Drive: 80 letters, dropbox: 255 letters                                       |
| 11003      | FILE\_COUNT\_LIMIT             | -                                                     | Maximum number of files and folders for request is 10000.               | When there are a lot of requested files and folders due to delete and list retrieval (Basic: 100, max: 10000)               |
| 11004      | UPLOAD\_SIZE\_LIMIT            | -                                                     | Exceeded the capacity of one time upload (Max12Mbytes).                 | Exceeded upload file capacity (1 file max: , 1 request max: )                                                               |
| 11050      | INVALID\_FILENAME              | Invalid Characters in File or Folder Name             | Following texts cannot be used in file and folder names.  / :? \* " ¦   | File/folder name validation ( /  : ? \* " ¦)                                                                                |
| 11051      | INVALID\_URL                   | -                                                     | URL upload support port is 80, 443.                                     | URL support port for uploading through URL                                                                                  |
| 20000      | FOLDER\_DUPLICATED\_NAME       | There is already a folder at the given destination    | Folder in same name exists.                                             | When creating with a duplicate folder name or rename                                                                        |
| 20001      | FOLDER\_NOT\_EXISTS            | No file was found at the specified path.              | No file or folder is found at the specific path.                        | When there is no file/folder in the specific path e.g. delete, download                                                     |
| 20002      | INVALID\_BASE\_PATH            | -                                                     | No parent folder exists.                                                | In case there is no parent folder or it is deleted when uploading a file or creating a folder                               |
| 20010      | FILE\_DUPLICATED\_NAME         | -                                                     | File in the same name exists.                                           | In case of overwrite=false&autorename=false, In case file in the same name exists                                           |
| 21002      | MARKED\_ALREADY\_DELETING      | -                                                     | File or folder requested to be deleted.                                 | -                                                                                                                           |
| 21003      | DELETE\_FILE\_COUNT\_LIMIT     | -                                                     | The maximum number of files and folders to delete is 10000.             | -                                                                                                                           |
| 21011      | NO\_FILE\_TO\_DELETE           | -                                                     | No data to delete.                                                      | -                                                                                                                           |
| 21030      | FAIL\_TO\_DELETE               | -                                                     | A problem occurred while deleting.                                      | -                                                                                                                           |
| 21031      | FAIL\_TO\_CREATE\_ROOT\_FOLDER | -                                                     | Failed to create Root folder.                                           | -                                                                                                                           |
| 22001      | FAIL\_TO\_CREATE\_FOLDER       | -                                                     | Failed to create a folder.                                              | -                                                                                                                           |
| 23001      | FAIL\_TO\_UPLOAD\_IMAGES       | -                                                     | A problem occurred while uploading the image.                           | -                                                                                                                           |
| 30004      | INVALID\_APPKEY                | -                                                     | Verification information is not valid.                                  | App Key or Secret Key error                                                                                                 |
| 30005      | INVALID\_USER                  | -                                                     | User information is not valid.                                          | -                                                                                                                           |
