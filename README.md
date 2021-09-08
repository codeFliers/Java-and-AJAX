# Java-and-AJAX

AJAX is a technology which give the possibility through Javascript to have an asynchronous functionality on web pages.  
It permits to not restrict the user when he does an action. The web page will be partially updated and while it is going to happen, the user can still go about his business.  
To work, it need to support JavaScript and the object "XMLHttpRequest" (Firefox) (IE: ActiveXObject) which will handle the HTTP Request to the server.  Like AJAX use HTTP, J2EE know how to handle it. 

Once the request has been updated, the response return to the user and a "callback" function is called. It will work out the updating of the DOM.

**First example**  
In this simple example, we have a JSP page and a servlet. The JSP will have a form that will check if what a user is writing start by a 'x'/'X'.  
If it doesn't, it will print out a "no.png" next to it or a "ok.png" if it does.  

valider() is the function that create an ajax request and majIHM() is the callback function charged to handle the response from the servlet "AjexServlet" (name=Valider).

Check out FIRST EXAMPLE code [here](https://github.com/codeFliers/Java-and-AJAX/tree/main/First%20example/main)

*What is important to remember?*  
We need a web page, a callback function and a Servlet. The user start an "event" (button click) and it does start a function that will create an XMLHttpRequest.  
First, we need to determin the browser the user is using. Then the ajax object need 3 things:  
-give parameters to the request ("Type", url to the servlet with data in it, if it's async or not (bool))  
-eventually have a callback saved to handle the response from the servlet  
-send the request to the servlet.  

Then the servlet will eventually use "response.getWriter().println(...);" to send text data type that the callback will catch so it can process it "requete.responseXML".




