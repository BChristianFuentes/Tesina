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
    public partial class InformeCurso : Form
    {
        public InformeCurso()
        {
            InitializeComponent();

            cmbCurso.DataSource = llenar.ObtenerCursos();
            cmbCurso.ValueMember = "IdCurso";
            cmbCurso.DisplayMember = "CursoString";
            
            //cmbCurso.SelectedIndex = -1;

            cmbCiclo.DataSource = llenar.ObtenerCiclos();
            cmbCiclo.ValueMember = "CicloString";
            cmbCiclo.DisplayMember = "CicloString";
            //cmbCiclo.SelectedIndex = -1;
            dtpHasta.MaxDate = Convert.ToDateTime(Oper.NombreArchivo(true, true, true));
           
        }
        LlenarCombo llenar = new LlenarCombo();
        Operaciones Oper = new Operaciones();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        private void InformeCurso_KeyDown(object sender, KeyEventArgs e)
        {
            /*if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }*/
        }

        public void btnBuscar_Click(object sender, EventArgs e)
        {
            
            if (cmbCurso.Text == "")
            {
                Error.SetError(cmbCurso, "Ingrese un curso");
                cmbCurso.Focus();
                return;
            }
            Error.SetError(cmbCurso, "");
            if (cmbCiclo.Text == "")
            {
                Error.SetError(cmbCiclo, "Ingrese un ciclo");
                cmbCiclo.Focus();
                return;
            }
            Error.SetError(cmbCiclo, "");

            String FechaDesde = Convert.ToString(dtpDesde.Value.Year + "-" + dtpDesde.Value.Month + "-" + dtpDesde.Value.Day);
            String FechaHasta = Convert.ToString(dtpHasta.Value.Year + "-" + dtpHasta.Value.Month + "-" + dtpHasta.Value.Day);
            //int ciclo = Convert.ToInt32(cmbCurso.SelectedValue);
            if (Global.informe == 0)
            {
                OperAlu.InformeCurso(cmbCurso,Convert.ToInt32(cmbCiclo.SelectedValue),FechaDesde,FechaHasta,dgvCuanti);
            }
            else
            {
                if (Global.informe == 1)
                {
                    OperAlu.InformeCursocuantiDOE(cmbCurso, FechaDesde, FechaHasta, dgvCuanti);
                    //OperAlu.InformeCursocualiDOE(cmbCurso, FechaDesde, FechaHasta, dgvCuali);
                }
            }
            if (dgvCuanti.Rows.Count > 0)
            {
                btnExport1.Enabled = true;
                btnExport2.Enabled = true;
            }
            //txtCiclo.Text = Convert.ToString(cmbCurso.SelectedValue);
        }

        public void btnExport_Click(object sender, EventArgs e)
        {
            Oper.ExportarExcel(dgvCuanti,"Cuantitativo Curso", cmbCurso.Text, true);
        }

        private void InformeCurso_Load(object sender, EventArgs e)
        {
            ControlBox = false;
            cmbCiclo.Text = Convert.ToString(dtpHasta.Value.Year);
        }

        private void btnExport2_Click(object sender, EventArgs e)
        {
            String FechaDesde = Convert.ToString(dtpDesde.Value.Year + "-" + dtpDesde.Value.Month + "-" + dtpDesde.Value.Day);
            String FechaHasta = Convert.ToString(dtpHasta.Value.Year + "-" + dtpHasta.Value.Month + "-" + dtpHasta.Value.Day);
            Oper.CualitativoCurso(cmbCurso, FechaDesde, FechaHasta, cmbCurso.Text);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            InformeCurso.ActiveForm.Close();
        }

        private void dgvCuanti_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
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
