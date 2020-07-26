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
    public partial class AgregarModificarAlumnos : Form
    {
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        Teclado Digitos = new Teclado();
        LlenarCombo llenar = new LlenarCombo();

        buscarAlumno buscar = new buscarAlumno();

        public AgregarModificarAlumnos()
        {
            InitializeComponent();

            cmbCurso.DataSource = llenar.ObtenerCursos();
            cmbCurso.ValueMember = "IdCurso";
            cmbCurso.DisplayMember = "CursoString";

            cmbTD.DataSource = llenar.ObtenerDocumento();
            cmbTD.ValueMember = "IdDocumento";
            cmbTD.DisplayMember = "DocumentoString";

            cmbEstado.DataSource = llenar.ObtenerEstados();//Pache
            cmbEstado.ValueMember = "IdEstado";//Pache
            cmbEstado.DisplayMember = "EstadoString";//Pache  

            cmbCiclo.DataSource = llenar.ObtenerCiclos();
            cmbCiclo.DisplayMember = "CicloString";
            cmbCiclo.Text = Oper.NombreArchivo(false, false, true);
            /*
                cmbCurso.SelectedIndex = -1;
                cmbTD.SelectedIndex = -1;
                cmbEstado.SelectedIndex = -1;
                cmbCiclo.SelectedIndex = -1;*/
            string fechamax = Convert.ToString("31-12-" + (Convert.ToInt32(dtpFecha.Value.Year) - 10));
            dtpFecha.MaxDate = Convert.ToDateTime(fechamax);
        }
        Operaciones Oper = new Operaciones();
        private void button1_Click(object sender, EventArgs e)
        {
            if (txtNombre.Text == "")
            {
                Error.SetError(txtNombre, "Ingrese un nombre");
                txtNombre.Focus();
                return;
            }
            Error.SetError(txtNombre,"");
            if (txtApellido.Text == "")
            {
                Error.SetError(txtApellido, "Ingrese un apellido");
                txtApellido.Focus();
                return;
            }
            Error.SetError(txtApellido, "");
            if (txtTelefono.Text == "")
            {
                Error.SetError(txtTelefono, "Ingrese un telefono");
                txtTelefono.Focus();
                return;
            }
            Error.SetError(txtTelefono, "");
            if (cmbTD.Text == "")
            {
                Error.SetError(cmbTD, "Seleccione un tipo de documento");
                cmbTD.Focus();
                return;
            }
            Error.SetError(cmbTD, "");
            if (txtDocumento.Text == "")
            {
                Error.SetError(txtDocumento, "Ingrese un número de documento");
                txtDocumento.Focus();
                return;
            }
            Error.SetError(txtDocumento, "");
            if (cmbCiclo.Text == "")
            {
                Error.SetError(cmbCiclo, "Ingrese un número de documento");
                txtDocumento.Focus();
                return;
            }
            Error.SetError(cmbCiclo, "");
            String FechaDesde = Convert.ToString(dtpFecha.Value.Year + "-" + dtpFecha.Value.Month + "-" + dtpFecha.Value.Day);
            OperAlu.Agregar(Usuarios.Id, txtNombre, txtApellido, FechaDesde, Convert.ToInt32(txtTelefono.Text), cmbTD, Convert.ToInt32(txtDocumento.Text), cmbCurso, Convert.ToInt32(cmbCiclo.SelectedValue), txtObser);
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (txtNombre.Text == "")
            {
                Error.SetError(txtNombre, "Ingrese un nombre");
                txtNombre.Focus();
                return;
            }
            Error.SetError(txtNombre, "");
            if (txtApellido.Text == "")
            {
                Error.SetError(txtApellido, "Ingrese un apellido");
                txtApellido.Focus();
                return;
            }
            Error.SetError(txtApellido, "");
            if (txtTelefono.Text == "")
            {
                Error.SetError(txtTelefono, "Ingrese un telefono");
                txtTelefono.Focus();
                return;
            }
            Error.SetError(txtTelefono, "");
            if (cmbTD.Text == "")
            {
                Error.SetError(cmbTD, "Seleccione un tipo de documento");
                cmbTD.Focus();
                return;
            }
            Error.SetError(cmbTD, "");
            if (txtDocumento.Text == "")
            {
                Error.SetError(txtDocumento, "Ingrese un número de documento");
                txtDocumento.Focus();
                return;
            }
            Error.SetError(txtDocumento, "");

            String FechaDesde = Convert.ToString(dtpFecha.Value.Year + "-" + dtpFecha.Value.Month + "-" + dtpFecha.Value.Day);//Pache
            if(OperAlu.modificar(Usuarios.Id, txtId, txtNombre, txtApellido, FechaDesde, Convert.ToInt32(txtTelefono.Text), cmbTD, Convert.ToInt32(txtDocumento.Text), cmbEstado, txtObser) && OperAlu.modificarAluxCurso(Usuarios.Id, txtId, Convert.ToInt32(cmbCiclo.SelectedValue), cmbCurso))
            {
                MessageBox.Show("Alumno modificado");
                this.Close();
            }
            
            /*
            buscarAlumno.ActiveForm.BringToFront();
                
            
                Application.OpenForms["AgregarModificarAlumnos"].BringToFront();
                buscarAlumno buscar = new buscarAlumno();
                buscar.btnBuscar.PerformClick();           
                */
            
        }

        private void AgregarAlumno_KeyDown(object sender, KeyEventArgs e)
        {/*
            if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }*/
        }


        private void txtNombre_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }

        private void txtApellido_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }

        private void txtTelefono_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void txtDocumento_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void lblFN_Click(object sender, EventArgs e)
        {

        }

        private void cmbCurso_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        
        private void button1_Click_2(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txtId_TextChanged(object sender, EventArgs e)
        {

        }


        private void txtCiclo_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtCiclo_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }
    }
}
