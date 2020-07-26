using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace Log_in_con_Store_Procedure
{
    class OperacionesProfesores
    {
        public static string Nombre { get; set; }
        public static string Apellido { get; set; }
        public static string FechaNacimiento { get; set; }
        public static string Mail { get; set; }
        public static int Telefono { get; set; }
        public static int TipoDeDocumento { get; set; }
        public static int Documento { get; set; }

        public void Agregar(/*int IDModif*/ TextBox Nom, TextBox Apel, 
            string Nac, int Tel, TextBox Mail, int Doc, ComboBox TipoDoc, ComboBox Estado, int usuario)
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
            MySqlCommand comand = new MySqlCommand("INSERTAR_PROFESOR", Global.Conexion, tran); //Nombre store
            comand.CommandType = CommandType.StoredProcedure;
            //comand.Parameters.AddWithValue("pIdUsuaModif", IDModif);
            comand.Parameters.AddWithValue("I_nombre", Nom.Text);
            comand.Parameters.AddWithValue("I_apellido", Apel.Text);
            comand.Parameters.AddWithValue("I_fechanac", Nac);
            comand.Parameters.AddWithValue("I_telefono", Tel);
            comand.Parameters.AddWithValue("I_mail", Mail.Text);
            comand.Parameters.AddWithValue("I_documento", Doc);
            comand.Parameters.AddWithValue("I_idtipodoc", TipoDoc.SelectedValue);
            comand.Parameters.AddWithValue("I_idestado", Estado.SelectedValue);
            comand.Parameters.AddWithValue("I_idUsuario", usuario);
            comand.ExecuteNonQuery();
            MessageBox.Show("Profesor agregado");
            tran.Commit();

            Global.Conexion.Close();
        }

        public bool Modificar(/*int IDModif,*/ TextBox IDProf, TextBox Nom, TextBox Apel, String Nac, int Tel, TextBox Mail, int Doc, ComboBox TipoDoc, ComboBox Estado)
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
                MySqlCommand comand = new MySqlCommand("modificar_profesores", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                //comand.Parameters.AddWithValue("pIdUsuaModif", IDModif);
                comand.Parameters.AddWithValue("p_idprofesor", Convert.ToInt32(IDProf.Text));
                comand.Parameters.AddWithValue("p_nombre", Nom.Text);
                comand.Parameters.AddWithValue("p_apellido", Apel.Text);
                comand.Parameters.AddWithValue("p_FecNac", Nac);
                comand.Parameters.AddWithValue("p_telefono", Tel);
                comand.Parameters.AddWithValue("p_mail", Mail.Text);
                comand.Parameters.AddWithValue("p_documento", Doc);
                comand.Parameters.AddWithValue("p_idtipodocumento", TipoDoc.SelectedValue);
                comand.Parameters.AddWithValue("p_idestado", Estado.SelectedValue);


                comand.ExecuteNonQuery();



                tran.Commit();
                Global.Conexion.Close();
                hecho = true;
                return hecho;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo modificar al profesor");
                tran.Rollback();
                Global.Conexion.Close();
                return hecho;
            }

        }

        public void Eliminar(int id)
        {
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexin");
                Global.Conexion.Close();
            }
            MySqlTransaction tran = Global.Conexion.BeginTransaction();
            try
            {
                MySqlCommand comand = new MySqlCommand("borrar_profesor", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("p_idprofesor", id);

                comand.ExecuteNonQuery();
                tran.Commit();
                Global.Conexion.Close();
                MessageBox.Show("Profesor borrado");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo borrar al profesor");
                tran.Rollback();
                Global.Conexion.Close();
            }
        }

        public void BuscarProf(TextBox nom, TextBox doc, TextBox ap, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("Buscar_Profesor", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("Pnombre", nom.Text);
                cmd.Parameters.AddWithValue("Pdocumento", doc.Text);
                cmd.Parameters.AddWithValue("Papellido", ap.Text);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al Profesor");
            }
            Global.Conexion.Close();
        }

        public void ListadoProf(DataGridView dgv)
        {
            
            try
            {
                MySqlDataAdapter da = new MySqlDataAdapter("select * from profesores where id_estado != 9", Global.Conexion);
                DataSet ds = new DataSet();
                da.Fill(ds);
                dgv.DataSource = ds.Tables[0];
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }

        public void ProfxMateriaxCurso(/*int IDModif*/ TextBox Nom, TextBox Apel, string Nac, int Tel, TextBox Mail, int Doc, ComboBox TipoDoc, ComboBox Estado)
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
            MySqlCommand comand = new MySqlCommand("INSERTAR_PROFESOR", Global.Conexion, tran); //Nombre store
            comand.CommandType = CommandType.StoredProcedure;
            //comand.Parameters.AddWithValue("pIdUsuaModif", IDModif);
            comand.Parameters.AddWithValue("I_nombre", Nom.Text);
            comand.Parameters.AddWithValue("I_apellido", Apel.Text);
            comand.Parameters.AddWithValue("I_fechanac", Nac);
            comand.Parameters.AddWithValue("I_telefono", Tel);
            comand.Parameters.AddWithValue("I_mail", Mail.Text);
            comand.Parameters.AddWithValue("I_documento", Doc);
            comand.Parameters.AddWithValue("I_idtipodoc", TipoDoc.SelectedValue);
            comand.Parameters.AddWithValue("I_idestado", Estado.SelectedValue);
            comand.ExecuteNonQuery();
            MessageBox.Show("Profesor agregado");
            tran.Commit();

            Global.Conexion.Close();
        }
    }
}
