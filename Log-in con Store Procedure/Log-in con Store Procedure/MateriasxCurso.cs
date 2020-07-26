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
    public partial class MateriasxCurso : Form
    {
        LlenarCombo Llenar = new LlenarCombo();
        OperacionesMaterias OpMat = new OperacionesMaterias();
        public MateriasxCurso()
        {
            InitializeComponent();
            cmbCurso.DataSource = Llenar.ObtenerCursos();
            cmbCurso.ValueMember = "IdCurso";
            cmbCurso.DisplayMember = "CursoString";
            textBox1.Visible = false;
            btn_ag2.Enabled = false;
        }

        private void btn_cerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_buscar_Click(object sender, EventArgs e)
        {
            if (OperacionesMaterias.Operacion == 1)
            {
                OpMat.ListadoMatxCur(cmbCurso, dgv_prof);
                dgv_prof.Columns["ID Materia"].Visible = false;
                dgv_prof.Columns["ID MateriaxCurso"].Visible = false;
            }
            else if (OperacionesMaterias.Operacion == 0)
            {
                OpMat.ListadoProfxMatxCur(cmbCurso, dgv_prof);
                dgv_prof.Columns["id Profesor"].Visible = false;
            }
        }

        private void btn_agregar_Click(object sender, EventArgs e)
        {
            OpMat.AgrMatxCur(Convert.ToInt32(textBox1.Text), cmbCurso);
            this.Close();
        }

        private void btn_ag2_Click(object sender, EventArgs e)
        {
            DataGridViewRow datos = dgv_prof.CurrentRow;
            textBox2.Text = datos.Cells["ID MateriaxCurso"].Value.ToString();
            OpMat.AgrProfxMatxCur(Convert.ToInt32(textBox1.Text),Convert.ToInt32(textBox2.Text),0,0);
            OperacionesMaterias.Operacion = 0;
            this.Close();
        }

        private void dgv_prof_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btn_ag2.Enabled = true;
        }

        private void MateriasxCurso_Load(object sender, EventArgs e)
        {

        }
    }
}
