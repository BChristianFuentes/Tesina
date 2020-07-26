namespace Log_in_con_Store_Procedure
{
    partial class AgregarModificarAlumnos
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AgregarModificarAlumnos));
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.txtApellido = new System.Windows.Forms.TextBox();
            this.dtpFecha = new System.Windows.Forms.DateTimePicker();
            this.lblNom = new System.Windows.Forms.Label();
            this.lblApel = new System.Windows.Forms.Label();
            this.lblFN = new System.Windows.Forms.Label();
            this.txtDocumento = new System.Windows.Forms.TextBox();
            this.lblId = new System.Windows.Forms.Label();
            this.lblTel = new System.Windows.Forms.Label();
            this.txtTelefono = new System.Windows.Forms.TextBox();
            this.lblDoc = new System.Windows.Forms.Label();
            this.txtId = new System.Windows.Forms.TextBox();
            this.lblTD = new System.Windows.Forms.Label();
            this.cmbTD = new System.Windows.Forms.ComboBox();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.cmbCurso = new System.Windows.Forms.ComboBox();
            this.txtObser = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.lblEstado = new System.Windows.Forms.Label();
            this.cmbEstado = new System.Windows.Forms.ComboBox();
            this.cmbCiclo = new System.Windows.Forms.ComboBox();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnModificar = new System.Windows.Forms.Button();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.SuspendLayout();
            // 
            // txtNombre
            // 
            this.txtNombre.BackColor = System.Drawing.Color.PowderBlue;
            this.txtNombre.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtNombre.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txtNombre.Location = new System.Drawing.Point(174, 51);
            this.txtNombre.MaxLength = 30;
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(263, 26);
            this.txtNombre.TabIndex = 1;
            this.txtNombre.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtNombre_KeyPress);
            // 
            // txtApellido
            // 
            this.txtApellido.BackColor = System.Drawing.Color.PowderBlue;
            this.txtApellido.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtApellido.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txtApellido.Location = new System.Drawing.Point(174, 97);
            this.txtApellido.MaxLength = 30;
            this.txtApellido.Name = "txtApellido";
            this.txtApellido.Size = new System.Drawing.Size(263, 26);
            this.txtApellido.TabIndex = 2;
            this.txtApellido.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtApellido_KeyPress);
            // 
            // dtpFecha
            // 
            this.dtpFecha.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.dtpFecha.Location = new System.Drawing.Point(170, 148);
            this.dtpFecha.Name = "dtpFecha";
            this.dtpFecha.Size = new System.Drawing.Size(267, 26);
            this.dtpFecha.TabIndex = 3;
            // 
            // lblNom
            // 
            this.lblNom.AutoSize = true;
            this.lblNom.BackColor = System.Drawing.Color.Transparent;
            this.lblNom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblNom.Location = new System.Drawing.Point(96, 51);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(69, 20);
            this.lblNom.TabIndex = 5;
            this.lblNom.Text = "Nombre:";
            // 
            // lblApel
            // 
            this.lblApel.AutoSize = true;
            this.lblApel.BackColor = System.Drawing.Color.Transparent;
            this.lblApel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblApel.Location = new System.Drawing.Point(96, 97);
            this.lblApel.Name = "lblApel";
            this.lblApel.Size = new System.Drawing.Size(69, 20);
            this.lblApel.TabIndex = 6;
            this.lblApel.Text = "Apellido:";
            // 
            // lblFN
            // 
            this.lblFN.AutoSize = true;
            this.lblFN.BackColor = System.Drawing.Color.Transparent;
            this.lblFN.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblFN.Location = new System.Drawing.Point(2, 148);
            this.lblFN.Name = "lblFN";
            this.lblFN.Size = new System.Drawing.Size(163, 20);
            this.lblFN.TabIndex = 7;
            this.lblFN.Text = "Fecha de Nacimiento:";
            this.lblFN.Click += new System.EventHandler(this.lblFN_Click);
            // 
            // txtDocumento
            // 
            this.txtDocumento.BackColor = System.Drawing.Color.PowderBlue;
            this.txtDocumento.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtDocumento.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txtDocumento.Location = new System.Drawing.Point(443, 238);
            this.txtDocumento.MaxLength = 8;
            this.txtDocumento.Name = "txtDocumento";
            this.txtDocumento.Size = new System.Drawing.Size(188, 26);
            this.txtDocumento.TabIndex = 6;
            this.txtDocumento.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtDocumento_KeyPress);
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.BackColor = System.Drawing.Color.Transparent;
            this.lblId.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblId.Location = new System.Drawing.Point(84, 22);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(81, 20);
            this.lblId.TabIndex = 10;
            this.lblId.Text = "IdAlumno:";
            this.lblId.Visible = false;
            // 
            // lblTel
            // 
            this.lblTel.AutoSize = true;
            this.lblTel.BackColor = System.Drawing.Color.Transparent;
            this.lblTel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblTel.Location = new System.Drawing.Point(92, 193);
            this.lblTel.Name = "lblTel";
            this.lblTel.Size = new System.Drawing.Size(75, 20);
            this.lblTel.TabIndex = 11;
            this.lblTel.Text = "Teléfono:";
            // 
            // txtTelefono
            // 
            this.txtTelefono.BackColor = System.Drawing.Color.PowderBlue;
            this.txtTelefono.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtTelefono.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txtTelefono.Location = new System.Drawing.Point(174, 193);
            this.txtTelefono.MaxLength = 10;
            this.txtTelefono.Name = "txtTelefono";
            this.txtTelefono.Size = new System.Drawing.Size(188, 26);
            this.txtTelefono.TabIndex = 4;
            this.txtTelefono.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtTelefono_KeyPress);
            // 
            // lblDoc
            // 
            this.lblDoc.AutoSize = true;
            this.lblDoc.BackColor = System.Drawing.Color.Transparent;
            this.lblDoc.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblDoc.Location = new System.Drawing.Point(345, 240);
            this.lblDoc.Name = "lblDoc";
            this.lblDoc.Size = new System.Drawing.Size(96, 20);
            this.lblDoc.TabIndex = 13;
            this.lblDoc.Text = "Documento:";
            // 
            // txtId
            // 
            this.txtId.BackColor = System.Drawing.Color.PowderBlue;
            this.txtId.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtId.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtId.Location = new System.Drawing.Point(174, 22);
            this.txtId.MaxLength = 4;
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(150, 23);
            this.txtId.TabIndex = 0;
            this.txtId.Visible = false;
            this.txtId.TextChanged += new System.EventHandler(this.txtId_TextChanged);
            // 
            // lblTD
            // 
            this.lblTD.AutoSize = true;
            this.lblTD.BackColor = System.Drawing.Color.Transparent;
            this.lblTD.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblTD.Location = new System.Drawing.Point(20, 240);
            this.lblTD.Name = "lblTD";
            this.lblTD.Size = new System.Drawing.Size(152, 20);
            this.lblTD.TabIndex = 15;
            this.lblTD.Text = "Tipo de Documento:";
            // 
            // cmbTD
            // 
            this.cmbTD.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbTD.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTD.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmbTD.FormattingEnabled = true;
            this.cmbTD.Items.AddRange(new object[] {
            "a"});
            this.cmbTD.Location = new System.Drawing.Point(174, 237);
            this.cmbTD.Name = "cmbTD";
            this.cmbTD.Size = new System.Drawing.Size(150, 28);
            this.cmbTD.TabIndex = 5;
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // cmbCurso
            // 
            this.cmbCurso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCurso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCurso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmbCurso.FormattingEnabled = true;
            this.cmbCurso.Items.AddRange(new object[] {
            "a"});
            this.cmbCurso.Location = new System.Drawing.Point(175, 287);
            this.cmbCurso.Name = "cmbCurso";
            this.cmbCurso.Size = new System.Drawing.Size(100, 28);
            this.cmbCurso.TabIndex = 7;
            this.cmbCurso.SelectedIndexChanged += new System.EventHandler(this.cmbCurso_SelectedIndexChanged);
            // 
            // txtObser
            // 
            this.txtObser.BackColor = System.Drawing.Color.PowderBlue;
            this.txtObser.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtObser.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txtObser.Location = new System.Drawing.Point(174, 331);
            this.txtObser.MaxLength = 255;
            this.txtObser.Multiline = true;
            this.txtObser.Name = "txtObser";
            this.txtObser.Size = new System.Drawing.Size(457, 81);
            this.txtObser.TabIndex = 9;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(110, 290);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 20);
            this.label1.TabIndex = 11;
            this.label1.Text = "Curso:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label2.Location = new System.Drawing.Point(47, 330);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(118, 20);
            this.label2.TabIndex = 13;
            this.label2.Text = "Observaciones:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label3.Location = new System.Drawing.Point(334, 290);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(101, 20);
            this.label3.TabIndex = 15;
            this.label3.Text = "Ciclo Lectivo:";
            // 
            // lblEstado
            // 
            this.lblEstado.AutoSize = true;
            this.lblEstado.BackColor = System.Drawing.Color.Transparent;
            this.lblEstado.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblEstado.Location = new System.Drawing.Point(101, 428);
            this.lblEstado.Name = "lblEstado";
            this.lblEstado.Size = new System.Drawing.Size(64, 20);
            this.lblEstado.TabIndex = 17;
            this.lblEstado.Text = "Estado:";
            // 
            // cmbEstado
            // 
            this.cmbEstado.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbEstado.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbEstado.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmbEstado.FormattingEnabled = true;
            this.cmbEstado.Items.AddRange(new object[] {
            "a"});
            this.cmbEstado.Location = new System.Drawing.Point(174, 427);
            this.cmbEstado.Name = "cmbEstado";
            this.cmbEstado.Size = new System.Drawing.Size(150, 28);
            this.cmbEstado.TabIndex = 10;
            // 
            // cmbCiclo
            // 
            this.cmbCiclo.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCiclo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCiclo.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmbCiclo.FormattingEnabled = true;
            this.cmbCiclo.Items.AddRange(new object[] {
            "a"});
            this.cmbCiclo.Location = new System.Drawing.Point(443, 287);
            this.cmbCiclo.Name = "cmbCiclo";
            this.cmbCiclo.Size = new System.Drawing.Size(100, 28);
            this.cmbCiclo.TabIndex = 21;
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(516, 494);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 20;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.button1_Click_2);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(533, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 19;
            this.pictureBox1.TabStop = false;
            // 
            // btnModificar
            // 
            this.btnModificar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnModificar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnModificar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnModificar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnModificar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btnModificar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnModificar.Location = new System.Drawing.Point(175, 481);
            this.btnModificar.Name = "btnModificar";
            this.btnModificar.Size = new System.Drawing.Size(125, 45);
            this.btnModificar.TabIndex = 11;
            this.btnModificar.Text = "Guardar";
            this.btnModificar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnModificar.UseVisualStyleBackColor = false;
            this.btnModificar.Click += new System.EventHandler(this.button2_Click);
            // 
            // btnAgregar
            // 
            this.btnAgregar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnAgregar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnAgregar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnAgregar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnAgregar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btnAgregar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnAgregar.Location = new System.Drawing.Point(174, 481);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(125, 45);
            this.btnAgregar.TabIndex = 7;
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnAgregar.UseVisualStyleBackColor = false;
            this.btnAgregar.Click += new System.EventHandler(this.button1_Click);
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // comboBox1
            // 
            this.comboBox1.BackColor = System.Drawing.Color.PowderBlue;
            this.comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "a"});
            this.comboBox1.Location = new System.Drawing.Point(309, 261);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(100, 28);
            this.comboBox1.TabIndex = 22;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label4.Location = new System.Drawing.Point(244, 264);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(55, 20);
            this.label4.TabIndex = 23;
            this.label4.Text = "Curso:";
            // 
            // AgregarModificarAlumnos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.ClientSize = new System.Drawing.Size(653, 551);
            this.ControlBox = false;
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.cmbCiclo);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.cmbEstado);
            this.Controls.Add(this.lblEstado);
            this.Controls.Add(this.cmbCurso);
            this.Controls.Add(this.cmbTD);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.lblTD);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.lblDoc);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtTelefono);
            this.Controls.Add(this.lblTel);
            this.Controls.Add(this.lblId);
            this.Controls.Add(this.txtObser);
            this.Controls.Add(this.txtDocumento);
            this.Controls.Add(this.btnModificar);
            this.Controls.Add(this.lblFN);
            this.Controls.Add(this.lblApel);
            this.Controls.Add(this.lblNom);
            this.Controls.Add(this.dtpFecha);
            this.Controls.Add(this.txtApellido);
            this.Controls.Add(this.txtNombre);
            this.Controls.Add(this.btnAgregar);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AgregarModificarAlumnos";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Agregar Alumno";
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.AgregarAlumno_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblNom;
        private System.Windows.Forms.Label lblApel;
        private System.Windows.Forms.Label lblFN;
        private System.Windows.Forms.Label lblId;
        public System.Windows.Forms.TextBox txtId;
        public System.Windows.Forms.TextBox txtNombre;
        public System.Windows.Forms.TextBox txtApellido;
        public System.Windows.Forms.DateTimePicker dtpFecha;
        public System.Windows.Forms.TextBox txtDocumento;
        public System.Windows.Forms.TextBox txtTelefono;
        public System.Windows.Forms.TextBox txtObser;
        public System.Windows.Forms.ComboBox cmbTD;
        public System.Windows.Forms.ComboBox cmbEstado;
        private System.Windows.Forms.ErrorProvider Error;
        private System.Windows.Forms.PictureBox pictureBox1;
        public System.Windows.Forms.ComboBox cmbCurso;
        public System.Windows.Forms.Label lblTel;
        public System.Windows.Forms.Label lblDoc;
        public System.Windows.Forms.Label lblTD;
        public System.Windows.Forms.Label label3;
        public System.Windows.Forms.Label label2;
        public System.Windows.Forms.Label label1;
        public System.Windows.Forms.Label lblEstado;
        public System.Windows.Forms.Button btnAgregar;
        public System.Windows.Forms.Button btnModificar;
        public System.Windows.Forms.Button btnCerrar;
        public System.Windows.Forms.ComboBox cmbCiclo;
        private System.Windows.Forms.ErrorProvider errorProvider1;
        public System.Windows.Forms.ComboBox comboBox1;
        public System.Windows.Forms.Label label4;
    }
}