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
            this.components = new System.ComponentModel.Container();
            this.btnRegistro = new System.Windows.Forms.Button();
            this.lblListado = new System.Windows.Forms.Label();
            this.dtgListado = new System.Windows.Forms.DataGridView();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txatHora = new System.Windows.Forms.TextBox();
            this.dtpFecha = new System.Windows.Forms.DateTimePicker();
            this.lblFecha = new System.Windows.Forms.Label();
            this.lblCurso = new System.Windows.Forms.Label();
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.lblConp = new System.Windows.Forms.Label();
            this.cmbConput = new System.Windows.Forms.ComboBox();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.txtHora = new System.Windows.Forms.MaskedTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dtgListado)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // btnRegistro
            // 
            this.btnRegistro.BackColor = System.Drawing.Color.PowderBlue;
            this.btnRegistro.Enabled = false;
            this.btnRegistro.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnRegistro.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnRegistro.Image = global::Log_in_con_Store_Procedure.Properties.Resources.TomarLista;
            this.btnRegistro.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnRegistro.Location = new System.Drawing.Point(610, 305);
            this.btnRegistro.Name = "btnRegistro";
            this.btnRegistro.Size = new System.Drawing.Size(125, 55);
            this.btnRegistro.TabIndex = 38;
            this.btnRegistro.Text = "Registrar Retiro";
            this.btnRegistro.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnRegistro.UseVisualStyleBackColor = false;
            this.btnRegistro.Click += new System.EventHandler(this.btnRegistro_Click);
            // 
            // lblListado
            // 
            this.lblListado.AutoSize = true;
            this.lblListado.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblListado.Location = new System.Drawing.Point(10, 146);
            this.lblListado.Name = "lblListado";
            this.lblListado.Size = new System.Drawing.Size(65, 19);
            this.lblListado.TabIndex = 36;
            this.lblListado.Text = "Listado:";
            // 
            // dtgListado
            // 
            this.dtgListado.AllowUserToAddRows = false;
            this.dtgListado.AllowUserToDeleteRows = false;
            this.dtgListado.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dtgListado.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgListado.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dtgListado.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dtgListado.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgListado.Location = new System.Drawing.Point(13, 167);
            this.dtgListado.MultiSelect = false;
            this.dtgListado.Name = "dtgListado";
            this.dtgListado.ReadOnly = true;
            this.dtgListado.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgListado.Size = new System.Drawing.Size(577, 453);
            this.dtgListado.TabIndex = 35;
            this.dtgListado.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // btnBuscar
            // 
            this.btnBuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBuscar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnBuscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btnBuscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBuscar.Location = new System.Drawing.Point(465, 68);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(125, 45);
            this.btnBuscar.TabIndex = 34;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBuscar.UseVisualStyleBackColor = false;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label2.Location = new System.Drawing.Point(606, 224);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(96, 19);
            this.label2.TabIndex = 33;
            this.label2.Text = "Hora Retiro:";
            // 
            // txatHora
            // 
            this.txatHora.BackColor = System.Drawing.Color.PowderBlue;
            this.txatHora.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txatHora.Enabled = false;
            this.txatHora.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txatHora.Location = new System.Drawing.Point(535, 26);
            this.txatHora.MaxLength = 5;
            this.txatHora.Name = "txatHora";
            this.txatHora.Size = new System.Drawing.Size(87, 27);
            this.txatHora.TabIndex = 32;
            this.txatHora.Visible = false;
            this.txatHora.TextChanged += new System.EventHandler(this.txatHora_TextChanged);
            // 
            // dtpFecha
            // 
            this.dtpFecha.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.dtpFecha.Location = new System.Drawing.Point(160, 68);
            this.dtpFecha.Name = "dtpFecha";
            this.dtpFecha.Size = new System.Drawing.Size(196, 27);
            this.dtpFecha.TabIndex = 31;
            // 
            // lblFecha
            // 
            this.lblFecha.AutoSize = true;
            this.lblFecha.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblFecha.Location = new System.Drawing.Point(100, 68);
            this.lblFecha.Name = "lblFecha";
            this.lblFecha.Size = new System.Drawing.Size(54, 19);
            this.lblFecha.TabIndex = 29;
            this.lblFecha.Text = "Fecha:";
            // 
            // lblCurso
            // 
            this.lblCurso.AutoSize = true;
            this.lblCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCurso.Location = new System.Drawing.Point(27, 26);
            this.lblCurso.Name = "lblCurso";
            this.lblCurso.Size = new System.Drawing.Size(127, 19);
            this.lblCurso.TabIndex = 28;
            this.lblCurso.Text = "Buscar por curso:";
            // 
            // cmbCurso
            // 
            this.cmbCurso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCurso.Cursor = System.Windows.Forms.Cursors.Default;
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbCurso.FormattingEnabled = true;
            this.cmbCurso.Location = new System.Drawing.Point(160, 20);
            this.cmbCurso.Name = "cmbCurso";
            this.cmbCurso.Size = new System.Drawing.Size(150, 27);
            this.cmbCurso.TabIndex = 26;
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(610, 632);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 39;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.button1_Click);
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
            // lblConp
            // 
            this.lblConp.AutoSize = true;
            this.lblConp.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblConp.Location = new System.Drawing.Point(41, 111);
            this.lblConp.Name = "lblConp";
            this.lblConp.Size = new System.Drawing.Size(113, 19);
            this.lblConp.TabIndex = 41;
            this.lblConp.Text = "Tipo de Retiro:";
            // 
            // cmbConput
            // 
            this.cmbConput.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbConput.Cursor = System.Windows.Forms.Cursors.Default;
            this.cmbConput.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbConput.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbConput.FormattingEnabled = true;
            this.cmbConput.Location = new System.Drawing.Point(160, 108);
            this.cmbConput.Name = "cmbConput";
            this.cmbConput.Size = new System.Drawing.Size(196, 27);
            this.cmbConput.TabIndex = 40;
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // txtHora
            // 
            this.txtHora.BackColor = System.Drawing.Color.PowderBlue;
            this.txtHora.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtHora.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtHora.Location = new System.Drawing.Point(615, 246);
            this.txtHora.Mask = "00:00";
            this.txtHora.Name = "txtHora";
            this.txtHora.Size = new System.Drawing.Size(87, 27);
            this.txtHora.TabIndex = 42;
            this.txtHora.ValidatingType = typeof(System.DateTime);
            this.txtHora.MaskInputRejected += new System.Windows.Forms.MaskInputRejectedEventHandler(this.txtHora_MaskInputRejected);
            this.txtHora.TextChanged += new System.EventHandler(this.txtHora_TextChanged);
            // 
            // RetirosAnticipados
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(747, 689);
            this.ControlBox = false;
            this.Controls.Add(this.txtHora);
            this.Controls.Add(this.lblConp);
            this.Controls.Add(this.cmbConput);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.btnRegistro);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.lblListado);
            this.Controls.Add(this.dtgListado);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txatHora);
            this.Controls.Add(this.dtpFecha);
            this.Controls.Add(this.lblFecha);
            this.Controls.Add(this.lblCurso);
            this.Controls.Add(this.cmbCurso);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "RetirosAnticipados";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Retiros Anticipados";
            this.Load += new System.EventHandler(this.RetirosAnticipados_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtgListado)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnRegistro;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lblListado;
        private System.Windows.Forms.Button btnBuscar;
        public System.Windows.Forms.Label label2;
        public System.Windows.Forms.TextBox txatHora;
        public System.Windows.Forms.DateTimePicker dtpFecha;
        public System.Windows.Forms.Label lblFecha;
        public System.Windows.Forms.Label lblCurso;
        public System.Windows.Forms.ComboBox cmbCurso;
        private System.Windows.Forms.Button btnCerrar;
        public System.Windows.Forms.Label lblConp;
        public System.Windows.Forms.ComboBox cmbConput;
        public System.Windows.Forms.DataGridView dtgListado;
        private System.Windows.Forms.ErrorProvider Error;
        private System.Windows.Forms.MaskedTextBox txtHora;
    }
}