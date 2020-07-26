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
    public partial class Reportes : Form
    {
        public Reportes()
        {
            InitializeComponent();
            //cmbCurso.DataSource = llenar.ObtenerCursos();
            //cmbCurso.ValueMember = "IdCurso";
            //cmbCurso.DisplayMember = "CursoString";

            //cmbCurso.SelectedIndex = -1;
            cmbCiclo.DataSource = llenar.ObtenerCiclos();
            cmbCiclo.ValueMember = "CicloString";
            cmbCiclo.DisplayMember = "CicloString";
            cmbCiclo.Text = Oper.NombreArchivo(false, false, true);
            btnBuscar.PerformClick();
           
        }
        LlenarCombo llenar = new LlenarCombo();
        Operaciones Oper = new Operaciones();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        Teclado Digitos = new Teclado();
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (cmbCurso.Text == "")
            {
                Error.SetError(cmbCurso, "Ingrese un Mes");
                cmbCurso.Focus();
                return;
            }
            Error.SetError(cmbCurso, "");
            if (cmbCiclo.Text == "")
            {
                Error.SetError(cmbCiclo, "Ingrese un Ciclo");
                cmbCiclo.Focus();
                return;
            }
            Error.SetError(cmbCiclo, "");
            if (txtAsis1.Text == "")
            {
                Error.SetError(txtAsis1, "Ingrese el minimo de asistencias");
                txtAsis1.Focus();
                return;
            }
            Error.SetError(txtAsis1, "");
            if (txtAsis2.Text == "")
            {
                Error.SetError(txtAsis2, "Ingrese el máximo de asistencias");
                txtAsis2.Focus();
                return;
            }
            Error.SetError(txtAsis2, "");

            OperAlu.ReporteAlumnos(Convert.ToInt32(cmbCurso.Text), Convert.ToInt32(cmbCiclo.SelectedValue), Convert.ToInt32(txtAsis1.Text), Convert.ToInt32(txtAsis2.Text), dgvListado);

            dgvListado.Columns["idAlumno"].Visible = false;
            if (dgvListado.Rows.Count > 0)
            {
                dgvListado.CurrentCell = dgvListado.Rows[0].Cells[1];
                btnReinc.Enabled = true;
            }
        }

        private void Reportes_Load(object sender, EventArgs e)
        {
            ControlBox = false;
        }
        
        private void button1_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnReinc_Click(object sender, EventArgs e)
        {
            Oper.ExportarExcel(dgvListado, "Reporte por Mes","", true);
        }

        private void txtAsis2_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void txtAsis1_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void txtCiclo_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }
    }
}
