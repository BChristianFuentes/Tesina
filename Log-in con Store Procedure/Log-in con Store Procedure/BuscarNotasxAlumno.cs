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
    public partial class BuscarNotasxAlumno : Form
    {
        public BuscarNotasxAlumno()
        {
            InitializeComponent();
            cmb_curso.DataSource = Llenar.ObtenerCursos();
            cmb_curso.ValueMember = "IdCurso";
            cmb_curso.DisplayMember = "CursoString";
            cmb_ciclo.DataSource = Llenar.ObtenerCiclos();
            cmb_ciclo.DisplayMember = "CicloString";
        }

        LlenarCombo Llenar = new LlenarCombo();
        OperacionesNotas notas = new OperacionesNotas();

        private void btn_buscar_Click(object sender, EventArgs e)
        {
            if (cmb_curso.Text == "")
            {
                Error.SetError(cmb_curso, "Seleccione un curso");
                cmb_curso.Focus();
                return;
            }
            Error.SetError(cmb_curso, "");
            if (cmb_ciclo.Text == "")
            {
                Error.SetError(cmb_ciclo, "Seleccione un ciclo");
                cmb_ciclo.Focus();
                return;
            }
            Error.SetError(cmb_ciclo, "");
            notas.BuscarNotasxAlumno(txt_nomalumno.Text, txt_apellidoalumno.Text, cmb_curso.SelectedIndex, cmb_ciclo.SelectedIndex, dgv);
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void BuscarNotasxAlumno_Activated(object sender, EventArgs e)
        {
            btn_buscar.PerformClick();
        }

        private void cmb_curso_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBox2.Text = (cmb_curso.SelectedIndex + 1).ToString();
        }

        private void cmb_ciclo_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBox1.Text = (cmb_ciclo.SelectedIndex + 2018).ToString();
        }

        private void btn_exportar_Click(object sender, EventArgs e)
        {
            Operaciones opera = new Operaciones();
            opera.ExportarExcel(dgv, "Boletín", txt_nomalumno.Text + " " + txt_apellidoalumno.Text + " " + cmb_curso.Text + " " + cmb_ciclo.Text,true);
        }
    }
}
