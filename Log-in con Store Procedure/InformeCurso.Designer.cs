namespace Log_in_con_Store_Procedure
{
    partial class InformeCurso
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(InformeCurso));
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.lblCurso = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.dtpDesde = new System.Windows.Forms.DateTimePicker();
            this.dtpHasta = new System.Windows.Forms.DateTimePicker();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.dgvCuanti = new System.Windows.Forms.DataGridView();
            this.btnExport1 = new System.Windows.Forms.Button();
            this.lblLis = new System.Windows.Forms.Label();
            this.btnExport2 = new System.Windows.Forms.Button();
            this.lblCiclo = new System.Windows.Forms.Label();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.cmbCiclo = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCuanti)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // cmbCurso
            // 
            this.cmbCurso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbCurso.FormattingEnabled = true;
            this.cmbCurso.Location = new System.Drawing.Point(86, 24);
            this.cmbCurso.Name = "cmbCurso";
            this.cmbCurso.Size = new System.Drawing.Size(150, 27);
            this.cmbCurso.TabIndex = 1;
            // 
            // lblCurso
            // 
            this.lblCurso.AutoSize = true;
            this.lblCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCurso.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblCurso.Location = new System.Drawing.Point(31, 27);
            this.lblCurso.Name = "lblCurso";
            this.lblCurso.Size = new System.Drawing.Size(52, 19);
            this.lblCurso.TabIndex = 1;
            this.lblCurso.Text = "Curso:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.label1.Location = new System.Drawing.Point(27, 70);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(54, 19);
            this.label1.TabIndex = 2;
            this.label1.Text = "Desde:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.label2.Location = new System.Drawing.Point(288, 70);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(54, 19);
            this.label2.TabIndex = 2;
            this.label2.Text = "Hasta:";
            // 
            // dtpDesde
            // 
            this.dtpDesde.CalendarFont = new System.Drawing.Font("MV Boli", 8F);
            this.dtpDesde.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.dtpDesde.Location = new System.Drawing.Point(86, 64);
            this.dtpDesde.Name = "dtpDesde";
            this.dtpDesde.Size = new System.Drawing.Size(196, 27);
            this.dtpDesde.TabIndex = 3;
            this.dtpDesde.ValueChanged += new System.EventHandler(this.dtpDesde_ValueChanged);
            // 
            // dtpHasta
            // 
            this.dtpHasta.CalendarFont = new System.Drawing.Font("MV Boli", 8F);
            this.dtpHasta.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.dtpHasta.Location = new System.Drawing.Point(342, 64);
            this.dtpHasta.Name = "dtpHasta";
            this.dtpHasta.Size = new System.Drawing.Size(196, 27);
            this.dtpHasta.TabIndex = 4;
            this.dtpHasta.ValueChanged += new System.EventHandler(this.dtpHasta_ValueChanged);
            // 
            // btnBuscar
            // 
            this.btnBuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBuscar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnBuscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btnBuscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBuscar.Location = new System.Drawing.Point(637, 44);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(125, 45);
            this.btnBuscar.TabIndex = 5;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBuscar.UseVisualStyleBackColor = false;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // dgvCuanti
            // 
            this.dgvCuanti.AllowUserToAddRows = false;
            this.dgvCuanti.AllowUserToDeleteRows = false;
            this.dgvCuanti.AllowUserToOrderColumns = true;
            this.dgvCuanti.AllowUserToResizeColumns = false;
            this.dgvCuanti.AllowUserToResizeRows = false;
            this.dgvCuanti.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
            this.dgvCuanti.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dgvCuanti.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgvCuanti.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvCuanti.Location = new System.Drawing.Point(12, 122);
            this.dgvCuanti.MultiSelect = false;
            this.dgvCuanti.Name = "dgvCuanti";
            this.dgvCuanti.ReadOnly = true;
            this.dgvCuanti.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvCuanti.Size = new System.Drawing.Size(750, 250);
            this.dgvCuanti.StandardTab = true;
            this.dgvCuanti.TabIndex = 6;
            this.dgvCuanti.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvCuanti_CellContentClick);
            // 
            // btnExport1
            // 
            this.btnExport1.BackColor = System.Drawing.Color.PowderBlue;
            this.btnExport1.Enabled = false;
            this.btnExport1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnExport1.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnExport1.Image = ((System.Drawing.Image)(resources.GetObject("btnExport1.Image")));
            this.btnExport1.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.btnExport1.Location = new System.Drawing.Point(768, 180);
            this.btnExport1.Name = "btnExport1";
            this.btnExport1.Size = new System.Drawing.Size(125, 55);
            this.btnExport1.TabIndex = 6;
            this.btnExport1.Text = "Exportar Cuantitativo";
            this.btnExport1.TextAlign = System.Drawing.ContentAlignment.BottomRight;
            this.btnExport1.UseVisualStyleBackColor = false;
            this.btnExport1.Click += new System.EventHandler(this.btnExport_Click);
            // 
            // lblLis
            // 
            this.lblLis.AutoSize = true;
            this.lblLis.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblLis.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblLis.Location = new System.Drawing.Point(12, 102);
            this.lblLis.Name = "lblLis";
            this.lblLis.Size = new System.Drawing.Size(157, 19);
            this.lblLis.TabIndex = 7;
            this.lblLis.Text = "Listado Cuantitativo:";
            // 
            // btnExport2
            // 
            this.btnExport2.BackColor = System.Drawing.Color.PowderBlue;
            this.btnExport2.Enabled = false;
            this.btnExport2.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnExport2.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnExport2.Image = ((System.Drawing.Image)(resources.GetObject("btnExport2.Image")));
            this.btnExport2.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.btnExport2.Location = new System.Drawing.Point(768, 270);
            this.btnExport2.Name = "btnExport2";
            this.btnExport2.Size = new System.Drawing.Size(125, 53);
            this.btnExport2.TabIndex = 7;
            this.btnExport2.Text = "Exportar Cualitativo";
            this.btnExport2.TextAlign = System.Drawing.ContentAlignment.BottomRight;
            this.btnExport2.UseVisualStyleBackColor = false;
            this.btnExport2.Click += new System.EventHandler(this.btnExport2_Click);
            // 
            // lblCiclo
            // 
            this.lblCiclo.AutoSize = true;
            this.lblCiclo.BackColor = System.Drawing.Color.Transparent;
            this.lblCiclo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCiclo.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblCiclo.Location = new System.Drawing.Point(288, 27);
            this.lblCiclo.Name = "lblCiclo";
            this.lblCiclo.Size = new System.Drawing.Size(48, 19);
            this.lblCiclo.TabIndex = 13;
            this.lblCiclo.Text = "Ciclo:";
            this.lblCiclo.Visible = false;
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(865, 421);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 8;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(882, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 11;
            this.pictureBox1.TabStop = false;
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
            this.cmbCiclo.Location = new System.Drawing.Point(342, 24);
            this.cmbCiclo.Name = "cmbCiclo";
            this.cmbCiclo.Size = new System.Drawing.Size(100, 27);
            this.cmbCiclo.TabIndex = 14;
            // 
            // InformeCurso
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(1002, 478);
            this.Controls.Add(this.cmbCiclo);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.lblCiclo);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.btnExport2);
            this.Controls.Add(this.lblLis);
            this.Controls.Add(this.btnExport1);
            this.Controls.Add(this.dgvCuanti);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.dtpHasta);
            this.Controls.Add(this.dtpDesde);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.lblCurso);
            this.Controls.Add(this.cmbCurso);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "InformeCurso";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Informe de Faltas por Cursos";
            this.Load += new System.EventHandler(this.InformeCurso_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.InformeCurso_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.dgvCuanti)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblCurso;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dtpDesde;
        private System.Windows.Forms.DateTimePicker dtpHasta;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.DataGridView dgvCuanti;
        private System.Windows.Forms.Button btnExport1;
        private System.Windows.Forms.Label lblLis;
        private System.Windows.Forms.Button btnExport2;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lblCiclo;
        private System.Windows.Forms.Button btnCerrar;
        public System.Windows.Forms.ComboBox cmbCurso;
        private System.Windows.Forms.ErrorProvider Error;
        public System.Windows.Forms.ComboBox cmbCiclo;
    }
}