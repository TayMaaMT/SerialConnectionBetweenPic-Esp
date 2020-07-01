// Malak Ehab Al-Ashi 
// Taymaa Abd Elraheem Al-Zayan    
#include <ESP8266WiFi.h>
#include "Interactive.h"
IPAddress staticIP(192, 168, 1, 42);
IPAddress gateway(192, 168, 1, 1);
IPAddress subnet(255, 255, 255, 0);

char* ssid = "Al-Ashi_2018"; //  your network SSID (name) 
const char* password = "moka1997";

WiFiServer server(80);
String header;
WiFiClient client;

String GPIO0State = "off";
String GPIO1State = "off";
String GPIO2State = "off";
String GPIO3State = "off";

byte Ctr;

void setup()
{
  Serial.begin(9600);
  
  WiFi.begin(ssid,password);
  WiFi.config(staticIP, gateway, subnet);
  
  WiFi.mode(WIFI_STA); /////////////////////// very important line**
  while (WiFi.status() != WL_CONNECTED) {delay(500);
  }
  server.begin();
}

void loop() {
  client = server.available();              // Listen for incoming clients
  if (client) {                             // If a new client connects,
    String currentLine = "";                // make a String to hold incoming data from the client
    while (client.connected())              // loop while the client's connected
    {
      if (client.available()) {             // if there's bytes to read from the client,
        char c = client.read();             // read a byte, then
        header += c;
        if (c == '\n')                      // if the byte is a newline character
        {
          if (currentLine.length() == 0)    // if the current line is blank, that's the end of the client HTTP request
          {
            ProcessRequest();
            SendWebPage(); // Display the HTML web page
            break; // Break out of the while loop
          }
          else // if you got a newline, then clear currentLine
            currentLine = "";
        }
        else if (c != '\r')   // if you got anything else but a carriage return character,
          currentLine += c;      // add it to the end of the currentLine
      }
    }
    header = "";// Clear the header variable
    client.stop();// Close the connection
  }
}
void ProcessRequest()
{
 if (header.indexOf("GET /2/off") >= 0)
    {
      GPIO2State = "off";
      Serial.println('0');
    }
 else if (header.indexOf("GET /2/on") >= 0)
    {
      GPIO2State = "on";
      Serial.println('1');
    }
 else if (header.indexOf("GET /0/off") >= 0)
    {
      GPIO0State = "off";
      Serial.println('2');
    }
 else if (header.indexOf("GET /0/on") >= 0)
    {
      GPIO0State = "on";
      Serial.println('3');
    }
    else if (header.indexOf("GET /1/off") >= 0)
    {
      GPIO1State = "off";
      Serial.println('4');
    }
 else if (header.indexOf("GET /1/on") >= 0)
    {
      GPIO1State = "on";
      Serial.println('5');
    }
    else if (header.indexOf("GET /3/off") >= 0)
    {
      GPIO3State = "off";
      Serial.println('6');
    }
 else if (header.indexOf("GET /3/on") >= 0)
    {
      GPIO3State = "on";
      Serial.println('7');
    }
  
}

void SendWebPage()
{
 
  
  if (GPIO0State == "off") 
   {
    TemplatePage.replace("0 - State on" , "0 - State off");
    TemplatePage.replace("0/off\"><button class=\"button button2\">OFF" , "0/on\"><button class=\"button\">ON");
   }
  else 
   {
   TemplatePage.replace("0 - State off" , "0 - State on");
   TemplatePage.replace("0/on\"><button class=\"button\">ON" , "0/off\"><button class=\"button button2\">OFF");
   }
   
  if (GPIO2State == "off") 
  {
    TemplatePage.replace("2 - State on" , "2 - State off");    
    TemplatePage.replace("2/off\"><button class=\"button button2\">OFF" , "2/on\"><button class=\"button\">ON");
  }
  else                     
  {
    TemplatePage.replace("2 - State off" , "2 - State on");    
    TemplatePage.replace("2/on\"><button class=\"button\">ON" , "2/off\"><button class=\"button button2\">OFF");
  }
  if (GPIO1State == "off") 
  {
    TemplatePage.replace("1 - State on" , "1 - State off");    
    TemplatePage.replace("1/off\"><button class=\"button button2\">OFF" , "1/on\"><button class=\"button\">ON");
  }
  else                     
  {
    TemplatePage.replace("1 - State off" , "1 - State on");    
    TemplatePage.replace("1/on\"><button class=\"button\">ON" , "1/off\"><button class=\"button button2\">OFF");
  }
  if (GPIO3State == "off") 
  {
    TemplatePage.replace("3 - State on" , "3 - State off");    
    TemplatePage.replace("3/off\"><button class=\"button button2\">OFF" , "3/on\"><button class=\"button\">ON");
  }
  else                     
  {
    TemplatePage.replace("3 - State off" , "3 - State on");    
    TemplatePage.replace("3/on\"><button class=\"button\">ON" , "3/off\"><button class=\"button button2\">OFF");
  }
  
  client.println(TemplatePage);
   if (Serial.available() > 0) Ctr= (byte)Serial.read(); else Ctr;
  
  client.println("<h2 style=\"color:#ffffff\">Reference</h2><div style=\"width:100px;height:100px; border-style:double;border-color:white; border-radius: 50%;color:green;\"><p style=\"text-align: center; margin-top:30%;font-size:200%;\">"+(String)Ctr+"%</p></div> </div></center></body></html>");
  
 
}
