namespace Log_in_con_Store_Procedure
{
    partial class AgregarMateria
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
            this.cmb_esp = new System.Windows.Forms.ComboBox();
            this.lbl_esp = new System.Windows.Forms.Label();
            this.lbl_nom = new System.Windows.Forms.Label();
            this.txt_nommateria = new System.Windows.Forms.TextBox();
            this.btn_agregarmateria = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // cmb_esp
            // 
            this.cmb_esp.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_esp.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_esp.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_esp.FormattingEnabled = true;
            this.cmb_esp.Items.AddRange(new object[] {
            "a"});
            this.cmb_esp.Location = new System.Drawing.Point(118, 90);
            this.cmb_esp.Name = "cmb_esp";
            this.cmb_esp.Size = new System.Drawing.Size(165, 28);
            this.cmb_esp.TabIndex = 32;
            // 
            // lbl_esp
            // 
            this.lbl_esp.AutoSize = true;
            this.lbl_esp.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_esp.Location = new System.Drawing.Point(9, 93);
            this.lbl_esp.Name = "lbl_esp";
            this.lbl_esp.Size = new System.Drawing.Size(103, 20);
            this.lbl_esp.TabIndex = 30;
            this.lbl_esp.Text = "Especialidad:";
            // 
            // lbl_nom
            // 
            this.lbl_nom.AutoSize = true;
            this.lbl_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_nom.Location = new System.Drawing.Point(46, 51);
            this.lbl_nom.Name = "lbl_nom";
            this.lbl_nom.Size = new System.Drawing.Size(66, 20);
            this.lbl_nom.TabIndex = 29;
            this.lbl_nom.Text = "Materia:";
            // 
            // txt_nommateria
            // 
            this.txt_nommateria.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nommateria.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nommateria.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_nommateria.Location = new System.Drawing.Point(118, 49);
            this.txt_nommateria.Name = "txt_nommateria";
            this.txt_nommateria.Size = new System.Drawing.Size(165, 26);
            this.txt_nommateria.TabIndex = 31;
            // 
            // btn_agregarmateria
            // 
            this.btn_agregarmateria.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_agregarmateria.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_agregarmateria.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_agregarmateria.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_agregarmateria.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btn_agregarmateria.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_agregarmateria.Location = new System.Drawing.Point(78, 204);
            this.btn_agregarmateria.Name = "btn_agregarmateria";
            this.btn_agregarmateria.Size = new System.Drawing.Size(176, 45);
            this.btn_agregarmateria.TabIndex = 33;
            this.btn_agregarmateria.Text = "Agregar Materia";
            this.btn_agregarmateria.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_agregarmateria.UseVisualStyleBackColor = false;
            this.btn_agregarmateria.Click += new System.EventHandler(this.btn_agregarmateria_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(316, 24);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 34;
            this.pictureBox1.TabStop = false;
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(316, 204);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(108, 45);
            this.btnCerrar.TabIndex = 35;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.btnCerrar_Click);
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // AgregarMateria
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(436, 261);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.btn_agregarmateria);
            this.Controls.Add(this.cmb_esp);
            this.Controls.Add(this.lbl_esp);
            this.Controls.Add(this.lbl_nom);
            this.Controls.Add(this.txt_nommateria);
            this.Name = "AgregarMateria";
            this.Text = "AgregarMateria";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.ComboBox cmb_esp;
        private System.Windows.Forms.Label lbl_esp;
        private System.Windows.Forms.Label lbl_nom;
        public System.Windows.Forms.TextBox txt_nommateria;
        public System.Windows.Forms.Button btn_agregarmateria;
        private System.Windows.Forms.PictureBox pictureBox1;
        public System.Windows.Forms.Button btnCerrar;
        private System.Windows.Forms.ErrorProvider Error;
    }
}