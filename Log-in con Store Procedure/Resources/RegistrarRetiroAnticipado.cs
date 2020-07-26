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
    public partial class RegistrarRetiroAnticipado : Form
    {
        public RegistrarRetiroAnticipado()
        {
            InitializeComponent();

            cmbCurso.DataSource = llenar.ObtenerCursos();
            cmbCurso.ValueMember = "IdCurso";
            cmbCurso.DisplayMember = "CursoString";

            cmbCurso.SelectedIndex = -1;
        }

        LlenarCombo llenar = new LlenarCombo();
        OperacionesAlumnos OperAlu = new OperacionesAlumnos();
        Teclado Digitos = new Teclado();

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
