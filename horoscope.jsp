<html>
   <head>
      <title>Horoscope</title>
      <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
      <script src="http://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
      <link href='http://fonts.googleapis.com/css?family=Amatic+SC:700,400' rel='stylesheet' type='text/css'>
      <style>
         div.horoscope {
            border: none;
           /* font-family: 'Amatic SC', cursive; */
           font-family: cursive;
           font-size: 45px;
           color: #a6112a;
           margin: 0 auto;
           text-align: center;
           display: block;
           font-weight: 700;
           position: relative;
           background-image: url(img/bg.webp);
           background-position: center;
           /* background-clip: content-box; */
           background-size: cover;
           padding: 200px 112px; 
         }

         div.horoscope span {
            transform-origin: 100% 0%;
            animation-name: reveal;
            animation-duration: 4s;
            animation-iteration-count: infinite;

         }

         @keyframes reveal {
           100% {transform: translateX(500px);}
           100% {width: 5px;}
         }
      </style>
   </head>
   <%
      Integer parsedDay = 0;
      Integer parsedMonth = 0;
      String month = request.getParameter("month");
      String day = request.getParameter("day");
      if (day != null) {
        parsedDay = Integer.parseInt(day);
      }
      if (month != null) {
        parsedMonth = Integer.parseInt(month);
      }
      String[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
      String[] phrases = {"There is an exepected occurance waiting to throw you off your game today. But your calmness and maturity will keep you balanced.","Feelings of insecurity may surface today, making you nervous. Try doing something that makes you happy to boost your confidence.","You will be showered with appreciation and praise for your efforts at work. You might even be able to get a promotion or a pay rise today.","New relationships will get a chance to blossom today. Be open to talking with someone you may not know.","You may hit a roadblock today and become stressed. Don't worry, though, as the stress will melt away as you spend time with your loved ones.","The day may start off on a tense note but by evening, things will be peaceful and calm.","Your plans for today will see major changes due to an unexpected occurance, but you make progress in everything you had set out to do.","You will look past the criticism coming your way and make progress on your goals and dreams for the future.","You will understand the importance of constructive criticism and learn to use it to better yourself."," Be patient with yourself today you as may end up having a tough time managing relationships with those close to you.","Small things will bring you the most happiness today. Take your time and appreciate them!","Keep yourself filled with hope and optimism. A positive mindset will help you handle your worries and bring about better outcomes in life."};
   %>
   <%!
      public String zodiac_sign (Integer month, Integer day) {
         String sign="";

         if (month == 1) {
           if (day < 20)
              sign = "Capricorn";
           else
              sign = "Aquarius";
         }
         else if (month == 2) {
           if (day < 19)
              sign = "Aquarius";
           else
              sign = "Pisces";
         }
         else if(month == 3) {
           if (day < 21)
              sign = "Pisces";
           else
              sign = "Aries";
         }
         else if (month == 4) {
           if (day < 20)
              sign = "Aries";
           else
              sign = "Taurus";
         }
         else if (month == 5) {
           if (day < 21)
              sign = "Taurus";
           else
              sign = "Gemini";
         }
         else if( month == 6) {
           if (day < 21)
              sign = "Gemini";
           else
              sign = "Cancer";
         }
         else if (month == 7) {
           if (day < 23)
              sign = "Cancer";
           else
              sign = "Leo";
         }
         else if( month == 8) {
           if (day < 23)
              sign = "Leo";
           else
              sign = "Virgo";
         }
         else if (month == 9) {
           if (day < 23)
              sign = "Virgo";
           else
              sign = "Libra";
         }
         else if (month == 10) {
           if (day < 23)
              sign = "Libra";
           else
              sign = "Scorpio";
         }
         else if (month == 11) {
           if (day < 22)
              sign = "Scorpio";
           else
              sign = "Sagittarius";
         }
         else if (month == 12) {
           if (day < 22)
              sign = "Sagittarius";
           else
              sign ="Capricorn";
         }
         return sign;
      }

   %>
   <body>
      <div class="container">
         <img src="img/head.webp" class="img-fluid">
         <% if (month != null && day != null)  {%>
         <div class="text-center mt-5">
            <h2>Your Zodiac Sign is</h1>
            <img class="img-fluid" src="img/<%= zodiac_sign(parsedMonth, parsedDay)%>.jpg" />
            <h2> Your horoscope for this week is: </h2>
            <div class="horoscope"><span><%= phrases[parsedMonth-1] %></span></div>
         </div>
         <% } %>

         <h1 class="text-center my-5"> Welcome! Please enter your birthday!</h1>
         <form action="horoscope.jsp" method="post">
            <div class="row">
               <div class="mb-3 col">
                  <label for="day" class="form-label">Day</label>
                  <select class="form-select" aria-label="Default select example" name="day">
                     <option <%= day == null ? "selected" : "" %>> Please choose day... </option>
                     <%
                        for(int i=1; i<=31; i++) {%>
                           <option value="<%= i %>" <%= parsedDay == i ? "selected" : "" %>><%= i %></option>
                     <%   } 
                     %>
                  </select>
               </div>         
               <div class="mb-3 col">
                  <label for="month" class="form-label">Month</label>
                  <select class="form-select" aria-label="Default select example" name="month">
                     <option <%= month == null ? "selected" : "" %>> Please choose month... </option>
                     <%
                        for(int i=1; i<=months.length; i++) {%>
                           <option value="<%= i %>" <%= parsedMonth == i ? "selected" : "" %>><%= months[i-1] %></option>
                     <%   } 
                     %>
                  </select>
               </div>
            </div>
            <div class="text-center">
               <button type="submit" class="btn btn-primary text-center">Submit</button>
            </div>

         </form>

      </div>

   </body>
</html>
