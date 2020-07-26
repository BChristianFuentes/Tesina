namespace Log_in_con_Store_Procedure
{
    partial class AlumnosLibresAlu
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
            this.txtape = new System.Windows.Forms.TextBox();
            this.txtnom = new System.Windows.Forms.TextBox();
            this.txtId = new System.Windows.Forms.TextBox();
            this.dgvExport = new System.Windows.Forms.DataGridView();
            this.lblId = new System.Windows.Forms.Label();
            this.txtCiclo = new System.Windows.Forms.TextBox();
            this.lblApe = new System.Windows.Forms.Label();
            this.lblhecho = new System.Windows.Forms.Label();
            this.lblpendiente = new System.Windows.Forms.Label();
            this.dgvHecha = new System.Windows.Forms.DataGridView();
            this.dgvPendiente = new System.Windows.Forms.DataGridView();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.btnReinc = new System.Windows.Forms.Button();
            this.btnFirmado = new System.Windows.Forms.Button();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.cmbCiclo = new System.Windows.Forms.ComboBox();
            this.lblCiclo = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvExport)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvHecha)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPendiente)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // txtape
            // 
            this.txtape.BackColor = System.Drawing.Color.PowderBlue;
            this.txtape.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtape.Enabled = false;
            this.txtape.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtape.Location = new System.Drawing.Point(371, 46);
            this.txtape.MaxLength = 30;
            this.txtape.Multiline = true;
            this.txtape.Name = "txtape";
            this.txtape.Size = new System.Drawing.Size(161, 25);
            this.txtape.TabIndex = 47;
            // 
            // txtnom
            // 
            this.txtnom.BackColor = System.Drawing.Color.PowderBlue;
            this.txtnom.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtnom.Enabled = false;
            this.txtnom.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtnom.Location = new System.Drawing.Point(108, 46);
            this.txtnom.MaxLength = 30;
            this.txtnom.Multiline = true;
            this.txtnom.Name = "txtnom";
            this.txtnom.Size = new System.Drawing.Size(161, 25);
            this.txtnom.TabIndex = 46;
            // 
            // txtId
            // 
            this.txtId.BackColor = System.Drawing.Color.PowderBlue;
            this.txtId.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtId.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtId.Location = new System.Drawing.Point(134, 77);
            this.txtId.Multiline = true;
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(100, 25);
            this.txtId.TabIndex = 45;
            this.txtId.Visible = false;
            // 
            // dgvExport
            // 
            this.dgvExport.AllowUserToAddRows = false;
            this.dgvExport.AllowUserToDeleteRows = false;
            this.dgvExport.AllowUserToOrderColumns = true;
            this.dgvExport.AllowUserToResizeColumns = false;
            this.dgvExport.AllowUserToResizeRows = false;
            this.dgvExport.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
            this.dgvExport.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dgvExport.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgvExport.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvExport.Location = new System.Drawing.Point(725, 12);
            this.dgvExport.MultiSelect = false;
            this.dgvExport.Name = "dgvExport";
            this.dgvExport.ReadOnly = true;
            this.dgvExport.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvExport.Size = new System.Drawing.Size(150, 131);
            this.dgvExport.StandardTab = true;
            this.dgvExport.TabIndex = 44;
            this.dgvExport.Visible = false;
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblId.Location = new System.Drawing.Point(36, 48);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(68, 19);
            this.lblId.TabIndex = 43;
            this.lblId.Text = "Nombre:";
            // 
            // txtCiclo
            // 
            this.txtCiclo.BackColor = System.Drawing.Color.PowderBlue;
            this.txtCiclo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtCiclo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtCiclo.Location = new System.Drawing.Point(378, 77);
            this.txtCiclo.Multiline = true;
            this.txtCiclo.Name = "txtCiclo";
            this.txtCiclo.Size = new System.Drawing.Size(100, 25);
            this.txtCiclo.TabIndex = 42;
            this.txtCiclo.Visible = false;
            // 
            // lblApe
            // 
            this.lblApe.AutoSize = true;
            this.lblApe.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblApe.Location = new System.Drawing.Point(293, 48);
            this.lblApe.Name = "lblApe";
            this.lblApe.Size = new System.Drawing.Size(72, 19);
            this.lblApe.TabIndex = 41;
            this.lblApe.Text = "Apellido:";
            // 
            // lblhecho
            // 
            this.lblhecho.AutoSize = true;
            this.lblhecho.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblhecho.Location = new System.Drawing.Point(10, 149);
            this.lblhecho.Name = "lblhecho";
            this.lblhecho.Size = new System.Drawing.Size(220, 19);
            this.lblhecho.TabIndex = 38;
            this.lblhecho.Text = "Reincorporaciones Pendientes:";
            // 
            // lblpendiente
            // 
            this.lblpendiente.AutoSize = true;
            this.lblpendiente.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblpendiente.Location = new System.Drawing.Point(14, 389);
            this.lblpendiente.Name = "lblpendiente";
            this.lblpendiente.Size = new System.Drawing.Size(194, 19);
            this.lblpendiente.TabIndex = 36;
            this.lblpendiente.Text = "Reincorporaciones Hechas:";
            // 
            // dgvHecha
            // 
            this.dgvHecha.AllowUserToAddRows = false;
            this.dgvHecha.AllowUserToDeleteRows = false;
            this.dgvHecha.AllowUserToOrderColumns = true;
            this.dgvHecha.AllowUserToResizeColumns = false;
            this.dgvHecha.AllowUserToResizeRows = false;
            this.dgvHecha.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
            this.dgvHecha.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dgvHecha.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgvHecha.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvHecha.Location = new System.Drawing.Point(14, 420);
            this.dgvHecha.MultiSelect = false;
            this.dgvHecha.Name = "dgvHecha";
            this.dgvHecha.ReadOnly = true;
            this.dgvHecha.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvHecha.Size = new System.Drawing.Size(808, 190);
            this.dgvHecha.StandardTab = true;
            this.dgvHecha.TabIndex = 32;
            // 
            // dgvPendiente
            // 
            this.dgvPendiente.AllowUserToAddRows = false;
            this.dgvPendiente.AllowUserToDeleteRows = false;
            this.dgvPendiente.AllowUserToOrderColumns = true;
            this.dgvPendiente.AllowUserToResizeColumns = false;
            this.dgvPendiente.AllowUserToResizeRows = false;
            this.dgvPendiente.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
            this.dgvPendiente.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dgvPendiente.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgvPendiente.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPendiente.Location = new System.Drawing.Point(14, 180);
            this.dgvPendiente.MultiSelect = false;
            this.dgvPendiente.Name = "dgvPendiente";
            this.dgvPendiente.ReadOnly = true;
            this.dgvPendiente.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvPendiente.Size = new System.Drawing.Size(808, 190);
            this.dgvPendiente.StandardTab = true;
            this.dgvPendiente.TabIndex = 33;
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(847, 565);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 40;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.btnCerrar_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(864, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 39;
            this.pictureBox1.TabStop = false;
            // 
            // btnBuscar
            // 
            this.btnBuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBuscar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnBuscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btnBuscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBuscar.Location = new System.Drawing.Point(592, 46);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(125, 45);
            this.btnBuscar.TabIndex = 37;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBuscar.UseVisualStyleBackColor = false;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click_1);
            // 
            // btnReinc
            // 
            this.btnReinc.BackColor = System.Drawing.Color.PowderBlue;
            this.btnReinc.Enabled = false;
            this.btnReinc.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnReinc.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnReinc.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Exportar;
            this.btnReinc.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnReinc.Location = new System.Drawing.Point(826, 180);
            this.btnReinc.Name = "btnReinc";
            this.btnReinc.Size = new System.Drawing.Size(125, 45);
            this.btnReinc.TabIndex = 34;
            this.btnReinc.Text = "Exportar";
            this.btnReinc.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnReinc.UseVisualStyleBackColor = false;
            this.btnReinc.Click += new System.EventHandler(this.btnReinc_Click_2);
            // 
            // btnFirmado
            // 
            this.btnFirmado.BackColor = System.Drawing.Color.PowderBlue;
            this.btnFirmado.Enabled = false;
            this.btnFirmado.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnFirmado.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnFirmado.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Check;
            this.btnFirmado.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnFirmado.Location = new System.Drawing.Point(826, 325);
            this.btnFirmado.Name = "btnFirmado";
            this.btnFirmado.Size = new System.Drawing.Size(125, 45);
            this.btnFirmado.TabIndex = 35;
            this.btnFirmado.Text = "Firmado";
            this.btnFirmado.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnFirmado.UseVisualStyleBackColor = false;
            this.btnFirmado.Click += new System.EventHandler(this.btnFirmado_Click);
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
            this.cmbCiclo.Items.AddRange(new object[] {
            "a"});
            this.cmbCiclo.Location = new System.Drawing.Point(371, 97);
            this.cmbCiclo.Name = "cmbCiclo";
            this.cmbCiclo.Size = new System.Drawing.Size(100, 27);
            this.cmbCiclo.TabIndex = 48;
            // 
            // lblCiclo
            // 
            this.lblCiclo.AutoSize = true;
            this.lblCiclo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCiclo.Location = new System.Drawing.Point(317, 100);
            this.lblCiclo.Name = "lblCiclo";
            this.lblCiclo.Size = new System.Drawing.Size(48, 19);
            this.lblCiclo.TabIndex = 49;
            this.lblCiclo.Text = "Ciclo:";
            // 
            // AlumnosLibresAlu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(984, 622);
            this.ControlBox = false;
            this.Controls.Add(this.lblCiclo);
            this.Controls.Add(this.cmbCiclo);
            this.Controls.Add(this.txtape);
            this.Controls.Add(this.txtnom);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.dgvExport);
            this.Controls.Add(this.lblId);
            this.Controls.Add(this.txtCiclo);
            this.Controls.Add(this.lblApe);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.lblhecho);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.btnReinc);
            this.Controls.Add(this.lblpendiente);
            this.Controls.Add(this.btnFirmado);
            this.Controls.Add(this.dgvHecha);
            this.Controls.Add(this.dgvPendiente);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "AlumnosLibresAlu";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Búsqueda de alumno libre";
            ((System.ComponentModel.ISupportInitialize)(this.dgvExport)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvHecha)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPendiente)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.TextBox txtape;
        public System.Windows.Forms.TextBox txtnom;
        public System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.DataGridView dgvExport;
        private System.Windows.Forms.Label lblId;
        public System.Windows.Forms.TextBox txtCiclo;
        private System.Windows.Forms.Label lblApe;
        private System.Windows.Forms.Button btnCerrar;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lblhecho;
        private System.Windows.Forms.Button btnReinc;
        private System.Windows.Forms.Label lblpendiente;
        private System.Windows.Forms.Button btnFirmado;
        private System.Windows.Forms.DataGridView dgvHecha;
        private System.Windows.Forms.DataGridView dgvPendiente;
        private System.Windows.Forms.ErrorProvider Error;
        public System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.Label lblCiclo;
        public System.Windows.Forms.ComboBox cmbCiclo;
    }
}