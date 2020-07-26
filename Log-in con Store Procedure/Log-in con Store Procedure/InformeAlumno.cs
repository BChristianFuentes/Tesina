using System;
using System.Windows.Forms;

namespace Log_in_con_Store_Procedure
{
    public partial class InformeAlumno : Form
    {
        public InformeAlumno()
        {
            InitializeComponent();
            LlenarCombo llenar = new LlenarCombo();

            cmbCiclo.DataSource = llenar.ObtenerCiclos();
            cmbCiclo.DisplayMember = "Ciclo";
            //cmbCiclo.SelectedIndex = -1;
            dtpHasta.MaxDate = Convert.ToDateTime(Oper.NombreArchivo(true, true, true));

        }
        Operaciones Oper = new Operaciones();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        Teclado Digitos = new Teclado();
        string nomar;

        private void button1_Click(object sender, EventArgs e)
        {
            String FechaDesde = Convert.ToString(dtpDesde.Value.Year + "-" + dtpDesde.Value.Month + "-" + dtpDesde.Value.Day);
            String FechaHasta = Convert.ToString(dtpHasta.Value.Year + "-" + dtpHasta.Value.Month + "-" + dtpHasta.Value.Day);
            /*if (Global.informe == 0)
            {*/
                OperAlu.InformeAlumnocuanti(txtNom, txtApel, FechaDesde, FechaHasta, txtDoc, dgvCuanti);
            /*}
            else
            {
                if (Global.informe == 1)
                {
                    OperAlu.InformeAlumnocuantiDOE(txtNom, txtApel, Convert.ToInt32(txtCiclo.Text), FechaDesde, FechaHasta, dgvCuanti);
                }
            } */
            if (dgvCuanti.Rows.Count == 0)
            {
                btnExport1.Enabled = false;
            }
            if(dgvCuanti.Rows.Count > 0)
            {
                btnExport1.Enabled = true;
            }
            if (dgvCuali.Rows.Count == 0)
            {
                btnExport2.Enabled = false;
            }
            if (dgvCuali.Rows.Count > 0)
            {
                btnExport2.Enabled = true;
            }
        }

        private void btnExport1_Click(object sender, EventArgs e)
        {

            DataGridViewRow datos = dgvCuanti.CurrentRow;
            Oper.ExportarExcel(dgvCuanti, "Cuantitativo Alumno", datos.Cells["nombre"].Value.ToString() + " " + datos.Cells["apellido"].Value.ToString() + " " + datos.Cells["Cursos"].Value.ToString(), true);
        }

        private void btnExport2_Click(object sender, EventArgs e)
        {
            DataGridViewRow datos = dgvCuali.CurrentRow;
            Oper.ExportarExcel(dgvCuali, "Cualitativo Alumno", nomar, true); 
        }

        private void InformeAlumno_KeyDown(object sender, KeyEventArgs e)
        {
            /*if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }*/
        }

        private void txtNom_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }

        private void txtApel_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }

        private void txtDoc_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void InformeAlumno_Load(object sender, EventArgs e)
        {
            ControlBox = false;
            if (cmbCiclo.Text == "")
            {
                cmbCiclo.Text = Convert.ToString(dtpHasta.Value.Year);
            }
            //btnBuscar.PerformClick();
        }

        private void dgvCuanti_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            String FechaDesde = Convert.ToString(dtpDesde.Value.Year + "-" + dtpDesde.Value.Month + "-" + dtpDesde.Value.Day);
            String FechaHasta = Convert.ToString(dtpHasta.Value.Year + "-" + dtpHasta.Value.Month + "-" + dtpHasta.Value.Day);
            
            DataGridViewRow datos = dgvCuanti.CurrentRow;
            OperAlu.InformeAlumnoCuali(datos.Cells["Nombre"].Value.ToString(), datos.Cells["Apellido"].Value.ToString(), FechaDesde, FechaHasta, dgvCuali);
            if (dgvCuali.Rows.Count == 0)
            {
                btnExport2.Enabled = false;
            }
            if (dgvCuali.Rows.Count > 0)
            {
                btnExport2.Enabled = true;
            }
            nomar = datos.Cells["nombre"].Value.ToString() + " " + datos.Cells["apellido"].Value.ToString() + " " + datos.Cells["Cursos"].Value.ToString();
        }

        private void txtCiclo_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void dgvCuali_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        
        private void button1_Click_2(object sender, EventArgs e)
        {
            this.Close();
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
