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
    public partial class Abanderado : Form
    {
        public Abanderado()
        {
            InitializeComponent();
            cmb_trimestre.DataSource = llenar.ObtenerTrimestresParaBandera();
            cmb_trimestre.ValueMember = "IdTrimestre";
            cmb_trimestre.DisplayMember = "TrimestreString";
            cmb_turno.Items.Add("Mañana");
            cmb_turno.Items.Add("Tarde");
            cmb_turno.Items.Remove("a");
            cmb_turno.SelectedIndex = 0;
        }

        LlenarCombo llenar = new LlenarCombo();
        OperacionesAlumnos opa = new OperacionesAlumnos();

        private void btn_buscar_Click(object sender, EventArgs e)
        {
            if (cmb_turno.Text == "")
            {
                Error.SetError(cmb_turno, "Seleccione un turno");
                cmb_turno.Focus();
                return;
            }
            Error.SetError(cmb_turno, "");
            if (cmb_trimestre.Text == "")
            {
                Error.SetError(cmb_trimestre, "Seleccione un trimestre");
                cmb_trimestre.Focus();
                return;
            }
            opa.BanderaCuarto(cmb_turno.SelectedItem.ToString(), cmb_trimestre, dgv_escuelas);
            opa.BanderaQuinto(cmb_turno.SelectedItem.ToString(), cmb_trimestre, dgv_ciudad);
            opa.BanderaSexto(cmb_turno.SelectedItem.ToString(), cmb_trimestre, dgv_nacion);
        }

        private void cmb_trimestre_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBox1.Text = (cmb_trimestre.SelectedIndex + 1).ToString();
        }

        private void cmb_turno_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBox2.Text = cmb_turno.SelectedItem.ToString();
        }

        private void btn_cerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_exportar_Click(object sender, EventArgs e)
        {
            Operaciones op = new Operaciones();
            op.ExportarExcel(dgv_nacion, "Abanderados de la Bandera Nacional", "Turno " + cmb_turno.Text + " " + cmb_trimestre.Text, false);
            op.ExportarExcel(dgv_ciudad, "Abanderados de la Bandera de la Ciudad", "Turno " + cmb_turno.Text + " " + cmb_trimestre.Text, false);
            op.ExportarExcel(dgv_escuelas, "Abanderados de la Bandera de las Escuelas Técnicas", "Turno " + cmb_turno.Text + " " + cmb_trimestre.Text, true);
        }
    }
}
