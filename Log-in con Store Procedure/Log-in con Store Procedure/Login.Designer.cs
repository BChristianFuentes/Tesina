namespace Log_in_con_Store_Procedure
{
    partial class Login
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Login));
            this.lblCon = new System.Windows.Forms.Label();
            this.txtCon = new System.Windows.Forms.TextBox();
            this.lblUsu = new System.Windows.Forms.Label();
            this.txtUsu = new System.Windows.Forms.TextBox();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.button2 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // lblCon
            // 
            this.lblCon.AutoSize = true;
            this.lblCon.BackColor = System.Drawing.Color.Transparent;
            this.lblCon.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblCon.Location = new System.Drawing.Point(71, 224);
            this.lblCon.Name = "lblCon";
            this.lblCon.Size = new System.Drawing.Size(96, 20);
            this.lblCon.TabIndex = 8;
            this.lblCon.Text = "Contraseña:";
            this.lblCon.Click += new System.EventHandler(this.lblCon_Click);
            // 
            // txtCon
            // 
            this.txtCon.BackColor = System.Drawing.Color.PowderBlue;
            this.txtCon.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtCon.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtCon.Location = new System.Drawing.Point(75, 248);
            this.txtCon.MaxLength = 30;
            this.txtCon.Name = "txtCon";
            this.txtCon.Size = new System.Drawing.Size(108, 23);
            this.txtCon.TabIndex = 7;
            this.txtCon.UseSystemPasswordChar = true;
            // 
            // lblUsu
            // 
            this.lblUsu.AutoSize = true;
            this.lblUsu.BackColor = System.Drawing.Color.Transparent;
            this.lblUsu.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblUsu.Location = new System.Drawing.Point(71, 142);
            this.lblUsu.Name = "lblUsu";
            this.lblUsu.Size = new System.Drawing.Size(68, 20);
            this.lblUsu.TabIndex = 6;
            this.lblUsu.Text = "Usuario:";
            this.lblUsu.Click += new System.EventHandler(this.lblUsu_Click);
            // 
            // txtUsu
            // 
            this.txtUsu.BackColor = System.Drawing.Color.PowderBlue;
            this.txtUsu.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtUsu.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtUsu.Location = new System.Drawing.Point(75, 165);
            this.txtUsu.MaxLength = 30;
            this.txtUsu.Name = "txtUsu";
            this.txtUsu.Size = new System.Drawing.Size(108, 23);
            this.txtUsu.TabIndex = 5;
            this.txtUsu.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtUsu_KeyPress);
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.Color.PowderBlue;
            this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.button2.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.button2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button2.Location = new System.Drawing.Point(131, 354);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(125, 45);
            this.button2.TabIndex = 11;
            this.button2.Text = "Salir";
            this.button2.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.button2.UseVisualStyleBackColor = false;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.LightBlue;
            this.button1.FlatAppearance.BorderColor = System.Drawing.Color.DarkCyan;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.button1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Macri1;
            this.button1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button1.Location = new System.Drawing.Point(75, 291);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(125, 45);
            this.button1.TabIndex = 9;
            this.button1.Text = "Inicio";
            this.button1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(75, 4);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 10;
            this.pictureBox1.TabStop = false;
            // 
            // Login
            // 
            this.AcceptButton = this.button1;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(268, 411);
            this.ControlBox = false;
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.txtUsu);
            this.Controls.Add(this.txtCon);
            this.Controls.Add(this.lblUsu);
            this.Controls.Add(this.lblCon);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "Login";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Iniciar Sesión";
            this.Load += new System.EventHandler(this.Login_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label lblCon;
        private System.Windows.Forms.TextBox txtCon;
        private System.Windows.Forms.Label lblUsu;
        private System.Windows.Forms.TextBox txtUsu;
        private System.Windows.Forms.ErrorProvider Error;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button button2;
    }
}

