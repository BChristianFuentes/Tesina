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
    public partial class AsignarCursoAMateria : Form
    {
        public AsignarCursoAMateria()
        {
            InitializeComponent();
            cmb_curso.DataSource = Llenar.ObtenerCursos();
            cmb_curso.ValueMember = "IdCurso";
            cmb_curso.DisplayMember = "CursoString";
            cmb_esp.DataSource = Llenar.ObtenerEspecialidad();
            cmb_esp.ValueMember = "IdEspecialidad";
            cmb_esp.DisplayMember = "EspecialidadString";

        }

        LlenarCombo Llenar = new LlenarCombo();
        OperacionesMaterias Materias = new OperacionesMaterias();

        private void btn_buscar_Click(object sender, EventArgs e)
        {
            if (txt_nommateria.Text == "")
            {
                Error.SetError(txt_nommateria, "Ingrese materia");
                txt_nommateria.Focus();
                return;
            }
            Error.SetError(txt_nommateria, "");
            if (cmb_esp.Text == "")
            {
                Error.SetError(cmb_esp, "Seleccione una especialidad");
                cmb_esp.Focus();
                return;
            }
            Error.SetError(cmb_esp, "");
            Materias.BuscarMateriasxEsp(txt_nommateria, cmb_esp, dgv);
        }

        private void btn_asignar_Click(object sender, EventArgs e)
        {
            Materias.AgrMatxCur(Convert.ToInt32(dgv.CurrentRow.Cells["idmateria"].Value), cmb_curso);
            
        }
    }
}
