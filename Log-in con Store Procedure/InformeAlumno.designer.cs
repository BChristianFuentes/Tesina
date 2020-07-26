namespace Log_in_con_Store_Procedure
{
    partial class InformeAlumno
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(InformeAlumno));
            this.txtNom = new System.Windows.Forms.TextBox();
            this.txtDoc = new System.Windows.Forms.TextBox();
            this.txtApel = new System.Windows.Forms.TextBox();
            this.dgvCuanti = new System.Windows.Forms.DataGridView();
            this.dtpDesde = new System.Windows.Forms.DateTimePicker();
            this.lblNom = new System.Windows.Forms.Label();
            this.lblApel = new System.Windows.Forms.Label();
            this.lblDoc = new System.Windows.Forms.Label();
            this.lblDesde = new System.Windows.Forms.Label();
            this.lblHasta = new System.Windows.Forms.Label();
            this.dtpHasta = new System.Windows.Forms.DateTimePicker();
            this.dgvCuali = new System.Windows.Forms.DataGridView();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.lblCuanti = new System.Windows.Forms.Label();
            this.lblCuali = new System.Windows.Forms.Label();
            this.btnExport1 = new System.Windows.Forms.Button();
            this.btnExport2 = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.cmbCiclo = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCuanti)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCuali)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // txtNom
            // 
            this.txtNom.BackColor = System.Drawing.Color.PowderBlue;
            this.txtNom.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtNom.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtNom.Location = new System.Drawing.Point(81, 21);
            this.txtNom.MaxLength = 30;
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(100, 23);
            this.txtNom.TabIndex = 1;
            this.txtNom.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtNom_KeyPress);
            // 
            // txtDoc
            // 
            this.txtDoc.BackColor = System.Drawing.Color.PowderBlue;
            this.txtDoc.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtDoc.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtDoc.Location = new System.Drawing.Point(544, 21);
            this.txtDoc.MaxLength = 8;
            this.txtDoc.Name = "txtDoc";
            this.txtDoc.Size = new System.Drawing.Size(100, 23);
            this.txtDoc.TabIndex = 4;
            this.txtDoc.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtDoc_KeyPress);
            // 
            // txtApel
            // 
            this.txtApel.BackColor = System.Drawing.Color.PowderBlue;
            this.txtApel.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtApel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtApel.Location = new System.Drawing.Point(276, 21);
            this.txtApel.MaxLength = 30;
            this.txtApel.Name = "txtApel";
            this.txtApel.Size = new System.Drawing.Size(100, 23);
            this.txtApel.TabIndex = 2;
            this.txtApel.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtApel_KeyPress);
            // 
            // dgvCuanti
            // 
            this.dgvCuanti.AllowUserToAddRows = false;
            this.dgvCuanti.AllowUserToDeleteRows = false;
            this.dgvCuanti.AllowUserToResizeColumns = false;
            this.dgvCuanti.AllowUserToResizeRows = false;
            this.dgvCuanti.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dgvCuanti.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dgvCuanti.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgvCuanti.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvCuanti.Location = new System.Drawing.Point(12, 149);
            this.dgvCuanti.MultiSelect = false;
            this.dgvCuanti.Name = "dgvCuanti";
            this.dgvCuanti.ReadOnly = true;
            this.dgvCuanti.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvCuanti.Size = new System.Drawing.Size(813, 250);
            this.dgvCuanti.StandardTab = true;
            this.dgvCuanti.TabIndex = 9;
            this.dgvCuanti.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvCuanti_CellContentClick);
            // 
            // dtpDesde
            // 
            this.dtpDesde.CustomFormat = "";
            this.dtpDesde.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.dtpDesde.Location = new System.Drawing.Point(81, 76);
            this.dtpDesde.Name = "dtpDesde";
            this.dtpDesde.Size = new System.Drawing.Size(196, 27);
            this.dtpDesde.TabIndex = 5;
            this.dtpDesde.ValueChanged += new System.EventHandler(this.dtpDesde_ValueChanged);
            // 
            // lblNom
            // 
            this.lblNom.AutoSize = true;
            this.lblNom.BackColor = System.Drawing.Color.Transparent;
            this.lblNom.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblNom.Location = new System.Drawing.Point(8, 24);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(68, 19);
            this.lblNom.TabIndex = 5;
            this.lblNom.Text = "Nombre:";
            // 
            // lblApel
            // 
            this.lblApel.AutoSize = true;
            this.lblApel.BackColor = System.Drawing.Color.Transparent;
            this.lblApel.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblApel.Location = new System.Drawing.Point(198, 24);
            this.lblApel.Name = "lblApel";
            this.lblApel.Size = new System.Drawing.Size(72, 19);
            this.lblApel.TabIndex = 6;
            this.lblApel.Text = "Apellido:";
            // 
            // lblDoc
            // 
            this.lblDoc.AutoSize = true;
            this.lblDoc.BackColor = System.Drawing.Color.Transparent;
            this.lblDoc.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblDoc.Location = new System.Drawing.Point(405, 25);
            this.lblDoc.Name = "lblDoc";
            this.lblDoc.Size = new System.Drawing.Size(133, 19);
            this.lblDoc.TabIndex = 7;
            this.lblDoc.Text = "Nº de Documento:";
            // 
            // lblDesde
            // 
            this.lblDesde.AutoSize = true;
            this.lblDesde.BackColor = System.Drawing.Color.Transparent;
            this.lblDesde.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblDesde.Location = new System.Drawing.Point(22, 78);
            this.lblDesde.Name = "lblDesde";
            this.lblDesde.Size = new System.Drawing.Size(54, 19);
            this.lblDesde.TabIndex = 8;
            this.lblDesde.Text = "Desde:";
            // 
            // lblHasta
            // 
            this.lblHasta.AutoSize = true;
            this.lblHasta.BackColor = System.Drawing.Color.Transparent;
            this.lblHasta.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblHasta.Location = new System.Drawing.Point(389, 78);
            this.lblHasta.Name = "lblHasta";
            this.lblHasta.Size = new System.Drawing.Size(54, 19);
            this.lblHasta.TabIndex = 9;
            this.lblHasta.Text = "Hasta:";
            // 
            // dtpHasta
            // 
            this.dtpHasta.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.dtpHasta.Location = new System.Drawing.Point(448, 76);
            this.dtpHasta.Name = "dtpHasta";
            this.dtpHasta.Size = new System.Drawing.Size(196, 27);
            this.dtpHasta.TabIndex = 6;
            this.dtpHasta.ValueChanged += new System.EventHandler(this.dtpHasta_ValueChanged);
            // 
            // dgvCuali
            // 
            this.dgvCuali.AllowUserToAddRows = false;
            this.dgvCuali.AllowUserToDeleteRows = false;
            this.dgvCuali.AllowUserToResizeColumns = false;
            this.dgvCuali.AllowUserToResizeRows = false;
            this.dgvCuali.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvCuali.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dgvCuali.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgvCuali.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvCuali.Location = new System.Drawing.Point(12, 432);
            this.dgvCuali.MultiSelect = false;
            this.dgvCuali.Name = "dgvCuali";
            this.dgvCuali.ReadOnly = true;
            this.dgvCuali.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvCuali.Size = new System.Drawing.Size(813, 250);
            this.dgvCuali.StandardTab = true;
            this.dgvCuali.TabIndex = 11;
            this.dgvCuali.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvCuali_CellContentClick);
            // 
            // btnBuscar
            // 
            this.btnBuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBuscar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnBuscar.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btnBuscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btnBuscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBuscar.Location = new System.Drawing.Point(700, 76);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(125, 45);
            this.btnBuscar.TabIndex = 7;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBuscar.UseVisualStyleBackColor = false;
            this.btnBuscar.Click += new System.EventHandler(this.button1_Click);
            // 
            // lblCuanti
            // 
            this.lblCuanti.AutoSize = true;
            this.lblCuanti.BackColor = System.Drawing.Color.Transparent;
            this.lblCuanti.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCuanti.Location = new System.Drawing.Point(15, 128);
            this.lblCuanti.Name = "lblCuanti";
            this.lblCuanti.Size = new System.Drawing.Size(160, 19);
            this.lblCuanti.TabIndex = 14;
            this.lblCuanti.Text = "Informe Cuantitativo:";
            // 
            // lblCuali
            // 
            this.lblCuali.AutoSize = true;
            this.lblCuali.BackColor = System.Drawing.Color.Transparent;
            this.lblCuali.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCuali.Location = new System.Drawing.Point(15, 411);
            this.lblCuali.Name = "lblCuali";
            this.lblCuali.Size = new System.Drawing.Size(150, 19);
            this.lblCuali.TabIndex = 15;
            this.lblCuali.Text = "Informe Cualitativo:";
            // 
            // btnExport1
            // 
            this.btnExport1.BackColor = System.Drawing.Color.PowderBlue;
            this.btnExport1.Enabled = false;
            this.btnExport1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnExport1.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnExport1.Image = ((System.Drawing.Image)(resources.GetObject("btnExport1.Image")));
            this.btnExport1.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.btnExport1.Location = new System.Drawing.Point(831, 254);
            this.btnExport1.Name = "btnExport1";
            this.btnExport1.Size = new System.Drawing.Size(125, 53);
            this.btnExport1.TabIndex = 8;
            this.btnExport1.Text = "Exportar Cuantitativo";
            this.btnExport1.TextAlign = System.Drawing.ContentAlignment.BottomRight;
            this.btnExport1.UseVisualStyleBackColor = false;
            this.btnExport1.Click += new System.EventHandler(this.btnExport1_Click);
            // 
            // btnExport2
            // 
            this.btnExport2.BackColor = System.Drawing.Color.PowderBlue;
            this.btnExport2.Enabled = false;
            this.btnExport2.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnExport2.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnExport2.Image = ((System.Drawing.Image)(resources.GetObject("btnExport2.Image")));
            this.btnExport2.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.btnExport2.Location = new System.Drawing.Point(831, 523);
            this.btnExport2.Name = "btnExport2";
            this.btnExport2.Size = new System.Drawing.Size(125, 53);
            this.btnExport2.TabIndex = 9;
            this.btnExport2.Text = "Exportar Cualitativo";
            this.btnExport2.TextAlign = System.Drawing.ContentAlignment.BottomRight;
            this.btnExport2.UseVisualStyleBackColor = false;
            this.btnExport2.Click += new System.EventHandler(this.btnExport2_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Enabled = false;
            this.label2.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label2.Location = new System.Drawing.Point(671, 25);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(48, 19);
            this.label2.TabIndex = 18;
            this.label2.Text = "Ciclo:";
            this.label2.Visible = false;
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(847, 669);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 10;
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
            // cmbCiclo
            // 
            this.cmbCiclo.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCiclo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCiclo.Enabled = false;
            this.cmbCiclo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbCiclo.FormattingEnabled = true;
            this.cmbCiclo.Items.AddRange(new object[] {
            "a"});
            this.cmbCiclo.Location = new System.Drawing.Point(725, 21);
            this.cmbCiclo.Name = "cmbCiclo";
            this.cmbCiclo.Size = new System.Drawing.Size(100, 27);
            this.cmbCiclo.TabIndex = 22;
            this.cmbCiclo.Visible = false;
            // 
            // InformeAlumno
            // 
            this.AcceptButton = this.btnBuscar;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.ClientSize = new System.Drawing.Size(984, 726);
            this.Controls.Add(this.cmbCiclo);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.btnExport2);
            this.Controls.Add(this.btnExport1);
            this.Controls.Add(this.lblCuali);
            this.Controls.Add(this.lblCuanti);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.dgvCuali);
            this.Controls.Add(this.dtpHasta);
            this.Controls.Add(this.lblHasta);
            this.Controls.Add(this.lblDesde);
            this.Controls.Add(this.lblDoc);
            this.Controls.Add(this.lblApel);
            this.Controls.Add(this.lblNom);
            this.Controls.Add(this.dtpDesde);
            this.Controls.Add(this.dgvCuanti);
            this.Controls.Add(this.txtApel);
            this.Controls.Add(this.txtDoc);
            this.Controls.Add(this.txtNom);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "InformeAlumno";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Informe de Faltas por Alumno";
            this.Load += new System.EventHandler(this.InformeAlumno_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.InformeAlumno_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.dgvCuanti)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCuali)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.DataGridView dgvCuanti;
        private System.Windows.Forms.Label lblNom;
        private System.Windows.Forms.Label lblApel;
        private System.Windows.Forms.Label lblDesde;
        private System.Windows.Forms.Label lblHasta;
        private System.Windows.Forms.DataGridView dgvCuali;
        private System.Windows.Forms.Label lblCuanti;
        private System.Windows.Forms.Label lblCuali;
        private System.Windows.Forms.Button btnExport1;
        private System.Windows.Forms.Button btnExport2;
        public System.Windows.Forms.TextBox txtNom;
        public System.Windows.Forms.TextBox txtDoc;
        public System.Windows.Forms.TextBox txtApel;
        public System.Windows.Forms.DateTimePicker dtpDesde;
        public System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label label2;
        public System.Windows.Forms.Label lblDoc;
        private System.Windows.Forms.Button btnCerrar;
        public System.Windows.Forms.ComboBox cmbCiclo;
        public System.Windows.Forms.DateTimePicker dtpHasta;
    }
}

