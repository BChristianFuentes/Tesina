namespace Log_in_con_Store_Procedure
{
    partial class ModificarAsist
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ModificarAsist));
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.lblCurso = new System.Windows.Forms.Label();
            this.dtgListado = new System.Windows.Forms.DataGridView();
            this.lblAsis = new System.Windows.Forms.Label();
            this.cmbAsis = new System.Windows.Forms.ComboBox();
            this.btnMod = new System.Windows.Forms.Button();
            this.lblListado = new System.Windows.Forms.Label();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.dtpFecha = new System.Windows.Forms.DateTimePicker();
            this.lblFecha = new System.Windows.Forms.Label();
            this.txtNom = new System.Windows.Forms.TextBox();
            this.lblNom = new System.Windows.Forms.Label();
            this.txtApel = new System.Windows.Forms.TextBox();
            this.lblApel = new System.Windows.Forms.Label();
            this.txtDoc = new System.Windows.Forms.TextBox();
            this.lblDoc = new System.Windows.Forms.Label();
            this.lblSubMot = new System.Windows.Forms.Label();
            this.cmbSubMot = new System.Windows.Forms.ComboBox();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.txtjust = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.atxtHora = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtObserv = new System.Windows.Forms.TextBox();
            this.dtpHasta = new System.Windows.Forms.DateTimePicker();
            this.lblHasta = new System.Windows.Forms.Label();
            this.dtpDesde = new System.Windows.Forms.DateTimePicker();
            this.lblDesde = new System.Windows.Forms.Label();
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
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbCurso.FormattingEnabled = true;
            this.cmbCurso.Location = new System.Drawing.Point(95, 12);
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
            this.btnBuscar.Location = new System.Drawing.Point(618, 78);
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
            this.lblCurso.Location = new System.Drawing.Point(37, 15);
            this.lblCurso.Name = "lblCurso";
            this.lblCurso.Size = new System.Drawing.Size(52, 19);
            this.lblCurso.TabIndex = 2;
            this.lblCurso.Text = "Curso:";
            // 
            // dtgListado
            // 
            this.dtgListado.AllowUserToAddRows = false;
            this.dtgListado.AllowUserToDeleteRows = false;
            this.dtgListado.AllowUserToOrderColumns = true;
            this.dtgListado.AllowUserToResizeColumns = false;
            this.dtgListado.AllowUserToResizeRows = false;
            this.dtgListado.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dtgListado.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgListado.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dtgListado.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dtgListado.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgListado.Location = new System.Drawing.Point(21, 118);
            this.dtgListado.MultiSelect = false;
            this.dtgListado.Name = "dtgListado";
            this.dtgListado.ReadOnly = true;
            this.dtgListado.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgListado.Size = new System.Drawing.Size(531, 453);
            this.dtgListado.StandardTab = true;
            this.dtgListado.TabIndex = 3;
            this.dtgListado.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgListado_CellContentClick);
            // 
            // lblAsis
            // 
            this.lblAsis.AutoSize = true;
            this.lblAsis.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblAsis.Location = new System.Drawing.Point(600, 179);
            this.lblAsis.Name = "lblAsis";
            this.lblAsis.Size = new System.Drawing.Size(91, 19);
            this.lblAsis.TabIndex = 4;
            this.lblAsis.Text = "Modificar a:";
            // 
            // cmbAsis
            // 
            this.cmbAsis.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbAsis.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbAsis.Enabled = false;
            this.cmbAsis.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.cmbAsis.FormattingEnabled = true;
            this.cmbAsis.Location = new System.Drawing.Point(697, 178);
            this.cmbAsis.Name = "cmbAsis";
            this.cmbAsis.Size = new System.Drawing.Size(150, 24);
            this.cmbAsis.TabIndex = 4;
            // 
            // btnMod
            // 
            this.btnMod.BackColor = System.Drawing.Color.PowderBlue;
            this.btnMod.Enabled = false;
            this.btnMod.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnMod.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnMod.Image = global::Log_in_con_Store_Procedure.Properties.Resources.TomarLista;
            this.btnMod.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnMod.Location = new System.Drawing.Point(672, 354);
            this.btnMod.Name = "btnMod";
            this.btnMod.Size = new System.Drawing.Size(125, 45);
            this.btnMod.TabIndex = 5;
            this.btnMod.Text = "Modificar";
            this.btnMod.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnMod.UseVisualStyleBackColor = false;
            this.btnMod.Click += new System.EventHandler(this.button2_Click);
            // 
            // lblListado
            // 
            this.lblListado.AutoSize = true;
            this.lblListado.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblListado.Location = new System.Drawing.Point(17, 96);
            this.lblListado.Name = "lblListado";
            this.lblListado.Size = new System.Drawing.Size(65, 19);
            this.lblListado.TabIndex = 9;
            this.lblListado.Text = "Listado:";
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // dtpFecha
            // 
            this.dtpFecha.CalendarFont = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.dtpFecha.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.dtpFecha.Location = new System.Drawing.Point(97, 49);
            this.dtpFecha.Name = "dtpFecha";
            this.dtpFecha.Size = new System.Drawing.Size(200, 27);
            this.dtpFecha.TabIndex = 10;
            // 
            // lblFecha
            // 
            this.lblFecha.AutoSize = true;
            this.lblFecha.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblFecha.Location = new System.Drawing.Point(37, 52);
            this.lblFecha.Name = "lblFecha";
            this.lblFecha.Size = new System.Drawing.Size(54, 19);
            this.lblFecha.TabIndex = 8;
            this.lblFecha.Text = "Fecha:";
            // 
            // txtNom
            // 
            this.txtNom.BackColor = System.Drawing.Color.PowderBlue;
            this.txtNom.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtNom.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtNom.Location = new System.Drawing.Point(409, 53);
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(200, 27);
            this.txtNom.TabIndex = 2;
            this.txtNom.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtCiclo_KeyPress);
            // 
            // lblNom
            // 
            this.lblNom.AutoSize = true;
            this.lblNom.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblNom.Location = new System.Drawing.Point(335, 53);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(68, 19);
            this.lblNom.TabIndex = 8;
            this.lblNom.Text = "Nombre:";
            // 
            // txtApel
            // 
            this.txtApel.BackColor = System.Drawing.Color.PowderBlue;
            this.txtApel.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtApel.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtApel.Location = new System.Drawing.Point(409, 53);
            this.txtApel.Name = "txtApel";
            this.txtApel.Size = new System.Drawing.Size(200, 27);
            this.txtApel.TabIndex = 2;
            this.txtApel.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtCiclo_KeyPress);
            // 
            // lblApel
            // 
            this.lblApel.AutoSize = true;
            this.lblApel.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblApel.Location = new System.Drawing.Point(335, 55);
            this.lblApel.Name = "lblApel";
            this.lblApel.Size = new System.Drawing.Size(72, 19);
            this.lblApel.TabIndex = 8;
            this.lblApel.Text = "Apellido:";
            // 
            // txtDoc
            // 
            this.txtDoc.BackColor = System.Drawing.Color.PowderBlue;
            this.txtDoc.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtDoc.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtDoc.Location = new System.Drawing.Point(409, 51);
            this.txtDoc.Name = "txtDoc";
            this.txtDoc.Size = new System.Drawing.Size(200, 27);
            this.txtDoc.TabIndex = 2;
            this.txtDoc.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtCiclo_KeyPress);
            // 
            // lblDoc
            // 
            this.lblDoc.AutoSize = true;
            this.lblDoc.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblDoc.Location = new System.Drawing.Point(311, 55);
            this.lblDoc.Name = "lblDoc";
            this.lblDoc.Size = new System.Drawing.Size(92, 19);
            this.lblDoc.TabIndex = 8;
            this.lblDoc.Text = "Documento:";
            // 
            // lblSubMot
            // 
            this.lblSubMot.AutoSize = true;
            this.lblSubMot.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblSubMot.Location = new System.Drawing.Point(314, 17);
            this.lblSubMot.Name = "lblSubMot";
            this.lblSubMot.Size = new System.Drawing.Size(81, 19);
            this.lblSubMot.TabIndex = 4;
            this.lblSubMot.Text = "Actividad:";
            this.lblSubMot.Click += new System.EventHandler(this.lblSubMot_Click);
            // 
            // cmbSubMot
            // 
            this.cmbSubMot.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbSubMot.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSubMot.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbSubMot.FormattingEnabled = true;
            this.cmbSubMot.Location = new System.Drawing.Point(401, 14);
            this.cmbSubMot.Name = "cmbSubMot";
            this.cmbSubMot.Size = new System.Drawing.Size(200, 27);
            this.cmbSubMot.TabIndex = 4;
            this.cmbSubMot.SelectedIndexChanged += new System.EventHandler(this.cmbSubMot_SelectedIndexChanged);
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(750, 535);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 14;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.button1_Click_2);
            // 
            // txtjust
            // 
            this.txtjust.BackColor = System.Drawing.Color.PowderBlue;
            this.txtjust.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtjust.Enabled = false;
            this.txtjust.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtjust.Location = new System.Drawing.Point(580, 282);
            this.txtjust.Multiline = true;
            this.txtjust.Name = "txtjust";
            this.txtjust.Size = new System.Drawing.Size(295, 88);
            this.txtjust.TabIndex = 22;
            this.txtjust.Visible = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Enabled = false;
            this.label3.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label3.Location = new System.Drawing.Point(576, 260);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(115, 19);
            this.label3.TabIndex = 21;
            this.label3.Text = "Justificaciones:";
            this.label3.Visible = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label1.Location = new System.Drawing.Point(600, 220);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(123, 19);
            this.label1.TabIndex = 20;
            this.label1.Text = "Hora de Ingreso:";
            // 
            // atxtHora
            // 
            this.atxtHora.BackColor = System.Drawing.Color.PowderBlue;
            this.atxtHora.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.atxtHora.Enabled = false;
            this.atxtHora.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.atxtHora.Location = new System.Drawing.Point(697, 376);
            this.atxtHora.Name = "atxtHora";
            this.atxtHora.Size = new System.Drawing.Size(150, 23);
            this.atxtHora.TabIndex = 19;
            this.atxtHora.Visible = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Enabled = false;
            this.label2.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label2.Location = new System.Drawing.Point(580, 387);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(111, 19);
            this.label2.TabIndex = 24;
            this.label2.Text = "Observaciones:";
            this.label2.Visible = false;
            // 
            // txtObserv
            // 
            this.txtObserv.BackColor = System.Drawing.Color.PowderBlue;
            this.txtObserv.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtObserv.Enabled = false;
            this.txtObserv.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtObserv.Location = new System.Drawing.Point(580, 409);
            this.txtObserv.Multiline = true;
            this.txtObserv.Name = "txtObserv";
            this.txtObserv.Size = new System.Drawing.Size(295, 88);
            this.txtObserv.TabIndex = 23;
            this.txtObserv.Visible = false;
            // 
            // dtpHasta
            // 
            this.dtpHasta.CalendarFont = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.dtpHasta.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.dtpHasta.Location = new System.Drawing.Point(409, 52);
            this.dtpHasta.Name = "dtpHasta";
            this.dtpHasta.Size = new System.Drawing.Size(200, 27);
            this.dtpHasta.TabIndex = 28;
            // 
            // lblHasta
            // 
            this.lblHasta.AutoSize = true;
            this.lblHasta.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblHasta.Location = new System.Drawing.Point(349, 53);
            this.lblHasta.Name = "lblHasta";
            this.lblHasta.Size = new System.Drawing.Size(54, 19);
            this.lblHasta.TabIndex = 27;
            this.lblHasta.Text = "Hasta:";
            // 
            // dtpDesde
            // 
            this.dtpDesde.CalendarFont = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.dtpDesde.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.dtpDesde.Location = new System.Drawing.Point(401, 52);
            this.dtpDesde.Name = "dtpDesde";
            this.dtpDesde.Size = new System.Drawing.Size(200, 27);
            this.dtpDesde.TabIndex = 30;
            // 
            // lblDesde
            // 
            this.lblDesde.AutoSize = true;
            this.lblDesde.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblDesde.Location = new System.Drawing.Point(341, 54);
            this.lblDesde.Name = "lblDesde";
            this.lblDesde.Size = new System.Drawing.Size(54, 19);
            this.lblDesde.TabIndex = 29;
            this.lblDesde.Text = "Desde:";
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(767, 12);
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
            this.txtHora.Location = new System.Drawing.Point(729, 218);
            this.txtHora.Mask = "00:00";
            this.txtHora.Name = "txtHora";
            this.txtHora.Size = new System.Drawing.Size(100, 27);
            this.txtHora.TabIndex = 31;
            this.txtHora.ValidatingType = typeof(System.DateTime);
            // 
            // ModificarAsist
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(887, 592);
            this.Controls.Add(this.txtHora);
            this.Controls.Add(this.dtpDesde);
            this.Controls.Add(this.lblDesde);
            this.Controls.Add(this.dtpHasta);
            this.Controls.Add(this.lblHasta);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtObserv);
            this.Controls.Add(this.txtjust);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.atxtHora);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.dtpFecha);
            this.Controls.Add(this.lblListado);
            this.Controls.Add(this.lblFecha);
            this.Controls.Add(this.lblDoc);
            this.Controls.Add(this.lblApel);
            this.Controls.Add(this.lblNom);
            this.Controls.Add(this.txtDoc);
            this.Controls.Add(this.txtApel);
            this.Controls.Add(this.txtNom);
            this.Controls.Add(this.btnMod);
            this.Controls.Add(this.cmbSubMot);
            this.Controls.Add(this.cmbAsis);
            this.Controls.Add(this.lblSubMot);
            this.Controls.Add(this.lblAsis);
            this.Controls.Add(this.dtgListado);
            this.Controls.Add(this.lblCurso);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.cmbCurso);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ModificarAsist";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Modificar Asistencia";
            this.Load += new System.EventHandler(this.ModificarAsist_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.TomarAsistencia_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.dtgListado)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.DataGridView dtgListado;
        private System.Windows.Forms.Label lblAsis;
        private System.Windows.Forms.ComboBox cmbAsis;
        private System.Windows.Forms.Button btnMod;
        private System.Windows.Forms.Label lblListado;
        public System.Windows.Forms.TextBox txtDoc;
        public System.Windows.Forms.TextBox txtApel;
        public System.Windows.Forms.TextBox txtNom;
        public System.Windows.Forms.DateTimePicker dtpFecha;
        public System.Windows.Forms.Label lblDoc;
        public System.Windows.Forms.Label lblApel;
        public System.Windows.Forms.Label lblNom;
        public System.Windows.Forms.ComboBox cmbCurso;
        public System.Windows.Forms.Label lblCurso;
        public System.Windows.Forms.Label lblFecha;
        public System.Windows.Forms.ErrorProvider Error;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lblSubMot;
        private System.Windows.Forms.Button btnCerrar;
        public System.Windows.Forms.TextBox txtjust;
        public System.Windows.Forms.Label label3;
        public System.Windows.Forms.Label label1;
        public System.Windows.Forms.TextBox atxtHora;
        public System.Windows.Forms.Label label2;
        public System.Windows.Forms.TextBox txtObserv;
        public System.Windows.Forms.DateTimePicker dtpDesde;
        public System.Windows.Forms.Label lblDesde;
        public System.Windows.Forms.DateTimePicker dtpHasta;
        public System.Windows.Forms.Label lblHasta;
        public System.Windows.Forms.ComboBox cmbSubMot;
        private System.Windows.Forms.MaskedTextBox txtHora;
    }
}