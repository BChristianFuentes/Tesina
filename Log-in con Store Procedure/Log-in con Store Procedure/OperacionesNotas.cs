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
    class OperacionesNotas
    {
        public void BuscarNotasxAlumno(string nom, string ap, int curso, int ciclo, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("verNotasXAlumnoXCurso ---Pivot", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("Pnombre", nom);
                cmd.Parameters.AddWithValue("Papellido", ap);
                cmd.Parameters.AddWithValue("Pcurso", curso + 1);
                cmd.Parameters.AddWithValue("Pciclolectivo", ciclo + 2018);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar notas");
            }
            Global.Conexion.Close();
        }

        public void BuscarNotasxMateria(string materia, ComboBox curso, ComboBox ciclo, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("verNotaXMateriaXCurso---Pivot", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("Pmateria", materia);
                cmd.Parameters.AddWithValue("Pcurso", curso.SelectedIndex + 1);
                cmd.Parameters.AddWithValue("Pciclolectivo", ciclo.SelectedIndex + 2018);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar notas");
            }
            Global.Conexion.Close();
        }

        public void InsertarNotas(int ciclo, int idCurso, int idAXC, int idMXC, int idtrimestre, int nota, int idPXMXC, int idUsuario, int idEstado)
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
                MySqlCommand cmd = new MySqlCommand("insertar_nota", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("n_ciclolectivo", ciclo);
                cmd.Parameters.AddWithValue("n_idCurso", idCurso);
                cmd.Parameters.AddWithValue("n_idAlumxCurso", idAXC);
                cmd.Parameters.AddWithValue("n_idMateriaxCurso", idMXC);
                cmd.Parameters.AddWithValue("n_idTrimestreNota", idtrimestre);
                cmd.Parameters.AddWithValue("n_Calificacion", nota);
                cmd.Parameters.AddWithValue("n_idProfxMatexCurso", idPXMXC);
                cmd.Parameters.AddWithValue("n_idUsuario", idUsuario);
                cmd.Parameters.AddWithValue("n_idEstado", idEstado);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Nota insertada");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al insertar nota");
            }
            Global.Conexion.Close();
        }

        public void ModificarNotas(int idnota, int ciclo, int idCurso, int idAXC, int idMXC, int idtrimestre, int nota, 
                                    int idPXMXC, int idUsuario, int idEstado)
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
                MySqlCommand cmd = new MySqlCommand("insertar_nota", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("n_idNotas", idnota);
                cmd.Parameters.AddWithValue("n_idCurso", idCurso);
                cmd.Parameters.AddWithValue("n_idAlumxCurso", idAXC);
                cmd.Parameters.AddWithValue("n_idMateriaxCurso", idMXC);
                cmd.Parameters.AddWithValue("n_idTrimestreNota", idtrimestre);
                cmd.Parameters.AddWithValue("n_Calificacion", nota);
                cmd.Parameters.AddWithValue("n_idProfxMatexCurso", idPXMXC);
                cmd.Parameters.AddWithValue("n_idUsuario", idUsuario);
                cmd.Parameters.AddWithValue("n_idEstado", idEstado);
                cmd.Parameters.AddWithValue("n_ciclolectivo", ciclo);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Nota modificada");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al modificar nota");
            }
            Global.Conexion.Close();
        }

        public void verNotaxAlumno(DataGridView dgv, int idalumno)
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
                MySqlCommand cmd = new MySqlCommand("verNotaxAlumnoxCursov2", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("PidAlumno", idalumno);
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

        public void ModNotas(int idnota, int nota)
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
                MySqlCommand cmd = new MySqlCommand("ModificarCalificacion", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("PidNota", idnota);
                cmd.Parameters.AddWithValue("Pcalificacion", nota);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Nota modificada");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al modificar nota");
            }
            Global.Conexion.Close();
        }
    }
}
