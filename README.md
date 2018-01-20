# link

### **A simple server-client communications method over TCP/IP**

## How does it work
Coming soon

## Manifest

- `reciever.rb`  
    Allows the reception of link messages
- `sender.rb`  
    A way to easily send link messages

- `encoder.rb`  
    A small library used to encode and decode the subments in link messages

- `proof_of_concept`  
    Contains a basic example of using link to send time over the network.  
    To get custom time formats, add `"Format" => "*Your format from https://ruby-doc.org/core-2.2.0/Time.html#method-i-strftime here*"` to the hash on line 5 in `TimeClient.rb`
    - `TimeClient.rb`  
        A basic client for the `TimeServer`
    - `TimeServer.rb`  
        A semi-basic server that returns the time. If you're having issues and don't need fancy functionality, use `TimeServer.basic.rb`
    - `TimeServer.basic.rb`  
    A basic time server without the other's bells and whistles. If your'e haing issues with the full server, use this
