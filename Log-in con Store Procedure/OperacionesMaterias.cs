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
    class OperacionesMaterias
    {
        public static int Operacion = 0;

        #region Listados

        public void Listado(DataGridView dgv)
        {

            try
            {
                MySqlDataAdapter da = new MySqlDataAdapter("verMaterias", Global.Conexion);
                DataSet ds = new DataSet();
                da.Fill(ds);
                dgv.DataSource = ds.Tables[0];
                dgv.Columns["idMateria"].Visible = false;
                dgv.Columns["idCurso"].Visible = true;
                dgv.Columns["idMateriaxCurso"].Visible = false;
                dgv.Columns["idProfxMateriaxCurso"].Visible = false;
                dgv.Columns["idProfesor"].Visible = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }

        public void ListadoProfxMatxCur(ComboBox IdCurso, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("verProfesorXMateriaXCurso", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Pcurso", IdCurso.SelectedValue);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar formulario");
            }
            Global.Conexion.Close();
        }

        public void ListadoMatxCur(ComboBox IdCurso, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("VerMateriaXCurso", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Pcurso", IdCurso.SelectedValue);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar formulario");
            }
            Global.Conexion.Close();
        }

        #endregion
        #region Agregar Materias.

        public void AgregarMateria(TextBox Nom, ComboBox Especialidad, int Estado, int Usuario)
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
            MySqlCommand comand = new MySqlCommand("insertar_materias", Global.Conexion, tran); //Nombre store
            comand.CommandType = CommandType.StoredProcedure;
            comand.Parameters.AddWithValue("m_nombre", Nom.Text);
            comand.Parameters.AddWithValue("m_idespecialidad", Especialidad.SelectedValue);
            comand.Parameters.AddWithValue("m_idestado", Estado);
            comand.Parameters.AddWithValue("m_idUsuario", Usuario);
            comand.ExecuteNonQuery();
            MessageBox.Show("Materia agregada");
            tran.Commit();

            Global.Conexion.Close();
        }

        public void AgrMatxCur(int idMateria, ComboBox IdCurso)
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
            MySqlCommand comand = new MySqlCommand("insertar_materiaxcurso", Global.Conexion, tran); //Nombre store
            comand.CommandType = CommandType.StoredProcedure;
            comand.Parameters.AddWithValue("idMateria", idMateria);
            comand.Parameters.AddWithValue("idCurso", IdCurso.SelectedValue);
            comand.ExecuteNonQuery();
            MessageBox.Show("Materia agregada");
            tran.Commit();

            Global.Conexion.Close();
        }

        public void AgrProfxMatxCur(int idProf, int idMateriaxCurso, int Estado, int Usuario)
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
            MySqlCommand comand = new MySqlCommand("insertar_profesorxmateriaxcurso", Global.Conexion, tran); //Nombre store
            comand.CommandType = CommandType.StoredProcedure;
            comand.Parameters.AddWithValue("pxmxc_idprofesor", idProf);
            comand.Parameters.AddWithValue("pxmxc_idmateriaxcurso", idMateriaxCurso);
            comand.Parameters.AddWithValue("pxmxc_idestado", Estado);
            comand.Parameters.AddWithValue("pxmxc_idUsuario", Usuario);
            comand.ExecuteNonQuery();
            MessageBox.Show("Profesor agregada");
            tran.Commit();
            Global.Conexion.Close();
        }

        #endregion
        #region Modificar Materias.

        public void ModificarMateria(int Id, TextBox Nom, ComboBox Especialidad, int Estado, int Usuario)
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
            MySqlCommand comand = new MySqlCommand("modificar_materia", Global.Conexion, tran); //Nombre store
            comand.CommandType = CommandType.StoredProcedure;
            comand.Parameters.AddWithValue("m_idmateria", Id);
            comand.Parameters.AddWithValue("m_nombre", Nom.Text);
            comand.Parameters.AddWithValue("m_idespecialidad", Especialidad.SelectedValue);
            comand.Parameters.AddWithValue("m_idestado", Estado);
            comand.Parameters.AddWithValue("m_idUsuario", Usuario);
            comand.ExecuteNonQuery();
            MessageBox.Show("Materia modificada");
            tran.Commit();

            Global.Conexion.Close();
        }

        public void ModificarMateriaxCurso(int idmateriaxcurso, int idMateria, ComboBox Curso, int Estado, int Usuario, bool m)
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
            MySqlCommand comand = new MySqlCommand("modificar_materiaxcurso", Global.Conexion, tran); //Nombre store
            comand.CommandType = CommandType.StoredProcedure;
            comand.Parameters.AddWithValue("mxc_idmateriaxcurso", idmateriaxcurso);
            comand.Parameters.AddWithValue("mxc_idmateria", idMateria);
            comand.Parameters.AddWithValue("mxc_idcurso", Curso.SelectedValue);
            comand.Parameters.AddWithValue("mxc_idestado", Estado);
            comand.Parameters.AddWithValue("mxc_idUsuario", Usuario);
            comand.ExecuteNonQuery();
            if (m == true) MessageBox.Show("Curso modificado");
            tran.Commit();

            Global.Conexion.Close();
        }

        public void ModificarProfesorxMateriaXCurso(int idprofesorxmateriaxcurso, int idprofesor, int idmateriaxcurso, int Estado, int Usuario, bool m)
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
            MySqlCommand comand = new MySqlCommand("modificar_profesorxmateriaxcurso", Global.Conexion, tran); //Nombre store
            comand.CommandType = CommandType.StoredProcedure;
            comand.Parameters.AddWithValue("pxmxc_idProfxMatexCurso", idprofesorxmateriaxcurso);
            comand.Parameters.AddWithValue("pxmxc_idprofesor", idprofesor);
            comand.Parameters.AddWithValue("pxmxc_idMateriaxCurso", idmateriaxcurso);
            comand.Parameters.AddWithValue("pxmxc_idestado", Estado);
            comand.Parameters.AddWithValue("pxmxc_idUsuario", Usuario);
            comand.ExecuteNonQuery();
            if (m == true) MessageBox.Show("Profesor modificado");
            tran.Commit();

            Global.Conexion.Close();
        }

        #endregion

        public void BuscarMaterias(TextBox nom, ComboBox Especialidad, ComboBox Curso, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("Buscar_materia", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("Pmateria", nom.Text);
                cmd.Parameters.AddWithValue("Pespecialidad", Especialidad.SelectedText);
                cmd.Parameters.AddWithValue("Pcurso", Curso.SelectedText);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
                dgv.Columns["idMateria"].Visible = false;
                dgv.Columns["idCurso"].Visible = true;
                dgv.Columns["idMateriaxCurso"].Visible = false;
                dgv.Columns["idProfxMateriaxCurso"].Visible = false;
                dgv.Columns["idProfesor"].Visible = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar la materia.");
            }
            Global.Conexion.Close();
        }

        public void BuscarMateriasxEsp(TextBox nom, ComboBox Especialidad, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("Buscar_MateriaxEspecialidad", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("Pmateria", nom.Text);
                cmd.Parameters.AddWithValue("Pespecialidad", Especialidad.SelectedText);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar la materia.");
            }
            Global.Conexion.Close();
        }
    }
}
