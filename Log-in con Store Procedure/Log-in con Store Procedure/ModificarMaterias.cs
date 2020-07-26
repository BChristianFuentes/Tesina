using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace Log_in_con_Store_Procedure
{
    public partial class ModificarMaterias : Form
    {
        public ModificarMaterias()
        {
            InitializeComponent();
            cmb_esp.DataSource = Llenar.ObtenerEspecialidad();
            cmb_esp.ValueMember = "IdEspecialidad";
            cmb_esp.DisplayMember = "EspecialidadString";
            Profesores.ListadoProf(dgv);
            dgv.Columns["idProfesor"].Visible = false;
        }

        LlenarCombo Llenar = new LlenarCombo();
        OperacionesMaterias Materias = new OperacionesMaterias();
        OperacionesProfesores Profesores = new OperacionesProfesores();

        private void dgv_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_nomprof.Text = dgv.CurrentRow.Cells[1].Value.ToString() + " " + dgv.CurrentRow.Cells[2].Value.ToString();
            txt_idprof.Text = dgv.CurrentRow.Cells[0].Value.ToString();
        }

        private void btn_buscar_Click(object sender, EventArgs e)
        {
            if (txt_nomprofbuscar.Text == "")
            {
                errorModProf.SetError(txt_nomprofbuscar, "Ingrese un profesor");
                txt_nomprofbuscar.Focus();
                return;
            }
            errorModProf.SetError(txt_nomprofbuscar, "");
            if (txt_apeprofbuscar.Text == "")
            {
                errorModProf.SetError(txt_apeprofbuscar, "Ingrese un apellido");
                txt_apeprofbuscar.Focus();
                return;
            }
            errorModProf.SetError(txt_apeprofbuscar, "");
            if (txt_documento.Text == "")
            {
                errorModProf.SetError(txt_documento, "Ingrese un documento");
                txt_documento.Focus();
                return;
            }
            errorModProf.SetError(txt_documento, "");




            Profesores.BuscarProf(txt_nomprofbuscar, txt_documento, txt_apeprofbuscar, dgv);
            dgv.Columns["Numero de identidad del profesor"].Visible = false;
        }

        private void cmb_esp_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmb_curso.DataSource = Llenar.ObtenerCursosxEspecialidad(cmb_esp.SelectedIndex + 1);
            cmb_curso.ValueMember = "IdCursoEspecialidad";
            cmb_curso.DisplayMember = "CursoStringEspecialidad";
        }

        private void btn_modificarmateria_Click(object sender, EventArgs e)
        {
            if (txt_nommateria.Text == "")
            {
                errorModMateria.SetError(txt_nommateria, "Ingrese una materia");
                txt_nommateria.Focus();
                return;
            }
            errorModMateria.SetError(txt_nommateria, "");
            if (cmb_esp.Text == "")
            {
                errorModMateria.SetError(cmb_esp, "Seleccione una especialidad");
                cmb_esp.Focus();
                return;
            }
            errorModMateria.SetError(cmb_esp, "");
            if (cmb_curso.Text == "")
            {
                errorModMateria.SetError(cmb_curso, "Seleccione un curso");
                cmb_curso.Focus();
                return;
            }
            errorModMateria.SetError(cmb_curso, "");
            if (txt_nomprof.Text == "")
            {
                errorModMateria.SetError(txt_nomprof, "Ingrese un profesor");
                txt_nomprof.Focus();
                return;
            }
            errorModMateria.SetError(txt_nomprof, "");




            if (MessageBox.Show("¿Esta seguro que quiere modificar la materia?", "Salir", 
                MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                Materias.ModificarMateria(Convert.ToInt32(txt_idmateria.Text),
                                        txt_nommateria,
                                        cmb_esp,
                                        0,
                                        0);
                Materias.ModificarMateriaxCurso(Convert.ToInt32(txt_idmateriaxcurso.Text),
                                                Convert.ToInt32(txt_idmateria.Text),
                                                cmb_curso,
                                                0,
                                                0,
                                                false);
                Materias.ModificarProfesorxMateriaXCurso(Convert.ToInt32(txt_idprofesorxmateriaxcurso.Text),
                                                         Convert.ToInt32(txt_idprof.Text),
                                                         Convert.ToInt32(txt_idmateriaxcurso.Text),
                                                         0,
                                                         0,
                                                         false);
                txt_nommateria.Clear();
                cmb_esp.Text = "";
                cmb_curso.Text = "";
                txt_nomprof.Clear();
            }
        }
    }
}
