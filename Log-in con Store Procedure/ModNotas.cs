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
    public partial class ModNotas : Form
    {
        public ModNotas()
        {
            InitializeComponent();
        }

        OperacionesNotas OperN = new OperacionesNotas();
        Teclado Digitos = new Teclado();

        private void ModNotas_Load(object sender, EventArgs e)
        {
            OperN.verNotaxAlumno(dgv, Convert.ToInt32(txt_id.Text));
        }

        private void btn_modificarnota_Click(object sender, EventArgs e)
        {
            var limite = txt_nota.Text;
            if (limite.Length < 11 && limite.Length>1)
            {
                Error.SetError(txt_nota, "Ingrese una nota del 1 al 10");
                txt_nota.Focus();
                return;
            }
            if (txt_nota.Text == "")
            {
                Error.SetError(txt_nota, "Ingrese una nota");
                txt_nota.Focus();
                return;
            }
            label2.Text = dgv.CurrentRow.Cells["id_notas"].Value.ToString();
            OperN.ModNotas(Convert.ToInt32(label2.Text), Convert.ToInt32(txt_nota.Text));
            this.Close();
        }

        private void txt_nota_KeyPress(object sender, KeyPressEventArgs e)
        {

            Digitos.SoloNumeros(e);
        }
    }
}
