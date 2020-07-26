namespace Log_in_con_Store_Procedure
{
    partial class AgregarModificarProfesor
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AgregarModificarProfesor));
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.lbl_nom = new System.Windows.Forms.Label();
            this.lbl_ape = new System.Windows.Forms.Label();
            this.lbl_fnac = new System.Windows.Forms.Label();
            this.lbl_tel = new System.Windows.Forms.Label();
            this.lbl_mail = new System.Windows.Forms.Label();
            this.lbl_tdoc = new System.Windows.Forms.Label();
            this.lbl_doc = new System.Windows.Forms.Label();
            this.txt_nom = new System.Windows.Forms.TextBox();
            this.txt_ap = new System.Windows.Forms.TextBox();
            this.txt_tel = new System.Windows.Forms.TextBox();
            this.txt_doc = new System.Windows.Forms.TextBox();
            this.cmb_tdoc = new System.Windows.Forms.ComboBox();
            this.dtp_fecha = new System.Windows.Forms.DateTimePicker();
            this.cmb_estado = new System.Windows.Forms.ComboBox();
            this.lbl_estado = new System.Windows.Forms.Label();
            this.btn_modificar = new System.Windows.Forms.Button();
            this.btn_agregar = new System.Windows.Forms.Button();
            this.btn_cerrar = new System.Windows.Forms.Button();
            this.txt_id = new System.Windows.Forms.TextBox();
            this.lbl_id = new System.Windows.Forms.Label();
            this.txt_mail = new System.Windows.Forms.TextBox();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(533, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 20;
            this.pictureBox1.TabStop = false;
            // 
            // lbl_nom
            // 
            this.lbl_nom.AutoSize = true;
            this.lbl_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_nom.Location = new System.Drawing.Point(13, 41);
            this.lbl_nom.Name = "lbl_nom";
            this.lbl_nom.Size = new System.Drawing.Size(65, 20);
            this.lbl_nom.TabIndex = 21;
            this.lbl_nom.Text = "Nombre";
            // 
            // lbl_ape
            // 
            this.lbl_ape.AutoSize = true;
            this.lbl_ape.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_ape.Location = new System.Drawing.Point(13, 80);
            this.lbl_ape.Name = "lbl_ape";
            this.lbl_ape.Size = new System.Drawing.Size(65, 20);
            this.lbl_ape.TabIndex = 22;
            this.lbl_ape.Text = "Apellido";
            // 
            // lbl_fnac
            // 
            this.lbl_fnac.AutoSize = true;
            this.lbl_fnac.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_fnac.Location = new System.Drawing.Point(13, 123);
            this.lbl_fnac.Name = "lbl_fnac";
            this.lbl_fnac.Size = new System.Drawing.Size(157, 20);
            this.lbl_fnac.TabIndex = 23;
            this.lbl_fnac.Text = "Fecha de nacimiento";
            // 
            // lbl_tel
            // 
            this.lbl_tel.AutoSize = true;
            this.lbl_tel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_tel.Location = new System.Drawing.Point(13, 163);
            this.lbl_tel.Name = "lbl_tel";
            this.lbl_tel.Size = new System.Drawing.Size(71, 20);
            this.lbl_tel.TabIndex = 24;
            this.lbl_tel.Text = "Telefono";
            // 
            // lbl_mail
            // 
            this.lbl_mail.AutoSize = true;
            this.lbl_mail.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_mail.Location = new System.Drawing.Point(13, 204);
            this.lbl_mail.Name = "lbl_mail";
            this.lbl_mail.Size = new System.Drawing.Size(37, 20);
            this.lbl_mail.TabIndex = 25;
            this.lbl_mail.Text = "Mail";
            // 
            // lbl_tdoc
            // 
            this.lbl_tdoc.AutoSize = true;
            this.lbl_tdoc.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_tdoc.Location = new System.Drawing.Point(12, 255);
            this.lbl_tdoc.Name = "lbl_tdoc";
            this.lbl_tdoc.Size = new System.Drawing.Size(145, 20);
            this.lbl_tdoc.TabIndex = 26;
            this.lbl_tdoc.Text = "Tipo de documento";
            // 
            // lbl_doc
            // 
            this.lbl_doc.AutoSize = true;
            this.lbl_doc.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_doc.Location = new System.Drawing.Point(319, 252);
            this.lbl_doc.Name = "lbl_doc";
            this.lbl_doc.Size = new System.Drawing.Size(92, 20);
            this.lbl_doc.TabIndex = 27;
            this.lbl_doc.Text = "Documento";
            // 
            // txt_nom
            // 
            this.txt_nom.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nom.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_nom.Location = new System.Drawing.Point(98, 42);
            this.txt_nom.MaxLength = 20;
            this.txt_nom.Name = "txt_nom";
            this.txt_nom.Size = new System.Drawing.Size(234, 23);
            this.txt_nom.TabIndex = 29;
            this.txt_nom.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Txt_nom_KeyPress);
            // 
            // txt_ap
            // 
            this.txt_ap.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_ap.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_ap.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_ap.Location = new System.Drawing.Point(98, 77);
            this.txt_ap.MaxLength = 20;
            this.txt_ap.Name = "txt_ap";
            this.txt_ap.Size = new System.Drawing.Size(234, 23);
            this.txt_ap.TabIndex = 30;
            this.txt_ap.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Txt_ap_KeyPress);
            // 
            // txt_tel
            // 
            this.txt_tel.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_tel.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_tel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_tel.Location = new System.Drawing.Point(98, 163);
            this.txt_tel.MaxLength = 10;
            this.txt_tel.Name = "txt_tel";
            this.txt_tel.Size = new System.Drawing.Size(155, 23);
            this.txt_tel.TabIndex = 31;
            this.txt_tel.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Txt_tel_KeyPress);
            // 
            // txt_doc
            // 
            this.txt_doc.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_doc.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_doc.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_doc.Location = new System.Drawing.Point(417, 252);
            this.txt_doc.MaxLength = 10;
            this.txt_doc.Name = "txt_doc";
            this.txt_doc.Size = new System.Drawing.Size(147, 23);
            this.txt_doc.TabIndex = 33;
            this.txt_doc.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Txt_doc_KeyPress);
            // 
            // cmb_tdoc
            // 
            this.cmb_tdoc.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_tdoc.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_tdoc.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_tdoc.FormattingEnabled = true;
            this.cmb_tdoc.Items.AddRange(new object[] {
            "a"});
            this.cmb_tdoc.Location = new System.Drawing.Point(163, 249);
            this.cmb_tdoc.Name = "cmb_tdoc";
            this.cmb_tdoc.Size = new System.Drawing.Size(150, 28);
            this.cmb_tdoc.TabIndex = 34;
            // 
            // dtp_fecha
            // 
            this.dtp_fecha.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.dtp_fecha.Location = new System.Drawing.Point(176, 118);
            this.dtp_fecha.Name = "dtp_fecha";
            this.dtp_fecha.Size = new System.Drawing.Size(267, 26);
            this.dtp_fecha.TabIndex = 35;
            // 
            // cmb_estado
            // 
            this.cmb_estado.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_estado.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_estado.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_estado.FormattingEnabled = true;
            this.cmb_estado.Items.AddRange(new object[] {
            "a"});
            this.cmb_estado.Location = new System.Drawing.Point(98, 297);
            this.cmb_estado.Name = "cmb_estado";
            this.cmb_estado.Size = new System.Drawing.Size(150, 28);
            this.cmb_estado.TabIndex = 36;
            // 
            // lbl_estado
            // 
            this.lbl_estado.AutoSize = true;
            this.lbl_estado.BackColor = System.Drawing.Color.Transparent;
            this.lbl_estado.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_estado.Location = new System.Drawing.Point(16, 300);
            this.lbl_estado.Name = "lbl_estado";
            this.lbl_estado.Size = new System.Drawing.Size(60, 20);
            this.lbl_estado.TabIndex = 37;
            this.lbl_estado.Text = "Estado";
            // 
            // btn_modificar
            // 
            this.btn_modificar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_modificar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_modificar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_modificar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_modificar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btn_modificar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_modificar.Location = new System.Drawing.Point(20, 399);
            this.btn_modificar.Name = "btn_modificar";
            this.btn_modificar.Size = new System.Drawing.Size(125, 45);
            this.btn_modificar.TabIndex = 39;
            this.btn_modificar.Text = "Modificar";
            this.btn_modificar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_modificar.UseVisualStyleBackColor = false;
            this.btn_modificar.Click += new System.EventHandler(this.Btn_modificar_Click);
            // 
            // btn_agregar
            // 
            this.btn_agregar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_agregar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_agregar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_agregar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_agregar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btn_agregar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_agregar.Location = new System.Drawing.Point(20, 399);
            this.btn_agregar.Name = "btn_agregar";
            this.btn_agregar.Size = new System.Drawing.Size(125, 45);
            this.btn_agregar.TabIndex = 38;
            this.btn_agregar.Text = "Agregar";
            this.btn_agregar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_agregar.UseVisualStyleBackColor = false;
            this.btn_agregar.Click += new System.EventHandler(this.Btn_agregar_Click);
            // 
            // btn_cerrar
            // 
            this.btn_cerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_cerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_cerrar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_cerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btn_cerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_cerrar.Location = new System.Drawing.Point(439, 399);
            this.btn_cerrar.Name = "btn_cerrar";
            this.btn_cerrar.Size = new System.Drawing.Size(125, 45);
            this.btn_cerrar.TabIndex = 40;
            this.btn_cerrar.Text = "Cerrar";
            this.btn_cerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_cerrar.UseVisualStyleBackColor = false;
            this.btn_cerrar.Click += new System.EventHandler(this.Btn_cerrar_Click);
            // 
            // txt_id
            // 
            this.txt_id.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_id.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_id.Enabled = false;
            this.txt_id.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_id.Location = new System.Drawing.Point(98, 13);
            this.txt_id.MaxLength = 4;
            this.txt_id.Name = "txt_id";
            this.txt_id.Size = new System.Drawing.Size(234, 23);
            this.txt_id.TabIndex = 42;
            this.txt_id.Visible = false;
            // 
            // lbl_id
            // 
            this.lbl_id.AutoSize = true;
            this.lbl_id.Enabled = false;
            this.lbl_id.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_id.Location = new System.Drawing.Point(13, 12);
            this.lbl_id.Name = "lbl_id";
            this.lbl_id.Size = new System.Drawing.Size(26, 20);
            this.lbl_id.TabIndex = 41;
            this.lbl_id.Text = "ID";
            // 
            // txt_mail
            // 
            this.txt_mail.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_mail.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_mail.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_mail.Location = new System.Drawing.Point(79, 205);
            this.txt_mail.Name = "txt_mail";
            this.txt_mail.Size = new System.Drawing.Size(234, 23);
            this.txt_mail.TabIndex = 43;
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // AgregarModificarProfesor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(653, 469);
            this.ControlBox = false;
            this.Controls.Add(this.txt_mail);
            this.Controls.Add(this.txt_id);
            this.Controls.Add(this.lbl_id);
            this.Controls.Add(this.btn_cerrar);
            this.Controls.Add(this.btn_modificar);
            this.Controls.Add(this.btn_agregar);
            this.Controls.Add(this.cmb_estado);
            this.Controls.Add(this.lbl_estado);
            this.Controls.Add(this.dtp_fecha);
            this.Controls.Add(this.cmb_tdoc);
            this.Controls.Add(this.txt_doc);
            this.Controls.Add(this.txt_tel);
            this.Controls.Add(this.txt_ap);
            this.Controls.Add(this.txt_nom);
            this.Controls.Add(this.lbl_doc);
            this.Controls.Add(this.lbl_tdoc);
            this.Controls.Add(this.lbl_mail);
            this.Controls.Add(this.lbl_tel);
            this.Controls.Add(this.lbl_fnac);
            this.Controls.Add(this.lbl_ape);
            this.Controls.Add(this.lbl_nom);
            this.Controls.Add(this.pictureBox1);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AgregarModificarProfesor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "AgregarModificarProfesor";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lbl_nom;
        private System.Windows.Forms.Label lbl_ape;
        private System.Windows.Forms.Label lbl_fnac;
        private System.Windows.Forms.Label lbl_tel;
        private System.Windows.Forms.Label lbl_mail;
        private System.Windows.Forms.Label lbl_tdoc;
        private System.Windows.Forms.Label lbl_doc;
        public System.Windows.Forms.TextBox txt_nom;
        public System.Windows.Forms.TextBox txt_ap;
        public System.Windows.Forms.TextBox txt_tel;
        public System.Windows.Forms.TextBox txt_doc;
        public System.Windows.Forms.ComboBox cmb_tdoc;
        public System.Windows.Forms.DateTimePicker dtp_fecha;
        public System.Windows.Forms.ComboBox cmb_estado;
        public System.Windows.Forms.Label lbl_estado;
        public System.Windows.Forms.Button btn_modificar;
        public System.Windows.Forms.Button btn_agregar;
        public System.Windows.Forms.Button btn_cerrar;
        public System.Windows.Forms.TextBox txt_id;
        public System.Windows.Forms.Label lbl_id;
        public System.Windows.Forms.TextBox txt_mail;
        private System.Windows.Forms.ErrorProvider Error;
    }
}