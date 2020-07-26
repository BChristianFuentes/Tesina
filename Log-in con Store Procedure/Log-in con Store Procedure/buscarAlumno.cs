using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Office.Interop.Excel;

namespace Log_in_con_Store_Procedure
{
    public partial class buscarAlumno : Form
    {
        OperacionesNotas OperN = new OperacionesNotas();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        Teclado Digitos = new Teclado();

        public buscarAlumno()
        {
            InitializeComponent();
            btnModAsistencia.Enabled = false;
            btnEliminar.Enabled = false;
            btnInforme.Enabled = false;
            btnModificar.Enabled = false;
            btn_modificarnotas.Enabled = true;
        }

        private void txtNom_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }

        private void txtApel_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }

        private void txtDoc_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (System.Windows.Forms.Application.OpenForms.OfType<AgregarModificarAlumnos>().Count() == 0)
            {
                AgregarModificarAlumnos abrir = new AgregarModificarAlumnos();
                DataGridViewRow datos = dgvLis.CurrentRow;
                abrir.txtId.Text = datos.Cells["Id"].Value.ToString();
                abrir.txtNombre.Text = datos.Cells["Nombre"].Value.ToString();
                abrir.txtApellido.Text = datos.Cells["Apellido"].Value.ToString();
                abrir.dtpFecha.Text = datos.Cells["Fecha de nacimiento"].Value.ToString(); //Sí, pasa de String a Date sin problemas
                abrir.txtTelefono.Text = datos.Cells["Telefono"].Value.ToString();
                abrir.cmbTD.Text = datos.Cells["Tipo Documento"].Value.ToString();
                abrir.txtDocumento.Text = datos.Cells["Documento"].Value.ToString();
                abrir.cmbEstado.Text = datos.Cells["Tipo de Estado"].Value.ToString();
                abrir.txtObser.Text = datos.Cells["Observaciones"].Value.ToString();
                abrir.cmbCurso.Text = datos.Cells["Cursos"].Value.ToString();
                abrir.cmbCiclo.Text = datos.Cells["Ciclo"].Value.ToString();

                abrir.txtId.Enabled = false;
                abrir.Text = "Modificar Alumno";

                abrir.btnAgregar.Visible = false;
                abrir.btnModificar.Visible = true;
                abrir.Show();
            }
            else
                System.Windows.Forms.Application.OpenForms["AgregarModificarAlumnos"].BringToFront();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            DataGridViewRow datos = dgvLis.CurrentRow;
            string nom = datos.Cells["Nombre"].Value.ToString();
            string ape = datos.Cells["Apellido"].Value.ToString();
            int id = Convert.ToInt32(datos.Cells["Id"].Value);
            if (MessageBox.Show("¿Esta seguro de que desea eliminar al alumno " + nom + " " + ape + "?", "Eliminar Alumno", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                OperAlu.eliminar(id, Usuarios.Id);                
                
            }
            //btnBuscar.PerformClick();
        }

        private void btnInforme_Click(object sender, EventArgs e)
        {
            if (System.Windows.Forms.Application.OpenForms.OfType<InformeAlumno>().Count() == 0)
            {
                InformeAlumno abrir = new InformeAlumno();
                DataGridViewRow datos = dgvLis.CurrentRow;
                abrir.txtNom.Text = datos.Cells["Nombre"].Value.ToString();
                abrir.txtNom.Enabled = false;
                abrir.txtApel.Text = datos.Cells["Apellido"].Value.ToString();
                abrir.txtApel.Enabled = false;
                abrir.txtDoc.Text = datos.Cells["Documento"].Value.ToString();
                abrir.txtDoc.Enabled = false;
                abrir.cmbCiclo.Text = datos.Cells["Ciclo"].Value.ToString();
                abrir.cmbCiclo.Enabled = false;
                abrir.dtpDesde.Value = Convert.ToDateTime("1 - 1 - "+ abrir.dtpHasta.Value.Year);
                abrir.Show();
                abrir.btnBuscar.PerformClick();
            }
            else
                System.Windows.Forms.Application.OpenForms["InformeAlumno"].BringToFront();
        }

        private void btnAlulib_Click(object sender, EventArgs e)
        {
            if (System.Windows.Forms.Application.OpenForms.OfType<AlumnosLibresAlu>().Count() == 0)
            {
                AlumnosLibresAlu abrir = new AlumnosLibresAlu();
                DataGridViewRow datos = dgvLis.CurrentRow;

                abrir.txtId.Text = datos.Cells["Id"].Value.ToString();
                abrir.txtnom.Text = datos.Cells["Nombre"].Value.ToString();
                abrir.txtape.Text = datos.Cells["Apellido"].Value.ToString();
                abrir.txtCiclo.Text = datos.Cells["Ciclo"].Value.ToString();
                abrir.Show();
                abrir.btnBuscar.PerformClick();
            }
            else
                System.Windows.Forms.Application.OpenForms["AlumnosLibreAlu"].BringToFront();
        }

        private void buscarAlumno_Activated(object sender, EventArgs e)
        {
            btnBuscar.PerformClick();
        }

        private void btn_asignarnotas_Click(object sender, EventArgs e)
        {
            try
            {
                if (System.Windows.Forms.Application.OpenForms.OfType<AgregarModificarNotas>().Count() == 0)
                {
                    AgregarModificarNotas abrir = new AgregarModificarNotas();
                    abrir.txt_idcurso.Text = dgvLis.CurrentRow.Cells["idCurso"].Value.ToString();
                    abrir.txt_idAXC.Text = dgvLis.CurrentRow.Cells["idAlunmxcurso"].Value.ToString();
                    abrir.txt_alumno.Text = dgvLis.CurrentRow.Cells["Nombre"].Value.ToString() + " " + dgvLis.CurrentRow.Cells["Apellido"].Value.ToString();
                    abrir.cmb_curso.Text = dgvLis.CurrentRow.Cells["Cursos"].Value.ToString();
                    abrir.cmb_cicloelectivo.Text = dgvLis.CurrentRow.Cells["Ciclo"].Value.ToString();
                    abrir.btn_modificarnota.Enabled = false;
                    abrir.btn_modificarnota.Visible = false;
                    abrir.cmb_curso.Enabled = false;
                    abrir.cmb_cicloelectivo.Enabled = false;
                    abrir.txt_alumno.Enabled = false;
                    abrir.Text = "Asignar notas";
                    abrir.Show();
                }
                else System.Windows.Forms.Application.OpenForms["AgregarModificarNotas"].BringToFront();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "Seleccione un alumno");
            }
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            OperAlu.BuscarAlumno(txtNom, txtApel, txtDoc, dgvLis);
            dgvLis.Columns["Id"].Visible = true;
            if (dgvLis.Rows.Count > 0)
            {
                dgvLis.CurrentCell = dgvLis.Rows[0].Cells[1];
                if (Usuarios.Cargo == 1 || Usuarios.Cargo == 2 || Usuarios.Cargo == 3)
                {
                    btn_informealumnoDOE.Enabled = false;
                    btnModificar.Enabled = true;
                    btnEliminar.Enabled = true;
                    btnAlulib.Enabled = true;
                    btnInforme.Enabled = true;
                    btnModAsistencia.Enabled = true;
                    btn_registrarretirosantes.Enabled = true;

                }
                if (Usuarios.Cargo == 5)
                {
                    btnModificar.Enabled = false;
                    btnEliminar.Enabled = false;
                    btnAlulib.Enabled = false;
                    btnInforme.Enabled = false;
                    btnModAsistencia.Enabled = false;
                    btn_registrarretirosantes.Enabled = false;
                    btn_informealumnoDOE.Enabled = true;
                }
                if (Usuarios.Cargo == 4)
                {
                    btnAlulib.Enabled = true;
                    btnModAsistencia.Enabled = true;
                    btnModificar.Enabled = true;
                    btnEliminar.Enabled = true;
                    btn_informealumnoDOE.Enabled = true;
                    btn_registrarretirosantes.Enabled = true;
                    btnInforme.Enabled = true;
                }
                if (Usuarios.Cargo == 6)
                {
                    btnAlulib.Enabled = false;
                    btnModAsistencia.Enabled = false;
                    btnModificar.Enabled = true;
                    btnEliminar.Enabled = true;
                    btn_informealumnoDOE.Enabled = false;
                    btn_registrarretirosantes.Enabled = false;
                    btnInforme.Enabled = false;
                }
            }
            if (dgvLis.Rows.Count == 0)
            {
                btnAlulib.Enabled = false;
                btnModAsistencia.Enabled = false;
                btnModificar.Enabled = false;
                btnEliminar.Enabled = false;
                btn_informealumnoDOE.Enabled = false;
                btn_registrarretirosantes.Enabled = false;
                btnInforme.Enabled = false;
            }
        }

        private void btnModAsistencia_Click(object sender, EventArgs e)
        {
            Global.Modificar = 1;
            ModificarAsist abrir = new ModificarAsist();
            DataGridViewRow datos = dgvLis.CurrentRow;
            abrir.lblCurso.Hide();
            abrir.cmbCurso.Hide();
            //abrir.lblCiclo.Hide();
            //abrir.txtCiclo.Hide();
            abrir.Error.SetError(abrir.dtpFecha, "seleccione una fecha");
            abrir.dtpFecha.Focus();
            abrir.lblFecha.Visible = false;
            abrir.dtpFecha.Visible = false;
            abrir.cmbSubMot.Enabled = true;

            abrir.txtNom.Text = datos.Cells["Nombre"].Value.ToString();
            abrir.txtApel.Text = datos.Cells["Apellido"].Value.ToString();
            abrir.txtDoc.Text = datos.Cells["Documento"].Value.ToString();
            //abrir.txtCiclo.Text = datos.Cells["Ciclo"].Value.ToString();
            if (System.Windows.Forms.Application.OpenForms.OfType<ModificarAsist>().Count() == 0)
            {
                abrir.Show();
            }
            else
            {
                System.Windows.Forms.Application.OpenForms["ModificarAsist"].Close();
                abrir.Show();
            }
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_informealumnoDOE_Click(object sender, EventArgs e)
        {
            Global.informe = 1;
            if (System.Windows.Forms.Application.OpenForms.OfType<InformeAlumno>().Count() == 0)
            {
                InformeAlumno abrir = new InformeAlumno();
                DataGridViewRow datos = dgvLis.CurrentRow;
                abrir.txtNom.Text = datos.Cells["Nombre"].Value.ToString();
                abrir.txtNom.Enabled = false;
                abrir.txtApel.Text = datos.Cells["Apellido"].Value.ToString();
                abrir.txtApel.Enabled = false;
                abrir.txtDoc.Text = datos.Cells["Documento"].Value.ToString();
                abrir.txtDoc.Enabled = false;
                abrir.cmbCiclo.Text = datos.Cells["Ciclo"].Value.ToString();
                abrir.cmbCiclo.Enabled = false;
                abrir.dtpDesde.Value = Convert.ToDateTime("1 - 1 - " + abrir.dtpHasta.Value.Year);
                abrir.Show();
                abrir.btnBuscar.PerformClick();
            }
            else
                System.Windows.Forms.Application.OpenForms["InformeAlumno"].BringToFront();
        }

        private void btn_registrarretirosantes_Click(object sender, EventArgs e)
        {
            if (System.Windows.Forms.Application.OpenForms.OfType<RegistrarRetiroAnticipado>().Count() == 0)
            {
                RegistrarRetiroAnticipado abrir = new RegistrarRetiroAnticipado();
                DataGridViewRow datos = dgvLis.CurrentRow;
                abrir.txtId.Text = datos.Cells["Id"].Value.ToString();
                abrir.txtNombre.Text = datos.Cells["Nombre"].Value.ToString();
                abrir.txtApellido.Text = datos.Cells["Apellido"].Value.ToString();
                abrir.txtDocument.Text = datos.Cells["Documento"].Value.ToString();
                //abrir.txtCiclo.Text = datos.Cells["Ciclo"].Value.ToString();
                abrir.cmbCurso.Text = datos.Cells["Cursos"].Value.ToString();
                abrir.Show();
            }
            else
                System.Windows.Forms.Application.OpenForms["RegistrarRetiroAnticipado"].BringToFront();
        }

        private void btn_vernotas_Click(object sender, EventArgs e)
        {
            BuscarNotasxAlumno bnxa = new BuscarNotasxAlumno();
            bnxa.txt_nomalumno.Text = dgvLis.CurrentRow.Cells["Nombre"].Value.ToString();
            bnxa.txt_apellidoalumno.Text = dgvLis.CurrentRow.Cells["Apellido"].Value.ToString();
            bnxa.cmb_curso.Text = Convert.ToString(dgvLis.CurrentRow.Cells["Cursos"].Value);
            bnxa.cmb_ciclo.Text = dgvLis.CurrentRow.Cells["Ciclo"].Value.ToString();
            bnxa.cmb_curso.Enabled = false;
            bnxa.cmb_ciclo.Enabled = false;
            bnxa.txt_nomalumno.ReadOnly = true;
            bnxa.txt_apellidoalumno.ReadOnly = true;
            bnxa.Show();
        }

        private void btn_modificarnotas_Click(object sender, EventArgs e)
        {
            ModNotas abrir = new ModNotas();
            abrir.lbl_info.Text = dgvLis.CurrentRow.Cells["Nombre"].Value.ToString() + " " + dgvLis.CurrentRow.Cells["Apellido"].Value.ToString();
            abrir.txt_id.Text = dgvLis.CurrentRow.Cells["Id"].Value.ToString();
            abrir.Text = "Modificar Notas";
            abrir.Show();
        }
    }
}