namespace Log_in_con_Store_Procedure
{
    partial class buscarProfesor
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(buscarProfesor));
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.txt_nom = new System.Windows.Forms.TextBox();
            this.txt_ap = new System.Windows.Forms.TextBox();
            this.txt_doc = new System.Windows.Forms.TextBox();
            this.lbl_nom = new System.Windows.Forms.Label();
            this.lbl_ap = new System.Windows.Forms.Label();
            this.lbl_doc = new System.Windows.Forms.Label();
            this.btn_buscar = new System.Windows.Forms.Button();
            this.dgv_prof = new System.Windows.Forms.DataGridView();
            this.btn_cerrar = new System.Windows.Forms.Button();
            this.btn_eliminar = new System.Windows.Forms.Button();
            this.btn_modificar = new System.Windows.Forms.Button();
            this.btn_asignarmxc = new System.Windows.Forms.Button();
            this.btn_agregar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_prof)).BeginInit();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(664, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 12;
            this.pictureBox1.TabStop = false;
            // 
            // txt_nom
            // 
            this.txt_nom.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nom.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_nom.Location = new System.Drawing.Point(83, 15);
            this.txt_nom.MaxLength = 30;
            this.txt_nom.Name = "txt_nom";
            this.txt_nom.Size = new System.Drawing.Size(130, 23);
            this.txt_nom.TabIndex = 13;
            this.txt_nom.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Txt_nom_KeyPress);
            // 
            // txt_ap
            // 
            this.txt_ap.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_ap.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_ap.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_ap.Location = new System.Drawing.Point(310, 15);
            this.txt_ap.MaxLength = 30;
            this.txt_ap.Name = "txt_ap";
            this.txt_ap.Size = new System.Drawing.Size(130, 23);
            this.txt_ap.TabIndex = 14;
            this.txt_ap.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Txt_ap_KeyPress);
            // 
            // txt_doc
            // 
            this.txt_doc.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_doc.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_doc.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_doc.Location = new System.Drawing.Point(189, 67);
            this.txt_doc.MaxLength = 30;
            this.txt_doc.Name = "txt_doc";
            this.txt_doc.Size = new System.Drawing.Size(130, 23);
            this.txt_doc.TabIndex = 15;
            this.txt_doc.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Txt_doc_KeyPress);
            // 
            // lbl_nom
            // 
            this.lbl_nom.AutoSize = true;
            this.lbl_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_nom.Location = new System.Drawing.Point(12, 15);
            this.lbl_nom.Name = "lbl_nom";
            this.lbl_nom.Size = new System.Drawing.Size(65, 20);
            this.lbl_nom.TabIndex = 16;
            this.lbl_nom.Text = "Nombre";
            // 
            // lbl_ap
            // 
            this.lbl_ap.AutoSize = true;
            this.lbl_ap.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_ap.Location = new System.Drawing.Point(239, 18);
            this.lbl_ap.Name = "lbl_ap";
            this.lbl_ap.Size = new System.Drawing.Size(65, 20);
            this.lbl_ap.TabIndex = 17;
            this.lbl_ap.Text = "Apellido";
            // 
            // lbl_doc
            // 
            this.lbl_doc.AutoSize = true;
            this.lbl_doc.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_doc.Location = new System.Drawing.Point(12, 69);
            this.lbl_doc.Name = "lbl_doc";
            this.lbl_doc.Size = new System.Drawing.Size(171, 20);
            this.lbl_doc.TabIndex = 18;
            this.lbl_doc.Text = "Número de documento";
            // 
            // btn_buscar
            // 
            this.btn_buscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_buscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_buscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_buscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btn_buscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_buscar.Location = new System.Drawing.Point(595, 15);
            this.btn_buscar.Name = "btn_buscar";
            this.btn_buscar.Size = new System.Drawing.Size(49, 45);
            this.btn_buscar.TabIndex = 19;
            this.btn_buscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_buscar.UseVisualStyleBackColor = false;
            this.btn_buscar.Click += new System.EventHandler(this.Btn_buscar_Click);
            // 
            // dgv_prof
            // 
            this.dgv_prof.AllowUserToAddRows = false;
            this.dgv_prof.AllowUserToDeleteRows = false;
            this.dgv_prof.AllowUserToResizeColumns = false;
            this.dgv_prof.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgv_prof.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgv_prof.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_prof.Location = new System.Drawing.Point(12, 109);
            this.dgv_prof.Name = "dgv_prof";
            this.dgv_prof.Size = new System.Drawing.Size(632, 295);
            this.dgv_prof.TabIndex = 20;
            this.dgv_prof.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgv_prof_CellClick);
            // 
            // btn_cerrar
            // 
            this.btn_cerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_cerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_cerrar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_cerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btn_cerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_cerrar.Location = new System.Drawing.Point(664, 418);
            this.btn_cerrar.Name = "btn_cerrar";
            this.btn_cerrar.Size = new System.Drawing.Size(108, 45);
            this.btn_cerrar.TabIndex = 21;
            this.btn_cerrar.Text = "Cerrar";
            this.btn_cerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_cerrar.UseVisualStyleBackColor = false;
            this.btn_cerrar.Click += new System.EventHandler(this.Btn_cerrar_Click);
            // 
            // btn_eliminar
            // 
            this.btn_eliminar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_eliminar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_eliminar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_eliminar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Eliminar;
            this.btn_eliminar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_eliminar.Location = new System.Drawing.Point(302, 415);
            this.btn_eliminar.Name = "btn_eliminar";
            this.btn_eliminar.Size = new System.Drawing.Size(125, 45);
            this.btn_eliminar.TabIndex = 23;
            this.btn_eliminar.Text = "Eliminar";
            this.btn_eliminar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_eliminar.UseVisualStyleBackColor = false;
            this.btn_eliminar.Click += new System.EventHandler(this.Btn_eliminar_Click);
            // 
            // btn_modificar
            // 
            this.btn_modificar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_modificar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_modificar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_modificar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btn_modificar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_modificar.Location = new System.Drawing.Point(157, 415);
            this.btn_modificar.Name = "btn_modificar";
            this.btn_modificar.Size = new System.Drawing.Size(139, 45);
            this.btn_modificar.TabIndex = 22;
            this.btn_modificar.Text = "Modificar";
            this.btn_modificar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_modificar.UseVisualStyleBackColor = false;
            this.btn_modificar.Click += new System.EventHandler(this.Btn_modificar_Click);
            // 
            // btn_asignarmxc
            // 
            this.btn_asignarmxc.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_asignarmxc.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_asignarmxc.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_asignarmxc.Image = ((System.Drawing.Image)(resources.GetObject("btn_asignarmxc.Image")));
            this.btn_asignarmxc.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_asignarmxc.Location = new System.Drawing.Point(433, 415);
            this.btn_asignarmxc.Name = "btn_asignarmxc";
            this.btn_asignarmxc.Size = new System.Drawing.Size(178, 45);
            this.btn_asignarmxc.TabIndex = 24;
            this.btn_asignarmxc.Text = "Asignar a materia";
            this.btn_asignarmxc.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_asignarmxc.UseVisualStyleBackColor = false;
            this.btn_asignarmxc.Click += new System.EventHandler(this.btn_asignarmxc_Click);
            // 
            // btn_agregar
            // 
            this.btn_agregar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_agregar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_agregar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_agregar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btn_agregar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_agregar.Location = new System.Drawing.Point(12, 415);
            this.btn_agregar.Name = "btn_agregar";
            this.btn_agregar.Size = new System.Drawing.Size(139, 45);
            this.btn_agregar.TabIndex = 22;
            this.btn_agregar.Text = "Agregar";
            this.btn_agregar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_agregar.UseVisualStyleBackColor = false;
            this.btn_agregar.Click += new System.EventHandler(this.btn_agregar_Click);
            // 
            // buscarProfesor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.SkyBlue;
            this.ClientSize = new System.Drawing.Size(781, 472);
            this.ControlBox = false;
            this.Controls.Add(this.btn_asignarmxc);
            this.Controls.Add(this.btn_eliminar);
            this.Controls.Add(this.btn_agregar);
            this.Controls.Add(this.btn_modificar);
            this.Controls.Add(this.btn_cerrar);
            this.Controls.Add(this.dgv_prof);
            this.Controls.Add(this.btn_buscar);
            this.Controls.Add(this.lbl_doc);
            this.Controls.Add(this.lbl_ap);
            this.Controls.Add(this.lbl_nom);
            this.Controls.Add(this.txt_doc);
            this.Controls.Add(this.txt_ap);
            this.Controls.Add(this.txt_nom);
            this.Controls.Add(this.pictureBox1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "buscarProfesor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Buscar Profesor";
            this.Load += new System.EventHandler(this.buscarProfesor_Load);
            this.Click += new System.EventHandler(this.buscarProfesor_Click);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_prof)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        public System.Windows.Forms.TextBox txt_nom;
        public System.Windows.Forms.TextBox txt_ap;
        public System.Windows.Forms.TextBox txt_doc;
        private System.Windows.Forms.Label lbl_nom;
        private System.Windows.Forms.Label lbl_ap;
        private System.Windows.Forms.Label lbl_doc;
        public System.Windows.Forms.Button btn_buscar;
        public System.Windows.Forms.DataGridView dgv_prof;
        private System.Windows.Forms.Button btn_cerrar;
        private System.Windows.Forms.Button btn_eliminar;
        private System.Windows.Forms.Button btn_modificar;
        private System.Windows.Forms.Button btn_asignarmxc;
        private System.Windows.Forms.Button btn_agregar;
    }
}