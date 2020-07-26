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
    public partial class ModificarAsist : Form
    {
        LlenarCombo llenar = new LlenarCombo();
        Teclado Digitos = new Teclado();
        OperacionesAlumnos operalu = new OperacionesAlumnos();
        public ModificarAsist()
        {
            InitializeComponent();
            btnBuscar.Enabled=false;
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
            dtpFecha.MaxDate = Convert.ToDateTime(Oper.NombreArchivo(true, true, true));

        }
        Operaciones Oper = new Operaciones();
        private void button1_Click(object sender, EventArgs e)
        {
            //BuscarPorCurso
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
            lblListado.Text = "Listado: " + cmbSubMot.Text;
            cmbAsis.DataSource = llenar.ObtenerMotivo(Convert.ToInt32(cmbSubMot.SelectedValue));
            cmbAsis.DisplayMember = "MotivoString";
            cmbAsis.ValueMember = "IdMotivo";
            String Fecha = Convert.ToString(dtpFecha.Value.Year + "-" + dtpFecha.Value.Month + "-" + dtpFecha.Value.Day);
            if (Global.Modificar == 0)
                //operalu.ListadoAlumnosaJustificar(Convert.ToInt32(cmbCurso.SelectedValue), Fecha, dtgListado);

                operalu.ListadoAlumnosaJustificar(Convert.ToInt32(cmbCurso.SelectedValue), Convert.ToInt32(cmbSubMot.SelectedValue), Fecha, dtgListado);
            dtgListado.Columns["idAlumno"].Visible = false;
            dtgListado.Columns["idSeguimiento"].Visible = false;
            //dtgListado.Columns["justificado"].Visible = false;
            //dtgListado.Columns["observaciones"].Visible = false;
            //dtgListado.Columns["tipo de clase"].Visible = false;

            //dtgListado.Columns["idSeguimiento"].Visible = false;

            if (dtgListado.Rows.Count > 0)
            {
                dtgListado.CurrentCell = dtgListado.Rows[0].Cells[2];
                cmbAsis.Enabled = true;
                txtHora.Enabled = true;
                //txtjust.Enabled = true;
                //txtObserv.Enabled = true;
                btnMod.Enabled = true;
            }

            
            /*
            cmbSubMot.Enabled = true;
            cmbAsis.Enabled = true;
            txtHora.Enabled = true;
            txtjust.Enabled = true;
            txtObserv.Enabled = true;
            */
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
            //Tomar Asistencia
            DataGridViewRow dtrow = dtgListado.CurrentRow;
            int idseg = Convert.ToInt32(dtrow.Cells["idSeguimiento"].Value);
            //int idaxc = Convert.ToInt32(dtrow.Cells["idAlumnxcurso"].Value);
            String Fecha = Convert.ToString(dtpFecha.Value.Year + "-" + dtpFecha.Value.Month + "-" + dtpFecha.Value.Day);
            operalu.ModificarAsistencia(idseg, Usuarios.Id, Convert.ToInt32(cmbAsis.SelectedValue), Convert.ToInt32(cmbSubMot.SelectedValue), Convert.ToInt32(dtrow.Cells["idAlumno"].Value), cmbCurso, Fecha, txtHora);
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

        private void ModificarAsist_Load(object sender, EventArgs e)
        {
            ControlBox = false;
            //txtCiclo.Text = Convert.ToString(dtpFecha.Value.Year);
            cmbAsis.Enabled = false;
        }

        private void cmbSubMot_SelectedIndexChanged(object sender, EventArgs e)
        {
            //btnBuscar.PerformClick();
            btnBuscar.Enabled = true;            
        }
        
        private void button1_Click_2(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dtgListado_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            /*
            DataGridViewRow datos = dtgListado.CurrentRow;
            txtjust.Text = datos.Cells["justificado"].Value.ToString();
            txtObserv.Text = datos.Cells["observaciones"].Value.ToString();
            txtHora.Text = datos.Cells["hora"].Value.ToString();
            cmbSubMot.Text = datos.Cells["tiposubmotivo"].Value.ToString();
            //cmbAsis.Text = datos.Cells["asistencia"].Value.ToString();
            */
        }

        private void cmbCurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            dtpFecha.Enabled = true;
            cmbSubMot.Enabled = true;
        }

        private void lblSubMot_Click(object sender, EventArgs e)
        {

        }
    }
}
