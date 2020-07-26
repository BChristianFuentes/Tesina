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
    public partial class AgregarModificarUsuarios : Form
    {
        Usuarios OperUsu = new Usuarios();
        Teclado Digitos = new Teclado();
        LlenarCombo llenar = new LlenarCombo();
        public AgregarModificarUsuarios()
        {
            InitializeComponent();

            cmbCargo.DataSource = llenar.ObtenerJerarquia();
            cmbCargo.ValueMember = "IdJerarquia";
            cmbCargo.DisplayMember = "JerarquiaString";

            /*cmbEstado.DataSource = llenar.ObtenerEstados();
            cmbEstado.ValueMember = "IdEstado";
            cmbEstado.DisplayMember = "EstadoString";
            */
            if (this.Text == "Ingresar Usuario")
            {
                cmbCargo.SelectedIndex = -1;
                //cmbEstado.SelectedIndex = -1;
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (txtNom.Text == "")
            {
                Error.SetError(txtNom, "Ingrese un Nombre");
                txtNom.Focus();
                return;
            }
            Error.SetError(txtNom, "");
            if (txtApel.Text == "")
            {
                Error.SetError(txtApel, "Ingrese un Apellido");
                txtApel.Focus();
                return;
            }
            Error.SetError(txtApel, "");
            if (txtCon.Text == "")
            {
                Error.SetError(txtCon, "Ingrese un Contraseña");
                txtCon.Focus();
                return;
            }
            Error.SetError(txtCon, "");
            if (cmbCargo.Text == "")
            {
                Error.SetError(cmbCargo, "Ingrese un Cargo");
                cmbCargo.Focus();
                return;
            }
            Error.SetError(cmbCargo, "");
            OperUsu.AgregarUsuario(Usuarios.Id, Convert.ToString(txtNom.Text), Convert.ToString(txtApel.Text), Convert.ToString(txtCon.Text), Convert.ToInt32(cmbCargo.SelectedValue));

            BuscarUsuario buscar = new BuscarUsuario();
            buscar.btnAgregar.PerformClick();

            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (txtNom.Text == "")
            {
                Error.SetError(txtNom, "Ingrese un Nombre");
                txtNom.Focus();
                return;
            }
            Error.SetError(txtNom, "");
            if (txtApel.Text == "")
            {
                Error.SetError(txtApel, "Ingrese un Apellido");
                txtApel.Focus();
                return;
            }
            Error.SetError(txtApel, "");
            
            if (txtCon.Text == "")
            {
                Error.SetError(txtCon, "Ingrese un Contraseña");
                txtCon.Focus();
                return;
            }
            Error.SetError(txtCon, "");
            
            if (cmbCargo.Text == "")
            {
                Error.SetError(cmbCargo, "Ingrese un Cargo");
                cmbCargo.Focus();
                return;
            }
            if (OperUsu.ModificarUsuario(Convert.ToInt32(txtId.Text), Usuarios.Id, txtNom, txtApel, txtCon, Convert.ToInt32(cmbCargo.SelectedValue), 1))
            {
                MessageBox.Show("Usuario modificado");
                this.Close();
            }
        }

        private void AgregarUsuarios_Load(object sender, EventArgs e)
        {
            ControlBox = false;
        }

        private void AgregarUsuarios_FormClosing(object sender, FormClosingEventArgs e)
        {
        }

        private void AgregarUsuarios_KeyDown(object sender, KeyEventArgs e)
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

        private void cmbCargo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        
        private void button1_Click_2(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
