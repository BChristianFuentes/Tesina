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
    public partial class AsistenciasxTrimestre : Form
    {
        public AsistenciasxTrimestre()
        {
            InitializeComponent();
        }

        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        Operaciones Oper = new Operaciones();

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (cmbCurso.Text == "")
            {
                Error.SetError(cmbCurso, "Seleccionar curso");
                cmbCurso.Focus();
                return;
            }
            Error.SetError(cmbCurso, "");
            if (cmbTurno.Text == "")
            {
                Error.SetError(cmbTurno, "Seleccionar turno");
                cmbTurno.Focus();
                return;
            }
            Error.SetError(cmbTurno, "");
            /*
            String Fecha1 = Convert.ToString(dtpTri1.Value.Year + "-" + dtpTri1.Value.Month + "-" + dtpTri1.Value.Day);
            String Fecha2 = Convert.ToString(dtpTri2.Value.Year + "-" + dtpTri2.Value.Month + "-" + dtpTri2.Value.Day);
            String Fecha3 = Convert.ToString(dtpTri3.Value.Year + "-" + dtpTri3.Value.Month + "-" + dtpTri3.Value.Day);
            String Fecha4 = Convert.ToString(dtpTri4.Value.Year + "-" + dtpTri4.Value.Month + "-" + dtpTri4.Value.Day);
            String Fecha5 = Convert.ToString(dtpTri5.Value.Year + "-" + dtpTri5.Value.Month + "-" + dtpTri5.Value.Day);
            String Fecha6 = Convert.ToString(dtpTri6.Value.Year + "-" + dtpTri6.Value.Month + "-" + dtpTri6.Value.Day);
            OperAlu.ImprimirReincorporacion(Convert.ToInt32(txtId.Text), Fecha1, Fecha2, Fecha3, Fecha4, Fecha5, Fecha6, dtgListado);
            dtgListado.Columns.Remove("nombre");
            dtgListado.Columns.Remove("apellido");
            dtgListado.Columns.Remove("Cursos");
            dtgListado.Columns.Remove("Turno");
            */
        }
        private void btnReinc_Click(object sender, EventArgs e)
        {
            //Oper.ExportarRein(dtgListado, dtpTri6, Convert.ToString(txtNom.Text), Convert.ToString(txtApel.Text), Convert.ToInt32(cmbCurso.SelectedValue), Convert.ToString(cmbTurno.SelectedValue));
        }

    }
}
