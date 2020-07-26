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
    public partial class AlumnosJustificados : Form
    {
        public AlumnosJustificados()
        {
            InitializeComponent();
            cmbCurso.DataSource = llenar.ObtenerCursos();
            cmbCurso.ValueMember = "IdCurso";
            cmbCurso.DisplayMember = "CursoString";
        }
        LlenarCombo llenar = new LlenarCombo();
        Operaciones Oper = new Operaciones();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        private void InformeCurso_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }
        }

        private void btnBuscar_Click_1(object sender, EventArgs e)
        {
            if (cmbCurso.Text == "")
            {
                Error.SetError(cmbCurso, "Seleccione curso");
                cmbCurso.Focus();
                return;
            }
            Error.SetError(cmbCurso, "");
            if (txtCiclo.Text == "")
            {
                Error.SetError(txtCiclo, "Ingrese un ciclo");
                txtCiclo.Focus();
                return;
            }
            Error.SetError(txtCiclo, "");
            String FechaDesde = Convert.ToString(dtpDesde.Value.Year + "-" + dtpDesde.Value.Month + "-" + dtpDesde.Value.Day);
            String FechaHasta = Convert.ToString(dtpHasta.Value.Year + "-" + dtpHasta.Value.Month + "-" + dtpHasta.Value.Day);
            
            OperAlu.ListadoAsistenciaxAlumnoxCursoxJustificacion(cmbCurso, FechaDesde, FechaHasta, dgvJust);

            DataGridViewRow datos = dgvJust.CurrentRow;
            dgvJust.Columns["idAlumno"].Visible = false;
        }

        private void InformeCurso_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            txtCiclo.Text = Convert.ToString(dtpHasta.Value.Year);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            AlumnosJustificados.ActiveForm.Close();
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
