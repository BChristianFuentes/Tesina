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
    public partial class AgregarModificarNotas : Form
    {
        public AgregarModificarNotas()
        {
            InitializeComponent();
            cmb_curso.DataSource = Llenar.ObtenerCursos();
            cmb_curso.ValueMember = "IdCurso";
            cmb_curso.DisplayMember = "CursoString";
            cmb_trimestre.DataSource = Llenar.ObtenerTrimestres();
            cmb_trimestre.ValueMember = "IdTrimestre";
            cmb_trimestre.DisplayMember = "TrimestreString";
            cmb_cicloelectivo.DataSource = Llenar.ObtenerCiclos();
            cmb_cicloelectivo.DisplayMember = "CicloString";
        }

        LlenarCombo Llenar = new LlenarCombo();
        OperacionesMaterias materias = new OperacionesMaterias();
        OperacionesNotas notas = new OperacionesNotas();

        private void cmb_curso_SelectedIndexChanged(object sender, EventArgs e)
        {
           materias.ListadoProfxMatxCur(cmb_curso, dgv);
        }

        private void btn_asignarnota_Click(object sender, EventArgs e)
        {
            if (cmb_cicloelectivo.Text == "")
            {
                Error.SetError(cmb_cicloelectivo, "Seleccione un ciclo electivo");
                cmb_cicloelectivo.Focus();
                return;
            }
            Error.SetError(cmb_cicloelectivo, "");
            if (txt_alumno.Text == "")
            {
                Error.SetError(txt_alumno, "Ingrese un alumno");
                txt_alumno.Focus();
                return;
            }
            Error.SetError(txt_alumno, "");
            if (cmb_curso.Text == "")
            {
                Error.SetError(cmb_curso, "Seleccione un curso");
                cmb_curso.Focus();
                return;
            }
            Error.SetError(cmb_curso, "");
            if (txt_nota.Text == "")
            {
                Error.SetError(txt_nota, "Ingrese nota");
                txt_nota.Focus();
                return;
            }
            Error.SetError(txt_nota, "");
            if (cmb_trimestre.Text == "")
            {
                Error.SetError(cmb_trimestre, "Seleccione un trimestre");
                cmb_trimestre.Focus();
                return;
            }
            Error.SetError(cmb_trimestre, "");
            notas.InsertarNotas(cmb_cicloelectivo.SelectedIndex + 2018, Convert.ToInt32(txt_idcurso.Text),
                Convert.ToInt32(txt_idAXC.Text), Convert.ToInt32(dgv.CurrentRow.Cells["idMateriaxCurso"].Value),
                cmb_trimestre.SelectedIndex + 1, Convert.ToInt32(txt_nota.Text), 
                Convert.ToInt32(dgv.CurrentRow.Cells["idProfxMateriaxCurso"].Value), 0, 0);
            //notas.InsertarNotas(2018, 26, 154, 159, 2, 10, 2, 0, 0);
        }

        private void cmb_cicloelectivo_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_ciclo.Text = (cmb_cicloelectivo.SelectedIndex + 2018).ToString();
        }

        private void cmb_trimestre_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_trim.Text = (cmb_trimestre.SelectedIndex + 1).ToString();
        }

        private void btn_modificarnota_Click(object sender, EventArgs e)
        {
            notas.ModificarNotas(0, cmb_cicloelectivo.SelectedIndex + 2018, Convert.ToInt32(txt_idcurso.Text),
                Convert.ToInt32(txt_idAXC.Text), Convert.ToInt32(dgv.CurrentRow.Cells["idMateriaxCurso"].Value),
                cmb_trimestre.SelectedIndex + 1 /*<- Este*/, Convert.ToInt32(txt_nota.Text) /*<- Este*/,
                Convert.ToInt32(dgv.CurrentRow.Cells["idProfxMateriaxCurso"].Value), 0, 0);
        }

        private void AgregarModificarNotas_Activated(object sender, EventArgs e)
        {
            //notas.BuscarNotasxAlumno(txt_nom, txt_apell, cmb_curso, cmb_cicloelectivo, dgv);
        }
    }
}
