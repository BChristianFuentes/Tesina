using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace Log_in_con_Store_Procedure
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();

        }
        
        Usuarios OperUsu = new Usuarios();
        Teclado Digitos = new Teclado();
        private void button1_Click(object sender, EventArgs e)
        {
            if (txtUsu.Text == "")
            {
                Error.SetError(txtUsu, "Ingrese su nombre de usuario");
                txtUsu.Focus();
                return;
            }
            Error.SetError(txtUsu, "");
            if (txtCon.Text == "")
            {
                Error.SetError(txtCon, "Ingrese su contraseña");
                txtCon.Focus();
                return;
            }
            Error.SetError(txtCon, "");
            if (OperUsu.Login(txtUsu, txtCon))
            {
                MessageBox.Show("Bienvenido");
                Usuarios.Nombre = txtUsu.Text;
                Menu abrir = new Menu();
                abrir.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Usuario o contraseña incorrectos");
            }
        }

        private void txtUsu_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }

        private void lblUsu_Click(object sender, EventArgs e)
        {
            
        }

        private void lblCon_Click(object sender, EventArgs e)
        {
            
        }

        private void Login_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿Esta seguro que quiere salir?", "Salir", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Close();
            }
        }
    }
}
