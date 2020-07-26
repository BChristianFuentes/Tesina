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
    class LlenarCombo
    {

        public int IdMotivo { get; set; }
        public string MotivoString { get; set; }
        public int IdSubMotivo { get; set; }
        public string SubMotivoString { get; set; }
        public int IdCurso { get; set; }
        public string CursoString { get; set; }
        public int IdDocumento { get; set; }
        public string DocumentoString { get; set; }
        public int IdJerarquia { get; set; }
        public string JerarquiaString { get; set; }
        public int IdEstado { get; set; }
        public string EstadoString { get; set; }
        public int IdRetiroAnticipado { get; set; }
        public string RetiroAnticipadoString { get; set; }
        public int IdEvento { get; set; }
        public string EventoString { get; set; }
        public int IdEspecialidad { get; set; }
        public string EspecialidadString { get; set; }
        public string CicloString { get; set; }
        public string TrimestreString { get; set; }
        public int IdTrimestre { get; set; }
        public int idMateria { get; set; }
        public string MateriaString { get; set; }
        public string CursoStringEspecialidad { get; set; }
        public int IdCursoEspecialidad { get; set; }

        //public static int submotivo;
        public List<LlenarCombo> ObtenerCursos()
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("select idCurso, concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' from cursos as c where idCurso!= 0 and estado =0", Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo Cuno = new LlenarCombo();
                    Cuno.IdCurso = lector.GetInt32(0);
                    Cuno.CursoString = lector.GetString(1);

                    lista.Add(Cuno);
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }

        public List<LlenarCombo> ObtenerCursosxEspecialidad(int esp)
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("select idCurso, concat_ws('',c.anio,'° ',c.division,'°') as 'Cursos' from cursos as c where idCurso!= 0 and estado =0 and especialidad = " + esp, Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo Cuno = new LlenarCombo();
                    Cuno.IdCursoEspecialidad = lector.GetInt32(0);
                    Cuno.CursoStringEspecialidad = lector.GetString(1);
                    lista.Add(Cuno);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }

        public List<LlenarCombo> ObtenerMotivo(int submotivo)
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("SELECT idMotivo, asistencia FROM `motivos` WHERE idMotivo!= 0 and idMotivo != 13 and idMotivo != 14 and estado=1 and idSubmotivo=" + submotivo, Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.IdMotivo = lector.GetInt32(0);
                    ent.MotivoString = lector.GetString(1);

                    lista.Add(ent);
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }
        public List<LlenarCombo> ObtenerSubmotivo()
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("SELECT * FROM `submotivos` WHERE idSubmotivo!= 0 ", Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.IdSubMotivo = lector.GetInt32(0);
                    ent.SubMotivoString = lector.GetString(1);

                    lista.Add(ent);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }

        public List<LlenarCombo> ObtenerDocumento()
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("SELECT * FROM `tiposdocumentos`WHERE idTipodocumento!= 0 ", Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.IdDocumento = lector.GetInt32(0);
                    ent.DocumentoString = lector.GetString(1);

                    lista.Add(ent);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }

        public List<LlenarCombo> ObtenerJerarquia()
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("SELECT permiso, tipodecargo FROM cargos WHERE idCargo!= 0", Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.IdJerarquia = lector.GetInt32(0);
                    ent.JerarquiaString = lector.GetString(1);

                    lista.Add(ent);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }

        public List<LlenarCombo> ObtenerEstados()
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("SELECT * FROM estados WHERE idEstado!= 0 and idEstado <8", Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.IdEstado = lector.GetInt32(0);
                    ent.EstadoString = lector.GetString(1);

                    lista.Add(ent);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }

        public List<LlenarCombo> ObtenerEstadosProf()
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("SELECT * FROM estados WHERE idEstado != 0 and idEstado != 2 and idEstado != 3 and idEstado != 4 and idEstado != 5 and idEstado != 6 and idEstado != 7", Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.IdEstado = lector.GetInt32(0);
                    ent.EstadoString = lector.GetString(1);

                    lista.Add(ent);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }

        public List<LlenarCombo> ObtenerRetiroAnticipado()
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("SELECT idMotivo, asistencia FROM `motivos` WHERE idMotivo!= 0 and idEvento=3 and idSubmotivo=1 and estado=1", Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.IdRetiroAnticipado = lector.GetInt32(0);
                    ent.RetiroAnticipadoString = lector.GetString(1);

                    lista.Add(ent);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }
                
        public List<LlenarCombo> ObtenerCiclos()
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("Select Ciclolectivo From ciclos Order By Ciclolectivo ASC", Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.CicloString = lector.GetString(0);
                    lista.Add(ent);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }

        public List<LlenarCombo> ObtenerMaterias(int idCurso)
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("SELECT m.idMateria, m.nombre FROM materias m INNER JOIN materiasxcursos mxc ON m.idMateria = mxc.id_Materia WHERE mxc.id_Curso = " + idCurso, Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.idMateria = lector.GetInt32(0);
                    ent.MateriaString = lector.GetString(1);
                    lista.Add(ent);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }

        public List<LlenarCombo> ObtenerEventos()
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("SELECT idEvento, tipoevento FROM eventos WHERE idEvento != 0", Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.IdEvento = lector.GetInt32(0);
                    ent.EventoString = lector.GetString(1);

                    lista.Add(ent);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }

        public List<LlenarCombo> ObtenerEspecialidad()
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("SELECT * FROM especialidad WHERE idEspecialidad != 0 ", Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.IdEspecialidad = lector.GetInt32(0);
                    ent.EspecialidadString = lector.GetString(1);

                    lista.Add(ent);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }

        public List<LlenarCombo> ObtenerTrimestres()
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("Select id_trimestrenota, trimestre From trimestresnota", Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.IdTrimestre = lector.GetInt32(0);
                    ent.TrimestreString = lector.GetString(1);
                    lista.Add(ent);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }

        public List<LlenarCombo> ObtenerTrimestresParaBandera()
        {
            List<LlenarCombo> lista = new List<LlenarCombo>();
            Global.Conexion.Open();
            try
            {
                MySqlCommand comando = new MySqlCommand("Select id_trimestrenota, trimestre From trimestresnota where id_trimestrenota < 4", Global.Conexion);
                MySqlDataReader lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    LlenarCombo ent = new LlenarCombo();
                    ent.IdTrimestre = lector.GetInt32(0);
                    ent.TrimestreString = lector.GetString(1);
                    lista.Add(ent);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error al obtener el listado");
            }
            Global.Conexion.Close();
            return lista;
        }
    }
}
