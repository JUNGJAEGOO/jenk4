title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
Game &gt; Real Time Multiplayer &gt; Developer's Guide
------------------------------------------------------

NetworkManager
--------------

NetworkManager is a component which provides a network function for multiplayer games. The user not only conduct works such as network settings, status management and match makings using the inspector provided by NetworkManager without making a separate script but also provide API which corresponds to the applicable functions. Major functions NetworkManager provides are as follows.

-   Game status management

-   Game object creation management

-   Scene management

-   Debugging level settings

-   Match making

-   Network connection settings

Inspector
---------

NetworkManager inspector as follows.

<img src="http://static.toastoven.net/prod_realtimemultiplayer/img_27.jpg" />

| Term                         | Description                                                                                                                                                                                                                                                                                                                               |
|------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Don’t Destroy On Load        | When loading a new scene, designate not to destroy the game object which includes NetworkManager component.                                                                                                                                                                                                                               |
| Log Level                    | Designate the debugging level of NetworkManager component.                                                                                                                                                                                                                                                                                |
| Online Scene                 | Designate the scene which is called when a player joins the game room.                                                                                                                                                                                                                                                                    |
| Offline Scene                | Designate the scene which is called when a player leaves the room or network connection ends.                                                                                                                                                                                                                                             |
| Listener                     | A field to notify the status changes in NetworkManager. Designate by making a script to receive event notices in the game object. - void OnConnected() : Network connection successful - void OnFailedToConnect() : Network connection failed - void OnDisconnected() : End network connection - void OnJoinedGame() : Join the game room |
| Appkey                       | Enter Appkey issued from TOAST Cloud.                                                                                                                                                                                                                                                                                                     |
| Url                          | Enter URL issued from TOAST Cloud.                                                                                                                                                                                                                                                                                                        |
| Max Player                   | Designate max number of people to be admitted when creating a room.                                                                                                                                                                                                                                                                       |
| RoomType                     | Perform matching if same as entered string.                                                                                                                                                                                                                                                                                               |
| Reopen                       | If a vacancy occurs while processing a game, allow an additional participant to join the game.                                                                                                                                                                                                                                            |
| Spawn Info                   | Register game object that will be created dynamically in the game room.                                                                                                                                                                                                                                                                   |
| Channel Count                | Designate the number of channels for network communications. The minimum range is 5 and maximum is 50.                                                                                                                                                                                                                                    |
| MTU Size                     | Designate max byte number for one time send. Minimum range to designate is 450 bytes and max is 1300 bytes.                                                                                                                                                                                                                               |
| Ping Interval                | If reliability data is not sent, designate Ping interval sent to a server from a client.                                                                                                                                                                                                                                                  |
| Disconnect Timeout           | After sending reliability data, designate max time to wait for the response.                                                                                                                                                                                                                                                              |
| Enable CRC                   | Activate data’s integrity test. If the network connection is good in the service area, it is not recommended to use it on a mobile device.                                                                                                                                                                                                |
| Max Unreliable Commands      | Empty the queue if unreliability data piles up in the queue more than the designated number. If set 0, the applicable function does not operate.                                                                                                                                                                                          |
| Waning Queue Size            | In case a certain number of packet piles up in the queue, transfer a Warning message.                                                                                                                                                                                                                                                     |
| Resent Count Allowance       | Designate the number of resend of data that has not received the response.                                                                                                                                                                                                                                                                |
| Shows Network Stats and Info | If activated, network condition related figure information can be checked via NetworkStatistic property, and if NetworkManagerHUD component is activated, the applicable value can be checked on the game screen.                                                                                                                         |

### 
Scene management

A lot of developers use multiple scenes when creating a game with unity. For example, they develop a game by separating menu scene, game scene and end scene. When a player enters the game room, NetworkManager automatically loads scenes set in Online Scene. On the other hand, if service use has ended as the player ends the game and leaves the room, it will load Offline Scene.

But if a scene used before connecting to the network and an online scene are same, do not perform a scene loading. Same goes for an offline scene, do not perform a scene loading for same scenes. In other words, multiplayer contents can be added to a game composed of a single scene. Then from the moment entering the game room till the end, other scene can be loaded for use additionally.

### Match making

TOAST Cloud’s real time multiplayer service provides the very basic way of match making service. Match making conducts matching according to the string set in RoomType.

-   **Level matching** For matchings based on scores, divide player’s score in certain intervals and create a string based on that value. For example, if a player with score of 111, designate game\_1 type matching with the value dividing 100 in order to designate a matching between players in the score range of 100.

-   **Game type matching** Like MORPG, if a player selects to enter a certain dungeon, it can be designated to perform matching by designating the applicable dungeon name.

-   **Game version related matching** If a client version needs to be classified, designate to perform matching by adding client version information.

### Listener settings

NetworkManager has a function to notify status information in three categories. They are Connected status connected to TOAST Cloud, JoinedGame status joined in the game room after a verification process and lastly, Disconnected status disconnected the connection. If a required action is needed depending on the status change, make a script as follows and drag to NetworkManager inspector’s Listener item.

    public class Listener : MonoBehaviour {

        ///

        /// Connected to TOAST Cloud
        ///

        void OnConnect() {}

        ///

        /// Failed to connect TOAST Cloud
        ///

        void OnFailedToConnect() {}

        ///

        /// Joined a Game
        ///

        void OnJoinedGame() {}

        ///

        /// Disconnected from TOAST Cloud
        ///

        void OnDisconnected() {}
    }

### Create game objects

Creating game objects dynamically in a multiplayer game is one of necessary functions. Game objects can be created dynamically by registering Prefab to be created in NetworkManager before connecting to the network. To register in NetworkManager, the applicable game object must include NetworkIdentity component.

<img src="http://static.toastoven.net/prod_realtimemultiplayer/img_28.jpg" />

Registered prefab can be created dynamically by calling API provided by RealtimeNetwork as follows.

    RealtimeNetwork.Instantiate (playerPrefab, position, rotation);

### Multiplexing

Multiplexing is a way to present unnecessary data delay by having a domain to delete dependence between other data. For example, if A data and B data are designated as Reliable Sequenced QoS but do not depend on each other, it is better for the loss of A data avoid the delay of B data. In order to prevent these unnecessary delays, it is best to assign each domain with no dependency to separate channels.

NetworkManager Channel Count designates the max number of channels for use. A range possible to assign is minimum of 5 to maximum of 50, and because 0 and the first channels are used for internal data, it is better not to use them.

### Network setting

If Advanced Configuration is activated in the inspector, network engine’s default option can be changed. However, it is not recommended to set this function except for special occasions.

-   **MTU Size** MTU size changes are used to prevent fragmentation of IP class by reducing the value in a serviced country or region where network infra condition is not good. Fragmentation of IP class may raise the network delay even more.

-   **Ping Interval** If there is no need to recognize client’s connection status sensitively, expand Ping send interval, if need to recognize sensitively, it can be reduced to minimum of 500 milliseconds.

-   **Disconnection Timeout** Indicates the max time value to wait until receiving the response message for reliability data after sending it. Minimum value is 1000 milliseconds and max is 5000 milliseconds.

-   **CRC Enable** Activate data’s integrity check function. Considering the national network environment, it is not recommended to activate this.

-   **Max Unreliable Commands** This function is useful if rendering loop has stopped due to Cellular-Wi-Fi hand over or user manipulation, and this function deletes previous data piled up in the queue and reflects latest data.

-   **Waning Queue Size** If there is more data piled up in network engine internal queue than the designated threshold value, a Warning message is generated.

### API

\[Properties\]

| Term              | Type       | Description                                                                                     |
|-------------------|------------|-------------------------------------------------------------------------------------------------|
| Url               | string     | Indicates Project access URL issued from the Console.                                           |
| Appkey            | string     | Indicates Project Appkey issued from the Console.                                               |
| GameState         | GameStates | Indicates conditions related to games                                                           |
| NetStatus         | NetStates  | Shows network condition.                                                                        |
| UserID            | string     | Indicates player’s unique ID that will be used when connecting.                                 |
| LocalPlayer       | Player     | Local player’s information shared in the game room.                                             |
| IsMaster          | bool       | If the current player has a master authority, return True, if not, return false.                |
| dontDestroyOnLoad | bool       | Set up not to destroy the game object including NetworkManager when a scene changes.            |
| ServerAddress     | string     | Returns accessed game server’s address.                                                         |
| ServerPort        | int        | Return port number of the accessed game server.                                                 |
| MaxPlayer         | int        | Indicates game room’s max players. Max number of people is 8.                                   |
| RoomType          | string     | Designate types of game rooms to access.                                                        |
| Reopen            | bool       | If a player leaves while playing a game, allow a new player to join the game.                   |
| OnlineScene       | string     | Indicates a scene that will be loaded when joining the game room.                               |
| OfflineScene      | string     | Indicates a scene that will be loaded when disconnected.                                        |
| SpawnPrefabs      | List       | Indicates prefab list which will be created dynamically during the game.                        |
| MTU               | int        | Designate max byte number for one time send. Minimum range to designate is 450 and max is 1300. |
| PingInterval      | int        | If reliability data is not sent, designate Ping cycle sent to a server from a client.           |
| DisconenctTimeout | int        | Designate max time to wait for the response after sending reliability data.                     |
| ChannelCount      | int        | Designate ma number of channels for use.                                                        |
| ShowNetworkStats  | bool       | Decide whether to indicate the network status for the purpose of debugging.                     |
| Listener          | GameObject | Appoint a listener to receive NetworkManager’s status changes.                                  |

\[Methods\]

| Term         | Description                                              |
|--------------|----------------------------------------------------------|
| Description  | Connect to Real Time Multiplayer service of TOAST Cloud. |
| Signature    | void Connect()                                           |
| Return Value | N/A                                                      |
| Term         | Description                                              |
| Description  | End the Real Time Multiplayer service of TOAST Cloud.    |
| Signature    | void Disconnect()                                        |
| Return Value | N/A                                                      |

RealtimeNetwork
---------------

Once the network is activated, RealtimeNetwork provides high level of API that can produce real time multiplayer contents. Because RealtimeNetwork provides static functions and static properties only that it does not need to create separate objects. Major functions that RealtimeNetwork provides are as follows.

-   Create and destroy game objects

-   RPC

-   Synch server time

### Creation and destruction of game objects

Formation and destruction of game objects on network is a required function in a multiplayer game. By using Instantiate function that RealtimeNetwork provides, a game object can be created in the game room. A few constraint conditions related to formation are as follows.

-   Game objects that can be created on the network dynamically are limited to the ones that are designated in Registered Spawnable Prefab of NetworkManager, and the registered game objects must include NetworkIdentity component.

-   Only a player with a master authority can created prefab set by a master ownership.

-   A player who created prefab set by a local player’s ownership gets the primary ownership.

If a game object needs to be destroyed, use a Destroy function that RealtimeNetwork provides. Only the player who has an ownership of a game object to be deleted can delete the game object using the Destroy. As the second factor of Destroy function can set the delete delay time, functions like Destroy of GameObject can be easily realized on the network.

### RPC

RPC of RealtimeNetwork provides functions to send and receive messages between players.

-   Ephemeral message, Persistent message

-   Unicast

-   Multicast

Requirements for script and game object to be called to RPC are as follows.

-   Class to be used in RPC need to inherit NetworkBehaviour.

-   Game object which includes script to be used must include NetworkIdentity component.

RPC provides two types of message. First, Ephemeral which sends a message to players connected to the current game room and Persistent method which saves a message in the game room are provided. Similar to message send and receive of general network communications, Ephemeral type sends temporarily limited to players currently in the game room. However, Persistent type is saved in the game room classified as an assigned script and function. As an example of a use, if a player with a master ownership assigns a certain RPC as Persistent and sends to a game room, players currently connected will receive the message right away and players who connected after this will receive same RPC message. Assigned Persistent message can be deleted from the game room using the RemoveRPC function.

RealtimeNetwork’s RPC supports unicast and multicast. In other words, it not only sends a message to a particular player but also to all the players in the game room or to a particular player group.

### Time synch

Despite the fact the time synch is a necessary element in games like a great war, it is not easy to share same time value due to a network environment and physical distance. Moreover, if each player is in a different time zone, a local time cannot be used so the server time should be used as a reference time. FetchServerTimestamp function of RealtimeNetwork and ServerTime property allows an easy synch of time between players. Especially in a mobile environment, it supports time synch considering the network performance gap occurred between Cellular and Wi-Fi.

FetchServerTimestamp is a desynch function which, once synch is completed, ServerTime returns values bigger than 0. In case of an initial call, client performs the time synch function by calling FetchServerTimestamp internally, but considering the mobile environment, one more call is recommended before starting the game.

### API

\[Properties\]

RealtimeNetwork provides static functions and static properties. Functions and properties of RealtimeNetwork are as follows.

| Term                  | Type       | Description                                                        |
|-----------------------|------------|--------------------------------------------------------------------|
| IsNetworkActive       | bool       | Shows network connection status.                                   |
| IsJoinedRoom          | bool       | Shows the status connected to the game room.                       |
| IsMaster              | bool       | Indicates if the current player has the master authority.          |
| LocalPlayer           | Player     | Returns current player’s information.                              |
| CurrentUserID         | string     | Returns player’s unique ID used for connection.                    |
| Players               | List       | Returns list of players connected to the game room up to now.      |
| RoomProperties        | DataObject | Returns property of a room designated when creating the game room. |
| ServerTime            | uint       | Returns server time.                                               |
| IsServerTimeAvailable | uint       | Check to see if server time is available.                          |
| RoundTripTime         | uint       | Returns average packet round trip time.                            |

\[Methods\]

| Term         | Description                                                                                                                                            |
|--------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| Description  | Create game objects on the network.                                                                                                                    |
| Signature    | GameObject Instantiate( GameObject prefab, Vector3 position, Quaternion rotation)                                                                      |
| Parameters   | Prefab of game object to be created                                                                                                                    |
| Parameters   | Position value of game object to be created                                                                                                            |
| Parameters   | Rotation value of game object to be created                                                                                                            |
| Return Value | Returns created Game Object.                                                                                                                           |
| Term         | Description                                                                                                                                            |
| Description  | Delete game objects on the network.                                                                                                                    |
| Signature    | bool Destroy(GameObject gameObject, float time = 0)                                                                                                    |
| Parameters   | Game Object to be deleted on the network                                                                                                               |
| Parameters   | Delete delay time in seconds                                                                                                                           |
| Return Value | Returns created game object from Game Object.                                                                                                          |
| Term         | Description                                                                                                                                            |
| Description  | Send RPC messages on the network.                                                                                                                      |
| Signature    | bool RPC(NetworkIdentity identity, string methodName, RpcType type, ReceiverGroup receiverGroup, DataObject parameters, SendParameters sendParameters) |
| Signature    | bool RPC(NetworkIdentity identity, string methodName, RpcType type, byte player, DataObject parameters, SendParameters sendParameters)                 |
| Signature    | bool RPC(NetworkIdentity identity, string methodName, RpcType type, byte\[\] players, DataObject parameters, SendParameters sendParameters)            |
| Parameters   | Designate NetworkIdentity of the game object to send messages.                                                                                         |
| Parameters   | methodName Name of a function to receive a message                                                                                                     |
| Parameters   | Designate the message type. Ephemeral or Persistent of RpcType                                                                                         |
| Parameters   | receiverGroup Designate a group to receive messages.                                                                                                   |
| Parameters   | Designate player’s ID to receive messages.                                                                                                             |
| Parameters   | Designate player’s ID to receive a message in configuration.                                                                                           |
| Parameters   | parameters Sent in function’s factor when receiving a message.                                                                                         |
| Parameters   | sendParameters Designate message send options.                                                                                                         |
| Return Value | bool If send is successful, returns true, if not, returns false.                                                                                       |
| Term         | Description                                                                                                                                            |
| Description  | Delete RPC message appointed as Persistent.                                                                                                            |
| Signature    | bool RemoveRPC(NetworkIdentity identity, string methodName, SendParameters sendParameters)                                                             |
| Parameters   | identity Designate NetworkIdentity of RPC to be deleted.                                                                                               |
| Parameters   | methodName Designate the function name of RPC to be deleted.                                                                                           |
| Return Value | bool If send is successful, returns true, if not, returns false.                                                                                       |
| Term         | Description                                                                                                                                            |
| Description  | Requests ownership of other player’s game object.                                                                                                      |
| Signature    | bool RequestOwnership(GameObject gameobject)                                                                                                           |
| Parameters   | Game object to request gameobject ownership                                                                                                            |
| Return Value | bool If send is successful, returns true, if not, returns false.                                                                                       |
| Term         | Description                                                                                                                                            |
| Description  | Request a message to synch server time.                                                                                                                |
| Signature    | bool FetchServerTimestamp()                                                                                                                            |
| Return Value | bool If send is successful, returns true, if not, returns false.                                                                                       |

NetworkIdentity
---------------

NetworkIdentity is the unique identifier of an applicable game object on the network. To use NetworkTransfrom component and NetworkBehaviour in the game object, it must include NetworkIdentity component, and if NetworkBehaviour is inherited from the user defined script or add NetworkTransform component, NetworkIdentity will be added automatically. Major functions of NetworkIdentity are as follows.

-   Game object unique identifier

-   Appoint ownership

### Inspector

NetworkIdentity inspector as follows.

<img src="http://static.toastoven.net/prod_realtimemultiplayer/img_29.jpg" />

| Inspector              | Description                                                                                                                                                                                               |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Local Player Authority | Indicates the ownership of the applicable game object. If designated, the player who created the object will get the ownership. If it is not designated, it will be designated upon the master ownership. |

NetworkTransform
----------------

NetworkTransform provides various functions to synch position of game object and rotation value easily. NetworkTransform component, in a special form of user defined script inherited NetworkBehaviour, operates the same way user defined script inherited NetworkBehaviour operates.

To use NetworkTransform component, NetworkIdentity component must be included in the game object. Following is major functions that NetworkTransform provides.

-   Location synch

-   Rotation synch

-   Send speed

-   Sending and receiving channel settings

### Inspector

NetworkManager inspector as follows.

<img src="http://static.toastoven.net/prod_realtimemultiplayer/img_30.jpg" />

| Inspector                   | Description                                                                                                                                                                                                                                |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Network Send Rate           | Designate transmission rate in seconds.                                                                                                                                                                                                    |
| Network Channel             | Designate send channel.                                                                                                                                                                                                                    |
| Transform Sync Mode         | Provide a way to synch.                                                                                                                                                                                                                    |
| Movement Threshold          | Send data if the designated value exceeds the rotation angle or the size value of the position vector.                                                                                                                                     |
| Snap Threshold              | If the size value of position vector exceeds the designated value, match the value directly without performing the position interpolation.                                                                                                 |
| Interpolate Movement Factor | Position interpolation number which is based on data transmission rate. If bigger than 1, the number of interpolation reduces, if the value is smaller than 1, the number of interpolation increases. Does not perform interpolation if 0. |
| Rotation Axis               | Designate rotation axis.                                                                                                                                                                                                                   |
| Interpolate Rotation Factor | Rotation interpolation number which is based on data transmission rate. If bigger than 1, the number of interpolation reduces, if the value is smaller than 1, the number of interpolation increases. Does not perform interpolation if 0. |
| Sync Angular Velocity       | Designate synch of each speed value of Rigidbody.                                                                                                                                                                                          |

### Send speed

Setting transmission rate for game object synch is very important for natural display of performance and game. Because NetworkTransform supports Interpolation, transmission rate can be designated following the characteristics of a game, and designate transmission rate appropriate for the role of each game object.

It may seem it is best to send data for every frame to reduce the delay between the send device and receive device, but actually if data is sent for every frame, it has a negative effect on the game performance. Therefore, since the delay of position information sent to the network is unavoidable, interpolation must be used necessarily, and it is recommended to reduce a delay by restricting the character’s moving speed and to use interpolation. Except for special occasions, 10 times per second on PC and 6 times per second on a mobile device are recommended.

### Synch mode

Synch technique varies depending on the game property and the purpose of use of game object. NetworkTransform component supports easy game object synch by providing synch technique as follows.

-   **SyncTransform** : Perform sync without using the interpolation. Immediately reflect recent data received through network in the game object.

-   **SyncRigidbody2D** : Sync by changing the velocity value of Rigidbody2D using the interpolation. Rigidbody2D component must be included.

-   **SyncRigidbody3D** : Sync the velocity value of Rigidbody using the interpolation. Rigidbody component must be included.

-   **SyncCharacterControl** : Sync CharacterController component coordinates using the interpolation. CharacterController component must be included.

### Channel settings

To use data multiplexing, designate dedicated channels in NetworkTransform. If there is not a lot of data, it may be a way to send all data via channel 3 which is assigned as a default rather than assigning a particular channel, but if there is a lot of data, using multiple channels to avoid interference between data is more efficient. By using NetworkManager inspector’s Channel Count item or ChannelCount API, designate the max channel number, and assign a unique channel to each NetworkTransform within the range of designated channels. For example, if Channel Count is designated as 10, channels from 0 to 10 can be used. But since channel 0 and 1 are used internally and channel 3 is a default channel, it is recommended to avoid them and it is best to use channels from 4 to 10 for dedicated channels. Since unnecessary channel formation is not good for the performance, it is better to designate a reasonable number of channels.

### API

Provides property corresponding to the functions provided by inspector.

\[Properties\]

| API Methods         | Type              | Description                                                                                                                                                                                                                                              |
|---------------------|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| syncRotationAxis    | AxisSyncMode      | Designate rotation axis.                                                                                                                                                                                                                                 |
| NetworkChannel      | int               | Designate send channel.                                                                                                                                                                                                                                  |
| transformSyncMode   | TransformSyncMode | Provide a way to sync.                                                                                                                                                                                                                                   |
| movementTheshold    | float             | Send data if the designated value exceeds the rotation angle or size value of the position vector.                                                                                                                                                       |
| snapThreshold       | float             | If the size value of position vector exceeds the designated value, match the value directly without performing the position interpolation.                                                                                                               |
| interpolateMovement | float             | Position interpolation number which is based on data transmission rate. If bigger than 1, the number of interpolation reduces, if the value is smaller than 1, the number of interpolation increases. Does not perform interpolation if 0.               |
| interpolateRotation | float             | Position interpolation number which is based on data transmission rate. If bigger than 1, the number of the number of interpolation reduces, if the value is smaller than 1, the number of interpolation increases. Does not perform interpolation if 0. |
| syncSpin            | bool              | Designate sync of each speed value of Rigidbody.                                                                                                                                                                                                         |

NetworkBehaviour
----------------

NetworkBehaviour is a class a script must inherit in order to use the functions Real Time Multiplayer provides in the user defined script. Because NetworkBehaviour inherited UnityEngine.MonoBehaviour, MonoBehaviour function can be used. A game object which includes a user defined class that has inherited NetworkBehaviour with NetworkTransform as a component must include one NetworkIdentity component.

### Start and end of the game

Upon entering the game room, overriding OnStart function will be called. In reverse, upon leaving the game room or network disconnection, OnLeave function will be called.

### Confirm player’s access

When a player joins or leave the game room currently involved in, receive an applicable event message by overriding OnJoinedRoom and OnLeavedRoom. If a player designated as a master left the game room, receive a number of a player who is newly designated as a master through OnLeavedRoom message.

### User defined sync

Synch data that requires continuous reflection through overriding in user defined script with virtual functions of NetworkBehaviour, OnSerialize and OnDeserialize. For example, if the size of a game object that is not supported by NetworkTransform continuously requires synch, it can be developed by adding the applicable logic in OnSerialize and OnDeserialize. It is a realization of NetworkTransform position and rotation synch using the applicable function. However, it is recommended to use RPC for data that does not require continuous synch.

After the initial call of OnSerialize function, designate DirtyBit as true if synch is required as it is called only when DirtyBit property value is true. Once data is sent, DirtyBit will automatically change to false. If you want to reflect latest data with OnSerialize function when a new player joins the game room, designate DirtyBit as true. For details on applicable functions, refer to NetworkTransform source code provided.

NetworkBehaviour can designate send interval, channels and QoS through function overriding. Send interval is set to designate in seconds. For example, if the user wants to send data every 200 milliseconds, set it as 0.2. It is different from the inspector as the inspector designates number of times in seconds. Channels can be changed by overriding GetNetworkChannel functions and must be designated within the designated maximum channels in NetworkManager Channel Count. QoS basic value is designated as UnreliableSequenced, and for data that requires continuous reflection, UnreliableSequenced QoS is recommended as the basic value is.

### API

NetworkBehaviour API is composed of a virtual function to receive properties related to the current game object ownership and certain events, a virtual function to send and receive user data and a property.

\[Properties\]

| API Properties          | Type            | Description                                                                                                                |
|-------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------|
| IsLocalPlayerGameObject | bool            | Indicates whether a local player owns the game object.                                                                     |
| hasAuthority            | bool            | Check to see if ownership of applicable game object is held.                                                               |
| DirtyBit                | bool            | If designate True, OnSerialize function will be called to send data. After sending, it will automatically change to False. |
| networkIdentity         | NetworkIdentity | Return NetworkIdentity component included in the current game object.                                                      |

\[Methods\]

| API Methods  | Description                                                                                                                  |
|--------------|------------------------------------------------------------------------------------------------------------------------------|
| Description  | Called if enters the game room with a virtual function.                                                                      |
| Signature    | void OnStart()                                                                                                               |
| API Methods  | Description                                                                                                                  |
| Description  | Called if leaves the game room with a virtual function.                                                                      |
| Signature    | void OnLeave()                                                                                                               |
| API Methods  | Description                                                                                                                  |
| Description  | As a virtual function, function overrode to send data.                                                                       |
| Signature    | bool OnSerialize(DataObject data, bool initialState)                                                                         |
| Parameters   | Enter data to send.                                                                                                          |
| Parameters   | initialState If initial call, true, if not, false.                                                                           |
| Return Value | If bool true is returned, send data, if not, do not send data.                                                               |
| API Methods  | Description                                                                                                                  |
| Description  | As a virtual function, function overrode to receive.                                                                         |
| Signature    | void OnDeserialize(DataObject data, bool initialState)                                                                       |
| Parameters   | Received data                                                                                                                |
| Parameters   | initialState If initial call, true, if not, false.                                                                           |
| Return Value | If bool true is returned, send data, if not, do not send data.                                                               |
| API Methods  | Description                                                                                                                  |
| Description  | OnSerialize data will be sent to the channel designated with a virtual function. Channels can be changed through overriding. |
| Signature    | byte GetNetworkChannel()                                                                                                     |
| Return Value | byte designated channel returns.                                                                                             |
| API Methods  | Description                                                                                                                  |
| Description  | Designate OnSerialize data send cycle with a virtual function. Send interval can be changed through overriding.              |
| Signature    | float GetNetworkSendInterval()                                                                                               |
| Return Value | float designated time interval in seconds returns.                                                                           |
| API Methods  | Description                                                                                                                  |
| Description  | Designate OnSerialize send data network QoS with a virtual function. Send interval can be changed through overriding.        |
| Signature    | QosType GetQoS()                                                                                                             |
| Return Value | QosType designated QoS returns.                                                                                              |
| API Methods  | Description                                                                                                                  |
| Description  | Called when a new player joins the game room with a virtual function.                                                        |
| Signature    | void OnJoinedRoom(byte playerNum)                                                                                            |
| Parameters   | playerNum Newly joined player number                                                                                         |
| API Methods  | Description                                                                                                                  |
| Description  | Called when the player left the game room with a virtual function.                                                           |
| Signature    | public virtual void OnLeavedRoom(byte playerNum, byte newMasterNum)                                                          |
| Parameters   | playerNum Player number who left the game room                                                                               |
| Parameters   | newMasterNum Player number of the current game room master                                                                   |

DataObject
----------

DataObject is used when a user creates objects to send and receive data. When sending, DataObject will be sent to the destination through serialization and deserialization.

| Type         | Bytes used |
|--------------|------------|
| bool         | 1          |
| byte         | 1          |
| Int16        | 2          |
| Int32        | 4          |
| Int64        | 8          |
| float        | 4          |
| double       | 8          |
| string       | variable   |
| bool array   | variable   |
| byte array   | variable   |
| Int16 array  | variable   |
| Int32 array  | variable   |
| Int64 array  | variable   |
| float array  | variable   |
| double array | variable   |
| string array | variable   |
| DataObject   | variable   |

### API

DataObject will save data with key and value.

\[Properties\]

| API Properties | Description                       |
|----------------|-----------------------------------|
| Count          | Returns the number of saved data. |

\[Methods\]

| API Methods  | Description                                                                       |
|--------------|-----------------------------------------------------------------------------------|
| Description  | Check if the corresponding key is included.                                       |
| Signature    | bool ContainsKey(byte key)                                                        |
| Parameters   | key value                                                                         |
| Return Value | If a key corresponding to bool already exists, return true, if not, return false. |
| API Methods  | Description                                                                       |
| Description  | Returns the value corresponding to key.                                           |
| Signature    | T GetValue(byte key)                                                              |
| Parameters   | key value                                                                         |
| Return Value | Returns the value of the key corresponding to T.                                  |
| API Methods  | Description                                                                       |
| Description  | Check the existence of the key and return the corresponding value.                |
| Signature    | bool GetValue(byte key, out T value)                                              |
| Parameters   | key value                                                                         |
| Parameters   | Return value.                                                                     |
| Return Value | If there is a value corresponding to bool key, return true, if not, return false. |
| API Methods  | Description                                                                       |
| Description  | Enter Boolean type’s value in the designated key.                                 |
| Signature    | void SetBoolean(byte key, bool value)                                             |
| Parameters   | key value                                                                         |
| Parameters   | Boolean type’s value                                                              |
| API Methods  | Description                                                                       |
| Description  | Enter Byte type’s value in the designated key.                                    |
| Signature    | void SetByte(byte key, byte value)                                                |
| Parameters   | key value                                                                         |
| Parameters   | Byte type’s value                                                                 |
| API Methods  | Description                                                                       |
| Description  | Enter Int16 type’s value in the designated key.                                   |
| Signature    | void SetInt16(byte key, Int16 value)                                              |
| Parameters   | key value                                                                         |
| Parameters   | Int16 type’s value                                                                |
| Return Value | -                                                                                 |
| API Methods  | Description                                                                       |
| Description  | Enter Int32 type’s value in the designated key.                                   |
| Signature    | void SetInt32(byte key, Int16 value)                                              |
| Parameters   | key value                                                                         |
| Parameters   | Int32 type’s value                                                                |
| API Methods  | Description                                                                       |
| Description  | Enter Int64 type’s value in the designated key.                                   |
| Signature    | void SetInt64(byte key, Int64 value)                                              |
| Parameters   | key value                                                                         |
| Parameters   | Int64 type’s value                                                                |
| API Methods  | Description                                                                       |
| Description  | Enter String types’ value in the designated key.                                  |
| Signature    | void SetString(byte key, String value)                                            |
| Parameters   | key value                                                                         |
| Parameters   | String type’s value                                                               |
| API Methods  | Description                                                                       |
| Description  | Enter DataObject type’s value in the designated key.                              |
| Signature    | void SetDataObject(byte key, DataObject value)                                    |
| Parameters   | key value                                                                         |
| Parameters   | DataObject type’s value                                                           |
| API Methods  | Description                                                                       |
| Description  | Enter Boolean array type’s value in the designated key.                           |
| Signature    | void SetBooleans(byte key, bool\[\] value)                                        |
| Parameters   | key value                                                                         |
| Parameters   | Boolean sequence type’s value                                                     |
| API Methods  | Description                                                                       |
| Description  | Enter Byte array type’s value in the designated key.                              |
| Signature    | void SetBytes(byte key, byte\[\] value)                                           |
| Parameters   | key value                                                                         |
| Paramters    | Byte sequence type’s value                                                        |
| API Methods  | Description                                                                       |
| Description  | Enter Int16 array type’s value in the designated key.                             |
| Signature    | void SetInt16s(byte key, Int16\[\] value)                                         |
| Parameters   | key value                                                                         |
| Parameters   | Int16 type’s value                                                                |
| API Methods  | Description                                                                       |
| Description  | Enter Int32 array type’s value in the designated key.                             |
| Signature    | void SetInt32s(byte key, Int16\[\] value)                                         |
| Parameters   | key value                                                                         |
| Parameters   | Int32 sequence type’s value                                                       |
| API Methods  | Description                                                                       |
| Description  | Enter Int64 array type’s value in the designated key.                             |
| Signature    | void SetInt64s(byte key, Int64\[\] value)                                         |
| Parameters   | key value                                                                         |
| Parameters   | Int64 sequence type’s value                                                       |
| API Methods  | Description                                                                       |
| Description  | Enter String array type’s value in the designated key.                            |
| Signature    | void SetStrings(byte key, String\[\] value)                                       |
| Parameters   | key value                                                                         |
| Parameters   | String sequence type’s value.                                                     |

Others
------

If used as factors or return values, classes are as follows.

### GameState

GameState shows the game status.

| GameState Term       | Description                    |
|----------------------|--------------------------------|
| CONNECT\_ESTABLISHED | Network connection established |
| AUTH                 | Verification successful        |
| JOINGAME             | Join the game                  |
| LEAVEGAME            | Leave the game                 |

### NetStates

Shows the network status.

| NetStates Term | Description               |
|----------------|---------------------------|
| DISCONNECTED   | Network connection ended  |
| DISCONNECTING  | Ending network connection |
| CONNECTING     | Connecting to the network |
| CONNECTED      | Network connected         |

### TransformSyncMode

Designate position synch on the network.

| TransformSyncMode Term  | Description                                     |
|-------------------------|-------------------------------------------------|
| SyncNone                | Do not perform synch.                           |
| SyncTransform           | Perform synch based on game object’s Transform. |
| SyncRigidbody2D         | Sync Rigidbody2D component.                     |
| SyncRigidbody3D         | Sync Rigidbody component.                       |
| SyncCharacterController | Sync CharacterController component.             |

### AxisSyncMode

Designate rotation synch on the network.

| AxisSyncMode Term | Description                               |
|-------------------|-------------------------------------------|
| None              | Do not perform sync.                      |
| AxisX             | Perform X axis rotation sync.             |
| AxisY             | Perform Y axis rotation sync.             |
| AxisZ             | Perform Z axis rotation sync.             |
| AxisXY            | Perform X axis and Y axis rotations sync. |
| AxisXZ            | Perform X axis and Z axis rotations sync. |
| AxisYZ            | Perform Y axis and Z axis rotations sync. |
| AxisXYZ           | Perform all axis rotations sync.          |

### Player

Player class is used to refer to player’s information.

\[Properties\]

| Player Term | Type       |
|-------------|------------|
| IsMine      | bool       |
| IsMaster    | bool       |
| PlayerNr    | byte       |
| Properties  | DataObject |

### SendParameters

SendParameters is used as send option when sending RPC data.

\[Properties\]

| SendParameters Term | Type    | Description                     |
|---------------------|---------|---------------------------------|
| Channel             | byte    | Designate send channel.         |
| Encrypted           | bool    | Encrypt data if designate True. |
| QoS                 | QosType | Designate send QoS.             |

### ReceiverGroup

When sending RPC, ReceiverGroup designates receiver with a factor. Sending can still be done by designating Player ID without using ReceiverGroup but if receiver list is within the range of ReceiverGroup’s support, it is recommended to use ReceiverGroup considering the size of send data.

| ReceiverGroup Term | Description                                               |
|--------------------|-----------------------------------------------------------|
| All                | Send a message to all players in the current game room.   |
| Others             | Send a message to all players in the game room except me. |
| MasterClient       | Send a message to a player with master ownership.         |

### QosType

When sending data, designate network QoS.

| QosType Term        | Description                                                                                                                          |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| UnreliableSequenced | Unreliability –Order ensured send. Appropriate when data requires constant updates along with the game object coordinate.            |
| ReliableSequenced   | Reliability-order ensured send. Appropriate to send intermittent or temporary data.                                                  |
| AllCostDelivery     | Reliability-ensures order-fast send ReliableSequenced Perform fast resend similar to send. Appropriate for small but important data. |

Notice
------

Following restrictions apply when using Real-Time Multiplayer Service, and if efficiency and functions over restrictions are needed, separate service zone is supported for build.

-   The number of concurrent connected people per game room is 8.

-   Max number of message is limited to 500 (send + receive) per second for each room.

-   Do not use API with Public and Internal accesses that are not recorded in the document.

Video tutorial
--------------

The following is videos of making a simple game to a multiplayer game.
You can download assets used in tutorials via below links.

    [Space Shooter Tutorial Project Download](http://static.toastoven.net/toastcloud/sdk_download/RTM/SpaceShooter-Tutorial-Project.zip)

\[Space Shooter Tutorial 1 : TOAST Cloud settings/ connect to the game server\]

\[Space Shooter Tutorial 2 : Synch creation and position of player objects\]

\[Space Shooter Tutorial 3 : Synch missiles and obstacle objects\]
