title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Common > IAP > Getting Started

To use SDK from IAP, you first need to register app and item at web console. 

## Activating IAP item and issuing Appkey

```
To use IAP service, select [Common] > [IAP] at web console and click [Use Item] button to activate the service.
```

![[Figure. 1 IAP Activation]](http://static.toastoven.net/prod_iap/iap_n_30.png)
<center>[Figure. 1 IAP Activation]</center>

```
Click 'URL & Appkey' on top as in [Figure 2] to check AppKey or copy the key to clipboard.
```

![[Check AppKey]](http://static.toastoven.net/prod_iap/iap_n_31.png)
<center>[Figure. 2 Check AppKey]</center>

## Store Registration

```
1. Select [App] Tab and Click [Add]
2. Select [Store ID]   
   How to input information for store sync (Google Play) 
    - Store APP ID : Application package name in Google Play
    - Google In App Purchase License Key : Application Public Key in Google Play 
    - Google API Client ID : Google API project Client ID for OAuth  
    - Google API Client Secret : Google API project Client Secret  for OAuth
    - Refresh Token For Google OAuth : Refresh Token   
3. Click [Add]  
4. Check [APP ID]
```

> [Reference]  
> Refer to [Store interlocking information](./Store interlocking information) to obtain Store App ID.

![[그림 3 Store Registration]](http://static.toastoven.net/prod_iap/iap_n_32.png)
<center>[Figure. 3 Store Registration]</center>

## Item Registration

```
1. Click [Item] Tab.  
2. Select [Store ID] and Click [+ Add]   
3. Register item name in [Item Name]  
4. Register store item id in [Store Item ID]  
5. Select [Status]  
6. Click [Add] and check [ITEM ID].  
```

![[그림 4 Item Registration]](http://static.toastoven.net/prod_iap/iap_n_33.png)
<center>[Figure. 4 Item Registration]</center>

## Store Product Type

```
Before registering item to IAP service, register item type of InAppProducts registered at Developer Center in reference to [Table 1].
```

|Store|	Product Type|
|---|---|
|Google Play|	managed product|
|App Store|	consumable product|
|T-Store (One store)|	consumable product|

<center>[Table. 1] Store Product Type</center>

> [Warning]  
> We shall not be liable for any damage or system error caused as a result of proceeding with payment with unspecified item type

## Inquiry payment

```
1. Click [Transaction] Tab.
2. Select [Store ID].
3. Select start date and end date in [Date].
4. Select sort option in [Sort]
5. Click [Search]  
```

![[그림 5 Inquiry payment information]](http://static.toastoven.net/prod_iap/iap_n_44.png)
<center>[Figure. 5 Inquiry payment information]</center>

> [Reference]
> Payment Status   
>  - In Progress : in process   
>  - Success : completed successfully   
>  - Failure : failed  
>  - Refund : refunded

> Payment Status Detail 
>  - In Progress : If payment through store cannot be proceeded or payment cannot go through verification process.   
>  - Failure : If an error occurs in payment verification process even though payment was attempted at store.   
>  - Success : Store financial payment succeeded.
>  - Refund : If the admin manually refunded the payment in store. 


## Change Payment Status
```
You can change payment status in following conditions, 

1. If financial charge is successful, but IAP client does not receive receipt successfully, you should change payment status to 'Success'
   1.1 To change status to 'Success', currency and price on user's receipt will be needed.  

2. If user refunded payment at store, , you should change payment status to 'Refunded'
   2.1 After change, unconsumed payment API of Client will not return changed payment.

Payment which status will be changable shows [Modify] button right side as below. 

```
![[그림 6 Change payment status]](http://static.toastoven.net/prod_iap/iap_45.png)
<center>[Figure. 6 Change payment status]</center>
 
![[그림 7 Add additional information when changing statu]](http://static.toastoven.net/prod_iap/iap_46.PNG)
<center>[Figure. 7 Add additional information when changing status]</center>




## Inquiry Payment Statistics

```
1. Click [Statistics]  
2. Select [currency]  
3. You may inquire ‘This month’s total gross’ and ‘Daily details’ using [<][>] button at store  
```

![[그림 6 Payment Statistics]](http://static.toastoven.net/prod_iap/iap_n_35.png)
<center>[Figure. 6 Payment Statistics]</center>
