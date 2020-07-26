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
    public partial class AgregarModificarMotivos : Form
    {
        Usuarios OperUsu = new Usuarios();
        LlenarCombo llenar = new LlenarCombo();
        int comput;
        public AgregarModificarMotivos()
        {
            InitializeComponent();

            cmbEve.DataSource = llenar.ObtenerEventos();
            cmbEve.ValueMember = "IdEvento";
            cmbEve.DisplayMember = "EventoString";
            //cmbEve.SelectedIndex = -1;

            cmbSub.DataSource = llenar.ObtenerSubmotivo();
            cmbSub.DisplayMember = "SubMotivoString";
            cmbSub.ValueMember = "IdSubMotivo";
            //cmbSub.SelectedIndex = -1;

            
            if (Global.AgregarOModificar == 0)
            {
                //txtId.Enabled = false;
                btnMod.Visible = false;
                btnAgregar.Visible = true;
                this.Text = "Agregar Motivo";
            }
            if (Global.AgregarOModificar == 1)
            {
                
                //txtId.Enabled = false;
                btnAgregar.Visible = false;
                btnMod.Visible = true;
                this.Text = "Modificar Motivo";
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            /*
            if (txtId.Text == "")
            {
                Error.SetError(txtId, "Ingrese un id");
                txtId.Focus();
                return;
            }
            Error.SetError(txtId, "");
            */
            if (txtMot.Text == "")
            {
                Error.SetError(txtMot, "Ingrese una asistencia");
                txtMot.Focus();
                return;
            }
            Error.SetError(txtMot, "");
            
            if (txtDesc.Text == "")
            {
                Error.SetError(txtDesc, "Ingrese una descripción");
                txtDesc.Focus();
                return;
            }
            Error.SetError(txtDesc, "");
            
            if (txtVal.Text == "")
            {
                Error.SetError(txtVal, "Seleccione un valor de imputación");
                txtVal.Focus();
                return;
            }
            Error.SetError(txtVal, "");

            if (cmbConput.Text == "")
            {
                Error.SetError(cmbConput, "Ingrese para saber si es computable o no");
                cmbConput.Focus();
                return;
            }
            Error.SetError(cmbConput, "");

            if (cmbSub.Text == "")
            {
                Error.SetError(cmbSub, "Seleccione una actividad");
                cmbSub.Focus();
                return;
            }
            Error.SetError(cmbSub, "");
            if (cmbEve.Text == "")
            {
                Error.SetError(cmbEve, "Seleccione un tipo de Evento");
                cmbEve.Focus();
                return;
            }
            Error.SetError(cmbEve, "");

            if (cmbConput.Text == "Si")
            {
                comput = 1;
            }
            if (cmbConput.Text == "No")
            {
                comput = 0;
            }

            OperUsu.AgregarMotivos(Convert.ToString(txtMot.Text), comput, Convert.ToSingle(txtVal.Text), Convert.ToInt32(cmbSub.SelectedValue), Convert.ToInt32(cmbEve.SelectedValue), txtDesc, txtObs);

            ABMalumyusu buscar = new ABMalumyusu();
            buscar.btnActu.PerformClick();

            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (txtId.Text == "")
            {
                Error.SetError(txtId, "Ingrese un id");
                txtId.Focus();
                return;
            }
            Error.SetError(txtId, "");
            if (txtMot.Text == "")
            {
                Error.SetError(txtMot, "Ingrese una asistencia");
                txtMot.Focus();
                return;
            }
            Error.SetError(txtMot, "");
            if (txtDesc.Text == "")
            {
                Error.SetError(txtDesc, "Ingrese una descripción");
                txtDesc.Focus();
                return;
            }
            Error.SetError(txtDesc, "");
            if (txtVal.Text == "")
            {
                Error.SetError(txtVal, "Seleccione un valor de imputación");
                txtVal.Focus();
                return;
            }
            
            Error.SetError(txtVal, "");
            if (cmbConput.Text == "")
            {
                Error.SetError(cmbConput, "Ingrese para saber si es computable o no");
                cmbConput.Focus();
                return;
            }
            Error.SetError(cmbConput, "");
            if (cmbSub.Text == "")
            {
                Error.SetError(cmbSub, "Seleccione una actividad");
                cmbSub.Focus();
                return;
            }
            Error.SetError(cmbSub, "");
            if (cmbEve.Text == "")
            {
                Error.SetError(cmbEve, "Seleccione un tipo de Evento");
                cmbEve.Focus();
                return;
            }
            Error.SetError(cmbEve, "");

            
            if (cmbConput.Text == "Si")
            {
                comput = 1;
            }                
            if (cmbConput.Text == "No")
            {
                comput = 0;
            }
                

            OperUsu.ModificarMotivos(Convert.ToInt32(txtId.Text), Convert.ToString(txtMot.Text), comput, Convert.ToSingle(txtVal.Text), Convert.ToInt32(cmbSub.SelectedValue), Convert.ToInt32(cmbEve.SelectedValue),Usuarios.Id, txtDesc, txtObs);

            ABMalumyusu buscar = new ABMalumyusu();
            buscar.btnActu.PerformClick();

            this.Close();

        }

        private void AgregarMotivos_Load(object sender, EventArgs e)
        {
            ControlBox = false;
        }

        private void AgregarMotivos_KeyDown(object sender, KeyEventArgs e)
        {
           /* if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }*/
        }

        private void AgregarMotivos_FormClosing(object sender, FormClosingEventArgs e)
        {
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            this.Close();
            //AgregarModificarMotivos.ActiveForm.Close();
        }

        private void lvlObs_Click(object sender, EventArgs e)
        {

        }

        private void lblComp_Click(object sender, EventArgs e)
        {

        }
    }
}
