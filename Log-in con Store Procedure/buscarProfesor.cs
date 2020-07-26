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
    public partial class buscarProfesor : Form
    {
        OperacionesProfesores OperProf = new OperacionesProfesores();
        Teclado Digitos = new Teclado();

        public buscarProfesor()
        {
            
            InitializeComponent();
            btn_eliminar.Enabled = false;
            btn_modificar.Enabled = false;
            btn_asignarmxc.Enabled = false;
        }

        private void Txt_nom_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }

        private void Txt_ap_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }

        private void Txt_doc_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void Btn_buscar_Click(object sender, EventArgs e)
        {
            OperProf.BuscarProf(txt_nom, txt_doc, txt_ap,dgv_prof);
            //dgv_prof.Columns["idProfesor"].Visible = false;
            //dgv_prof.Columns["id_tipodocumento"].Visible = false;
            //dgv_prof.Columns["id_estado"].Visible = false;
            if (dgv_prof.Rows.Count > 0)
            {
                btn_eliminar.Enabled = true;
                btn_modificar.Enabled = true;
            }
            else if (dgv_prof.Rows.Count == 0)
            {
                btn_eliminar.Enabled = false;
                btn_modificar.Enabled = false;
            }
        }

        private void Btn_modificar_Click(object sender, EventArgs e)
        {
            if(Application.OpenForms.OfType<AgregarModificarAlumnos>().Count() == 0)
            {
                AgregarModificarProfesor abrir = new AgregarModificarProfesor();
                DataGridViewRow datos = dgv_prof.CurrentRow;
                abrir.txt_id.Text = datos.Cells["idProfesor"].Value.ToString();
                abrir.txt_nom.Text = datos.Cells["Nombre"].Value.ToString();
                abrir.txt_ap.Text = datos.Cells["Apellido"].Value.ToString();
                abrir.dtp_fecha.Text = datos.Cells["FechaNac"].Value.ToString();
                abrir.txt_tel.Text = datos.Cells["Telefono"].Value.ToString();
                abrir.txt_mail.Text = datos.Cells["Mail"].Value.ToString();
                abrir.txt_doc.Text = datos.Cells["Documento"].Value.ToString();
                abrir.cmb_tdoc.Text = datos.Cells["id_tipodocumento"].Value.ToString();
                abrir.cmb_estado.Text = datos.Cells["id_estado"].Value.ToString();

                abrir.txt_id.Enabled = false;
                abrir.Text = "Modificar Profesor";
                abrir.btn_agregar.Visible = false;
                abrir.btn_modificar.Visible = true;
                abrir.Show();
            }
            else Application.OpenForms["AgregarModificarProfesor"].BringToFront();
        }

        private void Btn_eliminar_Click(object sender, EventArgs e)
        {
            DataGridViewRow datos = dgv_prof.CurrentRow;
            string nom = datos.Cells["Nombre"].Value.ToString();
            string ap = datos.Cells["Apellido"].Value.ToString();
            int id = Convert.ToInt32(datos.Cells["idProfesor"].Value);
            if (MessageBox.Show("¿Esta seguro de que desea eliminar al profesor " + nom + " " + ap + "?", "Eliminar Alumno", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                OperProf.Eliminar(id);
            }
        }

        private void Btn_cerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buscarProfesor_Load(object sender, EventArgs e)
        {
            this.Refresh();
            OperProf.ListadoProf(dgv_prof);
            dgv_prof.Columns["idProfesor"].Visible = false;
            dgv_prof.Columns["id_tipodocumento"].Visible = false;
            dgv_prof.Columns["id_estado"].Visible = false;
        }

        private void dgv_prof_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btn_eliminar.Enabled = true;
            btn_modificar.Enabled = true;
            btn_asignarmxc.Enabled = true;
        }

        private void buscarProfesor_Click(object sender, EventArgs e)
        {
            OperProf.ListadoProf(dgv_prof);
            dgv_prof.Refresh();
        }

        private void btn_agregar_Click(object sender, EventArgs e)
        {
            AgregarModificarProfesor amp = new AgregarModificarProfesor();
            amp.btn_modificar.Visible = false;
            amp.cmb_estado.Visible = false;
            amp.lbl_estado.Visible = false;
            amp.Show();
        }

        private void btn_asignarmxc_Click(object sender, EventArgs e)
        {
            if (Application.OpenForms.OfType<AsignarProfesorAMateria>().Count() == 0)
            {
                AsignarProfesorAMateria abrir = new AsignarProfesorAMateria();
                abrir.txt_idprof.Text = dgv_prof.CurrentRow.Cells["idProfesor"].Value.ToString();
                abrir.txt_nomprof.Text = dgv_prof.CurrentRow.Cells["Nombre"].Value.ToString() + " " + dgv_prof.CurrentRow.Cells["Apellido"].Value.ToString();
                abrir.Show();
            }
            else Application.OpenForms["AsignarProfesorAMateria"].BringToFront();
        }
    }
}
