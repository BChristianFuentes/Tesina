namespace Log_in_con_Store_Procedure
{
    partial class AgregarModificarMotivos
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AgregarModificarMotivos));
            this.txtVal = new System.Windows.Forms.TextBox();
            this.txtMot = new System.Windows.Forms.TextBox();
            this.txtObs = new System.Windows.Forms.TextBox();
            this.lblId = new System.Windows.Forms.Label();
            this.lblComp = new System.Windows.Forms.Label();
            this.lblVal = new System.Windows.Forms.Label();
            this.lblMot = new System.Windows.Forms.Label();
            this.lvlObs = new System.Windows.Forms.Label();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.btnMod = new System.Windows.Forms.Button();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.lblDesc = new System.Windows.Forms.Label();
            this.txtDesc = new System.Windows.Forms.TextBox();
            this.lblSub = new System.Windows.Forms.Label();
            this.lblEve = new System.Windows.Forms.Label();
            this.cmbEve = new System.Windows.Forms.ComboBox();
            this.cmbSub = new System.Windows.Forms.ComboBox();
            this.cmbConput = new System.Windows.Forms.ComboBox();
            this.txtId = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // txtVal
            // 
            this.txtVal.BackColor = System.Drawing.Color.PowderBlue;
            this.txtVal.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtVal.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtVal.Location = new System.Drawing.Point(162, 210);
            this.txtVal.Name = "txtVal";
            this.txtVal.Size = new System.Drawing.Size(150, 27);
            this.txtVal.TabIndex = 5;
            // 
            // txtMot
            // 
            this.txtMot.BackColor = System.Drawing.Color.PowderBlue;
            this.txtMot.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtMot.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtMot.Location = new System.Drawing.Point(162, 41);
            this.txtMot.MaxLength = 30;
            this.txtMot.Name = "txtMot";
            this.txtMot.Size = new System.Drawing.Size(150, 27);
            this.txtMot.TabIndex = 2;
            // 
            // txtObs
            // 
            this.txtObs.BackColor = System.Drawing.Color.PowderBlue;
            this.txtObs.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtObs.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtObs.Location = new System.Drawing.Point(162, 334);
            this.txtObs.MaxLength = 255;
            this.txtObs.Multiline = true;
            this.txtObs.Name = "txtObs";
            this.txtObs.Size = new System.Drawing.Size(246, 73);
            this.txtObs.TabIndex = 8;
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblId.Location = new System.Drawing.Point(125, 5);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(29, 19);
            this.lblId.TabIndex = 5;
            this.lblId.Text = "Id:";
            this.lblId.Visible = false;
            // 
            // lblComp
            // 
            this.lblComp.AutoSize = true;
            this.lblComp.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblComp.Location = new System.Drawing.Point(59, 252);
            this.lblComp.Name = "lblComp";
            this.lblComp.Size = new System.Drawing.Size(97, 19);
            this.lblComp.TabIndex = 5;
            this.lblComp.Text = "Computable:";
            this.lblComp.Click += new System.EventHandler(this.lblComp_Click);
            // 
            // lblVal
            // 
            this.lblVal.AutoSize = true;
            this.lblVal.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblVal.Location = new System.Drawing.Point(27, 210);
            this.lblVal.Name = "lblVal";
            this.lblVal.Size = new System.Drawing.Size(129, 19);
            this.lblVal.TabIndex = 5;
            this.lblVal.Text = "Valor de la Falta:";
            // 
            // lblMot
            // 
            this.lblMot.AutoSize = true;
            this.lblMot.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblMot.Location = new System.Drawing.Point(66, 44);
            this.lblMot.Name = "lblMot";
            this.lblMot.Size = new System.Drawing.Size(83, 19);
            this.lblMot.TabIndex = 5;
            this.lblMot.Text = "Asistencia:";
            // 
            // lvlObs
            // 
            this.lvlObs.AutoSize = true;
            this.lvlObs.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lvlObs.Location = new System.Drawing.Point(34, 334);
            this.lvlObs.Name = "lvlObs";
            this.lvlObs.Size = new System.Drawing.Size(111, 19);
            this.lvlObs.TabIndex = 5;
            this.lvlObs.Text = "Observaciones:";
            this.lvlObs.Click += new System.EventHandler(this.lvlObs_Click);
            // 
            // btnAgregar
            // 
            this.btnAgregar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnAgregar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnAgregar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnAgregar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btnAgregar.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.btnAgregar.Location = new System.Drawing.Point(162, 437);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(125, 45);
            this.btnAgregar.TabIndex = 10;
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnAgregar.UseVisualStyleBackColor = false;
            this.btnAgregar.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnMod
            // 
            this.btnMod.BackColor = System.Drawing.Color.PowderBlue;
            this.btnMod.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnMod.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnMod.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btnMod.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.btnMod.Location = new System.Drawing.Point(162, 437);
            this.btnMod.Name = "btnMod";
            this.btnMod.Size = new System.Drawing.Size(125, 45);
            this.btnMod.TabIndex = 9;
            this.btnMod.Text = "Modificar";
            this.btnMod.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnMod.UseVisualStyleBackColor = false;
            this.btnMod.Click += new System.EventHandler(this.button2_Click);
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(428, 456);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 11;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(445, 12);
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
            // lblDesc
            // 
            this.lblDesc.AutoSize = true;
            this.lblDesc.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblDesc.Location = new System.Drawing.Point(56, 82);
            this.lblDesc.Name = "lblDesc";
            this.lblDesc.Size = new System.Drawing.Size(94, 19);
            this.lblDesc.TabIndex = 14;
            this.lblDesc.Text = "Descripcion:";
            // 
            // txtDesc
            // 
            this.txtDesc.BackColor = System.Drawing.Color.PowderBlue;
            this.txtDesc.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtDesc.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtDesc.Location = new System.Drawing.Point(162, 82);
            this.txtDesc.MaxLength = 255;
            this.txtDesc.Multiline = true;
            this.txtDesc.Name = "txtDesc";
            this.txtDesc.Size = new System.Drawing.Size(246, 73);
            this.txtDesc.TabIndex = 3;
            // 
            // lblSub
            // 
            this.lblSub.AutoSize = true;
            this.lblSub.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblSub.Location = new System.Drawing.Point(75, 171);
            this.lblSub.Name = "lblSub";
            this.lblSub.Size = new System.Drawing.Size(81, 19);
            this.lblSub.TabIndex = 15;
            this.lblSub.Text = "Actividad:";
            // 
            // lblEve
            // 
            this.lblEve.AutoSize = true;
            this.lblEve.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblEve.Location = new System.Drawing.Point(94, 294);
            this.lblEve.Name = "lblEve";
            this.lblEve.Size = new System.Drawing.Size(62, 19);
            this.lblEve.TabIndex = 16;
            this.lblEve.Text = "Evento:";
            // 
            // cmbEve
            // 
            this.cmbEve.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbEve.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbEve.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbEve.FormattingEnabled = true;
            this.cmbEve.Items.AddRange(new object[] {
            "a"});
            this.cmbEve.Location = new System.Drawing.Point(162, 291);
            this.cmbEve.Name = "cmbEve";
            this.cmbEve.Size = new System.Drawing.Size(150, 27);
            this.cmbEve.TabIndex = 7;
            // 
            // cmbSub
            // 
            this.cmbSub.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbSub.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbSub.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbSub.FormattingEnabled = true;
            this.cmbSub.Items.AddRange(new object[] {
            "a"});
            this.cmbSub.Location = new System.Drawing.Point(162, 168);
            this.cmbSub.Name = "cmbSub";
            this.cmbSub.Size = new System.Drawing.Size(150, 27);
            this.cmbSub.TabIndex = 4;
            // 
            // cmbConput
            // 
            this.cmbConput.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbConput.Cursor = System.Windows.Forms.Cursors.Default;
            this.cmbConput.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbConput.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbConput.FormattingEnabled = true;
            this.cmbConput.Items.AddRange(new object[] {
            "Si",
            "No"});
            this.cmbConput.Location = new System.Drawing.Point(162, 249);
            this.cmbConput.Name = "cmbConput";
            this.cmbConput.Size = new System.Drawing.Size(150, 27);
            this.cmbConput.TabIndex = 6;
            // 
            // txtId
            // 
            this.txtId.BackColor = System.Drawing.Color.PowderBlue;
            this.txtId.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtId.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtId.Location = new System.Drawing.Point(162, 5);
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(150, 27);
            this.txtId.TabIndex = 1;
            this.txtId.Visible = false;
            // 
            // AgregarModificarMotivos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(565, 513);
            this.ControlBox = false;
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.cmbConput);
            this.Controls.Add(this.cmbSub);
            this.Controls.Add(this.cmbEve);
            this.Controls.Add(this.lblEve);
            this.Controls.Add(this.lblSub);
            this.Controls.Add(this.lblDesc);
            this.Controls.Add(this.txtDesc);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.btnMod);
            this.Controls.Add(this.btnAgregar);
            this.Controls.Add(this.lvlObs);
            this.Controls.Add(this.lblMot);
            this.Controls.Add(this.lblVal);
            this.Controls.Add(this.lblComp);
            this.Controls.Add(this.lblId);
            this.Controls.Add(this.txtObs);
            this.Controls.Add(this.txtMot);
            this.Controls.Add(this.txtVal);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AgregarModificarMotivos";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "AgregarMotivos";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.AgregarMotivos_FormClosing);
            this.Load += new System.EventHandler(this.AgregarMotivos_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.AgregarMotivos_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.Label lblComp;
        private System.Windows.Forms.Label lblVal;
        private System.Windows.Forms.Label lblMot;
        private System.Windows.Forms.Label lvlObs;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button btnCerrar;
        private System.Windows.Forms.ErrorProvider Error;
        private System.Windows.Forms.Label lblDesc;
        private System.Windows.Forms.Label lblEve;
        private System.Windows.Forms.Label lblSub;
        public System.Windows.Forms.ComboBox cmbSub;
        public System.Windows.Forms.ComboBox cmbEve;
        public System.Windows.Forms.ComboBox cmbConput;
        public System.Windows.Forms.TextBox txtVal;
        public System.Windows.Forms.TextBox txtMot;
        public System.Windows.Forms.TextBox txtObs;
        public System.Windows.Forms.TextBox txtDesc;
        public System.Windows.Forms.TextBox txtId;
        public System.Windows.Forms.Button btnAgregar;
        public System.Windows.Forms.Button btnMod;
    }
}