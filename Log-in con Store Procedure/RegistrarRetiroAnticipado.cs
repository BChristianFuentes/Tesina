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
    public partial class RegistrarRetiroAnticipado : Form
    {
        public RegistrarRetiroAnticipado()
        {
            InitializeComponent();

            cmbCurso.DataSource = llenar.ObtenerCursos();
            cmbCurso.ValueMember = "IdCurso";
            cmbCurso.DisplayMember = "CursoString";
            
        }

        LlenarCombo llenar = new LlenarCombo();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        Teclado Digitos = new Teclado();

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void RegistrarRetiroAnticipado_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
        }

        private void btnRegistrar_Click(object sender, EventArgs e)
        {
            RetirosAnticipados ret = new RetirosAnticipados();

            DataGridViewRow datos = ret.dtgListado.CurrentRow;
            //txtDocument.Text = datos.Cells["idSeguimiento"].Value.ToString();
            OperAlu.RegistrarRetiroAnticipado(Convert.ToInt32(txtId.Text),Usuarios.Id, Convert.ToInt32(txtDocument.Text), txtObser, Convert.ToInt32(ret.cmbConput.SelectedValue));
            this.Close();
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void txtHora_TextChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void txtObser_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
