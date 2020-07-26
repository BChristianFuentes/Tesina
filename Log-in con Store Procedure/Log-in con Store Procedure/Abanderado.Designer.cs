namespace Log_in_con_Store_Procedure
{
    partial class Abanderado
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
            this.cmb_turno = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cmb_trimestre = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dgv_nacion = new System.Windows.Forms.DataGridView();
            this.dgv_ciudad = new System.Windows.Forms.DataGridView();
            this.dgv_escuelas = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.btn_buscar = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.btn_cerrar = new System.Windows.Forms.Button();
            this.btn_exportar = new System.Windows.Forms.Button();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dgv_nacion)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_ciudad)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_escuelas)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // cmb_turno
            // 
            this.cmb_turno.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_turno.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_turno.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_turno.FormattingEnabled = true;
            this.cmb_turno.Items.AddRange(new object[] {
            "a"});
            this.cmb_turno.Location = new System.Drawing.Point(116, 18);
            this.cmb_turno.Name = "cmb_turno";
            this.cmb_turno.Size = new System.Drawing.Size(165, 28);
            this.cmb_turno.TabIndex = 31;
            this.cmb_turno.SelectedIndexChanged += new System.EventHandler(this.cmb_turno_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label3.Location = new System.Drawing.Point(47, 21);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(54, 20);
            this.label3.TabIndex = 32;
            this.label3.Text = "Turno:";
            // 
            // cmb_trimestre
            // 
            this.cmb_trimestre.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_trimestre.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_trimestre.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_trimestre.FormattingEnabled = true;
            this.cmb_trimestre.Items.AddRange(new object[] {
            "a"});
            this.cmb_trimestre.Location = new System.Drawing.Point(116, 52);
            this.cmb_trimestre.Name = "cmb_trimestre";
            this.cmb_trimestre.Size = new System.Drawing.Size(165, 28);
            this.cmb_trimestre.TabIndex = 31;
            this.cmb_trimestre.SelectedIndexChanged += new System.EventHandler(this.cmb_trimestre_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(22, 55);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 20);
            this.label1.TabIndex = 32;
            this.label1.Text = "Trimestre:";
            // 
            // dgv_nacion
            // 
            this.dgv_nacion.AllowDrop = true;
            this.dgv_nacion.AllowUserToAddRows = false;
            this.dgv_nacion.AllowUserToDeleteRows = false;
            this.dgv_nacion.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_nacion.Location = new System.Drawing.Point(17, 122);
            this.dgv_nacion.Name = "dgv_nacion";
            this.dgv_nacion.Size = new System.Drawing.Size(361, 116);
            this.dgv_nacion.TabIndex = 33;
            // 
            // dgv_ciudad
            // 
            this.dgv_ciudad.AllowUserToAddRows = false;
            this.dgv_ciudad.AllowUserToDeleteRows = false;
            this.dgv_ciudad.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_ciudad.Location = new System.Drawing.Point(17, 276);
            this.dgv_ciudad.Name = "dgv_ciudad";
            this.dgv_ciudad.Size = new System.Drawing.Size(361, 116);
            this.dgv_ciudad.TabIndex = 33;
            // 
            // dgv_escuelas
            // 
            this.dgv_escuelas.AllowUserToAddRows = false;
            this.dgv_escuelas.AllowUserToDeleteRows = false;
            this.dgv_escuelas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_escuelas.Location = new System.Drawing.Point(17, 434);
            this.dgv_escuelas.Name = "dgv_escuelas";
            this.dgv_escuelas.Size = new System.Drawing.Size(361, 116);
            this.dgv_escuelas.TabIndex = 33;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label2.Location = new System.Drawing.Point(13, 96);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(165, 20);
            this.label2.TabIndex = 34;
            this.label2.Text = "Bandera de la Nación:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label4.Location = new System.Drawing.Point(13, 253);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(166, 20);
            this.label4.TabIndex = 34;
            this.label4.Text = "Bandera de la Ciudad:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label5.Location = new System.Drawing.Point(13, 411);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(256, 20);
            this.label5.TabIndex = 34;
            this.label5.Text = "Bandera de las Escuelas Técnicas.";
            // 
            // btn_buscar
            // 
            this.btn_buscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_buscar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_buscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_buscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_buscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btn_buscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_buscar.Location = new System.Drawing.Point(323, 18);
            this.btn_buscar.Name = "btn_buscar";
            this.btn_buscar.Size = new System.Drawing.Size(55, 45);
            this.btn_buscar.TabIndex = 35;
            this.btn_buscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_buscar.UseVisualStyleBackColor = false;
            this.btn_buscar.Click += new System.EventHandler(this.btn_buscar_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(285, 155);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(73, 20);
            this.textBox1.TabIndex = 36;
            this.textBox1.Visible = false;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(285, 129);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(73, 20);
            this.textBox2.TabIndex = 36;
            this.textBox2.Visible = false;
            // 
            // btn_cerrar
            // 
            this.btn_cerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_cerrar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_cerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_cerrar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_cerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btn_cerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_cerrar.Location = new System.Drawing.Point(258, 571);
            this.btn_cerrar.Name = "btn_cerrar";
            this.btn_cerrar.Size = new System.Drawing.Size(120, 45);
            this.btn_cerrar.TabIndex = 37;
            this.btn_cerrar.Text = "Cerrar";
            this.btn_cerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_cerrar.UseVisualStyleBackColor = false;
            this.btn_cerrar.Click += new System.EventHandler(this.btn_cerrar_Click);
            // 
            // btn_exportar
            // 
            this.btn_exportar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_exportar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_exportar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_exportar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_exportar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Exportar;
            this.btn_exportar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_exportar.Location = new System.Drawing.Point(17, 571);
            this.btn_exportar.Name = "btn_exportar";
            this.btn_exportar.Size = new System.Drawing.Size(120, 45);
            this.btn_exportar.TabIndex = 37;
            this.btn_exportar.Text = "Exportar";
            this.btn_exportar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_exportar.UseVisualStyleBackColor = false;
            this.btn_exportar.Click += new System.EventHandler(this.btn_exportar_Click);
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // Abanderado
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(393, 622);
            this.Controls.Add(this.btn_exportar);
            this.Controls.Add(this.btn_cerrar);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.btn_buscar);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dgv_escuelas);
            this.Controls.Add(this.dgv_ciudad);
            this.Controls.Add(this.dgv_nacion);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.cmb_trimestre);
            this.Controls.Add(this.cmb_turno);
            this.Name = "Abanderado";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Abanderados";
            ((System.ComponentModel.ISupportInitialize)(this.dgv_nacion)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_ciudad)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_escuelas)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        public System.Windows.Forms.ComboBox cmb_turno;
        public System.Windows.Forms.Label label3;
        public System.Windows.Forms.ComboBox cmb_trimestre;
        public System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dgv_nacion;
        private System.Windows.Forms.DataGridView dgv_ciudad;
        private System.Windows.Forms.DataGridView dgv_escuelas;
        public System.Windows.Forms.Label label2;
        public System.Windows.Forms.Label label4;
        public System.Windows.Forms.Label label5;
        public System.Windows.Forms.Button btn_buscar;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox2;
        public System.Windows.Forms.Button btn_cerrar;
        public System.Windows.Forms.Button btn_exportar;
        private System.Windows.Forms.ErrorProvider Error;
    }
}