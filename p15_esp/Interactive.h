String TemplatePage = R"(
 

<!DOCTYPE html>
<html>

  <head><meta name="viewport" content="width=device-width" initial-scale="1"/>
  <meta http-equiv="refresh" content="3" />

    <link rel="icon" href="data:,">
    <style>
                 html { font-family: Helvetica; display: inline-block; margin: 0px auto; text-align: center;}
             body{
              background-color: #333131;
          }
         
          
              .contain{
                  width: 50%;
                  height:500px;
               
              }
    
      .button { 
        border: none;
        background: #2e6d30;
        color: #ffffff !important;
        font-weight: 100;
        padding: 20px;
        text-transform: uppercase;
        border-radius: 6px;
        display: inline-block;
        }
      .button2 {
    color: #ffffff !important;
    font-weight: 700 !important;
    letter-spacing: 3px;
    background: #55a057;
     box-shadow:0px 2px 10px rgba(255,255,255,0.8),
             0px 5px 50px rgba(255,255,255,0.8),
             0px 8px 80px rgba(255,255,255,0.6),
             0px 8px 120px rgba(255,255,255,0.6);
    transition: all 0.3s ease 0s;
}
      .pargraph{ color:green; font-size:20px;}  
      .contain1{
        position: relative;
        float:left;
        margin-left: 35%;
        
        
        }
         .contain2{
        position: relative;
        float:right;
         margin-right: 32%;  
             
        }
        
     </style>
     <script>
          function Lamp() {
    document.getElementById("lampon").classList.toggle("coloron");

}
      </script>
   </head>
<body>
<center>

      <div class="contain"> 
    <h1 style="color:#FFFFFF">Taymaa & Malak <span style="color:green">IOT</span> project</h1>
  
   <div class="contain1">
    <p class="pargraph">Pump 1</p>
    <p><a href="/0/on"><button class="button">ON</button></a></p>
    <br>
    <p class="pargraph">Pump 2</p>
    <p><a href="/2/on"><button class="button">ON</button></a></p>
    </div>
    <div class="contain2">
    <p class="pargraph">Lamp</p>
    <p><a href="/1/on"><button class="button">ON</button></a></p>
    <br>
    <p class="pargraph">Motor </p>
    <p><a href="/3/on"><button class="button">ON</button></a></p>
    </div>
    
    
 




)";
