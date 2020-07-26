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
    public partial class Justificaciones : Form
    {
        public Justificaciones()
        {
            InitializeComponent();

            cmbCurso.SelectedIndexChanged -= new EventHandler(cmbCurso_SelectedIndexChanged);

            cmbCurso.DataSource = llenar.ObtenerCursos();
            cmbCurso.ValueMember = "IdCurso";
            cmbCurso.DisplayMember = "CursoString";

            cmbSubMot.DataSource = llenar.ObtenerSubmotivo();
            cmbSubMot.DisplayMember = "SubMotivoString";
            cmbSubMot.ValueMember = "IdSubMotivo";

            cmbCurso.SelectedIndexChanged += new EventHandler(cmbCurso_SelectedIndexChanged);
            dtpFecha.MaxDate = Convert.ToDateTime(Oper.NombreArchivo(true, true, true));
        }
        LlenarCombo llenar = new LlenarCombo();
        Operaciones Oper = new Operaciones();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        private void btnBuscar_Click_1(object sender, EventArgs e)
        {
            if (cmbCurso.Text == "")
            {
                Error.SetError(cmbCurso, "Ingrese un curso");
                cmbCurso.Focus();
                return;
            }
            Error.SetError(cmbCurso, "");

            String Fecha = Convert.ToString(dtpFecha.Value.Year + "-" + dtpFecha.Value.Month + "-" + dtpFecha.Value.Day);

            OperAlu.ListadoAlumnosaJustificar(Convert.ToInt32(cmbCurso.SelectedValue), Convert.ToInt32(cmbSubMot.SelectedValue), Fecha, dtgListado);

            dtgListado.Columns["idSeguimiento"].Visible = false;
            dtgListado.Columns["idAlumno"].Visible = false;

            if (dtgListado.Rows.Count > 0)
            {
                dtgListado.CurrentCell = dtgListado.Rows[0].Cells[2];
                btnAsig.Enabled = true;
                txtJust.Enabled = true;
                txtObs.Enabled = true;
                btnAsig.Enabled = true;
            }


        }

        private void btnAsig_Click(object sender, EventArgs e)
        {
            if (dtgListado.SelectedRows.Count == 0)
            {
                Error.SetError(dtgListado, "Seleccione un alumno");
                dtgListado.Focus();
                return;
            }
            Error.SetError(dtgListado, "");

            String Fecha = Convert.ToString(dtpFecha.Value.Year + "-" + dtpFecha.Value.Month + "-" + dtpFecha.Value.Day);
            DataGridViewRow datos = dtgListado.CurrentRow;
            OperAlu.ModificarJustificacion(Convert.ToInt32(datos.Cells["idSeguimiento"].Value.ToString()), txtJust, txtObs, Usuarios.Id);
            btnBuscar.PerformClick();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<AlumnosJustificados>().Count() == 0)
            {
                AlumnosJustificados abrir = new AlumnosJustificados();
                abrir.Show();
            }
            else
                Application.OpenForms["AlumnosJustificados"].BringToFront();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Justificaciones.ActiveForm.Close();
        }

        private void button1_Click_2(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Justificaciones_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            /*
            if (dtgListado.SelectedRows.Count>0)
            {
                DataGridViewRow datos = dtgListado.CurrentRow;
                txtJust.Text = datos.Cells["justificado"].Value.ToString();
                txtObs.Text = datos.Cells["observaciones"].Value.ToString();
            }
            */
        }

        private void dtgListado_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow datos = dtgListado.CurrentRow;
            /*if (datos.Cells["justificado"].Value.ToString() == null || datos.Cells["justificado"].Value.ToString() == "")
                txtJust.Text = datos.Cells["justificado"].Value.ToString();
            else
                txtJust.Text = "";
            if (datos.Cells["observaciones"].Value.ToString() == null || datos.Cells["observaciones"].Value.ToString() == "")
                txtObs.Text = datos.Cells["observaciones"].Value.ToString();
            else
                txtObs.Text = "";*/
            txtJust.Text = datos.Cells["justificado"].Value.ToString();
            txtObs.Text = datos.Cells["observaciones"].Value.ToString();

        }

        private void cmbCurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            dtpFecha.Enabled = true;
            btnBuscar.Enabled = true;
        }
    }
}
