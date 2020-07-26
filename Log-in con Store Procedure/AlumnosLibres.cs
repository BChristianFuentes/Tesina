using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Log_in_con_Store_Procedure
{
    public partial class AlumnosLibres : Form
    {
        public AlumnosLibres()
        {
            InitializeComponent();
            /*
            cmbCurso.DataSource = llenar.ObtenerCursos();
            cmbCurso.ValueMember = "IdCurso";
            cmbCurso.DisplayMember = "CursoString";
            cmbCurso.SelectedIndex = -1;
            */
        }
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        Operaciones Oper = new Operaciones();
        LlenarCombo llenar = new LlenarCombo();
        Teclado Digitos = new Teclado();

        private void Alumnos_Libres_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtId.Text == "")
            {
                Error.SetError(txtId, "Ingrese un ID");
                txtId.Focus();
                return;
            }
            Error.SetError(txtId, "");
            if (txtCiclo.Text == "")
            {
                Error.SetError(txtCiclo, "Ingrese un Ciclo");
                txtCiclo.Focus();
                return;
            }
            Error.SetError(txtCiclo, "");

            OperAlu.ListadoReincorporacionHechaAlu(Convert.ToInt32(txtId.Text), dgvHecha);
            OperAlu.ListadoReincorporacionPendienteAlu(Convert.ToInt32(txtId.Text), dgvPendiente);

            dgvPendiente.Columns["idReincorporacion"].Visible = false;
            dgvHecha.Columns["idReincorporacion"].Visible = false;

            if (dgvPendiente.Rows.Count > 0)
            {               
                dgvPendiente.CurrentCell = dgvPendiente.Rows[0].Cells[1];
                btnReinc.Enabled = true;
                btnFirmado.Enabled = true;
            }
            if (dgvHecha.Rows.Count > 0)
            {                
                dgvHecha.CurrentCell = dgvHecha.Rows[0].Cells[1];
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            DataGridViewRow datos = dgvPendiente.CurrentRow;
            int IdRein = Convert.ToInt32(dgvPendiente.CurrentRow.Cells[0].Value);
            string nom = datos.Cells["Nombre"].Value.ToString();
            string ape = datos.Cells["Apellido"].Value.ToString();

            if (MessageBox.Show("¿Esta seguro que el alumno " + nom + " " + ape + " firmo la reincorporacion?", "Firmar Reincorporacion", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                OperAlu.ReincorporarAlumnos(IdRein, Usuarios.Id);
            }

            btnBuscar.PerformClick();
        }

        private void btnImpresion_Click(object sender, EventArgs e)
        {
            if (dgvPendiente.Rows.Count > 0)
            {            
                int IdRein = Convert.ToInt32(dgvPendiente.CurrentRow.Cells[0].Value);

                OperAlu.Impresion(IdRein, Usuarios.Id);

                btnBuscar.PerformClick();
            }
        }

        private void Alumnos_Libres_Load(object sender, EventArgs e)
        {
            ControlBox = false;
        }

        private void button1_Click_2(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dtpHasta_ValueChanged(object sender, EventArgs e)
        {

        }

        private void lblHasta_Click(object sender, EventArgs e)
        {

        }

        private void lblDesde_Click(object sender, EventArgs e)
        {

        }

        private void dtpDesde_ValueChanged(object sender, EventArgs e)
        {

        }

        private void btnReinc_Click(object sender, EventArgs e)
        {
            if (dgvPendiente.Rows.Count > 0)
            {
                DataGridViewRow datos = dgvPendiente.CurrentRow;
                string rein = datos.Cells["tipoReincorporacion"].Value.ToString();
                /*
                if (MessageBox.Show("¿Esta seguro eliminar al alumno " + nom + " " + ape + "?", "Eliminar Alumno", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {                               
                */
                //OperAlu.ImprimirReincorporacion(156, dgvExport);//Convert.ToInt32(datos.Cells["idAlumno"].Value)

                dgvExport.Columns.Remove("nombre");
                dgvExport.Columns.Remove("apellido");
                dgvExport.Columns.Remove("Cursos");
                dgvExport.Columns.Remove("Turno");

                string nom = datos.Cells["Nombre"].Value.ToString();
                string ape = datos.Cells["Apellido"].Value.ToString();
                string curso = datos.Cells["Cursos"].Value.ToString();
                string turno = datos.Cells["Turno"].Value.ToString();

                if (rein == "Primera reincorporacion")
                {
                    //Oper.ExportarRein1(dgvExport, nom, ape, curso, turno);
                    DataGridViewRow dat = dgvPendiente.CurrentRow;

                    OperAlu.IMPRESION(Convert.ToInt32(dat.Cells["idReincorporacion"].Value), Usuarios.Id);
                }

                if (rein == "Segunda reincorporacion")
                {
                    //Oper.ExportarRein2(dgvExport, nom, ape, curso, turno);

                    DataGridViewRow dat = dgvPendiente.CurrentRow;
                    OperAlu.IMPRESION(Convert.ToInt32(dat.Cells["idReincorporacion"].Value), Usuarios.Id);
                }

                btnBuscar.PerformClick();

            }

        }

        private void btnTrimestre_Click(object sender, EventArgs e)
        {
            /*
            if (Application.OpenForms.OfType<AsistenciasxTrimestre>().Count() == 0)
            {
                AsistenciasxTrimestre abrir = new AsistenciasxTrimestre();
                DataGridViewRow datos = dgvPendiente.CurrentRow;                
                abrir.Show();

                //abrir.txtId.Text = datos.Cells["IdAlumno"].Value.ToString();
                abrir.txtNom.Text= datos.Cells["Nombre"].Value.ToString();
                abrir.txtApel.Text = datos.Cells["Apellido"].Value.ToString();
                abrir.cmbCurso.Text = datos.Cells["Anio"].Value.ToString();//Curso
                abrir.cmbTurno.Text = datos.Cells["Turno"].Value.ToString();
            }
            else
                Application.OpenForms["AsistenciasxTrimestre"].BringToFront();
                */
              
        }

        private void lblCurso_Click(object sender, EventArgs e)
        {

        }

        private void txtCiclo_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtCiclo_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }
        
        private void AlumnosLibres_Activated(object sender, EventArgs e)
        {
            btnBuscar.PerformClick();
            btnBuscar.Enabled = false;
        }
        
    }
}
