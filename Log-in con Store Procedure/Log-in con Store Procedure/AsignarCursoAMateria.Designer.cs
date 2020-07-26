namespace Log_in_con_Store_Procedure
{
    partial class AsignarCursoAMateria
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
            this.cmb_curso = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dgv = new System.Windows.Forms.DataGridView();
            this.btn_buscar = new System.Windows.Forms.Button();
            this.btn_asignar = new System.Windows.Forms.Button();
            this.cmb_esp = new System.Windows.Forms.ComboBox();
            this.lbl_esp = new System.Windows.Forms.Label();
            this.lbl_nom = new System.Windows.Forms.Label();
            this.txt_nommateria = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // cmb_curso
            // 
            this.cmb_curso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_curso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_curso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_curso.FormattingEnabled = true;
            this.cmb_curso.Items.AddRange(new object[] {
            "a"});
            this.cmb_curso.Location = new System.Drawing.Point(144, 449);
            this.cmb_curso.Name = "cmb_curso";
            this.cmb_curso.Size = new System.Drawing.Size(165, 28);
            this.cmb_curso.TabIndex = 30;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(66, 452);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 20);
            this.label1.TabIndex = 29;
            this.label1.Text = "Curso:";
            // 
            // dgv
            // 
            this.dgv.AllowUserToAddRows = false;
            this.dgv.AllowUserToDeleteRows = false;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Location = new System.Drawing.Point(7, 114);
            this.dgv.Name = "dgv";
            this.dgv.Size = new System.Drawing.Size(472, 263);
            this.dgv.TabIndex = 31;
            // 
            // btn_buscar
            // 
            this.btn_buscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_buscar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_buscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_buscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_buscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btn_buscar.Location = new System.Drawing.Point(414, 35);
            this.btn_buscar.Name = "btn_buscar";
            this.btn_buscar.Size = new System.Drawing.Size(58, 47);
            this.btn_buscar.TabIndex = 32;
            this.btn_buscar.UseVisualStyleBackColor = false;
            this.btn_buscar.Click += new System.EventHandler(this.btn_buscar_Click);
            // 
            // btn_asignar
            // 
            this.btn_asignar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_asignar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_asignar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_asignar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_asignar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btn_asignar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_asignar.Location = new System.Drawing.Point(361, 440);
            this.btn_asignar.Name = "btn_asignar";
            this.btn_asignar.Size = new System.Drawing.Size(123, 45);
            this.btn_asignar.TabIndex = 33;
            this.btn_asignar.Text = "Asignar";
            this.btn_asignar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_asignar.UseVisualStyleBackColor = false;
            this.btn_asignar.Click += new System.EventHandler(this.btn_asignar_Click);
            // 
            // cmb_esp
            // 
            this.cmb_esp.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_esp.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_esp.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_esp.FormattingEnabled = true;
            this.cmb_esp.Items.AddRange(new object[] {
            "a"});
            this.cmb_esp.Location = new System.Drawing.Point(132, 69);
            this.cmb_esp.Name = "cmb_esp";
            this.cmb_esp.Size = new System.Drawing.Size(165, 28);
            this.cmb_esp.TabIndex = 37;
            // 
            // lbl_esp
            // 
            this.lbl_esp.AutoSize = true;
            this.lbl_esp.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_esp.Location = new System.Drawing.Point(6, 77);
            this.lbl_esp.Name = "lbl_esp";
            this.lbl_esp.Size = new System.Drawing.Size(103, 20);
            this.lbl_esp.TabIndex = 35;
            this.lbl_esp.Text = "Especialidad:";
            // 
            // lbl_nom
            // 
            this.lbl_nom.AutoSize = true;
            this.lbl_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_nom.Location = new System.Drawing.Point(43, 35);
            this.lbl_nom.Name = "lbl_nom";
            this.lbl_nom.Size = new System.Drawing.Size(66, 20);
            this.lbl_nom.TabIndex = 34;
            this.lbl_nom.Text = "Materia:";
            // 
            // txt_nommateria
            // 
            this.txt_nommateria.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nommateria.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nommateria.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_nommateria.Location = new System.Drawing.Point(132, 29);
            this.txt_nommateria.Name = "txt_nommateria";
            this.txt_nommateria.Size = new System.Drawing.Size(165, 26);
            this.txt_nommateria.TabIndex = 36;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.lbl_nom);
            this.groupBox1.Controls.Add(this.btn_buscar);
            this.groupBox1.Controls.Add(this.lbl_esp);
            this.groupBox1.Controls.Add(this.cmb_esp);
            this.groupBox1.Controls.Add(this.dgv);
            this.groupBox1.Controls.Add(this.txt_nommateria);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(485, 395);
            this.groupBox1.TabIndex = 38;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Buscar Materia:";
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // AsignarCursoAMateria
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(509, 499);
            this.Controls.Add(this.btn_asignar);
            this.Controls.Add(this.cmb_curso);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.groupBox1);
            this.Name = "AsignarCursoAMateria";
            this.Text = "Asignar Curso";
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.ComboBox cmb_curso;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dgv;
        public System.Windows.Forms.Button btn_buscar;
        public System.Windows.Forms.Button btn_asignar;
        public System.Windows.Forms.ComboBox cmb_esp;
        private System.Windows.Forms.Label lbl_esp;
        private System.Windows.Forms.Label lbl_nom;
        public System.Windows.Forms.TextBox txt_nommateria;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ErrorProvider Error;
    }
}