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
    public partial class AsignarProfesorAMateria : Form
    {
        public AsignarProfesorAMateria()
        {
            InitializeComponent();
            cmb_curso.DataSource = Llenar.ObtenerCursos();
            cmb_curso.ValueMember = "IdCurso";
            cmb_curso.DisplayMember = "CursoString";
        }

        LlenarCombo Llenar = new LlenarCombo();
        OperacionesMaterias materias = new OperacionesMaterias();

        private void btn_asignarprofesor_Click(object sender, EventArgs e)
        {
            if (txt_nomprof.Text == "")
            {
                Error.SetError(txt_nomprof, "Ingrese un profesor");
                txt_nomprof.Focus();
                return;
            }
            Error.SetError(txt_nomprof, "");
            if (cmb_curso.Text == "")
            {
                Error.SetError(cmb_curso, "Seleccione un curso");
                cmb_curso.Focus();
                return;
            }
            Error.SetError(cmb_curso, "");
            materias.AgrProfxMatxCur(Convert.ToInt32(txt_idprof.Text),
                                        Convert.ToInt32(dgv.CurrentRow.Cells["id materiaxcurso"].Value), 0, 0);
        }

        private void cmb_curso_SelectedIndexChanged(object sender, EventArgs e)
        {
            materias.ListadoMatxCur(cmb_curso, dgv);
        }
    }
}
