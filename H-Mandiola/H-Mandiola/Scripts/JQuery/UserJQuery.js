$('#PregDiv').hide();
$('#RespDiv').hide();

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
                alert('Datos guardados con exito!!');
                console.log("Hola");
            }
        })
}

function ChangePassword() {
    var PASS = $("#pass").val();
    var NEWPASS = $("#newPass").val();
    var CONFIRMNEWPASS = $("#confirmNewPass").val();

    if (PASS == "" || NEWPASS == "" || CONFIRMNEWPASS =="") {
        alert("Complete todos los campos.");
    } else {
        
        $.ajax({
            type: "POST",
            url: "/Usuario/CambiarContraseñaUser", 
            data: { OldPass: PASS, newPass: NEWPASS, confirmPass: CONFIRMNEWPASS },
            dataType: "json",
            success: function (result) {
                if (result == "fail") {
                    $("#ChangePassForm")[0].reset();
                    alert("El cambio de contraseña falló");
                }
                else {
                    $("#ChangePassForm")[0].reset();
                    alert("Cambio de contraseña exitoso");
                    window.location.href = "/Usuario/Default"
                }
            }
        })
    }
}

    function Cancelar() {
        window.location.href = "/Usuario/Default"
    }

    function InicioSesion() {
        window.location.href = "/Usuario/Login"
    }

    function LoginRegister() {
        window.location.href = "/Usuario/CrearUsuario"
}

var Login = function () {
    var data = $("#loginF").serialize();
        //var data = $("#login").serialize();
        //var username = $("#UserName").val();
        //var pass = $("#Password").val();
        $.ajax({
            type: "POST",
            url: "/Usuario/LoginUser",
            data: data,
            success: function (result) {
                if (result == "Fail") {
                    $("#loginF")[0].reset();
                    //$("#msg").show();
                    console.log("Wendy")
                }
                else {
                    console.log("Hola");
                    window.location.href = "/Usuario/Default";
                    //$("#msg").hide();
                }
            }
        })
    }



