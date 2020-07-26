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
    public partial class RetirosAnticipados : Form
    {
        public RetirosAnticipados()
        {
            InitializeComponent();

            cmbCurso.DataSource = llenar.ObtenerCursos();
            cmbCurso.ValueMember = "IdCurso";
            cmbCurso.DisplayMember = "CursoString";
            //cmbCurso.SelectedIndex = -1;

            cmbConput.DataSource = llenar.ObtenerRetiroAnticipado();
            cmbConput.ValueMember = "IdRetiroAnticipado";
            cmbConput.DisplayMember = "RetiroAnticipadoString";
            //cmbConput.SelectedIndex = -1;


        }

        LlenarCombo llenar = new LlenarCombo();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        Teclado Digitos = new Teclado();

        private void btnRegistro_Click(object sender, EventArgs e)
        {
            if (cmbConput.Text == "")
            {
                Error.SetError(cmbConput, "Ingrese un tipo de retiro anticipado");
                cmbConput.Focus();
                return;
            }
            Error.SetError(cmbConput, "");
            if (!txtHora.MaskCompleted)
            {
                Error.SetError(txtHora, "Ingrese un horario de retiro");
                txtHora.Focus();
                return;
            }
            Error.SetError(txtHora, "");
            if (dtgListado.SelectedRows.Count == 0)
            {
                Error.SetError(dtgListado, "Seleccione un alumno");
                dtgListado.Focus();
                return;
            }
            Error.SetError(dtgListado, "");
            if (Application.OpenForms.OfType<RegistrarRetiroAnticipado>().Count() == 0)
            {
                RegistrarRetiroAnticipado abrir = new RegistrarRetiroAnticipado();
                DataGridViewRow datos = dtgListado.CurrentRow;
                abrir.txtId.Text = datos.Cells["idAlumno"].Value.ToString();
                abrir.txtNombre.Text = datos.Cells["nombre"].Value.ToString();
                abrir.txtNombre.Enabled = false;
                abrir.txtApellido.Text = datos.Cells["apellido"].Value.ToString();
                abrir.txtApellido.Enabled = false;
                abrir.txtDocument.Text = datos.Cells["idSeguimiento"].Value.ToString();
                abrir.cmbCurso.SelectedValue = cmbCurso.SelectedValue;
                abrir.cmbCurso.Enabled = false;
                abrir.txtHora.Text = txtHora.Text;

                abrir.Show();
            }
            else
                Application.OpenForms["RegistrarRetiroAnticipado"].BringToFront();
        }

        private void RetirosAnticipados_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (cmbCurso.Text == "")
            {
                Error.SetError(cmbCurso, "Ingrese un curso");
                cmbCurso.Focus();
                return;
            }
            Error.SetError(cmbCurso, "");

            String Fecha = Convert.ToString(dtpFecha.Value.Year + "-" + dtpFecha.Value.Month + "-" + dtpFecha.Value.Day);
            OperAlu.BuscarRetiroAnticipado(cmbCurso, 1, Fecha, dtgListado);
            if (dtgListado.Rows.Count > 0)
            {
                dtgListado.CurrentCell = dtgListado.Rows[0].Cells[1];
                if (txtHora.MaskCompleted)
                {
                    btnRegistro.Enabled = true;
                }

            }
            dtgListado.Columns["idAlumno"].Visible = false;
            dtgListado.Columns["idSeguimiento"].Visible = false;
            //adtgListado.Columns["tipo de clase"].Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txtHora_TextChanged(object sender, EventArgs e)
        {
            if (txtHora.MaskCompleted)
            {
                btnRegistro.Enabled = true;
            }
        }

        private void txatHora_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtHora_MaskInputRejected(object sender, MaskInputRejectedEventArgs e)
        {

        }
    }
}
