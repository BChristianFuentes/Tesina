namespace Log_in_con_Store_Procedure
{
    partial class Justificaciones
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Justificaciones));
            this.label4 = new System.Windows.Forms.Label();
            this.txtJust = new System.Windows.Forms.TextBox();
            this.dtpFecha = new System.Windows.Forms.DateTimePicker();
            this.lblListado = new System.Windows.Forms.Label();
            this.lblFecha = new System.Windows.Forms.Label();
            this.btnAsig = new System.Windows.Forms.Button();
            this.dtgListado = new System.Windows.Forms.DataGridView();
            this.lblCurso = new System.Windows.Forms.Label();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.txtObs = new System.Windows.Forms.TextBox();
            this.lblObs = new System.Windows.Forms.Label();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.cmbSubMot = new System.Windows.Forms.ComboBox();
            this.lblSubMot = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dtgListado)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label4.Location = new System.Drawing.Point(630, 186);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(115, 19);
            this.label4.TabIndex = 39;
            this.label4.Text = "Justificaciones:";
            // 
            // txtJust
            // 
            this.txtJust.BackColor = System.Drawing.Color.PowderBlue;
            this.txtJust.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtJust.Enabled = false;
            this.txtJust.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtJust.Location = new System.Drawing.Point(634, 208);
            this.txtJust.MaxLength = 150;
            this.txtJust.Multiline = true;
            this.txtJust.Name = "txtJust";
            this.txtJust.Size = new System.Drawing.Size(233, 81);
            this.txtJust.TabIndex = 38;
            // 
            // dtpFecha
            // 
            this.dtpFecha.CalendarFont = new System.Drawing.Font("Microsoft Sans Serif", 8F);
            this.dtpFecha.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.dtpFecha.Location = new System.Drawing.Point(152, 81);
            this.dtpFecha.Name = "dtpFecha";
            this.dtpFecha.Size = new System.Drawing.Size(215, 27);
            this.dtpFecha.TabIndex = 33;
            // 
            // lblListado
            // 
            this.lblListado.AutoSize = true;
            this.lblListado.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblListado.Location = new System.Drawing.Point(21, 125);
            this.lblListado.Name = "lblListado";
            this.lblListado.Size = new System.Drawing.Size(65, 19);
            this.lblListado.TabIndex = 31;
            this.lblListado.Text = "Listado:";
            // 
            // lblFecha
            // 
            this.lblFecha.AutoSize = true;
            this.lblFecha.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblFecha.Location = new System.Drawing.Point(92, 83);
            this.lblFecha.Name = "lblFecha";
            this.lblFecha.Size = new System.Drawing.Size(54, 19);
            this.lblFecha.TabIndex = 30;
            this.lblFecha.Text = "Fecha:";
            // 
            // btnAsig
            // 
            this.btnAsig.BackColor = System.Drawing.Color.PowderBlue;
            this.btnAsig.Enabled = false;
            this.btnAsig.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnAsig.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnAsig.Image = global::Log_in_con_Store_Procedure.Properties.Resources.TomarLista;
            this.btnAsig.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnAsig.Location = new System.Drawing.Point(701, 440);
            this.btnAsig.Name = "btnAsig";
            this.btnAsig.Size = new System.Drawing.Size(174, 45);
            this.btnAsig.TabIndex = 28;
            this.btnAsig.Text = "Asignar/Modificar";
            this.btnAsig.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnAsig.UseVisualStyleBackColor = false;
            this.btnAsig.Click += new System.EventHandler(this.btnAsig_Click);
            // 
            // dtgListado
            // 
            this.dtgListado.AllowUserToAddRows = false;
            this.dtgListado.AllowUserToDeleteRows = false;
            this.dtgListado.AllowUserToResizeColumns = false;
            this.dtgListado.AllowUserToResizeRows = false;
            this.dtgListado.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dtgListado.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dtgListado.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dtgListado.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dtgListado.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgListado.Location = new System.Drawing.Point(24, 155);
            this.dtgListado.MultiSelect = false;
            this.dtgListado.Name = "dtgListado";
            this.dtgListado.ReadOnly = true;
            this.dtgListado.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgListado.Size = new System.Drawing.Size(591, 411);
            this.dtgListado.StandardTab = true;
            this.dtgListado.TabIndex = 22;
            this.dtgListado.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgListado_CellContentClick);
            // 
            // lblCurso
            // 
            this.lblCurso.AutoSize = true;
            this.lblCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCurso.Location = new System.Drawing.Point(19, 30);
            this.lblCurso.Name = "lblCurso";
            this.lblCurso.Size = new System.Drawing.Size(127, 19);
            this.lblCurso.TabIndex = 20;
            this.lblCurso.Text = "Buscar por curso:";
            // 
            // btnBuscar
            // 
            this.btnBuscar.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnBuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBuscar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnBuscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btnBuscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBuscar.Location = new System.Drawing.Point(459, 60);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(125, 45);
            this.btnBuscar.TabIndex = 23;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBuscar.UseVisualStyleBackColor = false;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click_1);
            // 
            // cmbCurso
            // 
            this.cmbCurso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCurso.Cursor = System.Windows.Forms.Cursors.Default;
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbCurso.FormattingEnabled = true;
            this.cmbCurso.Location = new System.Drawing.Point(152, 28);
            this.cmbCurso.Name = "cmbCurso";
            this.cmbCurso.Size = new System.Drawing.Size(150, 27);
            this.cmbCurso.TabIndex = 19;
            this.cmbCurso.SelectedIndexChanged += new System.EventHandler(this.cmbCurso_SelectedIndexChanged);
            // 
            // txtObs
            // 
            this.txtObs.BackColor = System.Drawing.Color.PowderBlue;
            this.txtObs.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtObs.Enabled = false;
            this.txtObs.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtObs.Location = new System.Drawing.Point(642, 340);
            this.txtObs.MaxLength = 255;
            this.txtObs.Multiline = true;
            this.txtObs.Name = "txtObs";
            this.txtObs.Size = new System.Drawing.Size(233, 81);
            this.txtObs.TabIndex = 38;
            // 
            // lblObs
            // 
            this.lblObs.AutoSize = true;
            this.lblObs.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblObs.Location = new System.Drawing.Point(638, 318);
            this.lblObs.Name = "lblObs";
            this.lblObs.Size = new System.Drawing.Size(111, 19);
            this.lblObs.TabIndex = 39;
            this.lblObs.Text = "Observaciones:";
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(659, 577);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 40;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.button1_Click_2);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(759, 13);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 32;
            this.pictureBox1.TabStop = false;
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // cmbSubMot
            // 
            this.cmbSubMot.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbSubMot.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSubMot.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbSubMot.FormattingEnabled = true;
            this.cmbSubMot.Location = new System.Drawing.Point(414, 30);
            this.cmbSubMot.Name = "cmbSubMot";
            this.cmbSubMot.Size = new System.Drawing.Size(200, 27);
            this.cmbSubMot.TabIndex = 41;
            // 
            // lblSubMot
            // 
            this.lblSubMot.AutoSize = true;
            this.lblSubMot.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblSubMot.Location = new System.Drawing.Point(327, 31);
            this.lblSubMot.Name = "lblSubMot";
            this.lblSubMot.Size = new System.Drawing.Size(81, 19);
            this.lblSubMot.TabIndex = 42;
            this.lblSubMot.Text = "Actividad:";
            // 
            // Justificaciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(887, 592);
            this.ControlBox = false;
            this.Controls.Add(this.cmbSubMot);
            this.Controls.Add(this.lblSubMot);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.lblObs);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtObs);
            this.Controls.Add(this.txtJust);
            this.Controls.Add(this.dtpFecha);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.lblListado);
            this.Controls.Add(this.lblFecha);
            this.Controls.Add(this.btnAsig);
            this.Controls.Add(this.dtgListado);
            this.Controls.Add(this.lblCurso);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.cmbCurso);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Justificaciones";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Justificaciones";
            this.Load += new System.EventHandler(this.Justificaciones_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtgListado)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.DateTimePicker dtpFecha;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lblListado;
        private System.Windows.Forms.Label lblFecha;
        private System.Windows.Forms.DataGridView dtgListado;
        private System.Windows.Forms.Label lblCurso;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.Label lblObs;
        private System.Windows.Forms.Button btnCerrar;
        public System.Windows.Forms.TextBox txtJust;
        public System.Windows.Forms.Button btnAsig;
        public System.Windows.Forms.TextBox txtObs;
        public System.Windows.Forms.ComboBox cmbCurso;
        private System.Windows.Forms.ErrorProvider Error;
        public System.Windows.Forms.ComboBox cmbSubMot;
        private System.Windows.Forms.Label lblSubMot;
    }
}