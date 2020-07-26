namespace Log_in_con_Store_Procedure
{
    partial class Reportes
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Reportes));
            this.lblCurso = new System.Windows.Forms.Label();
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.lblMes = new System.Windows.Forms.Label();
            this.txtMes = new System.Windows.Forms.TextBox();
            this.txtCiclo = new System.Windows.Forms.TextBox();
            this.lblCiclo = new System.Windows.Forms.Label();
            this.dgvListado = new System.Windows.Forms.DataGridView();
            this.lblListado = new System.Windows.Forms.Label();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnReinc = new System.Windows.Forms.Button();
            this.txtAsis1 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtAsis2 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.cmbCiclo = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvListado)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // lblCurso
            // 
            this.lblCurso.AutoSize = true;
            this.lblCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCurso.Location = new System.Drawing.Point(37, 20);
            this.lblCurso.Name = "lblCurso";
            this.lblCurso.Size = new System.Drawing.Size(127, 19);
            this.lblCurso.TabIndex = 4;
            this.lblCurso.Text = "Buscar por curso:";
            this.lblCurso.Visible = false;
            // 
            // cmbCurso
            // 
            this.cmbCurso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCurso.Cursor = System.Windows.Forms.Cursors.Default;
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbCurso.FormattingEnabled = true;
            this.cmbCurso.Items.AddRange(new object[] {
            "01",
            "02",
            "03",
            "04",
            "05",
            "06",
            "07",
            "08",
            "09",
            "10",
            "11",
            "12"});
            this.cmbCurso.Location = new System.Drawing.Point(176, 18);
            this.cmbCurso.Name = "cmbCurso";
            this.cmbCurso.Size = new System.Drawing.Size(100, 27);
            this.cmbCurso.TabIndex = 1;
            // 
            // lblMes
            // 
            this.lblMes.AutoSize = true;
            this.lblMes.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblMes.Location = new System.Drawing.Point(125, 21);
            this.lblMes.Name = "lblMes";
            this.lblMes.Size = new System.Drawing.Size(39, 19);
            this.lblMes.TabIndex = 5;
            this.lblMes.Text = "Mes:";
            // 
            // txtMes
            // 
            this.txtMes.BackColor = System.Drawing.Color.PowderBlue;
            this.txtMes.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtMes.Enabled = false;
            this.txtMes.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtMes.Location = new System.Drawing.Point(339, 198);
            this.txtMes.Name = "txtMes";
            this.txtMes.Size = new System.Drawing.Size(100, 27);
            this.txtMes.TabIndex = 2;
            this.txtMes.Visible = false;
            // 
            // txtCiclo
            // 
            this.txtCiclo.BackColor = System.Drawing.Color.PowderBlue;
            this.txtCiclo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtCiclo.Enabled = false;
            this.txtCiclo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtCiclo.Location = new System.Drawing.Point(176, 53);
            this.txtCiclo.MaxLength = 4;
            this.txtCiclo.Name = "txtCiclo";
            this.txtCiclo.Size = new System.Drawing.Size(100, 27);
            this.txtCiclo.TabIndex = 3;
            this.txtCiclo.Visible = false;
            this.txtCiclo.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtCiclo_KeyPress);
            // 
            // lblCiclo
            // 
            this.lblCiclo.AutoSize = true;
            this.lblCiclo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCiclo.Location = new System.Drawing.Point(116, 54);
            this.lblCiclo.Name = "lblCiclo";
            this.lblCiclo.Size = new System.Drawing.Size(48, 19);
            this.lblCiclo.TabIndex = 7;
            this.lblCiclo.Text = "Ciclo:";
            // 
            // dgvListado
            // 
            this.dgvListado.AllowUserToAddRows = false;
            this.dgvListado.AllowUserToDeleteRows = false;
            this.dgvListado.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgvListado.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvListado.Location = new System.Drawing.Point(12, 259);
            this.dgvListado.Name = "dgvListado";
            this.dgvListado.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvListado.Size = new System.Drawing.Size(435, 157);
            this.dgvListado.TabIndex = 9;
            // 
            // lblListado
            // 
            this.lblListado.AutoSize = true;
            this.lblListado.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblListado.Location = new System.Drawing.Point(12, 237);
            this.lblListado.Name = "lblListado";
            this.lblListado.Size = new System.Drawing.Size(133, 19);
            this.lblListado.TabIndex = 10;
            this.lblListado.Text = "Lista de Alumnos:";
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(322, 422);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 8;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // btnBuscar
            // 
            this.btnBuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBuscar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnBuscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btnBuscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBuscar.Location = new System.Drawing.Point(151, 180);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(125, 45);
            this.btnBuscar.TabIndex = 6;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBuscar.UseVisualStyleBackColor = false;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(339, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 15;
            this.pictureBox1.TabStop = false;
            // 
            // btnReinc
            // 
            this.btnReinc.BackColor = System.Drawing.Color.PowderBlue;
            this.btnReinc.Enabled = false;
            this.btnReinc.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnReinc.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnReinc.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Exportar;
            this.btnReinc.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnReinc.Location = new System.Drawing.Point(12, 422);
            this.btnReinc.Name = "btnReinc";
            this.btnReinc.Size = new System.Drawing.Size(125, 45);
            this.btnReinc.TabIndex = 7;
            this.btnReinc.Text = "Exportar";
            this.btnReinc.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnReinc.UseVisualStyleBackColor = false;
            this.btnReinc.Click += new System.EventHandler(this.btnReinc_Click);
            // 
            // txtAsis1
            // 
            this.txtAsis1.BackColor = System.Drawing.Color.PowderBlue;
            this.txtAsis1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtAsis1.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtAsis1.Location = new System.Drawing.Point(176, 95);
            this.txtAsis1.MaxLength = 5;
            this.txtAsis1.Name = "txtAsis1";
            this.txtAsis1.Size = new System.Drawing.Size(100, 27);
            this.txtAsis1.TabIndex = 4;
            this.txtAsis1.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtAsis1_KeyPress);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label1.Location = new System.Drawing.Point(12, 97);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(152, 19);
            this.label1.TabIndex = 17;
            this.label1.Text = "Inasistencia mínima:";
            // 
            // txtAsis2
            // 
            this.txtAsis2.BackColor = System.Drawing.Color.PowderBlue;
            this.txtAsis2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtAsis2.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtAsis2.Location = new System.Drawing.Point(176, 133);
            this.txtAsis2.MaxLength = 5;
            this.txtAsis2.Name = "txtAsis2";
            this.txtAsis2.Size = new System.Drawing.Size(100, 27);
            this.txtAsis2.TabIndex = 5;
            this.txtAsis2.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtAsis2_KeyPress);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label2.Location = new System.Drawing.Point(9, 135);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(155, 19);
            this.label2.TabIndex = 19;
            this.label2.Text = "Inasistencia máxima:";
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // cmbCiclo
            // 
            this.cmbCiclo.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCiclo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCiclo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbCiclo.FormattingEnabled = true;
            this.cmbCiclo.Location = new System.Drawing.Point(176, 52);
            this.cmbCiclo.Name = "cmbCiclo";
            this.cmbCiclo.Size = new System.Drawing.Size(100, 27);
            this.cmbCiclo.TabIndex = 20;
            // 
            // Reportes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(459, 479);
            this.ControlBox = false;
            this.Controls.Add(this.cmbCiclo);
            this.Controls.Add(this.txtAsis2);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtAsis1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnReinc);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.lblListado);
            this.Controls.Add(this.dgvListado);
            this.Controls.Add(this.txtCiclo);
            this.Controls.Add(this.lblCiclo);
            this.Controls.Add(this.txtMes);
            this.Controls.Add(this.lblMes);
            this.Controls.Add(this.lblCurso);
            this.Controls.Add(this.cmbCurso);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Reportes";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Informe de alumnos con rango de inasistencias";
            this.Load += new System.EventHandler(this.Reportes_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvListado)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblCurso;
        private System.Windows.Forms.Label lblMes;
        private System.Windows.Forms.Label lblCiclo;
        private System.Windows.Forms.DataGridView dgvListado;
        private System.Windows.Forms.Label lblListado;
        public System.Windows.Forms.ComboBox cmbCurso;
        public System.Windows.Forms.TextBox txtMes;
        public System.Windows.Forms.TextBox txtCiclo;
        public System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.Button btnCerrar;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button btnReinc;
        public System.Windows.Forms.TextBox txtAsis1;
        private System.Windows.Forms.Label label1;
        public System.Windows.Forms.TextBox txtAsis2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ErrorProvider Error;
        public System.Windows.Forms.ComboBox cmbCiclo;
    }
}