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
    public partial class AlumnosLibresCurso : Form
    {
        public AlumnosLibresCurso()
        {
            InitializeComponent();

            cmbCurso.DataSource = llenar.ObtenerCursos();
            cmbCurso.ValueMember = "IdCurso";
            cmbCurso.DisplayMember = "CursoString";
            //cmbCurso.SelectedIndex = -1;

            cmbCiclo.DataSource = llenar.ObtenerCiclos();
            cmbCiclo.DisplayMember = "Ciclo";
            cmbCiclo.Text = Oper.NombreArchivo(false, false, true);
            //cmbCiclo.SelectedIndex = -1;
        }

        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        Operaciones Oper = new Operaciones();
        LlenarCombo llenar = new LlenarCombo();
        Teclado Digitos = new Teclado();

        private void Alumnos_Libres_KeyDown(object sender, KeyEventArgs e)
        {/*
            if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }*/
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (cmbCiclo.Text == "")
            {
                Error.SetError(cmbCiclo, "Ingrese un Ciclo");
                cmbCiclo.Focus();
                return;
            }
            Error.SetError(cmbCiclo, "");

            OperAlu.ListadoReincorporacionHecha(Convert.ToInt32(cmbCurso.SelectedValue), Convert.ToInt32(cmbCiclo.SelectedValue), dgvHecha);
            OperAlu.ListadoReincorporacionPendiente(Convert.ToInt32(cmbCurso.SelectedValue), Convert.ToInt32(cmbCiclo.SelectedValue), dgvPendiente);

            dgvPendiente.Columns["idAlumno"].Visible = false;
            dgvPendiente.Columns["idReincorporacion"].Visible = false;
            //dgvHecha.Columns["IdAlumno"].Visible = false;
            dgvHecha.Columns["idReincorporacion"].Visible = false;

            if (dgvPendiente.Rows.Count > 0)
            {        
                dgvPendiente.CurrentCell = dgvPendiente.Rows[0].Cells[2];
                btnFirmado.Enabled = true;
                btnReinc.Enabled = true;
            }
            if (dgvHecha.Rows.Count > 0)
            {
                dgvHecha.CurrentCell = dgvHecha.Rows[0].Cells[1];
            }
        }

        private void btnFirmado_Click(object sender, EventArgs e)
        {
            
            DataGridViewRow datos = dgvPendiente.CurrentRow;
            if (datos.Cells["Impresion"].Value.ToString() == "Hecha")
            { 
                if (dgvPendiente.Rows.Count > 0)
                {
                    
                    int IdRein = Convert.ToInt32(dgvPendiente.CurrentRow.Cells[0].Value);
                    string nom = datos.Cells["Nombre"].Value.ToString();
                    string ape = datos.Cells["Apellido"].Value.ToString();

                    if (MessageBox.Show("¿Esta seguro que el alumno " + nom + " " + ape + " firmo la reincorporacion?", "Firmar Reincorporacion", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        OperAlu.ReincorporarAlumnos(IdRein, Usuarios.Id);
                    }

                    btnBuscar.PerformClick();
                }                
            }
            else if (datos.Cells["Impresion"].Value.ToString() == "Pendiente")
            {
                string nom = datos.Cells["Nombre"].Value.ToString();
                string ape = datos.Cells["Apellido"].Value.ToString();
                MessageBox.Show("Primero debe realizar Exportacion antes de marcar como firmado al alumno " + nom + " " + ape, "Firmar Reincorporacion");
            }
            if (dgvPendiente.Rows.Count > 0)
            {
                dgvPendiente.CurrentCell = dgvPendiente.Rows[0].Cells[2];
                btnFirmado.Enabled = true;
                btnReinc.Enabled = true;
            }
            else
            {
                btnFirmado.Enabled = false;
                btnReinc.Enabled = false;
            }
        }

        private void btnReinc_Click(object sender, EventArgs e)
        {
            if (dgvPendiente.Rows.Count > 0)
            {
                /*
                DataGridViewRow datos = dgvPendiente.CurrentRow;
                string rein = datos.Cells["tipoReincorporacion"].Value.ToString();

                OperAlu.ImprimirReincorporacion(Convert.ToInt32(datos.Cells["idAlumno"].Value), dgvExport);//Convert.ToInt32(datos.Cells["idAlumno"].Value)

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
                    Oper.ExportarRein1(dgvExport, nom, ape, curso, turno);

                    DataGridViewRow dat = dgvPendiente.CurrentRow;
                    OperAlu.IMPRESION(Convert.ToInt32(dat.Cells["idReincorporacion"].Value), Usuarios.Id);
                }

                if (rein == "Segunda reincorporacion")
                {
                    Oper.ExportarRein2(dgvExport, nom, ape, curso, turno);

                    DataGridViewRow dat = dgvPendiente.CurrentRow;
                    OperAlu.IMPRESION(Convert.ToInt32(dat.Cells["idReincorporacion"].Value), Usuarios.Id);
                }
                */
                DataGridViewRow datos = dgvPendiente.CurrentRow;
                string rein = datos.Cells["tipoReincorporacion"].Value.ToString();

                OperAlu.ImprimirReincorporacion(Convert.ToInt32(datos.Cells["idAlumno"].Value), Convert.ToInt32(datos.Cells["Ciclo"].Value), dgvExport);//Convert.ToInt32(datos.Cells["idAlumno"].Value)

                dgvExport.Columns.Remove("Nombre");
                dgvExport.Columns.Remove("Apellido");
                dgvExport.Columns.Remove("Cursos");
                dgvExport.Columns.Remove("Turno");

                string nom = datos.Cells["Nombre"].Value.ToString();
                string ape = datos.Cells["Apellido"].Value.ToString();
                string curso = datos.Cells["Cursos"].Value.ToString();
                string turno = datos.Cells["Turno"].Value.ToString();

                if (rein == "Primera reincorporacion")
                {
                    Oper.ExportarRein1(dgvExport, nom, ape, curso, turno, nom + " " + ape);
                    OperAlu.IMPRESION(Convert.ToInt32(datos.Cells["idReincorporacion"].Value), Usuarios.Id);
                }

                if (rein == "Segunda reincorporacion")
                {
                    Oper.ExportarRein2(dgvExport, nom, ape, curso, turno, nom + " " + ape);
                    OperAlu.IMPRESION(Convert.ToInt32(datos.Cells["idReincorporacion"].Value), Usuarios.Id);
                }

                btnBuscar.PerformClick();
            }

        }

        private void txtCiclo_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void AlumnosLibresCurso_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
        }
    }
}
