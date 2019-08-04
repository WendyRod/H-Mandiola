using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace H_Mandiola.Models
{
    public class LoginModelClass
    {
        [Required(ErrorMessage = "Ingrese el usuario")]
        [Display(Name = "Ingrese el usuario")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Ingrese la contraseña")]
        [Display(Name = "Ingrese la contraseña")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}