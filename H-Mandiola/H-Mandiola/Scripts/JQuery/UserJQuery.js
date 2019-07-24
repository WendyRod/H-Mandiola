
function Register() {
    var values = new Object();
    //values.cedula = $('#cedula').val();
    values.nombre = $('#name').val();
    values.apellido1 = $('#surname1').val();
    values.apellido2 = $('#surname2').val();
    values.username = $('#username').val();
    values.clave = $('#password').val();
    values.confirmPass = $('#confirm_password').val
    values.email = $('#email').val();
    
    if (nombre == "" || apellido1 == "" || apellido2 == "" || username == "" || clave == "" || email == "") {
        alert("Complete todos los campos");
    } else if (clave != confirmPass) {
        alert("La contraseña y la confirmación de la contraseña no coinciden");
        return false;
    } else {
        return true;
    }
        $.ajax({
            type: 'POST',
            data: JSON.stringify(values),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            url: '/Usuario/SaveValues',
            success: function (result) {
                alert('Datos guardados con exito!!');
            }
        })
}

function Login() {
    var values = new Object();
    values.nombre = $('#UserName').val();
    values.apellido1 = $('#Password').val();
    $.ajax({
        url: '/Usuario/LoginMethod',
        type: "POST",
        data: JSON.stringify(values),
        dataType: "json",
        success: function (result) {
            if (result.toString() == "Success") {
                alert(result);
                window.location.href = "/Usuario/Default"
            }
            else {
                alert(result);
            }
        },
        error: function (result) {
            alert("Error");
        }
    });
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
}

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

function LoginRegistrese() {
    window.location.href = "/Usuario/CrearUsuario"
}



