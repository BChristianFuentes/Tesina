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
    public partial class BusquedaMotivo : Form
    {
        public BusquedaMotivo()
        {
            InitializeComponent();
            
            cmbCurso.DataSource = llenar.ObtenerCursos();
            cmbCurso.ValueMember = "IdCurso";
            cmbCurso.DisplayMember = "CursoString";
            

            cmbSubMot.DataSource = llenar.ObtenerSubmotivo();
            cmbSubMot.DisplayMember = "SubMotivoString";
            cmbSubMot.ValueMember = "IdSubMotivo";

            dtpHasta.MaxDate = Convert.ToDateTime(Oper.NombreArchivo(true, true, true));
        }

        LlenarCombo llenar = new LlenarCombo();
        Operaciones Oper = new Operaciones();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnReinc_Click(object sender, EventArgs e)
        {
            Oper.ExportarExcel(dtgListado, "Motivo", cmbSubMot.Text + " " + cmbAsis.Text + " " + cmbCurso.Text,true);
        }

        private void cmbCurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (cmbCurso.Text == "")
            {
                Error.SetError(cmbCurso, "Ingrese un curso");
                cmbCurso.Focus();
                return;
            }
            Error.SetError(cmbCurso, "");
            if (cmbSubMot.Text == "")
            {
                Error.SetError(cmbSubMot, "Ingrese un nombre de actividad");
                cmbSubMot.Focus();
                return;
            }
            Error.SetError(cmbSubMot, "");
            if (cmbAsis.Text == "")
            {
                Error.SetError(cmbAsis, "Ingrese el tipo de asistencia");
                cmbAsis.Focus();
                return;
            }
            Error.SetError(cmbAsis, "");

            String FechaDesde = Convert.ToString(dtpDesde.Value.Year + "-" + dtpDesde.Value.Month + "-" + dtpDesde.Value.Day);
            String FechaHasta = Convert.ToString(dtpHasta.Value.Year + "-" + dtpHasta.Value.Month + "-" + dtpHasta.Value.Day);
            OperAlu.BusquedaxMotivo(Convert.ToInt32(cmbCurso.SelectedValue),Convert.ToInt32(cmbAsis.SelectedValue),FechaDesde,FechaHasta, dtgListado);
            if (dtgListado.Rows.Count > 0)
            {
                dtgListado.Columns["idAlumnxcurso"].Visible = false;
                dtgListado.Columns["idAlumno"].Visible = false;
                dtgListado.Columns["idCurso"].Visible = false;
                dtgListado.Columns["idSeguimiento"].Visible = false;
                btnReinc.Enabled = true;
            }
            else
            {
                btnReinc.Enabled = false;
            }
        }

        private void cmbSubMot_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbAsis.DataSource = llenar.ObtenerMotivo(Convert.ToInt32(1));
            cmbAsis.DisplayMember = "MotivoString";
            cmbAsis.ValueMember = "IdMotivo";
            cmbAsis.Enabled = true;
        }

        private void BusquedaMotivo_Load(object sender, EventArgs e)
        {

        }

        private void dtpDesde_ValueChanged(object sender, EventArgs e)
        {
            dtpHasta.MinDate = dtpDesde.Value;
        }

        private void dtpHasta_ValueChanged(object sender, EventArgs e)
        {
            dtpDesde.MaxDate = dtpHasta.Value;
        }
    }
}
