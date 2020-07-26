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
    public partial class PromedioGeneralxCurso : Form
    {
        public PromedioGeneralxCurso()
        {
            InitializeComponent();
            cmb_curso.DataSource = Llenar.ObtenerCursos();
            cmb_curso.ValueMember = "IdCurso";
            cmb_curso.DisplayMember = "CursoString";
            cmb_ciclo.DataSource = Llenar.ObtenerCiclos();
            cmb_ciclo.DisplayMember = "CicloString";
        }

        LlenarCombo Llenar = new LlenarCombo();

        private void btn_buscar_Click(object sender, EventArgs e)
        {
            OperacionesAlumnos opa = new OperacionesAlumnos();
            opa.PromedioGeneral(dgv, cmb_curso, cmb_ciclo);
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_exportar_Click(object sender, EventArgs e)
        {
            Operaciones op = new Operaciones();
            op.ExportarExcel(dgv, "Promedio General de ", cmb_curso.Text + " " + cmb_ciclo, true);
        }

        private void cmb_curso_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBox3.Text = (cmb_curso.SelectedIndex + 1).ToString();
        }

        private void cmb_ciclo_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBox3.Text = (cmb_ciclo.SelectedIndex + 2018).ToString();
        }
    }
}
