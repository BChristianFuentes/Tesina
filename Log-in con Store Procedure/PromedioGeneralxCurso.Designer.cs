namespace Log_in_con_Store_Procedure
{
    partial class PromedioGeneralxCurso
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
            this.dgv = new System.Windows.Forms.DataGridView();
            this.btn_exportar = new System.Windows.Forms.Button();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btn_buscar = new System.Windows.Forms.Button();
            this.cmb_ciclo = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cmb_curso = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox3 = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // dgv
            // 
            this.dgv.AllowUserToAddRows = false;
            this.dgv.AllowUserToDeleteRows = false;
            this.dgv.AllowUserToResizeColumns = false;
            this.dgv.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgv.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Location = new System.Drawing.Point(9, 85);
            this.dgv.Name = "dgv";
            this.dgv.ReadOnly = true;
            this.dgv.Size = new System.Drawing.Size(637, 298);
            this.dgv.TabIndex = 51;
            // 
            // btn_exportar
            // 
            this.btn_exportar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_exportar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_exportar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_exportar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Exportar;
            this.btn_exportar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_exportar.Location = new System.Drawing.Point(666, 211);
            this.btn_exportar.Name = "btn_exportar";
            this.btn_exportar.Size = new System.Drawing.Size(108, 45);
            this.btn_exportar.TabIndex = 49;
            this.btn_exportar.Text = "Exportar";
            this.btn_exportar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_exportar.UseVisualStyleBackColor = false;
            this.btn_exportar.Click += new System.EventHandler(this.btn_exportar_Click);
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(666, 338);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(108, 45);
            this.btnCerrar.TabIndex = 50;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.btnCerrar_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(666, 19);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 126);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 48;
            this.pictureBox1.TabStop = false;
            // 
            // btn_buscar
            // 
            this.btn_buscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_buscar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_buscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_buscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_buscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btn_buscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_buscar.Location = new System.Drawing.Point(594, 19);
            this.btn_buscar.Name = "btn_buscar";
            this.btn_buscar.Size = new System.Drawing.Size(52, 45);
            this.btn_buscar.TabIndex = 47;
            this.btn_buscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_buscar.UseVisualStyleBackColor = false;
            this.btn_buscar.Click += new System.EventHandler(this.btn_buscar_Click);
            // 
            // cmb_ciclo
            // 
            this.cmb_ciclo.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_ciclo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_ciclo.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_ciclo.FormattingEnabled = true;
            this.cmb_ciclo.Items.AddRange(new object[] {
            "a"});
            this.cmb_ciclo.Location = new System.Drawing.Point(348, 23);
            this.cmb_ciclo.Name = "cmb_ciclo";
            this.cmb_ciclo.Size = new System.Drawing.Size(165, 28);
            this.cmb_ciclo.TabIndex = 45;
            this.cmb_ciclo.SelectedIndexChanged += new System.EventHandler(this.cmb_ciclo_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label3.Location = new System.Drawing.Point(278, 31);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(47, 20);
            this.label3.TabIndex = 39;
            this.label3.Text = "Ciclo:";
            // 
            // cmb_curso
            // 
            this.cmb_curso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_curso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_curso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_curso.FormattingEnabled = true;
            this.cmb_curso.Items.AddRange(new object[] {
            "a"});
            this.cmb_curso.Location = new System.Drawing.Point(100, 23);
            this.cmb_curso.Name = "cmb_curso";
            this.cmb_curso.Size = new System.Drawing.Size(163, 28);
            this.cmb_curso.TabIndex = 46;
            this.cmb_curso.SelectedIndexChanged += new System.EventHandler(this.cmb_curso_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(29, 31);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 20);
            this.label1.TabIndex = 40;
            this.label1.Text = "Curso:";
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(127, 59);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(100, 20);
            this.textBox3.TabIndex = 52;
            // 
            // PromedioGeneralxCurso
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(788, 395);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.dgv);
            this.Controls.Add(this.btn_exportar);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.btn_buscar);
            this.Controls.Add(this.cmb_ciclo);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.cmb_curso);
            this.Controls.Add(this.label1);
            this.Name = "PromedioGeneralxCurso";
            this.Text = "PromedioGeneralxCurso";
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.DataGridView dgv;
        public System.Windows.Forms.Button btn_exportar;
        public System.Windows.Forms.Button btnCerrar;
        private System.Windows.Forms.PictureBox pictureBox1;
        public System.Windows.Forms.Button btn_buscar;
        public System.Windows.Forms.ComboBox cmb_ciclo;
        public System.Windows.Forms.Label label3;
        public System.Windows.Forms.ComboBox cmb_curso;
        public System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox3;
    }
}