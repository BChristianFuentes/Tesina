namespace Log_in_con_Store_Procedure
{
    partial class TomarAsistencia
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(TomarAsistencia));
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.lblCurso = new System.Windows.Forms.Label();
            this.dtgListado = new System.Windows.Forms.DataGridView();
            this.lblAsis = new System.Windows.Forms.Label();
            this.cmbAsis = new System.Windows.Forms.ComboBox();
            this.btnAsig = new System.Windows.Forms.Button();
            this.lblListado = new System.Windows.Forms.Label();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.label1 = new System.Windows.Forms.Label();
            this.cmbSubMot = new System.Windows.Forms.ComboBox();
            this.dtpFecha = new System.Windows.Forms.DateTimePicker();
            this.lblFecha = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.atxtHora = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtObser = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtJust = new System.Windows.Forms.TextBox();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.txtHora = new System.Windows.Forms.MaskedTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dtgListado)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // cmbCurso
            // 
            this.cmbCurso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCurso.Cursor = System.Windows.Forms.Cursors.Default;
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbCurso.FormattingEnabled = true;
            this.cmbCurso.Location = new System.Drawing.Point(168, 12);
            this.cmbCurso.Name = "cmbCurso";
            this.cmbCurso.Size = new System.Drawing.Size(150, 27);
            this.cmbCurso.TabIndex = 1;
            this.cmbCurso.SelectedIndexChanged += new System.EventHandler(this.cmbCurso_SelectedIndexChanged);
            // 
            // btnBuscar
            // 
            this.btnBuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBuscar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnBuscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btnBuscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBuscar.Location = new System.Drawing.Point(484, 97);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(125, 45);
            this.btnBuscar.TabIndex = 3;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBuscar.UseVisualStyleBackColor = false;
            this.btnBuscar.Click += new System.EventHandler(this.button1_Click);
            // 
            // lblCurso
            // 
            this.lblCurso.AutoSize = true;
            this.lblCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCurso.Location = new System.Drawing.Point(29, 13);
            this.lblCurso.Name = "lblCurso";
            this.lblCurso.Size = new System.Drawing.Size(127, 19);
            this.lblCurso.TabIndex = 2;
            this.lblCurso.Text = "Buscar por curso:";
            // 
            // dtgListado
            // 
            this.dtgListado.AllowUserToAddRows = false;
            this.dtgListado.AllowUserToDeleteRows = false;
            this.dtgListado.AllowUserToResizeColumns = false;
            this.dtgListado.AllowUserToResizeRows = false;
            this.dtgListado.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
            this.dtgListado.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dtgListado.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dtgListado.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgListado.Location = new System.Drawing.Point(12, 167);
            this.dtgListado.MultiSelect = false;
            this.dtgListado.Name = "dtgListado";
            this.dtgListado.ReadOnly = true;
            this.dtgListado.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgListado.Size = new System.Drawing.Size(500, 453);
            this.dtgListado.StandardTab = true;
            this.dtgListado.TabIndex = 3;
            // 
            // lblAsis
            // 
            this.lblAsis.AutoSize = true;
            this.lblAsis.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblAsis.Location = new System.Drawing.Point(524, 172);
            this.lblAsis.Name = "lblAsis";
            this.lblAsis.Size = new System.Drawing.Size(140, 19);
            this.lblAsis.TabIndex = 4;
            this.lblAsis.Text = "Asignar Asistencia:";
            // 
            // cmbAsis
            // 
            this.cmbAsis.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbAsis.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbAsis.Enabled = false;
            this.cmbAsis.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbAsis.FormattingEnabled = true;
            this.cmbAsis.Location = new System.Drawing.Point(545, 195);
            this.cmbAsis.Name = "cmbAsis";
            this.cmbAsis.Size = new System.Drawing.Size(150, 27);
            this.cmbAsis.TabIndex = 4;
            this.cmbAsis.SelectedIndexChanged += new System.EventHandler(this.cmbAsis_SelectedIndexChanged);
            // 
            // btnAsig
            // 
            this.btnAsig.BackColor = System.Drawing.Color.PowderBlue;
            this.btnAsig.Enabled = false;
            this.btnAsig.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnAsig.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnAsig.Image = global::Log_in_con_Store_Procedure.Properties.Resources.TomarLista;
            this.btnAsig.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnAsig.Location = new System.Drawing.Point(597, 290);
            this.btnAsig.Name = "btnAsig";
            this.btnAsig.Size = new System.Drawing.Size(125, 45);
            this.btnAsig.TabIndex = 5;
            this.btnAsig.Text = "Asignar";
            this.btnAsig.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnAsig.UseVisualStyleBackColor = false;
            this.btnAsig.Click += new System.EventHandler(this.button2_Click);
            // 
            // lblListado
            // 
            this.lblListado.AutoSize = true;
            this.lblListado.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblListado.Location = new System.Drawing.Point(15, 145);
            this.lblListado.Name = "lblListado";
            this.lblListado.Size = new System.Drawing.Size(65, 19);
            this.lblListado.TabIndex = 9;
            this.lblListado.Text = "Listado:";
            this.lblListado.Click += new System.EventHandler(this.lblListado_Click);
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label1.Location = new System.Drawing.Point(16, 97);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(138, 19);
            this.label1.TabIndex = 4;
            this.label1.Text = "Asignar Actividad:";
            // 
            // cmbSubMot
            // 
            this.cmbSubMot.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbSubMot.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSubMot.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbSubMot.FormattingEnabled = true;
            this.cmbSubMot.Location = new System.Drawing.Point(168, 96);
            this.cmbSubMot.Name = "cmbSubMot";
            this.cmbSubMot.Size = new System.Drawing.Size(150, 27);
            this.cmbSubMot.TabIndex = 4;
            this.cmbSubMot.SelectedIndexChanged += new System.EventHandler(this.cmbSubMot_SelectedIndexChanged);
            // 
            // dtpFecha
            // 
            this.dtpFecha.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.dtpFecha.Location = new System.Drawing.Point(168, 58);
            this.dtpFecha.Name = "dtpFecha";
            this.dtpFecha.Size = new System.Drawing.Size(200, 27);
            this.dtpFecha.TabIndex = 12;
            // 
            // lblFecha
            // 
            this.lblFecha.AutoSize = true;
            this.lblFecha.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblFecha.Location = new System.Drawing.Point(104, 58);
            this.lblFecha.Name = "lblFecha";
            this.lblFecha.Size = new System.Drawing.Size(54, 19);
            this.lblFecha.TabIndex = 8;
            this.lblFecha.Text = "Fecha:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label2.Location = new System.Drawing.Point(524, 228);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(123, 19);
            this.label2.TabIndex = 14;
            this.label2.Text = "Hora de Ingreso:";
            // 
            // atxtHora
            // 
            this.atxtHora.BackColor = System.Drawing.Color.PowderBlue;
            this.atxtHora.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.atxtHora.Enabled = false;
            this.atxtHora.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.atxtHora.Location = new System.Drawing.Point(545, 341);
            this.atxtHora.Name = "atxtHora";
            this.atxtHora.Size = new System.Drawing.Size(150, 23);
            this.atxtHora.TabIndex = 13;
            this.atxtHora.Visible = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label3.Location = new System.Drawing.Point(536, 367);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(111, 19);
            this.label3.TabIndex = 16;
            this.label3.Text = "Observaciones:";
            // 
            // txtObser
            // 
            this.txtObser.BackColor = System.Drawing.Color.PowderBlue;
            this.txtObser.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtObser.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtObser.Location = new System.Drawing.Point(540, 389);
            this.txtObser.Multiline = true;
            this.txtObser.Name = "txtObser";
            this.txtObser.Size = new System.Drawing.Size(194, 90);
            this.txtObser.TabIndex = 15;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Enabled = false;
            this.label4.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label4.Location = new System.Drawing.Point(536, 495);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(115, 19);
            this.label4.TabIndex = 18;
            this.label4.Text = "Justificaciones:";
            this.label4.Visible = false;
            // 
            // txtJust
            // 
            this.txtJust.BackColor = System.Drawing.Color.PowderBlue;
            this.txtJust.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtJust.Enabled = false;
            this.txtJust.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtJust.Location = new System.Drawing.Point(540, 517);
            this.txtJust.Multiline = true;
            this.txtJust.Name = "txtJust";
            this.txtJust.Size = new System.Drawing.Size(194, 64);
            this.txtJust.TabIndex = 17;
            this.txtJust.Visible = false;
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(610, 626);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 19;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.button1_Click_2);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(627, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 11;
            this.pictureBox1.TabStop = false;
            // 
            // txtHora
            // 
            this.txtHora.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtHora.BackColor = System.Drawing.Color.PowderBlue;
            this.txtHora.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtHora.Enabled = false;
            this.txtHora.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtHora.Location = new System.Drawing.Point(545, 250);
            this.txtHora.Mask = "00:00";
            this.txtHora.Name = "txtHora";
            this.txtHora.Size = new System.Drawing.Size(100, 27);
            this.txtHora.TabIndex = 32;
            this.txtHora.ValidatingType = typeof(System.DateTime);
            // 
            // TomarAsistencia
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(747, 683);
            this.ControlBox = false;
            this.Controls.Add(this.txtHora);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtJust);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtObser);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.atxtHora);
            this.Controls.Add(this.dtpFecha);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.lblListado);
            this.Controls.Add(this.lblFecha);
            this.Controls.Add(this.btnAsig);
            this.Controls.Add(this.cmbSubMot);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmbAsis);
            this.Controls.Add(this.lblAsis);
            this.Controls.Add(this.dtgListado);
            this.Controls.Add(this.lblCurso);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.cmbCurso);
            this.ForeColor = System.Drawing.SystemColors.ControlText;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "TomarAsistencia";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Tomar Asistencia";
            this.Load += new System.EventHandler(this.TomarAsistencia_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.TomarAsistencia_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.dtgListado)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.Label lblCurso;
        private System.Windows.Forms.DataGridView dtgListado;
        private System.Windows.Forms.Label lblAsis;
        private System.Windows.Forms.Button btnAsig;
        private System.Windows.Forms.Label lblListado;
        private System.Windows.Forms.ErrorProvider Error;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker dtpFecha;
        private System.Windows.Forms.Label lblFecha;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtJust;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtObser;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox atxtHora;
        private System.Windows.Forms.Button btnCerrar;
        public System.Windows.Forms.ComboBox cmbCurso;
        public System.Windows.Forms.ComboBox cmbAsis;
        public System.Windows.Forms.ComboBox cmbSubMot;
        private System.Windows.Forms.MaskedTextBox txtHora;
    }
}