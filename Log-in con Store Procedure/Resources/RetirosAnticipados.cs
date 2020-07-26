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

            cmbCurso.SelectedIndex = -1;
        }

        LlenarCombo llenar = new LlenarCombo();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        Teclado Digitos = new Teclado();

        private void btnRegistro_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<RegistrarRetiroAnticipado>().Count() == 0)
            {
                RegistrarRetiroAnticipado abrir = new RegistrarRetiroAnticipado();
                abrir.cmbCurso.SelectedValue = cmbCurso.SelectedValue;
                abrir.txtCiclo.Text = txtCiclo.Text;
                abrir.dtpFecha.Text = dtpFecha.Text;
                abrir.txtHora.Text = txtHora.Text;
                abrir.Show();
            }
            else
                Application.OpenForms["RegistrarRetiroAnticipado"].BringToFront();
        }

        private void RetirosAnticipados_Load(object sender, EventArgs e)
        {
            txtCiclo.Text = Convert.ToString(dtpFecha.Value.Year);
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
