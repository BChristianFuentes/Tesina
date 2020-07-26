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
    public partial class ABMalumyusu : Form
    {
        public ABMalumyusu()
        {
            InitializeComponent();
        }
        Usuarios Usu = new Usuarios();
        private void button1_Click(object sender, EventArgs e)
        {
            Usu.MostrarMotivos(dgvABM);

            if (dgvABM.Rows.Count == 0)
            {
                btnModificar.Enabled = false;
                btnBorrar.Enabled = false;
            }
            if (dgvABM.Rows.Count > 0)
            {
                dgvABM.CurrentCell = dgvABM.Rows[0].Cells[1];
                btnModificar.Enabled = true;
                btnBorrar.Enabled = true;
                
                DataGridViewRow datos = dgvABM.CurrentRow;

                dgvABM.Columns["Id"].Visible = false;
                /*
                if (Convert.ToString(datos.Cells["Computable"].Value) == "1")
                {
                    datos.Cells["Computable"].Value = "Si";
                }
                if (Convert.ToString(datos.Cells["Computable"].Value) == "0")
                {
                    datos.Cells["Computable"].Value = "No";
                }
                */
            }
            
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Global.AgregarOModificar = 0;
            /*
            switch (Global.SeleccionarABM)
            {
                case 2:
                    {
                        AgregarModificarUsuarios abrir = new AgregarModificarUsuarios();
                        if (Application.OpenForms.OfType<AgregarModificarUsuarios>().Count() == 0)
                        {
                            abrir.Show();
                        }
                        else
                        {
                            //abrir.BringToFront().fo;
                        }
                        
                    }; break;
                case 3:
                    {
                        if(Application.OpenForms.OfType<AgregarModificarMotivos>().Count() == 0)
                        {
                            AgregarModificarMotivos abrir = new AgregarModificarMotivos();
                            abrir.Show();
                        }

                    }; break;
                case 4:
                    {
                        if (Application.OpenForms.OfType<AgregarModificarAlertas>().Count() == 0)
                        {
                            AgregarModificarAlertas abrir = new AgregarModificarAlertas();
                            abrir.Show();
                        }
                    };break;
            }*/

            if (Application.OpenForms.OfType<AgregarModificarMotivos>().Count() == 0)
            {
                AgregarModificarMotivos abrir = new AgregarModificarMotivos();
                DataGridViewRow datos = dgvABM.CurrentRow;
                abrir.Show();

                abrir.btnAgregar.Visible = true;
                abrir.btnMod.Visible = false;
                abrir.cmbConput.SelectedIndex = 1;
                abrir.Text = "Agregar Motivos";
            }
            else
                Application.OpenForms["AgregarModificarMotivos"].BringToFront();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Global.AgregarOModificar = 1;
            /*
            switch (Global.SeleccionarABM)
            {
                case 2:
                    {
                        for (int i = 0; i < 6; i++)
                        {
                            if(this.dgvABM.SelectedRows.Count == 1)
                            {
                                //Global.TrasladarDatos[i] = this.dgvABM.CurrentRow.Cells[i].Value.ToString();
                                //Global.Pas = true;
                            }
                        }
                        if (Application.OpenForms.OfType<AgregarModificarUsuarios>().Count() == 0)
                        {
                            AgregarModificarUsuarios edit = new AgregarModificarUsuarios();
                            edit.Show();
                        }

                    }; break;
                case 3:
                    {
                        for (int i = 0; i < 5; i++)
                        {
                            if (this.dgvABM.SelectedRows.Count == 1)
                            {
                               // Global.TrasladarDatos[i] = this.dgvABM.CurrentRow.Cells[i].Value.ToString();
                                //Global.Pas = true;
                            }
                        }
                        if (Application.OpenForms.OfType<AgregarModificarMotivos>().Count() == 0)
                        {
                            AgregarModificarMotivos edit = new AgregarModificarMotivos();
                            edit.Show();
                        }

                    }; break;
                case 4:
                    {
                        if (Application.OpenForms.OfType<AgregarModificarAlertas>().Count() == 0)
                        {
                            AgregarModificarAlertas abrir = new AgregarModificarAlertas();
                            abrir.Show();
                        }
                    };break;
            }*/
            if (Application.OpenForms.OfType<AgregarModificarMotivos>().Count() == 0)
            {
                AgregarModificarMotivos abrir = new AgregarModificarMotivos();
                DataGridViewRow datos = dgvABM.CurrentRow;
                abrir.Show();

                abrir.txtId.Text = datos.Cells["Id"].Value.ToString();
                abrir.txtMot.Text = datos.Cells["Asistencia"].Value.ToString();
                abrir.txtDesc.Text = datos.Cells["Descripcion"].Value.ToString();
                abrir.cmbSub.Text = datos.Cells["Actividad"].Value.ToString();
                abrir.txtVal.Text = datos.Cells["Valor"].Value.ToString();
                
                abrir.cmbEve.Text = datos.Cells["Evento"].Value.ToString();
                abrir.txtObs.Text = datos.Cells["Observacion"].Value.ToString();
                /*
                if (Convert.ToInt32(datos.Cells["Computable"].Value) == 1)
                {
                    abrir.cmbConput.SelectedIndex = 0;
                }
                else if (Convert.ToInt32(datos.Cells["Computable"].Value) == 0)
                {
                    abrir.cmbConput.SelectedIndex = 1;
                }
                */
                if(Convert.ToString(datos.Cells["Computable"].Value) == "1")
                {
                    abrir.cmbConput.SelectedIndex = 0;
                }
                else if (Convert.ToString(datos.Cells["Computable"].Value) == "0")
                {
                    abrir.cmbConput.SelectedIndex = 1;
                }
                else
                {
                    abrir.cmbConput.Text = datos.Cells["Computable"].Value.ToString();
                }
                
                abrir.btnAgregar.Visible = false;
                abrir.btnMod.Visible = true;
                abrir.Text = "Modificar Motivos";
            }
            else
                Application.OpenForms["AgregarModificarMotivos"].BringToFront();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (dgvABM.Rows.Count > 0) {
                    DataGridViewRow datos = dgvABM.CurrentRow;
                    string motivo = datos.Cells["asistencia"].Value.ToString();
                    int id = Convert.ToInt32(datos.Cells["Id"].Value);
                    if (MessageBox.Show("¿Esta seguro eliminar al motivo llamado " + motivo + "?", "Eliminar Motivo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        Usu.EliminarMotivos(Convert.ToInt32(datos.Cells["Id"].Value), Usuarios.Id);//id
                    Usu.MostrarMotivos(dgvABM);
                    }
            }

        }

        private void ABMalumyusu_KeyDown(object sender, KeyEventArgs e)
        {/*
            if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }*/
        }

        private void dgvABM_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void ABMalumyusu_Load(object sender, EventArgs e)
        {
            ControlBox = false;
            btnActu.PerformClick();
        }
        
        private void button1_Click_2(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
