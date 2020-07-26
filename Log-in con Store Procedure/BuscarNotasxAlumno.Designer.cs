namespace Log_in_con_Store_Procedure
{
    partial class BuscarNotasxAlumno
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
            this.btn_buscar = new System.Windows.Forms.Button();
            this.cmb_curso = new System.Windows.Forms.ComboBox();
            this.txt_nomalumno = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.lbl_nom = new System.Windows.Forms.Label();
            this.txt_apellidoalumno = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.dgv = new System.Windows.Forms.DataGridView();
            this.label3 = new System.Windows.Forms.Label();
            this.cmb_ciclo = new System.Windows.Forms.ComboBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.btn_exportar = new System.Windows.Forms.Button();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // btn_buscar
            // 
            this.btn_buscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_buscar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_buscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_buscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_buscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btn_buscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_buscar.Location = new System.Drawing.Point(597, 23);
            this.btn_buscar.Name = "btn_buscar";
            this.btn_buscar.Size = new System.Drawing.Size(52, 45);
            this.btn_buscar.TabIndex = 32;
            this.btn_buscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_buscar.UseVisualStyleBackColor = false;
            this.btn_buscar.Click += new System.EventHandler(this.btn_buscar_Click);
            // 
            // cmb_curso
            // 
            this.cmb_curso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_curso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_curso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_curso.FormattingEnabled = true;
            this.cmb_curso.Items.AddRange(new object[] {
            "a"});
            this.cmb_curso.Location = new System.Drawing.Point(367, 23);
            this.cmb_curso.Name = "cmb_curso";
            this.cmb_curso.Size = new System.Drawing.Size(165, 28);
            this.cmb_curso.TabIndex = 30;
            this.cmb_curso.SelectedIndexChanged += new System.EventHandler(this.cmb_curso_SelectedIndexChanged);
            // 
            // txt_nomalumno
            // 
            this.txt_nomalumno.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nomalumno.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nomalumno.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_nomalumno.Location = new System.Drawing.Point(113, 23);
            this.txt_nomalumno.Name = "txt_nomalumno";
            this.txt_nomalumno.Size = new System.Drawing.Size(165, 26);
            this.txt_nomalumno.TabIndex = 29;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(297, 31);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 20);
            this.label1.TabIndex = 27;
            this.label1.Text = "Curso:";
            // 
            // lbl_nom
            // 
            this.lbl_nom.AutoSize = true;
            this.lbl_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_nom.Location = new System.Drawing.Point(22, 25);
            this.lbl_nom.Name = "lbl_nom";
            this.lbl_nom.Size = new System.Drawing.Size(69, 20);
            this.lbl_nom.TabIndex = 26;
            this.lbl_nom.Text = "Nombre:";
            // 
            // txt_apellidoalumno
            // 
            this.txt_apellidoalumno.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_apellidoalumno.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_apellidoalumno.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_apellidoalumno.Location = new System.Drawing.Point(113, 55);
            this.txt_apellidoalumno.Name = "txt_apellidoalumno";
            this.txt_apellidoalumno.Size = new System.Drawing.Size(165, 26);
            this.txt_apellidoalumno.TabIndex = 29;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label2.Location = new System.Drawing.Point(22, 61);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(69, 20);
            this.label2.TabIndex = 26;
            this.label2.Text = "Apellido:";
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(669, 342);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(108, 45);
            this.btnCerrar.TabIndex = 35;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.btnCerrar_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(669, 18);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 34;
            this.pictureBox1.TabStop = false;
            // 
            // dgv
            // 
            this.dgv.AllowUserToAddRows = false;
            this.dgv.AllowUserToDeleteRows = false;
            this.dgv.AllowUserToResizeColumns = false;
            this.dgv.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgv.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Location = new System.Drawing.Point(12, 110);
            this.dgv.Name = "dgv";
            this.dgv.ReadOnly = true;
            this.dgv.Size = new System.Drawing.Size(637, 277);
            this.dgv.TabIndex = 36;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label3.Location = new System.Drawing.Point(297, 65);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(47, 20);
            this.label3.TabIndex = 27;
            this.label3.Text = "Ciclo:";
            // 
            // cmb_ciclo
            // 
            this.cmb_ciclo.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_ciclo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_ciclo.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_ciclo.FormattingEnabled = true;
            this.cmb_ciclo.Items.AddRange(new object[] {
            "a"});
            this.cmb_ciclo.Location = new System.Drawing.Point(367, 57);
            this.cmb_ciclo.Name = "cmb_ciclo";
            this.cmb_ciclo.Size = new System.Drawing.Size(165, 28);
            this.cmb_ciclo.TabIndex = 30;
            this.cmb_ciclo.SelectedIndexChanged += new System.EventHandler(this.cmb_ciclo_SelectedIndexChanged);
            // 
            // textBox1
            // 
            this.textBox1.BackColor = System.Drawing.Color.PowderBlue;
            this.textBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.textBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.textBox1.Location = new System.Drawing.Point(522, 144);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(108, 26);
            this.textBox1.TabIndex = 29;
            // 
            // textBox2
            // 
            this.textBox2.BackColor = System.Drawing.Color.PowderBlue;
            this.textBox2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.textBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.textBox2.Location = new System.Drawing.Point(522, 185);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(108, 26);
            this.textBox2.TabIndex = 29;
            // 
            // btn_exportar
            // 
            this.btn_exportar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_exportar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_exportar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_exportar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Exportar;
            this.btn_exportar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_exportar.Location = new System.Drawing.Point(669, 215);
            this.btn_exportar.Name = "btn_exportar";
            this.btn_exportar.Size = new System.Drawing.Size(108, 45);
            this.btn_exportar.TabIndex = 35;
            this.btn_exportar.Text = "Exportar";
            this.btn_exportar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_exportar.UseVisualStyleBackColor = false;
            this.btn_exportar.Click += new System.EventHandler(this.btn_exportar_Click);
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // BuscarNotasxAlumno
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(789, 400);
            this.Controls.Add(this.dgv);
            this.Controls.Add(this.btn_exportar);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.btn_buscar);
            this.Controls.Add(this.cmb_ciclo);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.cmb_curso);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.lbl_nom);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.txt_apellidoalumno);
            this.Controls.Add(this.txt_nomalumno);
            this.Name = "BuscarNotasxAlumno";
            this.Text = "Buscar Notas por Alumno";
            this.Activated += new System.EventHandler(this.BuscarNotasxAlumno_Activated);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        public System.Windows.Forms.Button btn_buscar;
        public System.Windows.Forms.ComboBox cmb_curso;
        public System.Windows.Forms.Button btnCerrar;
        private System.Windows.Forms.PictureBox pictureBox1;
        public System.Windows.Forms.DataGridView dgv;
        public System.Windows.Forms.ComboBox cmb_ciclo;
        public System.Windows.Forms.TextBox txt_nomalumno;
        public System.Windows.Forms.Label label1;
        public System.Windows.Forms.Label lbl_nom;
        public System.Windows.Forms.TextBox txt_apellidoalumno;
        public System.Windows.Forms.Label label2;
        public System.Windows.Forms.Label label3;
        public System.Windows.Forms.TextBox textBox1;
        public System.Windows.Forms.TextBox textBox2;
        public System.Windows.Forms.Button btn_exportar;
        private System.Windows.Forms.ErrorProvider Error;
    }
}