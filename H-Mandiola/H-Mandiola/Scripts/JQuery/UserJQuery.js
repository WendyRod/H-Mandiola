
function Register() {
    var values = new Object();
    values.cedula = $('#cedula').val();
    values.nombre = $('#name').val();
    values.apellido1 = $('#surname1').val();
    values.apellido2 = $('#surname2').val();
    values.username = $('#username').val();
    values.clave = $('#password').val();
    values.confirmPass = $('#confirm_password').val();
    values.email = $('#email').val();
    
    if (values.cedula == "" || values.nombre == "" || values.apellido1 == "" || values.apellido2 == "" || values.username == "" || values.clave == "" || values.email == "") {
        alert("Complete todos los campos.");
    } else if (values.clave != values.confirmPass) {
        alert("La contraseña y la confirmación de la contraseña no coinciden");
    } 
    
        $.ajax({
            type: 'POST',
            data: JSON.stringify(values),
            contentType: 'application/json',
            dataType: 'json',
            url: '/Usuario/SaveValues',
            success: function (result) {
                alert(result)
                alert('Datos guardados con exito!!');
                console.log("Hola");
            }
        })
}

/*function Login() {
    //var values = new Object();
    var login = {
        usuario : $('#UserName').val(),
        clave : $('#Password').val()
    };
    $.ajax({
        url: '/Usuario/LoginMethod',
        type: "POST",
        data: login,
        dataType: "json",
        success: function (result) {
            alert(result);
            if (result == "Fail") {
                alert("No se puede iniciar sesión")
                //alert(result);
                
            }
            else {
                window.location.href = "/Usuario/Default"
            }
        }
        /*error: function (result) {
            alert(result)
            alert("Error");
        }*/
    //});*/
//    var dataObject = { UserName: $("#UserName").val(), Password: $("#Password").val() };
//    $.ajax({
//        url: '@Url.Action("Login", "Usuario")',
//        type: "POST",
//        data: dataObject,
//        dataType: "json",
//        success: function (result) {
//            if (result.toString() == "Success") {
//                alert(result);
//            }
//            else {
//                alert(result);
//            }
//        },
//        error: function (result) {
//            alert("Error");
//        }
//}

function ChangePassword() {
    var pass = $("#pass").val();
    var newPass = $("#newPass").val();
    var confirmNewPass = $("#confirmNewPass").val();

    $.ajax({
        type: "POST",
        url: "/Usuario/ChangePassword", 
        data: { pass: pass, newPass: newPass, confirmNewPass: confirmNewPass },
        dataType: "json",
        success: function (result) {
            if (result == "fail") {
                if ("#newPass" != "#confirmNewPass") {
                    alert("Las contraseñas no coinciden")
                }
            }
            else {
                alert("La contraseña se cambio exitosamente!");
            }
        }
    })
    }

    function InicioSesion() {
        window.location.href = "/Usuario/Login"
    }

    function LoginRegister() {
        window.location.href = "/Usuario/CrearUsuario"
}

var Login = function () {
    var data = $("#login").serialize();
        console.log("Reconoce la funcion");
        //var data = $("#login").serialize();
        //var username = $("#UserName").val();
        //var pass = $("#Password").val();
        console.log("no entra")
        $.ajax({
            type: "POST",
            url: "/Usuario/LoginUser",
            data: data,
            success: function (result) {
                console.log("NO")
                if (result == "Fail") {
                    $("#login")[0].reset();
                    //$("#msg").show();
                    console.log("Wendy")
                }
                else {
                    console.log("Hola")
                    alert("Hola");
                    window.location.href = "/Usuario/Default";
                    //$("#msg").hide();
                }
            }
        })
    }



