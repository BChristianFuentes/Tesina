using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;
using System.Windows.Forms;

namespace Log_in_con_Store_Procedure
{
    class Usuarios
    {
        public static int Id { get; set; }
        public static string Nombre { get; set; }
        public static string Apellido { get; set; }
        public static string Contraseña { get; set; }
        public static int Cargo { get; set; }
        public void BuscarUsuario(TextBox Nombre, TextBox Apellido, DataGridView dgv)
        {
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
            }
            try
            {
                MySqlCommand cmd = new MySqlCommand("BUSCARUSUARIO", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("pNom", Nombre.Text);
                cmd.Parameters.AddWithValue("pApe", Apellido.Text);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al mostrar los datos");
            }
            Global.Conexion.Close();
        }

        public void AgregarUsuario(int IdMod, string nom, string ape, string contr, int cmbCargo)
        {
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
            }
            MySqlTransaction tran = Global.Conexion.BeginTransaction();
            try
            {
                MySqlCommand comand = new MySqlCommand("INSERTAR_USUARIO", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("pIdUsuaModif", IdMod);
                comand.Parameters.AddWithValue("Pnom", nom);
                comand.Parameters.AddWithValue("Pape", ape);
                comand.Parameters.AddWithValue("Pctra", contr);
                comand.Parameters.AddWithValue("Pidcar", cmbCargo);

                comand.ExecuteNonQuery();


                MessageBox.Show("Usuario agregado");

                tran.Commit();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message,"No se agregó el usuario");
                tran.Rollback();
            }
            Global.Conexion.Close();
        }
        public bool ModificarUsuario(int IdUsu ,int IDModif, TextBox txtNom, TextBox txtApel, TextBox txtCon, int Cargo, int Estado)
        {
            bool hecho = false;
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
            }
            MySqlTransaction tran = Global.Conexion.BeginTransaction();
            try
            {
                MySqlCommand comand = new MySqlCommand("ModificarUsuario", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("pidUsu", IdUsu);
                comand.Parameters.AddWithValue("pnom", txtNom.Text);
                comand.Parameters.AddWithValue("pape", txtApel.Text);
                comand.Parameters.AddWithValue("pcontra", txtCon.Text);
                comand.Parameters.AddWithValue("pest", Estado);
                comand.Parameters.AddWithValue("pcar", Cargo);
                comand.Parameters.AddWithValue("pIdUsuaModif", IDModif);

                comand.ExecuteNonQuery();

                
                tran.Commit();
                Global.Conexion.Close();
                hecho = true;
                return hecho;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se modificó el usuario");
                tran.Rollback();
                Global.Conexion.Close();
                return hecho;
            }
            
        }
        public void EliminarUsuario(int UsuarioDel, int IdUsuario)
        {
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
            }
            MySqlTransaction tran = Global.Conexion.BeginTransaction();
            try
            {
                MySqlCommand comand = new MySqlCommand("eliminarusuario", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("pIdUsua", UsuarioDel);
                comand.Parameters.AddWithValue("pidUsuario", IdUsuario);

                comand.ExecuteNonQuery();
                tran.Commit();
                Global.Conexion.Close();
                MessageBox.Show("Se eliminó el usuario");

                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message,"No se eliminó el usuario");
                tran.Rollback();
                Global.Conexion.Close();
            }
            
        }
        public bool Login(TextBox usuario, TextBox contraseña)
        {
            
            bool verf = false;
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
                Global.Conexion.Close();
            }
            try
            {
                MySqlCommand cmd = new MySqlCommand("LOGIN_USUARIO", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("pUsuar", usuario.Text);
                cmd.Parameters.AddWithValue("pContr", contraseña.Text);

                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                Global.Conexion.Close();
                if (dt.Rows.Count>0)
                {
                    DataRow datos = dt.Rows[0];
                    if (datos["Usuario"].ToString() == usuario.Text)
                    {
                        verf = true;
                        Usuarios.Id = Convert.ToInt32(datos["Id"]);
                        Usuarios.Cargo = Convert.ToInt32(datos["Cargo"]);
                        return verf;
                    }
                    return verf;
                }
                else
                {
                    return verf;
                }

            }
            catch(Exception)
            {
                return verf;
            }

        }
        public void AgregarMotivos(string Asis, int Comp, float Valor, int idSub, int idEve, TextBox desc, TextBox obs)
        {
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
            }
            MySqlTransaction tran = Global.Conexion.BeginTransaction();
            try
            {
                MySqlCommand comand = new MySqlCommand("INGRESAR_MOTIVO", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("pasist", Asis);
                comand.Parameters.AddWithValue("pcompu", Comp);
                comand.Parameters.AddWithValue("pvalorasist", Valor);
                comand.Parameters.AddWithValue("pidsubmotivo", idSub);
                comand.Parameters.AddWithValue("pidevento", idEve);
                comand.Parameters.AddWithValue("pDescri", desc.Text);
                comand.Parameters.AddWithValue("pObse", obs.Text);
                comand.ExecuteNonQuery();


                MessageBox.Show("Se agregó el motivo");

                tran.Commit();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message,"No se agregó el motivo");
                tran.Rollback();
            }
            Global.Conexion.Close();
        }
        public void ModificarMotivos(int idMot, string Asis, int Comp, float Valor, int idSub, int idEve, int idUsu, TextBox desc, TextBox obs)
        {
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
            }
            MySqlTransaction tran = Global.Conexion.BeginTransaction();
            try
            {
                MySqlCommand comand = new MySqlCommand("modificar_motivo", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("pidmotivo", idMot);
                comand.Parameters.AddWithValue("pasist", Asis);
                comand.Parameters.AddWithValue("pcompu", Comp);
                comand.Parameters.AddWithValue("pvalorasist", Valor);
                comand.Parameters.AddWithValue("pidsubmotivo", idSub);
                comand.Parameters.AddWithValue("pidevento", idEve);
                comand.Parameters.AddWithValue("pIdUsuaModif", idUsu);
                comand.Parameters.AddWithValue("pdescrip", desc.Text);
                comand.Parameters.AddWithValue("pObse", obs.Text);

                comand.ExecuteNonQuery();


                MessageBox.Show("Se modificó el motivo");

                tran.Commit();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se modificó el motivo");
                tran.Rollback();
            }
            Global.Conexion.Close();
        }
        public void EliminarMotivos(int idMot, int idUsu)
        {
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
            }
            MySqlTransaction tran = Global.Conexion.BeginTransaction();
            try
            {
                MySqlCommand comand = new MySqlCommand("eliminar_motivo", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("pIdMotivo", idMot);
                comand.Parameters.AddWithValue("pidUsuario", idUsu);

                comand.ExecuteNonQuery();


                MessageBox.Show("Se eliminó el motivo");

                tran.Commit();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se eliminó el motivo");
                tran.Rollback();
            }
            Global.Conexion.Close();
        }
        public void AgregarAlertas(TextBox Des, TextBox Tipo)
        {

        }
        public void ModificarAlertas(TextBox Id, TextBox Des, TextBox Tipo)
        {

        }
        public void EliminarAlertas(TextBox Id)
        {

        }
        public void CambiarTrimestres(string fecha1, string fecha2, string fecha3, string fecha4, string fecha5, string fecha6, int ciclo)
        {
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
            }
            MySqlTransaction tran = Global.Conexion.BeginTransaction();
            try
            {
                MySqlCommand comand = new MySqlCommand("insertar trimestre", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("pfechea1", fecha1);
                comand.Parameters.AddWithValue("pfecha2", fecha2);
                comand.Parameters.AddWithValue("pfecha3", fecha3);
                comand.Parameters.AddWithValue("pfecha4", fecha4);
                comand.Parameters.AddWithValue("pfecha5", fecha5);
                comand.Parameters.AddWithValue("pfecha6", fecha6);
                comand.Parameters.AddWithValue("pciclo", ciclo);

                comand.ExecuteNonQuery();


                //MessageBox.Show("El inicio y fin de cada trimestre fue cambiado");

                tran.Commit();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se cambiaron los trimestres");
                tran.Rollback();
            }
            Global.Conexion.Close();
        }

        public void MostrarMotivos(DataGridView dgv)
        {
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
            }
            MySqlTransaction tran = Global.Conexion.BeginTransaction();
            try
            {
                MySqlCommand cmd = new MySqlCommand("MostrarMotivos", Global.Conexion, tran);
                cmd.CommandType = CommandType.StoredProcedure;

                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;

                cmd.ExecuteNonQuery();
                
                tran.Commit();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se Mostraron los motivos");
                tran.Rollback();
            }
            Global.Conexion.Close();
        }
    }
}
