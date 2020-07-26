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
    public partial class AgregarModificarProfesor : Form
    {
        buscarProfesor bprof = new buscarProfesor();
        OperacionesProfesores OperProf = new OperacionesProfesores();
        Teclado Digitos = new Teclado();
        LlenarCombo Llenar = new LlenarCombo();        

        public AgregarModificarProfesor()
        {
            InitializeComponent();
            cmb_tdoc.DataSource = Llenar.ObtenerDocumento();
            cmb_tdoc.ValueMember = "IdDocumento";
            cmb_tdoc.DisplayMember = "DocumentoString";

            cmb_estado.DataSource = Llenar.ObtenerEstadosProf();
            cmb_estado.ValueMember = "IdEstado";
            cmb_estado.DisplayMember = "EstadoString";

            string FechaMax = Convert.ToString("31-12-" + (Convert.ToInt32(dtp_fecha.Value.Year) - 10));
            dtp_fecha.MaxDate = Convert.ToDateTime(FechaMax);
        }

        private void Txt_nom_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }

        private void Txt_ap_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloCaracteres(e);
        }

        private void Txt_tel_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void Txt_doc_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void Btn_cerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Btn_agregar_Click(object sender, EventArgs e)
        {            
            if (txt_nom.Text == "")
            {
                Error.SetError(txt_nom, "Ingrese un nombre");
                txt_nom.Focus();
                return;
            }
            Error.SetError(txt_nom, "");
            if (txt_ap.Text == "")
            {
                Error.SetError(txt_ap, "Ingrese un apellido");
                txt_ap.Focus();
                return;
            }
            Error.SetError(txt_ap, "");
            if (txt_tel.Text == "")
            {
                Error.SetError(txt_tel, "Ingrese un telefono");
                txt_tel.Focus();
                return;
            }
            Error.SetError(txt_tel, "");
            if (cmb_tdoc.Text == "")
            {
                Error.SetError(cmb_tdoc, "Seleccione un tipo de documento");
                cmb_tdoc.Focus();
                return;
            }
            Error.SetError(cmb_tdoc, "");
            if (txt_doc.Text == "")
            {
                Error.SetError(txt_doc, "Ingrese un número de documento");
                txt_doc.Focus();
                return;
            }            
            Error.SetError(txt_doc, "");            
            String FechaDesde = Convert.ToString(dtp_fecha.Value.Year + "-" + dtp_fecha.Value.Month + "-" + dtp_fecha.Value.Day);
            OperProf.Agregar(/*Usuarios.Id,*/ txt_nom, txt_ap, FechaDesde, Convert.ToInt32(txt_tel.Text), txt_mail, Convert.ToInt32(txt_doc.Text), cmb_tdoc, cmb_estado, 0);
            this.Close();
        }

        private void Btn_modificar_Click(object sender, EventArgs e)
        {
            if (txt_nom.Text == "")
            {
                Error.SetError(txt_nom, "Ingrese un nombre");
                txt_nom.Focus();
                return;
            }
            Error.SetError(txt_nom, "");
            if (txt_ap.Text == "")
            {
                Error.SetError(txt_ap, "Ingrese un apellido");
                txt_ap.Focus();
                return;
            }
            Error.SetError(txt_ap, "");
            if (txt_tel.Text == "")
            {
                Error.SetError(txt_tel, "Ingrese un telefono");
                txt_tel.Focus();
                return;
            }
            Error.SetError(txt_tel, "");
            if (cmb_tdoc.Text == "")
            {
                Error.SetError(cmb_tdoc, "Seleccione un tipo de documento");
                cmb_tdoc.Focus();
                return;
            }
            Error.SetError(cmb_tdoc, "");
            if (txt_doc.Text == "")
            {
                Error.SetError(txt_doc, "Ingrese un número de documento");
                txt_doc.Focus();
                return;
            }
            Error.SetError(txt_doc, "");
            String FechaDesde = Convert.ToString(dtp_fecha.Value.Year + "-" + dtp_fecha.Value.Month + "-" + dtp_fecha.Value.Day);
            if (OperProf.Modificar(/*Usuarios.Id,*/ txt_id, txt_nom, txt_ap, FechaDesde, Convert.ToInt32(txt_tel.Text), txt_mail, Convert.ToInt32(txt_doc.Text), cmb_tdoc, cmb_estado))
            {
                MessageBox.Show("Profesor modificado");
                OperProf.ListadoProf(bprof.dgv_prof);
                bprof.dgv_prof.Refresh();
                this.Close();
            }
        }
    }
}
