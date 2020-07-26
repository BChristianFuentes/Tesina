namespace Log_in_con_Store_Procedure
{
    partial class BusquedaMotivo
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
            this.lblCurso = new System.Windows.Forms.Label();
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.dtpHasta = new System.Windows.Forms.DateTimePicker();
            this.dtpDesde = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.cmbAsis = new System.Windows.Forms.ComboBox();
            this.lblAsis = new System.Windows.Forms.Label();
            this.lblListado = new System.Windows.Forms.Label();
            this.dtgListado = new System.Windows.Forms.DataGridView();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnReinc = new System.Windows.Forms.Button();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.cmbSubMot = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dtgListado)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // lblCurso
            // 
            this.lblCurso.AutoSize = true;
            this.lblCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCurso.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblCurso.Location = new System.Drawing.Point(68, 15);
            this.lblCurso.Name = "lblCurso";
            this.lblCurso.Size = new System.Drawing.Size(52, 19);
            this.lblCurso.TabIndex = 2;
            this.lblCurso.Text = "Curso:";
            // 
            // cmbCurso
            // 
            this.cmbCurso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbCurso.FormattingEnabled = true;
            this.cmbCurso.Location = new System.Drawing.Point(130, 12);
            this.cmbCurso.Name = "cmbCurso";
            this.cmbCurso.Size = new System.Drawing.Size(150, 27);
            this.cmbCurso.TabIndex = 3;
            this.cmbCurso.SelectedIndexChanged += new System.EventHandler(this.cmbCurso_SelectedIndexChanged);
            // 
            // dtpHasta
            // 
            this.dtpHasta.CalendarFont = new System.Drawing.Font("MV Boli", 8F);
            this.dtpHasta.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.dtpHasta.Location = new System.Drawing.Point(419, 101);
            this.dtpHasta.Name = "dtpHasta";
            this.dtpHasta.Size = new System.Drawing.Size(196, 27);
            this.dtpHasta.TabIndex = 8;
            this.dtpHasta.ValueChanged += new System.EventHandler(this.dtpHasta_ValueChanged);
            // 
            // dtpDesde
            // 
            this.dtpDesde.CalendarFont = new System.Drawing.Font("MV Boli", 8F);
            this.dtpDesde.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.dtpDesde.Location = new System.Drawing.Point(130, 101);
            this.dtpDesde.Name = "dtpDesde";
            this.dtpDesde.Size = new System.Drawing.Size(196, 27);
            this.dtpDesde.TabIndex = 7;
            this.dtpDesde.ValueChanged += new System.EventHandler(this.dtpDesde_ValueChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.label2.Location = new System.Drawing.Point(357, 101);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(54, 19);
            this.label2.TabIndex = 5;
            this.label2.Text = "Hasta:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.label1.Location = new System.Drawing.Point(66, 101);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(54, 19);
            this.label1.TabIndex = 6;
            this.label1.Text = "Desde:";
            // 
            // cmbAsis
            // 
            this.cmbAsis.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbAsis.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbAsis.Enabled = false;
            this.cmbAsis.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbAsis.FormattingEnabled = true;
            this.cmbAsis.Location = new System.Drawing.Point(130, 53);
            this.cmbAsis.Name = "cmbAsis";
            this.cmbAsis.Size = new System.Drawing.Size(150, 27);
            this.cmbAsis.TabIndex = 9;
            // 
            // lblAsis
            // 
            this.lblAsis.AutoSize = true;
            this.lblAsis.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblAsis.Location = new System.Drawing.Point(37, 54);
            this.lblAsis.Name = "lblAsis";
            this.lblAsis.Size = new System.Drawing.Size(83, 19);
            this.lblAsis.TabIndex = 10;
            this.lblAsis.Text = "Asistencia:";
            // 
            // lblListado
            // 
            this.lblListado.AutoSize = true;
            this.lblListado.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblListado.Location = new System.Drawing.Point(15, 207);
            this.lblListado.Name = "lblListado";
            this.lblListado.Size = new System.Drawing.Size(131, 20);
            this.lblListado.TabIndex = 12;
            this.lblListado.Text = "Listado Alumnos:";
            // 
            // dtgListado
            // 
            this.dtgListado.AllowUserToAddRows = false;
            this.dtgListado.AllowUserToDeleteRows = false;
            this.dtgListado.AllowUserToResizeColumns = false;
            this.dtgListado.AllowUserToResizeRows = false;
            this.dtgListado.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dtgListado.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dtgListado.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dtgListado.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgListado.Location = new System.Drawing.Point(12, 229);
            this.dtgListado.MultiSelect = false;
            this.dtgListado.Name = "dtgListado";
            this.dtgListado.ReadOnly = true;
            this.dtgListado.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgListado.Size = new System.Drawing.Size(777, 310);
            this.dtgListado.StandardTab = true;
            this.dtgListado.TabIndex = 11;
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(681, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 14;
            this.pictureBox1.TabStop = false;
            // 
            // btnReinc
            // 
            this.btnReinc.BackColor = System.Drawing.Color.PowderBlue;
            this.btnReinc.Enabled = false;
            this.btnReinc.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnReinc.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnReinc.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Exportar;
            this.btnReinc.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnReinc.Location = new System.Drawing.Point(12, 580);
            this.btnReinc.Name = "btnReinc";
            this.btnReinc.Size = new System.Drawing.Size(125, 45);
            this.btnReinc.TabIndex = 18;
            this.btnReinc.Text = "Exportar";
            this.btnReinc.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnReinc.UseVisualStyleBackColor = false;
            this.btnReinc.Click += new System.EventHandler(this.btnReinc_Click);
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(664, 580);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 17;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.btnCerrar_Click);
            // 
            // cmbSubMot
            // 
            this.cmbSubMot.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbSubMot.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSubMot.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbSubMot.FormattingEnabled = true;
            this.cmbSubMot.Location = new System.Drawing.Point(474, 13);
            this.cmbSubMot.Name = "cmbSubMot";
            this.cmbSubMot.Size = new System.Drawing.Size(150, 27);
            this.cmbSubMot.TabIndex = 19;
            this.cmbSubMot.SelectedIndexChanged += new System.EventHandler(this.cmbSubMot_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.label3.Location = new System.Drawing.Point(330, 14);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(138, 19);
            this.label3.TabIndex = 20;
            this.label3.Text = "Asignar Actividad:";
            // 
            // btnBuscar
            // 
            this.btnBuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBuscar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnBuscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btnBuscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBuscar.Location = new System.Drawing.Point(408, 151);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(125, 45);
            this.btnBuscar.TabIndex = 21;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBuscar.UseVisualStyleBackColor = false;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // BusquedaMotivo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(801, 637);
            this.ControlBox = false;
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.cmbSubMot);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnReinc);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.lblListado);
            this.Controls.Add(this.dtgListado);
            this.Controls.Add(this.cmbAsis);
            this.Controls.Add(this.lblAsis);
            this.Controls.Add(this.dtpHasta);
            this.Controls.Add(this.dtpDesde);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.lblCurso);
            this.Controls.Add(this.cmbCurso);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "BusquedaMotivo";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Busqueda de faltas por tipo de asistencia";
            this.Load += new System.EventHandler(this.BusquedaMotivo_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtgListado)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblCurso;
        public System.Windows.Forms.ComboBox cmbCurso;
        private System.Windows.Forms.DateTimePicker dtpHasta;
        private System.Windows.Forms.DateTimePicker dtpDesde;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        public System.Windows.Forms.ComboBox cmbAsis;
        private System.Windows.Forms.Label lblAsis;
        private System.Windows.Forms.Label lblListado;
        private System.Windows.Forms.DataGridView dtgListado;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button btnReinc;
        private System.Windows.Forms.Button btnCerrar;
        public System.Windows.Forms.ComboBox cmbSubMot;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.ErrorProvider Error;
    }
}