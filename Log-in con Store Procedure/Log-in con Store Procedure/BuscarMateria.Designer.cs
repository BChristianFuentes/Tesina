namespace Log_in_con_Store_Procedure
{
    partial class BuscarMateria
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BuscarMateria));
            this.cmb_esp = new System.Windows.Forms.ComboBox();
            this.txt_nom = new System.Windows.Forms.TextBox();
            this.lbl_esp = new System.Windows.Forms.Label();
            this.lbl_nom = new System.Windows.Forms.Label();
            this.dgv = new System.Windows.Forms.DataGridView();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.cmb_curso = new System.Windows.Forms.ComboBox();
            this.btn_modificarmateria = new System.Windows.Forms.Button();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.btn_buscar = new System.Windows.Forms.Button();
            this.btn_asignarcurso = new System.Windows.Forms.Button();
            this.btn_agregarmateria = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btn_veralumnos = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // cmb_esp
            // 
            this.cmb_esp.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_esp.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_esp.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_esp.FormattingEnabled = true;
            this.cmb_esp.Items.AddRange(new object[] {
            "a"});
            this.cmb_esp.Location = new System.Drawing.Point(144, 53);
            this.cmb_esp.Name = "cmb_esp";
            this.cmb_esp.Size = new System.Drawing.Size(165, 28);
            this.cmb_esp.TabIndex = 22;
            this.cmb_esp.SelectedIndexChanged += new System.EventHandler(this.cmb_esp_SelectedIndexChanged);
            // 
            // txt_nom
            // 
            this.txt_nom.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nom.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_nom.Location = new System.Drawing.Point(144, 12);
            this.txt_nom.Name = "txt_nom";
            this.txt_nom.Size = new System.Drawing.Size(165, 26);
            this.txt_nom.TabIndex = 21;
            // 
            // lbl_esp
            // 
            this.lbl_esp.AutoSize = true;
            this.lbl_esp.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_esp.Location = new System.Drawing.Point(39, 56);
            this.lbl_esp.Name = "lbl_esp";
            this.lbl_esp.Size = new System.Drawing.Size(99, 20);
            this.lbl_esp.TabIndex = 20;
            this.lbl_esp.Text = "Especialidad";
            // 
            // lbl_nom
            // 
            this.lbl_nom.AutoSize = true;
            this.lbl_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_nom.Location = new System.Drawing.Point(16, 14);
            this.lbl_nom.Name = "lbl_nom";
            this.lbl_nom.Size = new System.Drawing.Size(122, 20);
            this.lbl_nom.TabIndex = 19;
            this.lbl_nom.Text = "Nombre materia";
            // 
            // dgv
            // 
            this.dgv.AllowUserToAddRows = false;
            this.dgv.AllowUserToDeleteRows = false;
            this.dgv.AllowUserToResizeColumns = false;
            this.dgv.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgv.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Location = new System.Drawing.Point(12, 101);
            this.dgv.Name = "dgv";
            this.dgv.Size = new System.Drawing.Size(645, 277);
            this.dgv.TabIndex = 25;
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(332, 61);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 20);
            this.label1.TabIndex = 20;
            this.label1.Text = "Curso:";
            // 
            // cmb_curso
            // 
            this.cmb_curso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_curso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_curso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_curso.FormattingEnabled = true;
            this.cmb_curso.Items.AddRange(new object[] {
            "a"});
            this.cmb_curso.Location = new System.Drawing.Point(402, 53);
            this.cmb_curso.Name = "cmb_curso";
            this.cmb_curso.Size = new System.Drawing.Size(141, 28);
            this.cmb_curso.TabIndex = 22;
            // 
            // btn_modificarmateria
            // 
            this.btn_modificarmateria.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_modificarmateria.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_modificarmateria.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_modificarmateria.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_modificarmateria.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btn_modificarmateria.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_modificarmateria.Location = new System.Drawing.Point(187, 384);
            this.btn_modificarmateria.Name = "btn_modificarmateria";
            this.btn_modificarmateria.Size = new System.Drawing.Size(176, 45);
            this.btn_modificarmateria.TabIndex = 26;
            this.btn_modificarmateria.Text = "Modificar Materia";
            this.btn_modificarmateria.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_modificarmateria.UseVisualStyleBackColor = false;
            this.btn_modificarmateria.Click += new System.EventHandler(this.btn_modificarmateria_Click);
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(676, 435);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(108, 45);
            this.btnCerrar.TabIndex = 24;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.btnCerrar_Click);
            // 
            // btn_buscar
            // 
            this.btn_buscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_buscar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_buscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_buscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_buscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btn_buscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_buscar.Location = new System.Drawing.Point(605, 14);
            this.btn_buscar.Name = "btn_buscar";
            this.btn_buscar.Size = new System.Drawing.Size(52, 45);
            this.btn_buscar.TabIndex = 23;
            this.btn_buscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_buscar.UseVisualStyleBackColor = false;
            this.btn_buscar.Click += new System.EventHandler(this.btn_buscar_Click);
            // 
            // btn_asignarcurso
            // 
            this.btn_asignarcurso.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_asignarcurso.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_asignarcurso.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_asignarcurso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_asignarcurso.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btn_asignarcurso.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_asignarcurso.Location = new System.Drawing.Point(369, 384);
            this.btn_asignarcurso.Name = "btn_asignarcurso";
            this.btn_asignarcurso.Size = new System.Drawing.Size(168, 45);
            this.btn_asignarcurso.TabIndex = 23;
            this.btn_asignarcurso.Text = "Asignar Cursos";
            this.btn_asignarcurso.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_asignarcurso.UseVisualStyleBackColor = false;
            this.btn_asignarcurso.Click += new System.EventHandler(this.btn_asignarcurso_Click);
            // 
            // btn_agregarmateria
            // 
            this.btn_agregarmateria.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_agregarmateria.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_agregarmateria.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_agregarmateria.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_agregarmateria.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btn_agregarmateria.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_agregarmateria.Location = new System.Drawing.Point(12, 384);
            this.btn_agregarmateria.Name = "btn_agregarmateria";
            this.btn_agregarmateria.Size = new System.Drawing.Size(168, 45);
            this.btn_agregarmateria.TabIndex = 23;
            this.btn_agregarmateria.Text = "Agregar Materia";
            this.btn_agregarmateria.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_agregarmateria.UseVisualStyleBackColor = false;
            this.btn_agregarmateria.Click += new System.EventHandler(this.btn_agregarmateria_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(676, 13);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 18;
            this.pictureBox1.TabStop = false;
            // 
            // btn_veralumnos
            // 
            this.btn_veralumnos.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_veralumnos.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_veralumnos.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_veralumnos.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_veralumnos.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Informe;
            this.btn_veralumnos.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_veralumnos.Location = new System.Drawing.Point(12, 435);
            this.btn_veralumnos.Name = "btn_veralumnos";
            this.btn_veralumnos.Size = new System.Drawing.Size(168, 45);
            this.btn_veralumnos.TabIndex = 27;
            this.btn_veralumnos.Text = "Ver alumnos";
            this.btn_veralumnos.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_veralumnos.UseVisualStyleBackColor = false;
            this.btn_veralumnos.Click += new System.EventHandler(this.btn_veralumnos_Click);
            // 
            // BuscarMateria
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(800, 483);
            this.ControlBox = false;
            this.Controls.Add(this.btn_veralumnos);
            this.Controls.Add(this.btn_modificarmateria);
            this.Controls.Add(this.dgv);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.btn_buscar);
            this.Controls.Add(this.btn_asignarcurso);
            this.Controls.Add(this.btn_agregarmateria);
            this.Controls.Add(this.cmb_curso);
            this.Controls.Add(this.cmb_esp);
            this.Controls.Add(this.txt_nom);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.lbl_esp);
            this.Controls.Add(this.lbl_nom);
            this.Controls.Add(this.pictureBox1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "BuscarMateria";
            this.Text = "Buscar Materia";
            this.Load += new System.EventHandler(this.BuscarMateria_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.Button btn_agregarmateria;
        public System.Windows.Forms.ComboBox cmb_esp;
        private System.Windows.Forms.TextBox txt_nom;
        private System.Windows.Forms.Label lbl_esp;
        private System.Windows.Forms.Label lbl_nom;
        private System.Windows.Forms.PictureBox pictureBox1;
        public System.Windows.Forms.DataGridView dgv;
        public System.Windows.Forms.Button btnCerrar;
        private System.Windows.Forms.ErrorProvider Error;
        public System.Windows.Forms.Button btn_buscar;
        public System.Windows.Forms.ComboBox cmb_curso;
        private System.Windows.Forms.Label label1;
        public System.Windows.Forms.Button btn_modificarmateria;
        public System.Windows.Forms.Button btn_asignarcurso;
        public System.Windows.Forms.Button btn_veralumnos;
    }
}