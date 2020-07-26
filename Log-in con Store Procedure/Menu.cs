using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
//-------------------------------------------
using Spire.Pdf; //Para usar PDFDocument agregar referencia
using System.Drawing.Printing; //Se agrega para poder imprimir
//-------------------------------------------


namespace Log_in_con_Store_Procedure
{
    public partial class Menu : Form
    {
        public Menu()
        {
            InitializeComponent();
            switch (Usuarios.Cargo)
            {
                case 1:
                    {
                        preceptoresToolStripMenuItem.Enabled = false;
                        //motivosToolStripMenuItem.Enabled = false;
                        //configuracionesToolStripMenuItem.Enabled = false;
                        alertarDOEToolStripMenuItem.Enabled = false;
                        configuracionDeTrimestresToolStripMenuItem.Enabled = false;
                    };break;
                case 2:
                    {
                        //configuracionesToolStripMenuItem.Enabled = false;
                        alertarDOEToolStripMenuItem.Enabled = false;
                    };break;
                case 3:
                    {
                        //configuracionesToolStripMenuItem.Enabled = false;
                        alertarDOEToolStripMenuItem.Enabled = false;
                    };break;
                case 5:
                    {
                        preceptoresToolStripMenuItem.Enabled = false;
                        agregarToolStripMenuItem.Enabled = false;
                        //motivosToolStripMenuItem.Enabled = false;
                        informesToolStripMenuItem.Enabled = false;
                        asistenciaToolStripMenuItem.Enabled = false;
                        //configuracionesToolStripMenuItem.Enabled = false;
                        configuracionDeTrimestresToolStripMenuItem.Enabled = false;
                    };break;
                case 6:
                    {
                        preceptoresToolStripMenuItem.Enabled = false;
                        informesToolStripMenuItem.Enabled = false;
                        asistenciaToolStripMenuItem.Enabled = false;
                        alumnosLibresToolStripMenuItem.Enabled = false;
                        alertarDOEToolStripMenuItem.Enabled = false;
                        configuracionDeTrimestresToolStripMenuItem.Enabled = false;
                    };break;
            }
            toolStripLabel1.Text = Oper.NombreArchivo(true, true, true);
            toolStripLabel2.Text = "| Usuario: " + Usuarios.Nombre;
        }
        Operaciones Oper = new Operaciones();
        private void agregarModificarToolStripMenuItem2_Click(object sender, EventArgs e)
        {
            Global.SeleccionarABM = 3;
            if (Application.OpenForms.OfType<ABMalumyusu>().Count() == 0)
            {
                ABMalumyusu abrir = new ABMalumyusu();
                abrir.Text = "Agregar/Modificar/Eliminar Motivos";
                abrir.Show();
            }
            else
            {
                Application.OpenForms["ABMalumyusu"].BringToFront();
                Application.OpenForms["ABMalumyusu"].Text = "Agregar/Modificar/Eliminar Motivos";
            }
                

        }

        private void agregarModificarToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<BuscarUsuario>().Count() == 0)
            {
                BuscarUsuario abrir = new BuscarUsuario();
                abrir.Text = "Agregar/Modificar/Eliminar Usuarios";
                abrir.Show();
            }
            else
            {
                Application.OpenForms["BuscarUsuario"].BringToFront();
            }
                

        }

        private void tomarAsistenciaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<TomarAsistencia>().Count() == 0)
            {
                TomarAsistencia abrir = new TomarAsistencia();             

                abrir.Show();
            }
            else
                Application.OpenForms["TomarAsistencia"].BringToFront();

        }

        private void asistenciaPorAlumnoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Global.informe = 0;
            if (Application.OpenForms.OfType<InformeAlumno>().Count() == 0)
            {
                InformeAlumno abrir = new InformeAlumno();
                abrir.Show();
            }
            else
                Application.OpenForms["InformeAlumno"].BringToFront();

        }

        private void Menu_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void buscarAlumnoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<buscarAlumno>().Count() == 0)
            {
                buscarAlumno abrir = new buscarAlumno();
                abrir.Show();
            }
            else
                Application.OpenForms["buscarAlumno"].BringToFront();

        }

        private void listadoDeAlumnosLibresToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<AlumnosLibresCurso>().Count() == 0)
            {
                AlumnosLibresCurso abrir = new AlumnosLibresCurso();
                abrir.Show();
            }
            else
                Application.OpenForms["AlumnosLibresCurso"].BringToFront();

        }
        
        private void imprimirReincorparaciónToolStripMenuItem_Click(object sender, EventArgs e)
        {
            /*
            */
        }
        
        private void asistenciaPorCursoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<InformeCurso>().Count() == 0)
            {
                InformeCurso abrir = new InformeCurso();
                abrir.Show();
            }
            else
                Application.OpenForms["InformeCurso"].BringToFront();

        }
        
        private void Menu_FormClosing_1(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void alumnosToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void agregarModificarEliminarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Global.SeleccionarABM = 4;
            if (Application.OpenForms.OfType<ABMalumyusu>().Count() == 0)
            {
                ABMalumyusu abrir = new ABMalumyusu();
                abrir.Text = "Agregar/Modificar/Eliminar Alertas DOE";
                abrir.Show();
            }
            else
            {
                Application.OpenForms["ABMalumyusu"].BringToFront();
                Application.OpenForms["ABMalumyusu"].Text = "Agregar/Modificar/Eliminar Alertas DOE";
            }
                
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
        }

        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void informesToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void modificarAsistenciaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Global.Modificar=0;
            ModificarAsist abrir = new ModificarAsist();
            
            if (Application.OpenForms.OfType<ModificarAsist>().Count() == 0)
            {         

                abrir.lblNom.Hide();
                abrir.txtNom.Hide();
                abrir.lblApel.Hide();
                abrir.txtApel.Hide();
                abrir.lblDoc.Hide();
                abrir.txtDoc.Hide();
                abrir.lblHasta.Visible = false;
                abrir.dtpHasta.Visible = false;
                abrir.lblDesde.Visible = false;
                abrir.dtpDesde.Visible = false;

                abrir.Show();
            }
            else
            {
                Application.OpenForms["ModificarAsist"].Close();
                abrir.Show();
            }
                
        }

        private void agregarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AgregarModificarAlumnos abrir = new AgregarModificarAlumnos();

            if (Application.OpenForms.OfType<AgregarModificarAlumnos>().Count() == 0)
            {                
                abrir.txtId.Enabled = false;
                abrir.btnModificar.Visible = false;
                abrir.btnAgregar.Visible = true;
                abrir.lblEstado.Visible = false;//io
                abrir.cmbEstado.Visible = false;//io
                abrir.Text = "Ingresar Alumno";
                abrir.Show();
            }
            else
            {
                Application.OpenForms["AgregarModificarAlumnos"].BringToFront();
            }
        }

        private void eliminarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<BorrarRegistros>().Count() == 0)
            {
                BorrarRegistros del = new BorrarRegistros();
                del.Show();
            }
            else
                Application.OpenForms["BorrarRegistros"].BringToFront();
        }

        private void preceptoresToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void asistenciaPorAlumnoToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            /*
            Global.informe = 1;
            if (Application.OpenForms.OfType<InformeAlumno>().Count() == 0)
            {
                InformeAlumno abrir = new InformeAlumno();
                abrir.Show();
            }
            else
                Application.OpenForms["InformeAlumno"].BringToFront();
                */
        }

        private void asistenciaPorCursoToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            /*
            if (Application.OpenForms.OfType<InformeCurso>().Count() == 0)
            {
                InformeCurso abrir = new InformeCurso();
                abrir.Show();
            }
            else
                Application.OpenForms["InformeCurso"].BringToFront();
                */
        }

        private void Menu_Load(object sender, EventArgs e)
        {
            ControlBox = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
           
        }

        private void informesDOEToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Global.informe = 1;
            if (Application.OpenForms.OfType<InformeAlumno>().Count() == 0)
            {
                InformeAlumno abrir = new InformeAlumno();
                abrir.txtDoc.Visible = false;
                abrir.lblDoc.Visible = false;
                abrir.Show();
            }
            else
                Application.OpenForms["InformeAlumno"].BringToFront();
        }

        private void informeCursoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Global.informe = 1;
            if (Application.OpenForms.OfType<InformeCurso>().Count() == 0)
            {
                InformeCurso abrir = new InformeCurso();
                abrir.Show();
            }
            else
                Application.OpenForms["InformeCurso"].BringToFront();
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿Esta seguro que quiere salir?", "Salir", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Close();
            }
            
        }
        /*
        private void agregarModificarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<Justificaciones>().Count() == 0)
            {
                Justificaciones abrir = new Justificaciones();

                LlenarCombo llenar = new LlenarCombo();
                abrir.cmbCurso.DataSource = llenar.ObtenerCursos();
                abrir.cmbCurso.ValueMember = "IdCurso";
                abrir.cmbCurso.DisplayMember = "CursoString";
                abrir.cmbCurso.SelectedIndex = -1;

                abrir.Show();
            }
            else
                Application.OpenForms["Justificaciones"].BringToFront();
        }
        
        private void alumnosJustificadosToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (Application.OpenForms.OfType<AlumnosJustificados>().Count() == 0)
            {
                AlumnosJustificados abrir = new AlumnosJustificados();
                abrir.Show();
            }
            else
                Application.OpenForms["AlumnosJustificados"].BringToFront();
        }
        */
        private void alertarDOEToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void alumnosPorMesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<Reportes>().Count() == 0)
            {
                Reportes abrir = new Reportes();
                abrir.Show();
            }
            else
                Application.OpenForms["Reportes"].BringToFront();
        }

        private void alumnosConMayorA3AusentesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<Alerta3Ausentes>().Count() == 0)
            {
                Alerta3Ausentes abrir = new Alerta3Ausentes();
                abrir.Show();
            }
            else
                Application.OpenForms["Alerta3Ausentes"].BringToFront();
        }

        private void retirposAncticipadosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<RetirosAnticipados>().Count() == 0)
            {
                RetirosAnticipados abrir = new RetirosAnticipados();
                abrir.Show();
            }
            else
                Application.OpenForms["RetirosAnticipados"].BringToFront();
        }

        private void cerrarSesiónToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿Esta seguro que quiere cerrar sesión?", "Cerrar Sesión", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                Application.Restart();
            }
        }

        private void faltasPorTrimestreToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<AsistenciasxTrimestre>().Count() == 0)
            {
                AsistenciasxTrimestre abrir = new AsistenciasxTrimestre();
                abrir.Show();
            }
            else
                Application.OpenForms["AsistenciasxTrimestre"].BringToFront();
        }

        private void trimestresToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<Trimestres>().Count() == 0)
            {
                Trimestres abrir = new Trimestres();
                abrir.Show();
            }
            else
                Application.OpenForms["Trimestres"].BringToFront();
        }

        private void buscarPorAsistenciaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void acercaDeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Creditos abrir = new Creditos();
            abrir.Show();
        }

        private void toolStripLabel1_Click(object sender, EventArgs e)
        {

        }

        private void toolStripLabel2_Click(object sender, EventArgs e)
        {

        }

        private void justificacionesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<Justificaciones>().Count() == 0)
            {
                Justificaciones abrir = new Justificaciones();

                abrir.Show();
            }
            else
                Application.OpenForms["Justificaciones"].BringToFront();
        }

        private void asistenciasSegúnMotivoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<BusquedaMotivo>().Count() == 0)
            {
                BusquedaMotivo abrir = new BusquedaMotivo();
                abrir.Show();
            }
            else
                Application.OpenForms["BusquedaMotivo"].BringToFront();
        }

        private void configuracionDeTrimestresToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<Trimestres>().Count() == 0)
            {
                Trimestres abrir = new Trimestres();
                abrir.Show();
            }
            else
                Application.OpenForms["Trimestres"].BringToFront();
        }

        private void configurarMotivosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<ABMalumyusu>().Count() == 0)
            {
                ABMalumyusu abrir = new ABMalumyusu();
                abrir.Show();
            }
            else
                Application.OpenForms["ABMalumyusu"].BringToFront();
        }

        private void AgregarToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            AgregarModificarProfesor abrir = new AgregarModificarProfesor();

            if (Application.OpenForms.OfType<AgregarModificarProfesor>().Count() == 0)
            {
                abrir.lbl_id.Visible = false;
                abrir.txt_id.Enabled = false;                
                abrir.btn_modificar.Visible = false;
                abrir.btn_agregar.Visible = true;
                abrir.lbl_estado.Visible = false;//io
                abrir.cmb_estado.Visible = false;//io
                abrir.Text = "Ingresar Profesor";
                abrir.Show();
            }
            else
            {
                Application.OpenForms["AgregarModificarProfesor"].BringToFront();
            }
        }

        private void buscarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<buscarProfesor>().Count() == 0)
            {
                buscarProfesor abrir = new buscarProfesor();
                abrir.Show();
            }
            else
                Application.OpenForms["buscarProfesor"].BringToFront();
        }

        private void añadirModificarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<BuscarMateria>().Count() == 0)
            {
                BuscarMateria abrir = new BuscarMateria();
                abrir.Show();
            }
            else
                Application.OpenForms["AgregarMaterias"].BringToFront();
        }

        private void buscarNotasxmateriaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BuscarNotasxMateria notas = new BuscarNotasxMateria();
            notas.Show();
        }

        private void buscarNotasxalumnoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BuscarNotasxAlumno notas = new BuscarNotasxAlumno();
            notas.Show();
        }

        private void abanderadosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Abanderado bandera = new Abanderado();
            bandera.Show();
        }

        private void promoverDeCursoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            PromoverDeCurso promover = new PromoverDeCurso();
            promover.Show();
        }

        private void promedioGeneralPorCursoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            PromedioGeneralxCurso pgxc = new PromedioGeneralxCurso();
            pgxc.Show();
        }
    }
}
