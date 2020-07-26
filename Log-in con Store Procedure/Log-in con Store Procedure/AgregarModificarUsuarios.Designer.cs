namespace Log_in_con_Store_Procedure
{
    partial class AgregarModificarUsuarios
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AgregarModificarUsuarios));
            this.txtNom = new System.Windows.Forms.TextBox();
            this.txtApel = new System.Windows.Forms.TextBox();
            this.txtCon = new System.Windows.Forms.TextBox();
            this.lblNom = new System.Windows.Forms.Label();
            this.lblApel = new System.Windows.Forms.Label();
            this.lblCon = new System.Windows.Forms.Label();
            this.lblCargo = new System.Windows.Forms.Label();
            this.btnIng = new System.Windows.Forms.Button();
            this.lblId = new System.Windows.Forms.Label();
            this.txtId = new System.Windows.Forms.TextBox();
            this.btnMod = new System.Windows.Forms.Button();
            this.cmbCargo = new System.Windows.Forms.ComboBox();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnCerrar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // txtNom
            // 
            this.txtNom.BackColor = System.Drawing.Color.PowderBlue;
            this.txtNom.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtNom.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtNom.Location = new System.Drawing.Point(164, 48);
            this.txtNom.MaxLength = 30;
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(150, 27);
            this.txtNom.TabIndex = 1;
            this.txtNom.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtNom_KeyPress);
            // 
            // txtApel
            // 
            this.txtApel.BackColor = System.Drawing.Color.PowderBlue;
            this.txtApel.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtApel.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtApel.Location = new System.Drawing.Point(164, 87);
            this.txtApel.MaxLength = 30;
            this.txtApel.Name = "txtApel";
            this.txtApel.Size = new System.Drawing.Size(150, 27);
            this.txtApel.TabIndex = 2;
            this.txtApel.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtApel_KeyPress);
            // 
            // txtCon
            // 
            this.txtCon.BackColor = System.Drawing.Color.PowderBlue;
            this.txtCon.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtCon.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtCon.Location = new System.Drawing.Point(164, 129);
            this.txtCon.MaxLength = 30;
            this.txtCon.Name = "txtCon";
            this.txtCon.Size = new System.Drawing.Size(150, 27);
            this.txtCon.TabIndex = 3;
            // 
            // lblNom
            // 
            this.lblNom.AutoSize = true;
            this.lblNom.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblNom.Location = new System.Drawing.Point(77, 51);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(68, 19);
            this.lblNom.TabIndex = 1;
            this.lblNom.Text = "Nombre:";
            // 
            // lblApel
            // 
            this.lblApel.AutoSize = true;
            this.lblApel.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblApel.Location = new System.Drawing.Point(77, 90);
            this.lblApel.Name = "lblApel";
            this.lblApel.Size = new System.Drawing.Size(72, 19);
            this.lblApel.TabIndex = 1;
            this.lblApel.Text = "Apellido:";
            // 
            // lblCon
            // 
            this.lblCon.AutoSize = true;
            this.lblCon.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCon.Location = new System.Drawing.Point(54, 132);
            this.lblCon.Name = "lblCon";
            this.lblCon.Size = new System.Drawing.Size(90, 19);
            this.lblCon.TabIndex = 1;
            this.lblCon.Text = "Contraseña:";
            // 
            // lblCargo
            // 
            this.lblCargo.AutoSize = true;
            this.lblCargo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblCargo.Location = new System.Drawing.Point(89, 171);
            this.lblCargo.Name = "lblCargo";
            this.lblCargo.Size = new System.Drawing.Size(53, 19);
            this.lblCargo.TabIndex = 1;
            this.lblCargo.Text = "Cargo:";
            // 
            // btnIng
            // 
            this.btnIng.BackColor = System.Drawing.Color.PowderBlue;
            this.btnIng.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnIng.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnIng.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btnIng.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnIng.Location = new System.Drawing.Point(164, 214);
            this.btnIng.Name = "btnIng";
            this.btnIng.Size = new System.Drawing.Size(125, 45);
            this.btnIng.TabIndex = 5;
            this.btnIng.Text = "Agregar";
            this.btnIng.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnIng.UseVisualStyleBackColor = false;
            this.btnIng.Click += new System.EventHandler(this.button1_Click);
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblId.Location = new System.Drawing.Point(114, 13);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(32, 19);
            this.lblId.TabIndex = 3;
            this.lblId.Text = "ID:";
            this.lblId.Visible = false;
            // 
            // txtId
            // 
            this.txtId.BackColor = System.Drawing.Color.PowderBlue;
            this.txtId.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtId.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.txtId.Location = new System.Drawing.Point(164, 10);
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(150, 27);
            this.txtId.TabIndex = 0;
            this.txtId.Visible = false;
            // 
            // btnMod
            // 
            this.btnMod.BackColor = System.Drawing.Color.PowderBlue;
            this.btnMod.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnMod.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnMod.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btnMod.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnMod.Location = new System.Drawing.Point(164, 214);
            this.btnMod.Name = "btnMod";
            this.btnMod.Size = new System.Drawing.Size(125, 45);
            this.btnMod.TabIndex = 6;
            this.btnMod.Text = "Guardar";
            this.btnMod.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnMod.UseVisualStyleBackColor = false;
            this.btnMod.Click += new System.EventHandler(this.button2_Click);
            // 
            // cmbCargo
            // 
            this.cmbCargo.BackColor = System.Drawing.Color.PowderBlue;
            this.cmbCargo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCargo.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.cmbCargo.FormattingEnabled = true;
            this.cmbCargo.Location = new System.Drawing.Point(164, 168);
            this.cmbCargo.Name = "cmbCargo";
            this.cmbCargo.Size = new System.Drawing.Size(150, 27);
            this.cmbCargo.TabIndex = 4;
            this.cmbCargo.SelectedIndexChanged += new System.EventHandler(this.cmbCargo_SelectedIndexChanged);
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(394, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 11;
            this.pictureBox1.TabStop = false;
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(377, 284);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 7;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.button1_Click_2);
            // 
            // AgregarModificarUsuarios
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(514, 341);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.cmbCargo);
            this.Controls.Add(this.btnMod);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.lblId);
            this.Controls.Add(this.btnIng);
            this.Controls.Add(this.lblCargo);
            this.Controls.Add(this.lblCon);
            this.Controls.Add(this.lblApel);
            this.Controls.Add(this.lblNom);
            this.Controls.Add(this.txtCon);
            this.Controls.Add(this.txtApel);
            this.Controls.Add(this.txtNom);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AgregarModificarUsuarios";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Agregar Usuarios";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.AgregarUsuarios_FormClosing);
            this.Load += new System.EventHandler(this.AgregarUsuarios_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.AgregarUsuarios_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.ErrorProvider Error;
        private System.Windows.Forms.PictureBox pictureBox1;
        public System.Windows.Forms.TextBox txtNom;
        public System.Windows.Forms.TextBox txtApel;
        public System.Windows.Forms.TextBox txtCon;
        public System.Windows.Forms.TextBox txtId;
        public System.Windows.Forms.ComboBox cmbCargo;
        public System.Windows.Forms.Label lblNom;
        public System.Windows.Forms.Label lblApel;
        public System.Windows.Forms.Label lblCon;
        public System.Windows.Forms.Label lblCargo;
        public System.Windows.Forms.Button btnIng;
        public System.Windows.Forms.Label lblId;
        public System.Windows.Forms.Button btnMod;
        private System.Windows.Forms.Button btnCerrar;
    }
}