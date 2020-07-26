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
    public partial class Trimestres : Form
    {
        public Trimestres()
        {
            InitializeComponent();

            cmbCiclo.DataSource = llenar.ObtenerCiclos();
            cmbCiclo.ValueMember = "Ciclo";
            cmbCiclo.DisplayMember = "Ciclo";
            cmbCiclo.Text = Oper.NombreArchivo(false, false, true);
        }
        Operaciones Oper = new Operaciones();
        Teclado Digitos = new Teclado();
        Usuarios OperUsu = new Usuarios();
        LlenarCombo llenar = new LlenarCombo();
        private void Trimestres_Load(object sender, EventArgs e)
        {

        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txtNom_KeyPress(object sender, KeyPressEventArgs e)
        {
            Digitos.SoloNumeros(e);
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            String Fecha1 = Convert.ToString(dtp1.Value.Year + "-" + dtp1.Value.Month + "-" + dtp1.Value.Day);
            String Fecha2 = Convert.ToString(dtp2.Value.Year + "-" + dtp2.Value.Month + "-" + dtp2.Value.Day);
            String Fecha3 = Convert.ToString(dtp3.Value.Year + "-" + dtp3.Value.Month + "-" + dtp3.Value.Day);
            String Fecha4 = Convert.ToString(dtp4.Value.Year + "-" + dtp4.Value.Month + "-" + dtp4.Value.Day);
            String Fecha5 = Convert.ToString(dtp5.Value.Year + "-" + dtp5.Value.Month + "-" + dtp5.Value.Day);
            String Fecha6 = Convert.ToString(dtp6.Value.Year + "-" + dtp6.Value.Month + "-" + dtp6.Value.Day);
            try
            {
                OperUsu.CambiarTrimestres(Fecha1, Fecha2, Fecha3, Fecha4, Fecha5, Fecha6, Convert.ToInt32(cmbCiclo.SelectedValue));
                MessageBox.Show("El inicio y fin de cada trimestre fue modificado");
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "No se modificaron los trimestres");
            }
        }
    }
}
