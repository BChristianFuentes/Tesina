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
    public partial class BuscarNotasxMateria : Form
    {
        public BuscarNotasxMateria()
        {
            InitializeComponent();
            cmb_curso.DataSource = Llenar.ObtenerCursos();
            cmb_curso.ValueMember = "IdCurso";
            cmb_curso.DisplayMember = "CursoString";
            cmb_ciclo.DataSource = Llenar.ObtenerCiclos();
            cmb_ciclo.DisplayMember = "CicloString";
        }

        LlenarCombo Llenar = new LlenarCombo();
        OperacionesMaterias Materias = new OperacionesMaterias();
        OperacionesNotas Notas = new OperacionesNotas();

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
            if (cmb_materia.Text == "")
            {
                Error.SetError(cmb_materia, "Seleccione una materia");
                cmb_materia.Focus();
                return;
            }
            Error.SetError(cmb_materia, "");
            Notas.BuscarNotasxMateria(cmb_materia.SelectedText, cmb_curso, cmb_ciclo, dgv);
        }

        private void cmb_curso_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmb_materia.DataSource = Llenar.ObtenerMaterias(cmb_curso.SelectedIndex + 1);
            cmb_materia.ValueMember = "idMateria";
            cmb_materia.DisplayMember = "MateriaString";
        }

        private void btn_exportar_Click(object sender, EventArgs e)
        {
            Operaciones opera = new Operaciones();
            opera.ExportarExcel(dgv, "Alumnos de ", cmb_materia.Text + " " + cmb_curso.Text + " " + cmb_ciclo.Text,true);
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void BuscarNotasxMateria_Activated(object sender, EventArgs e)
        {
            btn_buscar.PerformClick();
        }
    }
}
