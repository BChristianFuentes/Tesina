namespace Log_in_con_Store_Procedure
{
    partial class AlumnosLibresCurso
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
            this.dgvExport = new System.Windows.Forms.DataGridView();
            this.lblCurso = new System.Windows.Forms.Label();
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.lblCiclo = new System.Windows.Forms.Label();
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
            ((System.ComponentModel.ISupportInitialize)(this.dgvExport)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvHecha)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPendiente)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
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
            this.dgvExport.Location = new System.Drawing.Point(708, 12);
            this.dgvExport.MultiSelect = false;
            this.dgvExport.Name = "dgvExport";
            this.dgvExport.ReadOnly = true;
            this.dgvExport.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvExport.Size = new System.Drawing.Size(150, 131);
            this.dgvExport.StandardTab = true;
            this.dgvExport.TabIndex = 56;
            this.dgvExport.Visible = false;
            // 
            // lblCurso
            // 
            this.lblCurso.AutoSize = true;
            this.lblCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCurso.Location = new System.Drawing.Point(143, 41);
            this.lblCurso.Name = "lblCurso";
            this.lblCurso.Size = new System.Drawing.Size(127, 19);
            this.lblCurso.TabIndex = 55;
            this.lblCurso.Text = "Buscar por curso:";
            // 
            // cmbCurso
            // 
            this.cmbCurso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCurso.Cursor = System.Windows.Forms.Cursors.Default;
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbCurso.FormattingEnabled = true;
            this.cmbCurso.Location = new System.Drawing.Point(282, 39);
            this.cmbCurso.Name = "cmbCurso";
            this.cmbCurso.Size = new System.Drawing.Size(150, 27);
            this.cmbCurso.TabIndex = 54;
            // 
            // lblCiclo
            // 
            this.lblCiclo.AutoSize = true;
            this.lblCiclo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCiclo.Location = new System.Drawing.Point(480, 41);
            this.lblCiclo.Name = "lblCiclo";
            this.lblCiclo.Size = new System.Drawing.Size(48, 19);
            this.lblCiclo.TabIndex = 52;
            this.lblCiclo.Text = "Ciclo:";
            // 
            // lblhecho
            // 
            this.lblhecho.AutoSize = true;
            this.lblhecho.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblhecho.Location = new System.Drawing.Point(12, 161);
            this.lblhecho.Name = "lblhecho";
            this.lblhecho.Size = new System.Drawing.Size(220, 19);
            this.lblhecho.TabIndex = 49;
            this.lblhecho.Text = "Reincorporaciones Pendientes:";
            // 
            // lblpendiente
            // 
            this.lblpendiente.AutoSize = true;
            this.lblpendiente.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblpendiente.Location = new System.Drawing.Point(9, 389);
            this.lblpendiente.Name = "lblpendiente";
            this.lblpendiente.Size = new System.Drawing.Size(194, 19);
            this.lblpendiente.TabIndex = 47;
            this.lblpendiente.Text = "Reincorporaciones Hechas:";
            // 
            // dgvHecha
            // 
            this.dgvHecha.AllowUserToAddRows = false;
            this.dgvHecha.AllowUserToDeleteRows = false;
            this.dgvHecha.AllowUserToOrderColumns = true;
            this.dgvHecha.AllowUserToResizeColumns = false;
            this.dgvHecha.AllowUserToResizeRows = false;
            this.dgvHecha.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvHecha.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
            this.dgvHecha.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dgvHecha.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgvHecha.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvHecha.Location = new System.Drawing.Point(12, 420);
            this.dgvHecha.MultiSelect = false;
            this.dgvHecha.Name = "dgvHecha";
            this.dgvHecha.ReadOnly = true;
            this.dgvHecha.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvHecha.Size = new System.Drawing.Size(808, 190);
            this.dgvHecha.StandardTab = true;
            this.dgvHecha.TabIndex = 43;
            // 
            // dgvPendiente
            // 
            this.dgvPendiente.AllowUserToAddRows = false;
            this.dgvPendiente.AllowUserToDeleteRows = false;
            this.dgvPendiente.AllowUserToOrderColumns = true;
            this.dgvPendiente.AllowUserToResizeColumns = false;
            this.dgvPendiente.AllowUserToResizeRows = false;
            this.dgvPendiente.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvPendiente.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
            this.dgvPendiente.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dgvPendiente.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgvPendiente.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPendiente.Location = new System.Drawing.Point(12, 184);
            this.dgvPendiente.MultiSelect = false;
            this.dgvPendiente.Name = "dgvPendiente";
            this.dgvPendiente.ReadOnly = true;
            this.dgvPendiente.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvPendiente.Size = new System.Drawing.Size(808, 190);
            this.dgvPendiente.StandardTab = true;
            this.dgvPendiente.TabIndex = 44;
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
            this.btnCerrar.TabIndex = 51;
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
            this.pictureBox1.TabIndex = 50;
            this.pictureBox1.TabStop = false;
            // 
            // btnBuscar
            // 
            this.btnBuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBuscar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnBuscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btnBuscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBuscar.Location = new System.Drawing.Point(387, 98);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(125, 45);
            this.btnBuscar.TabIndex = 48;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBuscar.UseVisualStyleBackColor = false;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // btnReinc
            // 
            this.btnReinc.BackColor = System.Drawing.Color.PowderBlue;
            this.btnReinc.Enabled = false;
            this.btnReinc.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnReinc.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnReinc.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Exportar;
            this.btnReinc.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnReinc.Location = new System.Drawing.Point(836, 184);
            this.btnReinc.Name = "btnReinc";
            this.btnReinc.Size = new System.Drawing.Size(125, 45);
            this.btnReinc.TabIndex = 45;
            this.btnReinc.Text = "Exportar";
            this.btnReinc.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnReinc.UseVisualStyleBackColor = false;
            this.btnReinc.Click += new System.EventHandler(this.btnReinc_Click);
            // 
            // btnFirmado
            // 
            this.btnFirmado.BackColor = System.Drawing.Color.PowderBlue;
            this.btnFirmado.Enabled = false;
            this.btnFirmado.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnFirmado.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnFirmado.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Check;
            this.btnFirmado.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnFirmado.Location = new System.Drawing.Point(836, 329);
            this.btnFirmado.Name = "btnFirmado";
            this.btnFirmado.Size = new System.Drawing.Size(125, 45);
            this.btnFirmado.TabIndex = 46;
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
            this.cmbCiclo.Cursor = System.Windows.Forms.Cursors.Default;
            this.cmbCiclo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCiclo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbCiclo.FormattingEnabled = true;
            this.cmbCiclo.Location = new System.Drawing.Point(534, 39);
            this.cmbCiclo.Name = "cmbCiclo";
            this.cmbCiclo.Size = new System.Drawing.Size(100, 27);
            this.cmbCiclo.TabIndex = 57;
            // 
            // AlumnosLibresCurso
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(984, 622);
            this.ControlBox = false;
            this.Controls.Add(this.cmbCiclo);
            this.Controls.Add(this.dgvExport);
            this.Controls.Add(this.lblCurso);
            this.Controls.Add(this.cmbCurso);
            this.Controls.Add(this.lblCiclo);
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
            this.Name = "AlumnosLibresCurso";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Alumnos libre por curso";
            this.Load += new System.EventHandler(this.AlumnosLibresCurso_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvExport)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvHecha)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPendiente)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvExport;
        private System.Windows.Forms.Label lblCurso;
        public System.Windows.Forms.ComboBox cmbCurso;
        private System.Windows.Forms.Label lblCiclo;
        private System.Windows.Forms.Button btnCerrar;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lblhecho;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.Button btnReinc;
        private System.Windows.Forms.Label lblpendiente;
        private System.Windows.Forms.Button btnFirmado;
        private System.Windows.Forms.DataGridView dgvHecha;
        private System.Windows.Forms.DataGridView dgvPendiente;
        private System.Windows.Forms.ErrorProvider Error;
        public System.Windows.Forms.ComboBox cmbCiclo;
    }
}