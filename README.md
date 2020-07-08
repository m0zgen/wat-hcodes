## What is HTTP code?

Simple script for search and show HTTP codes.

### Examples

Ask about of HTTP code 200:
```
./wat-hcodes.sh 200
```

Result

```
Code: 200 | Status: OK | Description: The request has succeeded.
```

Ask about of any HTTP code with *5*:
```
./wat-hcodes.sh 5
```

Result:
```
Code: 205 | Status: Reset Content | Description: "The server has fulfilled the request and desires that the user agent reset the ""document view"", which caused the request to be sent, to its original state as received from the origin server."

Code: 305 | Status: Use Proxy | Description: Defined in a previous version of this specification and is now deprecated, due to security concerns regarding in-band configuration of a proxy.

...

Code: 599 | Status: Network Connect Timeout Error | Description: This status code is not specified in any RFCs, but is used by some HTTP proxies to signal a network connect timeout behind the proxy to a client in front of the proxy.
```

Ask only 5xx codes:

```
./wat-hcodes.sh "^5"
```

Result:

```
Code: 500 | Status: Internal Server Error | Description: The server encountered an unexpected condition that prevented it from fulfilling the request.

...

Code: 599 | Status: Network Connect Timeout Error | Description: This status code is not specified in any RFCs, but is used by some HTTP proxies to signal a network connect timeout behind the proxy to a client in front of the proxy.

```

Ask by keyword:

```
./wat-hcodes.sh "gateway"
```

Result:

```
Code: 502 | Status: Bad Gateway | Description: The server, while acting as a gateway or proxy, received an invalid response from an inbound server it accessed while attempting to fulfill the request.

Code: 504 | Status: Gateway Timeout | Description: The server, while acting as a gateway or proxy, did not receive a timely response from an upstream server it needed to access in order to complete the request.
```