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
    public partial class BorrarRegistros : Form
    {
        
        
        public BorrarRegistros()
        {
            InitializeComponent();
        }
        Teclado Digitos = new Teclado();
        Usuarios usu = new Usuarios();
        private void button1_Click(object sender, EventArgs e)
        {
            if (txtId.Text == "")
            {
                Error.SetError(txtId, "Ingrese un Id");
                txtId.Focus();
                return;
            }
            Error.SetError(txtId, "");
            usu.EliminarUsuario(Usuarios.Id, Convert.ToInt32(txtId.Text));
        }

        private void Borrar_FormClosing(object sender, FormClosingEventArgs e)
        {
        }

        private void Borrar_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }
        }

        private void txtId_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void BorrarRegistros_Load(object sender, EventArgs e)
        {
            ControlBox = false;
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
         BorrarRegistros.ActiveForm.Close();
        }

        private void button1_Click_2(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
