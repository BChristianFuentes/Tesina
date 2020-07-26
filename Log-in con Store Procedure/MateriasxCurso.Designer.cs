namespace Log_in_con_Store_Procedure
{
    partial class MateriasxCurso
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MateriasxCurso));
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btn_buscar = new System.Windows.Forms.Button();
            this.dgv_prof = new System.Windows.Forms.DataGridView();
            this.btn_cerrar = new System.Windows.Forms.Button();
            this.btn_agregar = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.btn_ag2 = new System.Windows.Forms.Button();
            this.textBox2 = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_prof)).BeginInit();
            this.SuspendLayout();
            // 
            // cmbCurso
            // 
            this.cmbCurso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmbCurso.FormattingEnabled = true;
            this.cmbCurso.Items.AddRange(new object[] {
            "a"});
            this.cmbCurso.Location = new System.Drawing.Point(103, 18);
            this.cmbCurso.Name = "cmbCurso";
            this.cmbCurso.Size = new System.Drawing.Size(100, 28);
            this.cmbCurso.TabIndex = 12;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(38, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 20);
            this.label1.TabIndex = 13;
            this.label1.Text = "Curso:";
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(688, 9);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 20;
            this.pictureBox1.TabStop = false;
            // 
            // btn_buscar
            // 
            this.btn_buscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_buscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_buscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_buscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btn_buscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_buscar.Location = new System.Drawing.Point(533, 9);
            this.btn_buscar.Name = "btn_buscar";
            this.btn_buscar.Size = new System.Drawing.Size(125, 45);
            this.btn_buscar.TabIndex = 21;
            this.btn_buscar.Text = "Buscar";
            this.btn_buscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_buscar.UseVisualStyleBackColor = false;
            this.btn_buscar.Click += new System.EventHandler(this.btn_buscar_Click);
            // 
            // dgv_prof
            // 
            this.dgv_prof.AllowUserToAddRows = false;
            this.dgv_prof.AllowUserToDeleteRows = false;
            this.dgv_prof.AllowUserToResizeColumns = false;
            this.dgv_prof.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgv_prof.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgv_prof.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_prof.Location = new System.Drawing.Point(12, 78);
            this.dgv_prof.Name = "dgv_prof";
            this.dgv_prof.Size = new System.Drawing.Size(646, 300);
            this.dgv_prof.TabIndex = 28;
            this.dgv_prof.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgv_prof_CellClick);
            // 
            // btn_cerrar
            // 
            this.btn_cerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_cerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_cerrar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_cerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btn_cerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_cerrar.Location = new System.Drawing.Point(688, 393);
            this.btn_cerrar.Name = "btn_cerrar";
            this.btn_cerrar.Size = new System.Drawing.Size(108, 45);
            this.btn_cerrar.TabIndex = 30;
            this.btn_cerrar.Text = "Cerrar";
            this.btn_cerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_cerrar.UseVisualStyleBackColor = false;
            this.btn_cerrar.Click += new System.EventHandler(this.btn_cerrar_Click);
            // 
            // btn_agregar
            // 
            this.btn_agregar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_agregar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_agregar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_agregar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_agregar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btn_agregar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_agregar.Location = new System.Drawing.Point(402, 9);
            this.btn_agregar.Name = "btn_agregar";
            this.btn_agregar.Size = new System.Drawing.Size(125, 45);
            this.btn_agregar.TabIndex = 31;
            this.btn_agregar.Text = "Agregar";
            this.btn_agregar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_agregar.UseVisualStyleBackColor = false;
            this.btn_agregar.Click += new System.EventHandler(this.btn_agregar_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(12, 393);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 20);
            this.textBox1.TabIndex = 32;
            this.textBox1.Visible = false;
            // 
            // btn_ag2
            // 
            this.btn_ag2.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_ag2.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_ag2.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_ag2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_ag2.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btn_ag2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_ag2.Location = new System.Drawing.Point(12, 393);
            this.btn_ag2.Name = "btn_ag2";
            this.btn_ag2.Size = new System.Drawing.Size(125, 45);
            this.btn_ag2.TabIndex = 33;
            this.btn_ag2.Text = "Agregar";
            this.btn_ag2.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_ag2.UseVisualStyleBackColor = false;
            this.btn_ag2.Click += new System.EventHandler(this.btn_ag2_Click);
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(160, 418);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(100, 20);
            this.textBox2.TabIndex = 34;
            this.textBox2.Visible = false;
            // 
            // MateriasxCurso
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(808, 450);
            this.ControlBox = false;
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.btn_ag2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.btn_agregar);
            this.Controls.Add(this.btn_cerrar);
            this.Controls.Add(this.dgv_prof);
            this.Controls.Add(this.btn_buscar);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.cmbCurso);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "MateriasxCurso";
            this.Text = "MateriasxCurso";
            this.Load += new System.EventHandler(this.MateriasxCurso_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_prof)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.ComboBox cmbCurso;
        public System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox pictureBox1;
        public System.Windows.Forms.Button btn_buscar;
        public System.Windows.Forms.DataGridView dgv_prof;
        private System.Windows.Forms.Button btn_cerrar;
        public System.Windows.Forms.Button btn_agregar;
        public System.Windows.Forms.TextBox textBox1;
        public System.Windows.Forms.Button btn_ag2;
        public System.Windows.Forms.TextBox textBox2;
    }
}