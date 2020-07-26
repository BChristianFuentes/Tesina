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
    public partial class AgregarMateria : Form
    {
        public AgregarMateria()
        {
            InitializeComponent();
            cmb_esp.DataSource = Llenar.ObtenerEspecialidad();
            cmb_esp.ValueMember = "IdEspecialidad";
            cmb_esp.DisplayMember = "EspecialidadString";
        }

        LlenarCombo Llenar = new LlenarCombo();
        OperacionesMaterias Materias = new OperacionesMaterias();

        private void btn_agregarmateria_Click(object sender, EventArgs e)
        {
            if (txt_nommateria.Text == "")
            {
                Error.SetError(txt_nommateria, "Ingrese una materia");
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

        Materias.AgregarMateria(txt_nommateria, cmb_esp, 0, 0);
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
           
        }
    }
}
