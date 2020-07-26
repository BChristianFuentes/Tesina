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
    public partial class BuscarMateria : Form
    {
        Teclado Digitos = new Teclado();
        LlenarCombo Llenar = new LlenarCombo();
        OperacionesMaterias Materias = new OperacionesMaterias();

        public BuscarMateria()
        {
            InitializeComponent();
            cmb_esp.DataSource = Llenar.ObtenerEspecialidad();
            cmb_esp.ValueMember = "IdEspecialidad";
            cmb_esp.DisplayMember = "EspecialidadString";
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void BuscarMateria_Load(object sender, EventArgs e)
        {
            Materias.Listado(dgv);
        }

        private void btn_agregarmateria_Click(object sender, EventArgs e)
        {
            AgregarMateria agregarmaterias = new AgregarMateria();
            agregarmaterias.Show();
        }

        private void btn_buscar_Click(object sender, EventArgs e)
        {
            /*if (txt_nom.Text == "")
            {
                Error.SetError(txt_nom, "Ingrese un nombre");
                txt_nom.Focus();
                return;
            }
            Error.SetError(txt_nom, "");*/
            Materias.BuscarMaterias(txt_nom, cmb_esp, cmb_curso, dgv);
            dgv.Refresh();
        }

        private void btn_modificarmateria_Click(object sender, EventArgs e)
        {
            try
            {
                if (Application.OpenForms.OfType<ModificarMaterias>().Count() == 0)
                {
                    ModificarMaterias abrir = new ModificarMaterias();
                    #region ID:
                    abrir.txt_idmateria.Text = dgv.CurrentRow.Cells["idMateria"].Value.ToString();
                    abrir.txt_idmateriaxcurso.Text = dgv.CurrentRow.Cells["idMateriaxCurso"].Value.ToString();
                    abrir.txt_idprofesorxmateriaxcurso.Text = dgv.CurrentRow.Cells["idProfxMateriaxCurso"].Value.ToString();
                    abrir.txt_idprof.Text = dgv.CurrentRow.Cells["idProfesor"].Value.ToString();
                    #endregion
                    abrir.txt_nommateria.Text = dgv.CurrentRow.Cells["Materia"].Value.ToString();
                    abrir.txt_nommateria.ReadOnly = true;
                    abrir.cmb_curso.Text = dgv.CurrentRow.Cells["Cursos"].Value.ToString();
                    abrir.cmb_esp.Text = dgv.CurrentRow.Cells["Especialidad de la materia"].Value.ToString();
                    abrir.txt_nomprof.Text = dgv.CurrentRow.Cells["Nombre del profesor"].Value.ToString() + " " + dgv.CurrentRow.Cells["Apellido del profesor"].Value.ToString();
                    abrir.Show();
                }
                else Application.OpenForms["AgregarModificarProfesor"].BringToFront();
            }
            catch(Exception exc)
            {
                MessageBox.Show(exc.Message, "Seleccione una materia");
            }
        }

        private void cmb_esp_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmb_curso.DataSource = Llenar.ObtenerCursosxEspecialidad(cmb_esp.SelectedIndex + 1);
            cmb_curso.ValueMember = "IdCursoEspecialidad";
            cmb_curso.DisplayMember = "CursoStringEspecialidad";
        }

        private void btn_asignarcurso_Click(object sender, EventArgs e)
        {
            AsignarCursoAMateria cursos = new AsignarCursoAMateria();
            cursos.Show();
        }

        private void btn_veralumnos_Click(object sender, EventArgs e)
        {
            try
            {
                BuscarNotasxMateria bnxm = new BuscarNotasxMateria();
                //bnxm.cmb_ciclo.Text = dgv.CurrentRow.Cells["Ciclo"].Value.ToString(); El stored no da ciclo.
                bnxm.cmb_curso.Text = Convert.ToString(dgv.CurrentRow.Cells["Cursos"].Value);
                bnxm.cmb_materia.Text = dgv.CurrentRow.Cells["Materia"].Value.ToString();
                bnxm.cmb_ciclo.Enabled = false;
                bnxm.cmb_curso.Enabled = false;
                bnxm.cmb_materia.Enabled = false;
                bnxm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Seleccione una materia.");
            }
        }
    }
}
