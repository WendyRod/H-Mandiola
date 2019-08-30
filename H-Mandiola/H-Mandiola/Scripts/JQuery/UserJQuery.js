$("#pregunta").hide();
$("#respuesta").hide();
$("#lblRespuesta").hide();
$("#btnSalir").hide();

function Register() {
    var values = new Object();
    values.nombre = $("#name").val();
    values.apellido1 = $("#surname1").val();
    values.apellido2 = $("#surname2").val();
    values.username = $("#username").val();
    values.clave = $("#password").val();
    values.confirmPass = $("#confirm_password").val();
    values.email = $("#email").val();

    if (values.nombre == "" || values.apellido1 == "" || values.apellido2 == "" || values.username == "" || values.clave == "" || values.email == "") {
        alert("Complete todos los campos.");
    } else if (values.clave != values.confirmPass) {
        alert("La contraseña y la confirmación de la contraseña no coinciden");
    }

    $.ajax({
        type: 'POST',
        data: JSON.stringify(values),
        contentType: 'application/json',
        dataType: 'json',
        url: "/Usuario/SaveValues",
        success: function (response) {
            if (response.success) {
                alert(response.responseText);
                window.location.href = "/Usuario/LoginAdmin"
            } else {
                alert(response.responseText);
            }
        },
        error: function (response) {
            alert("Error!");
        }
    })
}

function RegisterCliente() {
    var values = new Object();
    values.nombre       = $("#name").val();
    values.apellido1    = $("#surname1").val();
    values.apellido2    = $("#surname2").val();
    values.username     = $("#username").val();
    values.clave        = $("#password").val();
    values.confirmPass = $("#confirm_password").val();
    values.email = $("#email").val();
    values.pregunta     = "Color" //$("#pregunta").val();
    values.respuesta    = "Azul" //$("#respuesta").val();
    values.estado       = 1;

    if (values.nombre == "" || values.apellido1 == "" || values.apellido2 == "" || values.username == "" || values.clave == "" || values.email == "") {
        alert("Complete todos los campos.");
    }
    else if (values.clave != values.confirmPass) {
        alert("La contraseña y la confirmación de la contraseña no coinciden");
    }
    else {
        $.ajax({
            type: 'POST',
            data: JSON.stringify( values ),
            contentType: 'application/json',
            dataType: 'json',
            url: "/Cliente/Inserta_Cliente",
            success: function (response) {
                if (response.success) {
                    //alert(response.responseText);
                    window.location.href = "/Cliente/LoginCliente";
                } else {
                    alert(response.responseText);
                }
            },
            error: function (response) {
                alert("¡Error! " + response);
            }
        });
    }
}

function ChangePassword() {

    var oldPass = $('#pass').val();
    var newPass = $('#newPass').val();
    var confirmPass = $('#confirmNewPass').val();
    if (oldPass == "" || newPass == "" || confirmPass == "") {
        alert("No se han brindado los datos necesarios.")
    }
    else {
        $.ajax({
            type: 'POST',
            url: "/Usuario/CambiarClaveUser",
            data: JSON.stringify({ OldPass: oldPass, NewPass: newPass, ConfirmPass: confirmPass }),
            contentType: 'application/json',
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    alert(response.responseText);
                    //window.location.href = "/Usuario/Default"
                } else {
                    alert(response.responseText);
                }
            },
            error: function (response) {
                alert("Error.");
            }
        })
    }
}

function Cancelar() {
    window.location.href = "/Usuario/Default"
}

function CancelarClientRegister() {
    window.location.href = "/Cliente/LoginCliente"
}

function LoginRegister() {
    window.location.href = "/Usuario/CrearUsuarioAdmin"
}

function LoginRegisterClient() {
    window.location.href = "/Cliente/CrearCliente"
}

function LoginAdminView() {
    window.location.href = "/Usuario/LoginAdmin"
}

function LoginClientView() {
    window.location.href = "/Cliente/LoginCliente"
}

var LoginCliente = function () {
    var data = $("#loginF").serialize();
    $.ajax({
        type: "POST",
        url: "/Cliente/LoginCliente",
        data: data,
        success: function (result) {
            if (result == "Fail") {
                $("#loginF")[0].reset();
                //$("#msg").show();
            }
            else {
                window.location.href = "/Cliente/Inicio";
                $("#btnInicio").hide();
                $("#btnSalir").show();
                //$("#msg").hide();
            }
        }
    })
}

var LoginAdmin = function () {
    var data = $("#loginF").serialize();
    $.ajax({
        type: "POST",
        url: "/Usuario/LoginAdmin",
        data: data,
        success: function (result) {
            if (result == "Fail") {
                $("#loginF")[0].reset();
                //$("#msg").show();
            }
            else {
                window.location.href = "/Usuario/Default";
                $("#btnInicio").hide();
                $("#btnSalir").show();
                //$("#msg").hide();
            }
        }
    })
}

function CerrarSesionAdmin() {
    window.location.href = "/Usuario/Login"
    $("#btnSalir").hide();
    $("#btnInicio").show();
}

function CerrarSesionCliente() {
    window.location.href = "/Usuario/Login"
    $("#btnSalir").hide();
    $("#btnInicio").show();
}




