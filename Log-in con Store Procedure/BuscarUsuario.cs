using System;
using System.Data;
using System.Linq;
using System.Windows.Forms;
using MySql.Data.MySqlClient;


namespace Log_in_con_Store_Procedure
{
    public partial class BuscarUsuario : Form
    {
        public BuscarUsuario()
        {
            InitializeComponent();
        }
        Usuarios OperUsu = new Usuarios();
        Teclado Digitos = new Teclado();
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            
            OperUsu.BuscarUsuario(txtNom, txtApel, dgvLis);
            dgvLis.Columns["Id"].Visible = false;
            if (dgvLis.Rows.Count > 0)
            {
                btnEliminar.Enabled = true;
                btnModificar.Enabled = true;
                dgvLis.CurrentCell = dgvLis.Rows[0].Cells[1];
            }
            if (dgvLis.Rows.Count == 0)
            {
                btnModificar.Enabled = false;
                btnEliminar.Enabled = false;
            }
            
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<AgregarModificarUsuarios>().Count() == 0)
            {

                AgregarModificarUsuarios abrir = new AgregarModificarUsuarios();
                abrir.txtId.Enabled = false;
                abrir.btnMod.Visible = false;
                abrir.btnIng.Visible = true;
                //abrir.lblEst.Visible = false;
                //abrir.cmbEstado.Visible = false;
                
                abrir.Text = "Ingresar Usuario";
                abrir.Show();
            }
            else
                Application.OpenForms["AgregarModificarUsuarios"].BringToFront();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            DataGridViewRow datos = dgvLis.CurrentRow;
            string nom = datos.Cells["Nombre"].Value.ToString();
            string ape = datos.Cells["Apellido"].Value.ToString();
            int id = Convert.ToInt32(datos.Cells["Id"].Value);
            if (MessageBox.Show("¿Esta seguro de que desea eliminar al usuario " + nom + " " + ape + "?", "Eliminar Usuario", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                OperUsu.EliminarUsuario(id, Usuarios.Id);
                if (Usuarios.Id==id)
                {
                    Application.Restart();
                }
                btnBuscar.PerformClick();
            }
            /*
            if (Application.OpenForms.OfType<BorrarRegistros>().Count() == 0)
            {
                Global.SeleccionarABM = 2;
                BorrarRegistros abrir = new BorrarRegistros();
                DataGridViewRow datos = dgvLis.CurrentRow;
                abrir.txtId.Text = datos.Cells["Id"].Value.ToString();
                abrir.Show();
            }
            else
                Application.OpenForms["BorrarRegistros"].BringToFront();
                */
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<AgregarModificarUsuarios>().Count() == 0)
            {
                AgregarModificarUsuarios abrir = new AgregarModificarUsuarios();
                DataGridViewRow datos = dgvLis.CurrentRow;
                abrir.txtId.Text = datos.Cells["Id"].Value.ToString();
                abrir.txtNom.Text = datos.Cells["Nombre"].Value.ToString();
                abrir.txtApel.Text = datos.Cells["Apellido"].Value.ToString();
                abrir.cmbCargo.Text = datos.Cells["Tipo De Cargo"].Value.ToString();
                abrir.txtId.Enabled = false;
                abrir.btnIng.Visible = false;
                abrir.btnMod.Visible = true;
                abrir.Text = "Modificar Usuario";
                abrir.Show();
            }
            else
                Application.OpenForms["AgregarModificarUsuarios"].BringToFront();
        }

        private void BuscarUsuario_KeyDown(object sender, KeyEventArgs e)
        {
            /*if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }*/
        }

        private void BuscarUsuario_Load(object sender, EventArgs e)
        {
            ControlBox = false;
            btnModificar.Enabled = false;
            btnEliminar.Enabled = false;

            MySqlDataAdapter da = new MySqlDataAdapter("select * from Usuarios", Global.Conexion);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dgvLis.DataSource = ds.Tables[0];
        }

        private void dgvLis_SelectionChanged(object sender, EventArgs e)
        {
            btnModificar.Enabled = true;
            btnEliminar.Enabled = true;
        }

        private void dgvLis_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            BuscarUsuario.ActiveForm.Close();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        private void BuscarUsuario_Activated(object sender, EventArgs e)
        {
            btnBuscar.PerformClick();
        }

        private void txtNom_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }

        private void txtApel_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }
    }
}
