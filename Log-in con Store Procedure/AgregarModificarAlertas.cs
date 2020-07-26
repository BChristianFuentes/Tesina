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
    public partial class AgregarModificarAlertas : Form
    {
        public AgregarModificarAlertas()
        {
            InitializeComponent();
            if (Global.AgregarOModificar == 0)
            {
                txtId.Enabled = false;
                btnAgregar.Visible = true;
                btnModificar.Visible = false;
                this.Text = "Agregar Alerta";
            }
            if (Global.AgregarOModificar == 1)
            {
                txtId.Enabled = false;
                this.Text = "Modificar Alerta";
                btnModificar.Visible = true;
                btnAgregar.Visible = false;
            }
        }
        Usuarios OperUsu = new Usuarios();
        private void AgregarModificarAlertas_KeyDown(object sender, KeyEventArgs e)
        {
            /*if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }*/
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (txtTipoAlerta.Text == "")
            {
                Error.SetError(txtTipoAlerta, "Ingrese un tipo de alerta");
                txtTipoAlerta.Focus();
                return;
            }
            Error.SetError(txtTipoAlerta, "");
            if (txtDescAlerta.Text == "")
            {
                Error.SetError(txtDescAlerta, "Ingrese una descripcion");
                txtDescAlerta.Focus();
                return;
            }
            Error.SetError(txtDescAlerta, "");

            OperUsu.AgregarAlertas(txtDescAlerta, txtTipoAlerta);
        }

        private void AgregarModificarAlertas_FormClosing(object sender, FormClosingEventArgs e)
        {
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (txtTipoAlerta.Text == "")
            {
                Error.SetError(txtTipoAlerta, "Ingrese un tipo de alerta");
                txtTipoAlerta.Focus();
                return;
            }
            Error.SetError(txtTipoAlerta, "");
            if (txtDescAlerta.Text == "")
            {
                Error.SetError(txtDescAlerta, "Ingrese una descripcion");
                txtDescAlerta.Focus();
                return;
            }
            Error.SetError(txtDescAlerta, "");

            OperUsu.ModificarAlertas(txtId, txtDescAlerta, txtTipoAlerta);
        }

        private void AgregarModificarAlertas_Load(object sender, EventArgs e)
        {
            ControlBox = false;
        }
        
        private void button1_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
