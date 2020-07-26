namespace Log_in_con_Store_Procedure
{
    partial class AlumnosLibres
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AlumnosLibres));
            this.dgvPendiente = new System.Windows.Forms.DataGridView();
            this.lblpendiente = new System.Windows.Forms.Label();
            this.dgvHecha = new System.Windows.Forms.DataGridView();
            this.lblhecho = new System.Windows.Forms.Label();
            this.txtCiclo = new System.Windows.Forms.TextBox();
            this.lblCiclo = new System.Windows.Forms.Label();
            this.lblId = new System.Windows.Forms.Label();
            this.dgvExport = new System.Windows.Forms.DataGridView();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.txtId = new System.Windows.Forms.TextBox();
            this.txtnom = new System.Windows.Forms.TextBox();
            this.txtape = new System.Windows.Forms.TextBox();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.btnReinc = new System.Windows.Forms.Button();
            this.btnFirmado = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPendiente)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvHecha)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvExport)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
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
            this.dgvPendiente.Location = new System.Drawing.Point(12, 180);
            this.dgvPendiente.MultiSelect = false;
            this.dgvPendiente.Name = "dgvPendiente";
            this.dgvPendiente.ReadOnly = true;
            this.dgvPendiente.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvPendiente.Size = new System.Drawing.Size(808, 190);
            this.dgvPendiente.StandardTab = true;
            this.dgvPendiente.TabIndex = 0;
            // 
            // lblpendiente
            // 
            this.lblpendiente.AutoSize = true;
            this.lblpendiente.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblpendiente.Location = new System.Drawing.Point(12, 389);
            this.lblpendiente.Name = "lblpendiente";
            this.lblpendiente.Size = new System.Drawing.Size(194, 19);
            this.lblpendiente.TabIndex = 3;
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
            this.dgvHecha.Location = new System.Drawing.Point(12, 420);
            this.dgvHecha.MultiSelect = false;
            this.dgvHecha.Name = "dgvHecha";
            this.dgvHecha.ReadOnly = true;
            this.dgvHecha.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvHecha.Size = new System.Drawing.Size(808, 190);
            this.dgvHecha.StandardTab = true;
            this.dgvHecha.TabIndex = 0;
            // 
            // lblhecho
            // 
            this.lblhecho.AutoSize = true;
            this.lblhecho.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblhecho.Location = new System.Drawing.Point(8, 149);
            this.lblhecho.Name = "lblhecho";
            this.lblhecho.Size = new System.Drawing.Size(220, 19);
            this.lblhecho.TabIndex = 15;
            this.lblhecho.Text = "Reincorporaciones Pendientes:";
            // 
            // txtCiclo
            // 
            this.txtCiclo.BackColor = System.Drawing.Color.PowderBlue;
            this.txtCiclo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtCiclo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtCiclo.Location = new System.Drawing.Point(376, 77);
            this.txtCiclo.Multiline = true;
            this.txtCiclo.Name = "txtCiclo";
            this.txtCiclo.Size = new System.Drawing.Size(100, 25);
            this.txtCiclo.TabIndex = 25;
            this.txtCiclo.TextChanged += new System.EventHandler(this.txtCiclo_TextChanged);
            // 
            // lblCiclo
            // 
            this.lblCiclo.AutoSize = true;
            this.lblCiclo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCiclo.Location = new System.Drawing.Point(291, 48);
            this.lblCiclo.Name = "lblCiclo";
            this.lblCiclo.Size = new System.Drawing.Size(72, 19);
            this.lblCiclo.TabIndex = 24;
            this.lblCiclo.Text = "Apellido:";
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblId.Location = new System.Drawing.Point(34, 48);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(68, 19);
            this.lblId.TabIndex = 27;
            this.lblId.Text = "Nombre:";
            this.lblId.Click += new System.EventHandler(this.lblCurso_Click);
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
            this.dgvExport.Location = new System.Drawing.Point(723, 12);
            this.dgvExport.MultiSelect = false;
            this.dgvExport.Name = "dgvExport";
            this.dgvExport.ReadOnly = true;
            this.dgvExport.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvExport.Size = new System.Drawing.Size(150, 131);
            this.dgvExport.StandardTab = true;
            this.dgvExport.TabIndex = 28;
            this.dgvExport.Visible = false;
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // txtId
            // 
            this.txtId.BackColor = System.Drawing.Color.PowderBlue;
            this.txtId.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtId.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtId.Location = new System.Drawing.Point(132, 77);
            this.txtId.Multiline = true;
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(100, 25);
            this.txtId.TabIndex = 29;
            // 
            // txtnom
            // 
            this.txtnom.BackColor = System.Drawing.Color.PowderBlue;
            this.txtnom.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtnom.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtnom.Location = new System.Drawing.Point(106, 46);
            this.txtnom.MaxLength = 30;
            this.txtnom.Multiline = true;
            this.txtnom.Name = "txtnom";
            this.txtnom.Size = new System.Drawing.Size(161, 25);
            this.txtnom.TabIndex = 30;
            // 
            // txtape
            // 
            this.txtape.BackColor = System.Drawing.Color.PowderBlue;
            this.txtape.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtape.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtape.Location = new System.Drawing.Point(369, 46);
            this.txtape.MaxLength = 30;
            this.txtape.Multiline = true;
            this.txtape.Name = "txtape";
            this.txtape.Size = new System.Drawing.Size(161, 25);
            this.txtape.TabIndex = 31;
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
            this.btnCerrar.TabIndex = 18;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.button1_Click_2);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(864, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 16;
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
            this.btnBuscar.TabIndex = 14;
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
            this.btnReinc.Location = new System.Drawing.Point(826, 180);
            this.btnReinc.Name = "btnReinc";
            this.btnReinc.Size = new System.Drawing.Size(125, 45);
            this.btnReinc.TabIndex = 1;
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
            this.btnFirmado.Location = new System.Drawing.Point(826, 325);
            this.btnFirmado.Name = "btnFirmado";
            this.btnFirmado.Size = new System.Drawing.Size(125, 45);
            this.btnFirmado.TabIndex = 2;
            this.btnFirmado.Text = "Firmado";
            this.btnFirmado.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnFirmado.UseVisualStyleBackColor = false;
            this.btnFirmado.Click += new System.EventHandler(this.button1_Click);
            // 
            // AlumnosLibres
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.ClientSize = new System.Drawing.Size(984, 622);
            this.Controls.Add(this.txtape);
            this.Controls.Add(this.txtnom);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.dgvExport);
            this.Controls.Add(this.lblId);
            this.Controls.Add(this.txtCiclo);
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
            this.DoubleBuffered = true;
            this.Enabled = false;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AlumnosLibres";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Alumnos Libres";
            this.Load += new System.EventHandler(this.Alumnos_Libres_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Alumnos_Libres_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.dgvPendiente)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvHecha)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvExport)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvPendiente;
        private System.Windows.Forms.Button btnFirmado;
        private System.Windows.Forms.Label lblpendiente;
        private System.Windows.Forms.Button btnReinc;
        private System.Windows.Forms.DataGridView dgvHecha;
        private System.Windows.Forms.Label lblhecho;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button btnCerrar;
        public System.Windows.Forms.TextBox txtCiclo;
        private System.Windows.Forms.Label lblCiclo;
        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.DataGridView dgvExport;
        private System.Windows.Forms.ErrorProvider Error;
        public System.Windows.Forms.TextBox txtId;
        public System.Windows.Forms.TextBox txtape;
        public System.Windows.Forms.TextBox txtnom;
        public System.Windows.Forms.Button btnBuscar;
    }
}