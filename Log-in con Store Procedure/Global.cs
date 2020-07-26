using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace Log_in_con_Store_Procedure
{
     public class Global
     {
        //public static MySqlConnection Conexion = new MySqlConnection("server=localhost; database=14-11; Uid=root; password=; SslMode=none; Allow Zero Datetime=False;Convert Zero Datetime=True;Persist Security Info=True");
        public static MySqlConnection Conexion = new MySqlConnection("server=192.168.0.101; database=bd2; Uid=C#; password=123456; SslMode=none; Allow Zero Datetime=False;Convert Zero Datetime=True;Persist Security Info=True");
        public static int SeleccionarABM = 0;
        public static int AgregarOModificar = 0;
        public static int AgregarOModificarProf = 0;
        public static int Cargo = 0;
        public static int informe = 0;
        public static int Evento = 0;
        public static int Modificar = 0;
        //SE EDITA ESTA.
     }
}
