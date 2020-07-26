namespace Log_in_con_Store_Procedure
{
    partial class RetirosAnticipados
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
            this.btnRegistro = new System.Windows.Forms.Button();
            this.lblListado = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txtHora = new System.Windows.Forms.TextBox();
            this.dtpFecha = new System.Windows.Forms.DateTimePicker();
            this.lblFecha = new System.Windows.Forms.Label();
            this.lblCiclo = new System.Windows.Forms.Label();
            this.txtCiclo = new System.Windows.Forms.TextBox();
            this.lblCurso = new System.Windows.Forms.Label();
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnCerrar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // btnRegistro
            // 
            this.btnRegistro.BackColor = System.Drawing.Color.PowderBlue;
            this.btnRegistro.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnRegistro.Font = new System.Drawing.Font("MV Boli", 13F);
            this.btnRegistro.Location = new System.Drawing.Point(628, 284);
            this.btnRegistro.Name = "btnRegistro";
            this.btnRegistro.Size = new System.Drawing.Size(108, 55);
            this.btnRegistro.TabIndex = 38;
            this.btnRegistro.Text = "Registrar Retiro";
            this.btnRegistro.UseVisualStyleBackColor = false;
            this.btnRegistro.Click += new System.EventHandler(this.btnRegistro_Click);
            // 
            // lblListado
            // 
            this.lblListado.AutoSize = true;
            this.lblListado.Font = new System.Drawing.Font("MV Boli", 10F);
            this.lblListado.Location = new System.Drawing.Point(10, 146);
            this.lblListado.Name = "lblListado";
            this.lblListado.Size = new System.Drawing.Size(60, 18);
            this.lblListado.TabIndex = 36;
            this.lblListado.Text = "Listado:";
            // 
            // dataGridView1
            // 
            this.dataGridView1.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(13, 167);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(577, 453);
            this.dataGridView1.TabIndex = 35;
            // 
            // btnBuscar
            // 
            this.btnBuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBuscar.Font = new System.Drawing.Font("MV Boli", 13F);
            this.btnBuscar.Location = new System.Drawing.Point(425, 73);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(105, 55);
            this.btnBuscar.TabIndex = 34;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.UseVisualStyleBackColor = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("MV Boli", 10F);
            this.label2.Location = new System.Drawing.Point(346, 26);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(91, 18);
            this.label2.TabIndex = 33;
            this.label2.Text = "Hora Retiro:";
            // 
            // txtHora
            // 
            this.txtHora.BackColor = System.Drawing.Color.PowderBlue;
            this.txtHora.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtHora.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtHora.Location = new System.Drawing.Point(443, 25);
            this.txtHora.Name = "txtHora";
            this.txtHora.Size = new System.Drawing.Size(87, 23);
            this.txtHora.TabIndex = 32;
            // 
            // dtpFecha
            // 
            this.dtpFecha.Location = new System.Drawing.Point(153, 108);
            this.dtpFecha.Name = "dtpFecha";
            this.dtpFecha.Size = new System.Drawing.Size(200, 20);
            this.dtpFecha.TabIndex = 31;
            // 
            // lblFecha
            // 
            this.lblFecha.AutoSize = true;
            this.lblFecha.Font = new System.Drawing.Font("MV Boli", 10F);
            this.lblFecha.Location = new System.Drawing.Point(98, 108);
            this.lblFecha.Name = "lblFecha";
            this.lblFecha.Size = new System.Drawing.Size(49, 18);
            this.lblFecha.TabIndex = 29;
            this.lblFecha.Text = "Fecha:";
            // 
            // lblCiclo
            // 
            this.lblCiclo.AutoSize = true;
            this.lblCiclo.Font = new System.Drawing.Font("MV Boli", 10F);
            this.lblCiclo.Location = new System.Drawing.Point(56, 70);
            this.lblCiclo.Name = "lblCiclo";
            this.lblCiclo.Size = new System.Drawing.Size(95, 18);
            this.lblCiclo.TabIndex = 30;
            this.lblCiclo.Text = "Ciclo Lectivo:";
            // 
            // txtCiclo
            // 
            this.txtCiclo.BackColor = System.Drawing.Color.PowderBlue;
            this.txtCiclo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtCiclo.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtCiclo.Location = new System.Drawing.Point(153, 67);
            this.txtCiclo.Name = "txtCiclo";
            this.txtCiclo.Size = new System.Drawing.Size(150, 23);
            this.txtCiclo.TabIndex = 27;
            // 
            // lblCurso
            // 
            this.lblCurso.AutoSize = true;
            this.lblCurso.Font = new System.Drawing.Font("MV Boli", 10F);
            this.lblCurso.Location = new System.Drawing.Point(27, 26);
            this.lblCurso.Name = "lblCurso";
            this.lblCurso.Size = new System.Drawing.Size(122, 18);
            this.lblCurso.TabIndex = 28;
            this.lblCurso.Text = "Buscar por curso:";
            // 
            // cmbCurso
            // 
            this.cmbCurso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCurso.Cursor = System.Windows.Forms.Cursors.Default;
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Font = new System.Drawing.Font("MV Boli", 10F);
            this.cmbCurso.FormattingEnabled = true;
            this.cmbCurso.Location = new System.Drawing.Point(153, 23);
            this.cmbCurso.Name = "cmbCurso";
            this.cmbCurso.Size = new System.Drawing.Size(150, 25);
            this.cmbCurso.TabIndex = 26;
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(628, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 37;
            this.pictureBox1.TabStop = false;
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Location = new System.Drawing.Point(660, 597);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(75, 23);
            this.btnCerrar.TabIndex = 39;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.btnCerrar_Click);
            // 
            // RetirosAnticipados
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(747, 632);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.btnRegistro);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.lblListado);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtHora);
            this.Controls.Add(this.dtpFecha);
            this.Controls.Add(this.lblFecha);
            this.Controls.Add(this.lblCiclo);
            this.Controls.Add(this.txtCiclo);
            this.Controls.Add(this.lblCurso);
            this.Controls.Add(this.cmbCurso);
            this.Name = "RetirosAnticipados";
            this.Text = "RetirosAnticipados";
            this.Load += new System.EventHandler(this.RetirosAnticipados_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnRegistro;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lblListado;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btnBuscar;
        public System.Windows.Forms.Label label2;
        public System.Windows.Forms.TextBox txtHora;
        public System.Windows.Forms.DateTimePicker dtpFecha;
        public System.Windows.Forms.Label lblFecha;
        public System.Windows.Forms.Label lblCiclo;
        public System.Windows.Forms.TextBox txtCiclo;
        public System.Windows.Forms.Label lblCurso;
        public System.Windows.Forms.ComboBox cmbCurso;
        private System.Windows.Forms.Button btnCerrar;
    }
}