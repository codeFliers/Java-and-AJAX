<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - AJAX TEST</title>
</head>
<body>
    <td>
        <tr>

        </tr>
    </td>
    <script type="text/javascript">
        var requete;

        function valider() {
            //retrieve the html element (object) with "donnees" as ID
            var donnees = document.getElementById("donnees");
            //create an URL for the future request (valider as servlet name and valuer for the param name)
            var url = "Valider?valeur=" + escape(donnees.value);
            //detect if we're on Firefox, IE, Google chrome ....
            if (window.XMLHttpRequest) {
                //firefox
                requete = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                requete = new ActiveXObject("Microsoft.XMLHTTP");
            }
            //fill up the request (Type, URL and asyncBoolean)
            requete.open("GET", url, true);
            /*
            asyncBoolean is true, we associate 'onreadystagechange' with a
            callback function
            This function is saved before we send() the request and will be use
            to use the response in the index.jsp
             */
            requete.onreadystatechange = majIHM;
            //send() the request to the URL (null because it is a GET param)
            requete.send(null);
        }

        function majIHM() {
            var message = "";

            //the request is 'DONE' (open() -> send() with 'responseText'
            if (requete.readyState == 4) {
                //OK
                if (requete.status == 200) {
                    // exploit the data from the response
                    //retrieve the data as XML format
                    var messageTag = requete.responseXML.getElementsByTagName("message")[0];
                    console.log(messageTag);
                    //retrieve 'invalide' or 'valide'
                    //messageTag.firstChild.nodeValue;
                    message = messageTag.childNodes[0].nodeValue;
                    //get an object by the id "validationMessage" that will contain the result
                    var mdiv = document.getElementById("validationMessage");

                    if (message == "invalide") {
                        mdiv.innerHTML = "<img src='no.png'>";
                    } else {
                        mdiv.innerHTML = "<img src='ok.png'>";
                    }
                }
            }
        }
    </script>
    <table>
        <tr>
            <td>Valeur :</td>
            <!-- start valider() after each key press -->
            <td nowrap><input type="text" id="donnees" name="donnees" size="30"
                              onkeyup="valider();"></td>
            <td>
                <!-- RESULT -->
                <div id="validationMessage"></div>
            </td>
        </tr>
    </table>
</body>
</html>