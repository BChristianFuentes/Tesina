namespace Log_in_con_Store_Procedure
{
    partial class buscarAlumno
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(buscarAlumno));
            this.dgvLis = new System.Windows.Forms.DataGridView();
            this.lblNom = new System.Windows.Forms.Label();
            this.lblApel = new System.Windows.Forms.Label();
            this.txtNom = new System.Windows.Forms.TextBox();
            this.txtApel = new System.Windows.Forms.TextBox();
            this.txtDoc = new System.Windows.Forms.TextBox();
            this.lblDoc = new System.Windows.Forms.Label();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.btn_asignarnotas = new System.Windows.Forms.Button();
            this.btnAlulib = new System.Windows.Forms.Button();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.btn_registrarretirosantes = new System.Windows.Forms.Button();
            this.btn_informealumnoDOE = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnModAsistencia = new System.Windows.Forms.Button();
            this.btnInforme = new System.Windows.Forms.Button();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.btnModificar = new System.Windows.Forms.Button();
            this.btn_vernotas = new System.Windows.Forms.Button();
            this.btn_modificarnotas = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvLis)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvLis
            // 
            this.dgvLis.AllowUserToAddRows = false;
            this.dgvLis.AllowUserToDeleteRows = false;
            this.dgvLis.AllowUserToResizeColumns = false;
            this.dgvLis.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvLis.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dgvLis.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dgvLis.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgvLis.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgvLis.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvLis.Location = new System.Drawing.Point(14, 95);
            this.dgvLis.MultiSelect = false;
            this.dgvLis.Name = "dgvLis";
            this.dgvLis.ReadOnly = true;
            this.dgvLis.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.AutoSizeToDisplayedHeaders;
            this.dgvLis.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvLis.Size = new System.Drawing.Size(781, 241);
            this.dgvLis.StandardTab = true;
            this.dgvLis.TabIndex = 4;
            // 
            // lblNom
            // 
            this.lblNom.AutoSize = true;
            this.lblNom.BackColor = System.Drawing.Color.Transparent;
            this.lblNom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblNom.Location = new System.Drawing.Point(26, 23);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(69, 20);
            this.lblNom.TabIndex = 0;
            this.lblNom.Text = "Nombre:";
            // 
            // lblApel
            // 
            this.lblApel.AutoSize = true;
            this.lblApel.BackColor = System.Drawing.Color.Transparent;
            this.lblApel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblApel.Location = new System.Drawing.Point(26, 52);
            this.lblApel.Name = "lblApel";
            this.lblApel.Size = new System.Drawing.Size(69, 20);
            this.lblApel.TabIndex = 0;
            this.lblApel.Text = "Apellido:";
            // 
            // txtNom
            // 
            this.txtNom.BackColor = System.Drawing.Color.PowderBlue;
            this.txtNom.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtNom.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtNom.Location = new System.Drawing.Point(101, 19);
            this.txtNom.MaxLength = 30;
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(130, 23);
            this.txtNom.TabIndex = 1;
            this.txtNom.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtNom_KeyPress);
            // 
            // txtApel
            // 
            this.txtApel.BackColor = System.Drawing.Color.PowderBlue;
            this.txtApel.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtApel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtApel.Location = new System.Drawing.Point(101, 48);
            this.txtApel.MaxLength = 30;
            this.txtApel.Name = "txtApel";
            this.txtApel.Size = new System.Drawing.Size(130, 23);
            this.txtApel.TabIndex = 2;
            this.txtApel.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtApel_KeyPress);
            // 
            // txtDoc
            // 
            this.txtDoc.BackColor = System.Drawing.Color.PowderBlue;
            this.txtDoc.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtDoc.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtDoc.Location = new System.Drawing.Point(423, 20);
            this.txtDoc.MaxLength = 8;
            this.txtDoc.Name = "txtDoc";
            this.txtDoc.Size = new System.Drawing.Size(145, 23);
            this.txtDoc.TabIndex = 3;
            this.txtDoc.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtDoc_KeyPress);
            // 
            // lblDoc
            // 
            this.lblDoc.AutoSize = true;
            this.lblDoc.BackColor = System.Drawing.Color.Transparent;
            this.lblDoc.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblDoc.Location = new System.Drawing.Point(239, 21);
            this.lblDoc.Name = "lblDoc";
            this.lblDoc.Size = new System.Drawing.Size(178, 20);
            this.lblDoc.TabIndex = 0;
            this.lblDoc.Text = "Numero de Documento:";
            // 
            // btnBuscar
            // 
            this.btnBuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBuscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnBuscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btnBuscar.Location = new System.Drawing.Point(735, 12);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(51, 45);
            this.btnBuscar.TabIndex = 4;
            this.btnBuscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBuscar.UseVisualStyleBackColor = false;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // btn_asignarnotas
            // 
            this.btn_asignarnotas.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_asignarnotas.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_asignarnotas.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_asignarnotas.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btn_asignarnotas.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_asignarnotas.Location = new System.Drawing.Point(475, 351);
            this.btn_asignarnotas.Name = "btn_asignarnotas";
            this.btn_asignarnotas.Size = new System.Drawing.Size(157, 45);
            this.btn_asignarnotas.TabIndex = 12;
            this.btn_asignarnotas.Text = "Asignar notas";
            this.btn_asignarnotas.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_asignarnotas.UseVisualStyleBackColor = false;
            this.btn_asignarnotas.Click += new System.EventHandler(this.btn_asignarnotas_Click);
            // 
            // btnAlulib
            // 
            this.btnAlulib.BackColor = System.Drawing.Color.PowderBlue;
            this.btnAlulib.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnAlulib.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnAlulib.Image = ((System.Drawing.Image)(resources.GetObject("btnAlulib.Image")));
            this.btnAlulib.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnAlulib.Location = new System.Drawing.Point(270, 351);
            this.btnAlulib.Name = "btnAlulib";
            this.btnAlulib.Size = new System.Drawing.Size(199, 45);
            this.btnAlulib.TabIndex = 12;
            this.btnAlulib.Text = "Alumnos Libres";
            this.btnAlulib.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnAlulib.UseVisualStyleBackColor = false;
            this.btnAlulib.Click += new System.EventHandler(this.btnAlulib_Click);
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(804, 454);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(108, 45);
            this.btnCerrar.TabIndex = 11;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.btnCerrar_Click);
            // 
            // btn_registrarretirosantes
            // 
            this.btn_registrarretirosantes.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_registrarretirosantes.Enabled = false;
            this.btn_registrarretirosantes.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_registrarretirosantes.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_registrarretirosantes.Image = global::Log_in_con_Store_Procedure.Properties.Resources.TomarLista;
            this.btn_registrarretirosantes.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_registrarretirosantes.Location = new System.Drawing.Point(15, 453);
            this.btn_registrarretirosantes.Name = "btn_registrarretirosantes";
            this.btn_registrarretirosantes.Size = new System.Drawing.Size(249, 45);
            this.btn_registrarretirosantes.TabIndex = 10;
            this.btn_registrarretirosantes.Text = "Registrar Retiros Anticipados";
            this.btn_registrarretirosantes.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_registrarretirosantes.UseVisualStyleBackColor = false;
            this.btn_registrarretirosantes.Click += new System.EventHandler(this.btn_registrarretirosantes_Click);
            // 
            // btn_informealumnoDOE
            // 
            this.btn_informealumnoDOE.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_informealumnoDOE.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_informealumnoDOE.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_informealumnoDOE.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Informe;
            this.btn_informealumnoDOE.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_informealumnoDOE.Location = new System.Drawing.Point(14, 402);
            this.btn_informealumnoDOE.Name = "btn_informealumnoDOE";
            this.btn_informealumnoDOE.Size = new System.Drawing.Size(250, 45);
            this.btn_informealumnoDOE.TabIndex = 9;
            this.btn_informealumnoDOE.Text = "Informe del Alumno - DOE";
            this.btn_informealumnoDOE.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_informealumnoDOE.UseVisualStyleBackColor = false;
            this.btn_informealumnoDOE.Click += new System.EventHandler(this.btn_informealumnoDOE_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(804, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 11;
            this.pictureBox1.TabStop = false;
            // 
            // btnModAsistencia
            // 
            this.btnModAsistencia.BackColor = System.Drawing.Color.PowderBlue;
            this.btnModAsistencia.Enabled = false;
            this.btnModAsistencia.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnModAsistencia.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnModAsistencia.Image = global::Log_in_con_Store_Procedure.Properties.Resources.TomarLista;
            this.btnModAsistencia.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnModAsistencia.Location = new System.Drawing.Point(270, 454);
            this.btnModAsistencia.Name = "btnModAsistencia";
            this.btnModAsistencia.Size = new System.Drawing.Size(199, 45);
            this.btnModAsistencia.TabIndex = 8;
            this.btnModAsistencia.Text = "Modificar Asistencia";
            this.btnModAsistencia.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnModAsistencia.UseVisualStyleBackColor = false;
            this.btnModAsistencia.Click += new System.EventHandler(this.btnModAsistencia_Click);
            // 
            // btnInforme
            // 
            this.btnInforme.BackColor = System.Drawing.Color.PowderBlue;
            this.btnInforme.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnInforme.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnInforme.Image = ((System.Drawing.Image)(resources.GetObject("btnInforme.Image")));
            this.btnInforme.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnInforme.Location = new System.Drawing.Point(270, 402);
            this.btnInforme.Name = "btnInforme";
            this.btnInforme.Size = new System.Drawing.Size(199, 45);
            this.btnInforme.TabIndex = 7;
            this.btnInforme.Text = "Informe del Alumno";
            this.btnInforme.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnInforme.UseVisualStyleBackColor = false;
            this.btnInforme.Click += new System.EventHandler(this.btnInforme_Click);
            // 
            // btnEliminar
            // 
            this.btnEliminar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnEliminar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnEliminar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnEliminar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Eliminar;
            this.btnEliminar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnEliminar.Location = new System.Drawing.Point(146, 351);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(118, 45);
            this.btnEliminar.TabIndex = 6;
            this.btnEliminar.Text = "Eliminar";
            this.btnEliminar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnEliminar.UseVisualStyleBackColor = false;
            this.btnEliminar.Click += new System.EventHandler(this.btnEliminar_Click);
            // 
            // btnModificar
            // 
            this.btnModificar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnModificar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnModificar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnModificar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btnModificar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnModificar.Location = new System.Drawing.Point(15, 351);
            this.btnModificar.Name = "btnModificar";
            this.btnModificar.Size = new System.Drawing.Size(125, 45);
            this.btnModificar.TabIndex = 5;
            this.btnModificar.Text = "Modificar";
            this.btnModificar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnModificar.UseVisualStyleBackColor = false;
            this.btnModificar.Click += new System.EventHandler(this.btnModificar_Click);
            // 
            // btn_vernotas
            // 
            this.btn_vernotas.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_vernotas.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_vernotas.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_vernotas.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btn_vernotas.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_vernotas.Location = new System.Drawing.Point(475, 402);
            this.btn_vernotas.Name = "btn_vernotas";
            this.btn_vernotas.Size = new System.Drawing.Size(157, 45);
            this.btn_vernotas.TabIndex = 12;
            this.btn_vernotas.Text = "Ver notas";
            this.btn_vernotas.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_vernotas.UseVisualStyleBackColor = false;
            this.btn_vernotas.Click += new System.EventHandler(this.btn_vernotas_Click);
            // 
            // btn_modificarnotas
            // 
            this.btn_modificarnotas.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_modificarnotas.Enabled = false;
            this.btn_modificarnotas.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_modificarnotas.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_modificarnotas.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btn_modificarnotas.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_modificarnotas.Location = new System.Drawing.Point(475, 453);
            this.btn_modificarnotas.Name = "btn_modificarnotas";
            this.btn_modificarnotas.Size = new System.Drawing.Size(157, 45);
            this.btn_modificarnotas.TabIndex = 12;
            this.btn_modificarnotas.Text = "Modificar notas";
            this.btn_modificarnotas.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_modificarnotas.UseVisualStyleBackColor = false;
            this.btn_modificarnotas.Click += new System.EventHandler(this.btn_modificarnotas_Click);
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.PowderBlue;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.button1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.TomarLista;
            this.button1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button1.Location = new System.Drawing.Point(638, 351);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(157, 45);
            this.button1.TabIndex = 12;
            this.button1.Text = "Promover";
            this.button1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.button1.UseVisualStyleBackColor = false;
            // 
            // buscarAlumno
            // 
            this.AcceptButton = this.btnBuscar;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.ClientSize = new System.Drawing.Size(923, 508);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.btn_vernotas);
            this.Controls.Add(this.btn_modificarnotas);
            this.Controls.Add(this.btn_asignarnotas);
            this.Controls.Add(this.btnAlulib);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.btn_registrarretirosantes);
            this.Controls.Add(this.btn_informealumnoDOE);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.lblDoc);
            this.Controls.Add(this.txtDoc);
            this.Controls.Add(this.txtApel);
            this.Controls.Add(this.txtNom);
            this.Controls.Add(this.lblApel);
            this.Controls.Add(this.lblNom);
            this.Controls.Add(this.btnModAsistencia);
            this.Controls.Add(this.btnInforme);
            this.Controls.Add(this.btnEliminar);
            this.Controls.Add(this.btnModificar);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.dgvLis);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "buscarAlumno";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Buscar Alumno";
            this.Activated += new System.EventHandler(this.buscarAlumno_Activated);
            ((System.ComponentModel.ISupportInitialize)(this.dgvLis)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblNom;
        private System.Windows.Forms.Label lblApel;
        private System.Windows.Forms.Label lblDoc;
        private System.Windows.Forms.Button btnModificar;
        private System.Windows.Forms.Button btnEliminar;
        private System.Windows.Forms.Button btnInforme;
        private System.Windows.Forms.Button btnModAsistencia;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button btn_informealumnoDOE;
        private System.Windows.Forms.Button btn_registrarretirosantes;
        private System.Windows.Forms.Button btnCerrar;
        private System.Windows.Forms.Button btnAlulib;
        public System.Windows.Forms.Button btnBuscar;
        public System.Windows.Forms.TextBox txtNom;
        public System.Windows.Forms.TextBox txtApel;
        public System.Windows.Forms.TextBox txtDoc;
        public System.Windows.Forms.DataGridView dgvLis;
        private System.Windows.Forms.Button btn_asignarnotas;
        private System.Windows.Forms.Button btn_vernotas;
        private System.Windows.Forms.Button btn_modificarnotas;
        private System.Windows.Forms.Button button1;
    }
}