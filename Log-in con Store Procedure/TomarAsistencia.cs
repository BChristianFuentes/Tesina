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
    public partial class TomarAsistencia : Form
    {
        LlenarCombo llenar = new LlenarCombo();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        Teclado Digitos = new Teclado();
        public TomarAsistencia()
        {
            InitializeComponent();

            cmbCurso.SelectedIndexChanged -= new EventHandler(cmbCurso_SelectedIndexChanged);

            cmbCurso.DataSource = llenar.ObtenerCursos();
            cmbCurso.ValueMember = "IdCurso";
            cmbCurso.DisplayMember = "CursoString";
            //cmbCurso.SelectedIndex = -1;

            cmbSubMot.DataSource = llenar.ObtenerSubmotivo();
            cmbSubMot.DisplayMember = "SubMotivoString";
            cmbSubMot.ValueMember = "IdSubMotivo";
            //cmbSubMot.SelectedIndex = -1;

            cmbCurso.SelectedIndexChanged += new EventHandler(cmbCurso_SelectedIndexChanged);

        }

        private void button1_Click(object sender, EventArgs e)
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
                Error.SetError(cmbSubMot, "Ingrese una actividad");
                cmbSubMot.Focus();
                return;
            }
            Error.SetError(cmbSubMot, "");
            lblListado.Text = "Listado: " + cmbSubMot.Text;
            cmbAsis.DataSource = llenar.ObtenerMotivo(Convert.ToInt32(cmbSubMot.SelectedValue));
            cmbAsis.DisplayMember = "MotivoString";
            cmbAsis.ValueMember = "IdMotivo";

            String Fecha = Convert.ToString(dtpFecha.Value.Year + "-" + dtpFecha.Value.Month + "-" + dtpFecha.Value.Day);
            OperAlu.ListadoCursoPorDiv(Convert.ToInt32(dtpFecha.Value.Year), cmbCurso, cmbSubMot, Fecha, dtgListado);

            DataGridViewRow datos = dtgListado.CurrentRow;
            dtgListado.Columns["Id"].Visible = false;

            cmbAsis.Enabled = true;
            txtHora.Enabled = true;
            txtJust.Enabled = true;
            txtObser.Enabled = true;
            btnAsig.Enabled = true;
            //PruebalblListado.Text = Convert.ToString(Usuarios.Id);

            if (dtgListado.Rows.Count > 0)
            {
                dtgListado.CurrentCell = dtgListado.Rows[0].Cells[1];
            }                
        
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (dtgListado.SelectedRows.Count == 0)
            {
                Error.SetError(dtgListado, "Seleccione un alumno");
                dtgListado.Focus();
                return;
            }
            Error.SetError(dtgListado, "");
            if (cmbAsis.Text == "")
            {
                Error.SetError(cmbAsis, "Seleccione un valor");
                cmbAsis.Focus();
                return;
            }
            Error.SetError(cmbAsis, "");
            if (!txtHora.MaskCompleted)
            {
                Error.SetError(txtHora, "Ingrese la hora de ingreso de los alumnos");
                txtHora.Focus();
                return;
            }
            Error.SetError(txtHora, "");
            String Fecha = Convert.ToString(dtpFecha.Value.Year + "-" + dtpFecha.Value.Month + "-" + dtpFecha.Value.Day);
            DataGridViewRow datos = dtgListado.CurrentRow;
            OperAlu.TomarAsistencia(Convert.ToInt32(datos.Cells["Id"].Value), Usuarios.Id, cmbAsis, Fecha, txtHora, txtJust, txtObser, cmbSubMot, cmbCurso, Global.Evento);
            //OperAlu.ListadoCursoPorDiv(Convert.ToInt32(txtCiclo.Text), cmbCurso, cmbSubMot, Fecha, dtgListado);
            OperAlu.AlertaReincorporacion(Convert.ToInt32(cmbCurso.SelectedValue), dtpFecha.Value.Year, Convert.ToInt32(datos.Cells["Id"].Value));
            btnBuscar.PerformClick();
        }


        private void TomarAsistencia_KeyDown(object sender, KeyEventArgs e)
        {
            /*if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }*/
        }

        private void txtCiclo_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void cmbAsis_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void TomarAsistencia_Load(object sender, EventArgs e)
        {
            ControlBox = false;
            /*
            cmbAsis.Enabled = false;
            if (cmbSubMot.Enabled == false)
            {
                btnBuscar.Enabled = false;
            }
            */
            //btnBuscar.Enabled = false;
            Global.Evento = 1;
        }

        private void cmbSubMot_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnBuscar.Enabled = true;//btnBuscar.PerformClick();
        }

        private void chkAlerta_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click_2(object sender, EventArgs e)
        {
            this.Close();
        }

        private void lblListado_Click(object sender, EventArgs e)
        {

        }

        private void cmbCurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            dtpFecha.Enabled = true;
            cmbSubMot.Enabled = true;
            
        }        
            
    }
}
