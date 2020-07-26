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
    class OperacionesAlumnos
    {
        public static string Nombre { get; set; }
        public static string Apellido { get; set; }
        public static string FechaDeNacimiento { get; set; }
        public static int Telefono { get; set; }
        public static int TipoDeDocumento { get; set; }
        public static int Documento { get; set; }
        public void Agregar(int IDModif, TextBox Nom, TextBox Apel, String Nac, int Tel, ComboBox TipoDoc, int Doc, ComboBox IdCurso, int CicloL, TextBox Obs)
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
            //try
            //{
            MySqlCommand comand = new MySqlCommand("INGRESAR_ALUMNO", Global.Conexion, tran);
            comand.CommandType = CommandType.StoredProcedure;
            comand.Parameters.AddWithValue("pIdUsuaModif", IDModif);
            comand.Parameters.AddWithValue("pnom", Nom.Text);
            comand.Parameters.AddWithValue("pape", Apel.Text);
            comand.Parameters.AddWithValue("pfenac", Nac);
            comand.Parameters.AddWithValue("ptel", Tel);
            comand.Parameters.AddWithValue("ptdoc", TipoDoc.SelectedValue);
            comand.Parameters.AddWithValue("pndoc", Doc);
            comand.Parameters.AddWithValue("pIdCur", IdCurso.SelectedValue);
            comand.Parameters.AddWithValue("pCic", CicloL);
            comand.Parameters.AddWithValue("pobs", Obs.Text);
            comand.ExecuteNonQuery();
            MessageBox.Show("Alumno agregado");
            tran.Commit();
            /*}
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message,"No se pudo agregar al alumno");
                tran.Rollback();
            }*/
            Global.Conexion.Close();
        }
        //Pache Inicio
        public bool modificar(int IDModif, TextBox IDAlum, TextBox Nom, TextBox Apel, String Nac, int Tel, ComboBox TipoDoc, int Doc, ComboBox Estado, TextBox Obs)
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
                MySqlCommand comand = new MySqlCommand("MODIFICAR_ALUMNO", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("pIdUsua", IDModif);
                comand.Parameters.AddWithValue("pIdAlum", Convert.ToInt32(IDAlum.Text));
                comand.Parameters.AddWithValue("pNom", Nom.Text);
                comand.Parameters.AddWithValue("pApe", Apel.Text);
                comand.Parameters.AddWithValue("pTipodoc", TipoDoc.SelectedValue);
                comand.Parameters.AddWithValue("pNumDoc", Doc);
                comand.Parameters.AddWithValue("pTel", Tel);
                comand.Parameters.AddWithValue("pFech", Nac);
                comand.Parameters.AddWithValue("pIdEsta", Estado.SelectedValue);
                comand.Parameters.AddWithValue("pObse", Obs.Text);


                comand.ExecuteNonQuery();



                tran.Commit();
                Global.Conexion.Close();
                hecho = true;
                return hecho;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo modificar al alumno");
                tran.Rollback();
                Global.Conexion.Close();
                return hecho;
            }

        }
        //Pache Fin

        public bool modificarAluxCurso(int idUsuario, TextBox IDAlum, int Ciclo, ComboBox Curso)
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
                MySqlCommand comand = new MySqlCommand("MODIFICAR_AlumnoXCurso", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("pIdAlum", Convert.ToInt32(IDAlum.Text));
                comand.Parameters.AddWithValue("pIdUsua", idUsuario);
                comand.Parameters.AddWithValue("pIdCur", Curso.SelectedValue);
                comand.Parameters.AddWithValue("pAnio", Ciclo);


                comand.ExecuteNonQuery();
                tran.Commit();
                Global.Conexion.Close();
                hecho = true;
                return hecho;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo modificar al alumno");
                tran.Rollback();
                Global.Conexion.Close();
                return hecho;
            }

        }

        public void eliminar(int delet, int idUsu)
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
                MySqlCommand comand = new MySqlCommand("ELIMINARALUMNO", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("pidAlumno", delet);
                comand.Parameters.AddWithValue("pidUsuario", idUsu);

                comand.ExecuteNonQuery();
                tran.Commit();
                Global.Conexion.Close();
                MessageBox.Show("Alumno borrado");



            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo borrar al alumno");
                tran.Rollback();
                Global.Conexion.Close();
            }
            //Global.Conexion.Close();
        }
        public void InformeAlumnocuanti(TextBox nom, TextBox apel, String desde, String hasta, TextBox doc, DataGridView tabla)
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
                MySqlCommand comand = new MySqlCommand("InformeAlumnoCuantitavo", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pNom", nom.Text);
                comand.Parameters.AddWithValue("pApe", apel.Text);
                comand.Parameters.AddWithValue("pFechaMin", desde);
                comand.Parameters.AddWithValue("pFechaMax", hasta);
                comand.Parameters.AddWithValue("pNumDoc", doc.Text);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                tabla.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }
        public void InformeAlumnoCuali(string nom, string ape, String fecha1, String fecha2, DataGridView dgv)
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
                MySqlCommand comand = new MySqlCommand("LISTATOALUMNOCUALITATIVOm", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pbuscarnombre", nom);
                comand.Parameters.AddWithValue("pbuscarapellido", ape);
                comand.Parameters.AddWithValue("pfecha1", fecha1);
                comand.Parameters.AddWithValue("pfecha2", fecha2);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }
        public void InformeCurso(ComboBox curso, int ciclo, String desde, String hasta, DataGridView dtg)
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
                MySqlCommand comand = new MySqlCommand("LISTADOXCURSOCUANTIm", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pidcurso", Convert.ToInt32(curso.SelectedValue));
                //comand.Parameters.AddWithValue("pbuscarciclo", ciclo);
                comand.Parameters.AddWithValue("pfecha1", desde);
                comand.Parameters.AddWithValue("pfecha2", hasta);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dtg.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }
        public void ListadoCursoPorDiv(int ciclo, ComboBox cur, ComboBox submotivo, String fecha, DataGridView dtv)
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
                MySqlCommand cmd = new MySqlCommand("LISTADOxCURSO", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("pciclo", ciclo);
                cmd.Parameters.AddWithValue("paxc", cur.SelectedValue);
                cmd.Parameters.AddWithValue("psubmotivo", submotivo.SelectedValue);
                cmd.Parameters.AddWithValue("pbuscarfache", fecha);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dtv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el listado");
            }
            Global.Conexion.Close();
        }
        public void TomarAsistencia(int IdAlumxcurso, int IdUser, ComboBox IdMot, string Fecha, MaskedTextBox Hora, TextBox PJust, TextBox PObser, ComboBox SubMot, ComboBox Curso, int Evento)
        {
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
            }
            //try
            //{
            MySqlCommand comand = new MySqlCommand("REGISTROASISTENCIA", Global.Conexion);
            comand.CommandType = CommandType.StoredProcedure;
            comand.Parameters.AddWithValue("pidAlumnxcurso", IdAlumxcurso);
            comand.Parameters.AddWithValue("pidUsuarios", IdUser);
            comand.Parameters.AddWithValue("pidMotivos", IdMot.SelectedValue);
            comand.Parameters.AddWithValue("pfecha", Fecha);
            comand.Parameters.AddWithValue("phora", Hora.Text);
            comand.Parameters.AddWithValue("pjustificados", PJust.Text);
            comand.Parameters.AddWithValue("pobservaciones", PObser.Text);
            comand.Parameters.AddWithValue("psubmotivos", SubMot.SelectedValue);
            comand.Parameters.AddWithValue("pcursos", Curso.SelectedValue);
            comand.Parameters.AddWithValue("pEvento", Evento);
            comand.ExecuteNonQuery();
            /*}
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message,"Error al tomar asistencia");
            }*/
            Global.Conexion.Close();
        }
        public void ModificarAsistencia(int IdSeg, int IdUser, int IdMot, int IdSubMot, int idAlumxcurso, ComboBox Curso, String Fecha, MaskedTextBox Hora)
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
                MySqlCommand comand = new MySqlCommand("MODIFICARASISTENCIA2", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("pIdseg", IdSeg);
                comand.Parameters.AddWithValue("pidUsuarios", IdUser);
                comand.Parameters.AddWithValue("pidMotivos", IdMot);
                comand.Parameters.AddWithValue("pidSubmotivo", IdSubMot);
                comand.Parameters.AddWithValue("pidAlumnxcurso", idAlumxcurso);
                comand.Parameters.AddWithValue("pjustificados", "asdsadas");
                comand.Parameters.AddWithValue("pobservaciones", "adadsa");
                comand.Parameters.AddWithValue("pcursos", Curso.SelectedValue);
                comand.Parameters.AddWithValue("pfecha", Fecha);
                comand.Parameters.AddWithValue("phora", Hora.Text);
                comand.ExecuteNonQuery();
                MessageBox.Show("Asistencia modificada");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al modificar asistencia");
            }
            Global.Conexion.Close();
        }
        public void BuscarAlumno(TextBox alum, TextBox apel, TextBox Doc, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("BUSCARALUMNO", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("pNom", alum.Text);
                cmd.Parameters.AddWithValue("pApe", apel.Text);
                cmd.Parameters.AddWithValue("pNumDoc", Doc.Text);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }
        public void ListadoReincorporacionHecha(int curso, int ciclo, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("Reincorporacion echa", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("pidcurso", curso);
                cmd.Parameters.AddWithValue("pciclo", ciclo);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }
        public void ListadoReincorporacionPendiente(int curso, int ciclo, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("Reincorporacion pendiente", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("pidcurso", curso);
                cmd.Parameters.AddWithValue("pciclo", ciclo);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }
        public void ReincorporarAlumnos(int IdRein, int IdUsuario)
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
                MySqlCommand cmd = new MySqlCommand("REINCORPORAR", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("pIdrein", IdRein);
                cmd.Parameters.AddWithValue("pIdUsua", IdUsuario);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }

        public void Impresion(int IdRein, int IdUsuario)
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
                MySqlCommand cmd = new MySqlCommand("IMPRESION", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("pIdrein", IdRein);
                cmd.Parameters.AddWithValue("pIdUsua", IdUsuario);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }


        public void InformeAlumnocuantiDOE(TextBox buscnom, TextBox buscapel, int busciclo, String fecha1, String fecha2, DataGridView tabla)
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
                MySqlCommand comand = new MySqlCommand("LISTADOxALUMNOCUANTIDOEm", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pbuscarnombre", buscnom.Text);
                comand.Parameters.AddWithValue("pbuscarapellido", buscapel.Text);
                comand.Parameters.AddWithValue("pbuscarciclo", busciclo);
                comand.Parameters.AddWithValue("pfecha1", fecha1);
                comand.Parameters.AddWithValue("pfecha2", fecha2);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                tabla.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }

        public void InformeCursocuantiDOE(ComboBox curs, String fecha1, String fecha2, DataGridView dgv)
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
                MySqlCommand comand = new MySqlCommand("LISTADOXCURSOCUANTIDOEm", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pidcurso", Convert.ToInt32(curs.SelectedValue));
                //comand.Parameters.AddWithValue("pbuscarciclo", ciclo);
                comand.Parameters.AddWithValue("pfecha1", fecha1);
                comand.Parameters.AddWithValue("pfecha2", fecha2);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }
        
        public void AlertaReincorporacion(int curso, int ciclo, int alumno)
        {
            DataTable dt = new DataTable();
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
                MySqlCommand cmd = new MySqlCommand("REINCORPORACIONxALUMNOxCURSO", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("pidcurso", curso);
                cmd.Parameters.AddWithValue("pciclolectivo", ciclo);
                cmd.Parameters.AddWithValue("pidalum", alumno);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                adapter.Fill(dt);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
            if (dt.Rows.Count > 0)
            {
                DataRow datos = dt.Rows[0];
                MessageBox.Show(datos["alerta de reincorporacion"].ToString(), "Alerta de reincorporación pendiente");
            }

        }

        public void Alerta3Seguidas(String desde, String hasta, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("ALERTA3SEGUIDAS", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("pfechamin", desde);
                cmd.Parameters.AddWithValue("pFechamax", hasta);

                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }

        public void ReporteAlumnos(int mes, int ciclo, int pAs1, int pAs2, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("ReporteAlumxMes", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                //cmd.Parameters.AddWithValue("pidcurso", curso);
                cmd.Parameters.AddWithValue("pmes", mes);
                cmd.Parameters.AddWithValue("pciclo", ciclo);
                cmd.Parameters.AddWithValue("pAs1", pAs1);
                cmd.Parameters.AddWithValue("pAs2", pAs2);

                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }
        public void ListadoAsistenciaxAlumnoxCursoxJustificacion(ComboBox curso, String desde, String hasta, DataGridView dtg)
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
                MySqlCommand comand = new MySqlCommand("LISTADOASISTENCIAALUMNOxCURSOxJUSTIFICACIONxFECHA", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pidcurso", curso.SelectedValue);
                comand.Parameters.AddWithValue("pfecha1", desde);
                comand.Parameters.AddWithValue("pfecha2", hasta);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dtg.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }
        public void ListadoAsistenciaxCurso(ComboBox curso, String desde, String hasta, DataGridView dtg)
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
                MySqlCommand comand = new MySqlCommand("LISTADOASISTENCIAxCURSOxFECHA", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pidcurso", curso.SelectedValue);
                comand.Parameters.AddWithValue("pfecha1", desde);
                comand.Parameters.AddWithValue("pfecha2", hasta);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dtg.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }

        public void InformeCursocualiDOE(ComboBox buscurso, String desde, String hasta, DataGridView dtg)
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
                MySqlCommand comand = new MySqlCommand("ASISTENCIAxCURSOCUALITATIVODOEm", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pbuscarcurso", Convert.ToInt32(buscurso.SelectedValue));
                comand.Parameters.AddWithValue("pfecha1", desde);
                comand.Parameters.AddWithValue("pfecha2", hasta);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dtg.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }
        public void ListadoAlumnosaJustificar(int curso, int sub, string fecha, DataGridView dgv)
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
                MySqlCommand comand = new MySqlCommand("BuscarxcursomodificarAsistencia", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pidCurso", curso);
                comand.Parameters.AddWithValue("pFecha", fecha);
                comand.Parameters.AddWithValue("psubmotivo", sub);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }
        public void ModificarJustificacion(int seg, TextBox justificacion, TextBox observacion, int usuario)
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
                MySqlCommand comand = new MySqlCommand("modificarJustificacion", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pIdseg", seg);
                comand.Parameters.AddWithValue("pJust", justificacion.Text);
                comand.Parameters.AddWithValue("pObs", observacion.Text);
                comand.Parameters.AddWithValue("pidUsuarios", usuario);

                comand.ExecuteNonQuery();
                MessageBox.Show("Alumno justificado");
                //MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al justificar alumno");
            }
            Global.Conexion.Close();
        }

        public void ImprimirReincorporacion(int IdAlum, int ciclo, DataGridView dgv)
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
                MySqlCommand comand = new MySqlCommand("imprimir reincorporacion", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pIdAlum", IdAlum);
                comand.Parameters.AddWithValue("pciclo", ciclo);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }

        public void BusquedaxMotivo(int curso, int idMot, String desde, String hasta, DataGridView dtg)
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
                MySqlCommand comand = new MySqlCommand("busqueda-motivo", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pIdCur", curso);
                comand.Parameters.AddWithValue("pIdMot", idMot);
                comand.Parameters.AddWithValue("pFechaMin", desde);
                comand.Parameters.AddWithValue("pFechaMax", hasta);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dtg.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }

        public void BuscarRetiroAnticipado(ComboBox curso, int idSub, String fecha, DataGridView dgv)
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
                MySqlCommand comand = new MySqlCommand("listadoscursoretant", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pcurso", Convert.ToInt32(curso.SelectedValue));
                comand.Parameters.AddWithValue("psub", idSub);
                comand.Parameters.AddWithValue("pfecha", fecha);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dgv.DataSource = dt;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }

        public void RegistrarRetiroAnticipado(int idALu, int idUsu, int idSeg, TextBox obser, int motivo)//int idmotivo
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
                MySqlCommand comand = new MySqlCommand("RetAnt", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("palumn", idALu);
                comand.Parameters.AddWithValue("pusuario", idUsu);
                comand.Parameters.AddWithValue("pseg", idSeg);
                comand.Parameters.AddWithValue("pobvs", obser.Text);
                comand.Parameters.AddWithValue("pestado", 1);//estado
                comand.Parameters.AddWithValue("pmotivo", motivo);
                comand.Parameters.AddWithValue("pevento", 3);

                comand.ExecuteNonQuery();
                MessageBox.Show("Retiro Registrado");
                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }


        public void IMPRESION(int idRein, int idUsu)
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
                MySqlCommand comand = new MySqlCommand("IMPRESION", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.AddWithValue("pIdrein", idRein);
                comand.Parameters.AddWithValue("pIdUsua", idUsu);

                comand.ExecuteNonQuery();

                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al solicitar el informe");
            }
            Global.Conexion.Close();
        }

        public void ListadoReincorporacionHechaAlu(int idAlum, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("reincorporacion echa por idalumno", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.AddWithValue("pIdalum", idAlum);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }
        public void ListadoReincorporacionPendienteAlu(int idAlum, DataGridView dgv)
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
                MySqlCommand cmd = new MySqlCommand("Reincorporacion pendiente por idalumno", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("pIdalum", idAlum);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }

        public void BanderaCuarto(string turno, ComboBox trimestre, DataGridView dgvet)
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
                MySqlCommand cmd = new MySqlCommand("Prom_bandera-4to", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("turno", turno);
                cmd.Parameters.AddWithValue("trimestre", trimestre.SelectedIndex + 1);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgvet.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }

        public void BanderaQuinto(string turno, ComboBox trimestre, DataGridView dgvet)
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
                MySqlCommand cmd = new MySqlCommand("Prom_bandera-5to", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("turno", turno);
                cmd.Parameters.AddWithValue("trimestre", trimestre.SelectedIndex + 1);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgvet.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }

        public void BanderaSexto(string turno, ComboBox trimestre, DataGridView dgvet)
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
                MySqlCommand cmd = new MySqlCommand("Prom_bandera-6to", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("turno", turno);
                cmd.Parameters.AddWithValue("trimestre", trimestre.SelectedIndex + 1);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgvet.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }

        public void PromedioGeneral(DataGridView dgv, ComboBox curso, ComboBox ciclo)
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
                MySqlCommand cmd = new MySqlCommand("MayorPromedioxCurso", Global.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("p_idcurso", curso.SelectedIndex + 1);
                cmd.Parameters.AddWithValue("Pciclolectivo", ciclo.SelectedIndex + 2018);
                cmd.ExecuteNonQuery();
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al buscar al alumno");
            }
            Global.Conexion.Close();
        }
    }
}
