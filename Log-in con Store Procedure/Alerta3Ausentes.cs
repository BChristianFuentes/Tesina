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
    public partial class Alerta3Ausentes : Form
    {
        public Alerta3Ausentes()
        {
            InitializeComponent();
            dtpHasta.MaxDate = Convert.ToDateTime(Oper.NombreArchivo(true, true, true));
            
        }
        Operaciones Oper = new Operaciones();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            String FechaDesde = Convert.ToString(dtpDesde.Value.Year + "-" + dtpDesde.Value.Month + "-" + dtpDesde.Value.Day);
            String FechaHasta = Convert.ToString(dtpHasta.Value.Year + "-" + dtpHasta.Value.Month + "-" + dtpHasta.Value.Day);
            OperAlu.Alerta3Seguidas(FechaDesde, FechaHasta, dgvListado);

            if (dgvListado.Rows.Count > 0)
            {
                dgvListado.CurrentCell = dgvListado.Rows[0].Cells[1];
                btnReinc.Enabled = true;
            }
            if (dgvListado.Rows.Count == 0)
            {
                btnReinc.Enabled = false;
            }
        }

        private void Alerta3Ausentes_Load(object sender, EventArgs e)
        {
            btnReinc.Enabled = false;
            ControlBox = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
            //Alerta3Ausentes.ActiveForm.Close();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnReinc_Click(object sender, EventArgs e)
        {
            Oper.ExportarExcel(dgvListado, "3 Ausentes consecutivos", "", true);
        }

        private void lblCiclo_Click(object sender, EventArgs e)
        {

        }

        private void txtMes_TextChanged(object sender, EventArgs e)
        {

        }



        private void txtCiclo_TextChanged(object sender, EventArgs e)
        {

        }

        private void dtpHasta_ValueChanged(object sender, EventArgs e)
        {
            dtpDesde.MaxDate = dtpHasta.Value;
            
        }

        private void dtpDesde_ValueChanged(object sender, EventArgs e)
        {
            dtpHasta.MinDate = dtpDesde.Value;
        }
    }
}
