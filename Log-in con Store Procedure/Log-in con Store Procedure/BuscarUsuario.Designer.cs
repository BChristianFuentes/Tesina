namespace Log_in_con_Store_Procedure
{
    partial class BuscarUsuario
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BuscarUsuario));
            this.txtApel = new System.Windows.Forms.TextBox();
            this.txtNom = new System.Windows.Forms.TextBox();
            this.lblApel = new System.Windows.Forms.Label();
            this.lblNom = new System.Windows.Forms.Label();
            this.lblListado = new System.Windows.Forms.Label();
            this.dgvLis = new System.Windows.Forms.DataGridView();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.btnEliminar = new System.Windows.Forms.Button();
            this.btnModificar = new System.Windows.Forms.Button();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvLis)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // txtApel
            // 
            this.txtApel.BackColor = System.Drawing.Color.PowderBlue;
            this.txtApel.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtApel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtApel.Location = new System.Drawing.Point(332, 43);
            this.txtApel.MaxLength = 30;
            this.txtApel.Name = "txtApel";
            this.txtApel.Size = new System.Drawing.Size(100, 23);
            this.txtApel.TabIndex = 6;
            this.txtApel.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtApel_KeyPress);
            // 
            // txtNom
            // 
            this.txtNom.BackColor = System.Drawing.Color.PowderBlue;
            this.txtNom.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtNom.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtNom.Location = new System.Drawing.Point(110, 43);
            this.txtNom.MaxLength = 30;
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(100, 23);
            this.txtNom.TabIndex = 5;
            this.txtNom.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtNom_KeyPress);
            // 
            // lblApel
            // 
            this.lblApel.AutoSize = true;
            this.lblApel.BackColor = System.Drawing.Color.Transparent;
            this.lblApel.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblApel.Location = new System.Drawing.Point(254, 44);
            this.lblApel.Name = "lblApel";
            this.lblApel.Size = new System.Drawing.Size(72, 19);
            this.lblApel.TabIndex = 3;
            this.lblApel.Text = "Apellido:";
            // 
            // lblNom
            // 
            this.lblNom.AutoSize = true;
            this.lblNom.BackColor = System.Drawing.Color.Transparent;
            this.lblNom.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblNom.Location = new System.Drawing.Point(36, 44);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(68, 19);
            this.lblNom.TabIndex = 4;
            this.lblNom.Text = "Nombre:";
            // 
            // lblListado
            // 
            this.lblListado.AutoSize = true;
            this.lblListado.BackColor = System.Drawing.Color.Transparent;
            this.lblListado.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblListado.Location = new System.Drawing.Point(12, 122);
            this.lblListado.Name = "lblListado";
            this.lblListado.Size = new System.Drawing.Size(65, 19);
            this.lblListado.TabIndex = 7;
            this.lblListado.Text = "Listado:";
            // 
            // dgvLis
            // 
            this.dgvLis.AllowUserToAddRows = false;
            this.dgvLis.AllowUserToDeleteRows = false;
            this.dgvLis.AllowUserToResizeColumns = false;
            this.dgvLis.AllowUserToResizeRows = false;
            this.dgvLis.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvLis.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvLis.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dgvLis.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dgvLis.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgvLis.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvLis.Location = new System.Drawing.Point(16, 149);
            this.dgvLis.MultiSelect = false;
            this.dgvLis.Name = "dgvLis";
            this.dgvLis.ReadOnly = true;
            this.dgvLis.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvLis.Size = new System.Drawing.Size(770, 250);
            this.dgvLis.StandardTab = true;
            this.dgvLis.TabIndex = 8;
            this.dgvLis.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvLis_CellContentClick);
            this.dgvLis.SelectionChanged += new System.EventHandler(this.dgvLis_SelectionChanged);
            // 
            // btnBuscar
            // 
            this.btnBuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnBuscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBuscar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnBuscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btnBuscar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBuscar.Location = new System.Drawing.Point(505, 43);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(125, 45);
            this.btnBuscar.TabIndex = 12;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBuscar.UseVisualStyleBackColor = false;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // btnAgregar
            // 
            this.btnAgregar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnAgregar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnAgregar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnAgregar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btnAgregar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnAgregar.Location = new System.Drawing.Point(16, 405);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(125, 45);
            this.btnAgregar.TabIndex = 16;
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnAgregar.UseVisualStyleBackColor = false;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // btnEliminar
            // 
            this.btnEliminar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnEliminar.Enabled = false;
            this.btnEliminar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnEliminar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnEliminar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Eliminar;
            this.btnEliminar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnEliminar.Location = new System.Drawing.Point(278, 405);
            this.btnEliminar.Name = "btnEliminar";
            this.btnEliminar.Size = new System.Drawing.Size(125, 45);
            this.btnEliminar.TabIndex = 15;
            this.btnEliminar.Text = "Eliminar";
            this.btnEliminar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnEliminar.UseVisualStyleBackColor = false;
            this.btnEliminar.Click += new System.EventHandler(this.btnEliminar_Click);
            // 
            // btnModificar
            // 
            this.btnModificar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnModificar.Enabled = false;
            this.btnModificar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnModificar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnModificar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btnModificar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnModificar.Location = new System.Drawing.Point(147, 405);
            this.btnModificar.Name = "btnModificar";
            this.btnModificar.Size = new System.Drawing.Size(125, 45);
            this.btnModificar.TabIndex = 14;
            this.btnModificar.Text = "Modificar";
            this.btnModificar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnModificar.UseVisualStyleBackColor = false;
            this.btnModificar.Click += new System.EventHandler(this.btnModificar_Click);
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(661, 419);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 17;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(678, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(108, 131);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 13;
            this.pictureBox1.TabStop = false;
            // 
            // BuscarUsuario
            // 
            this.AcceptButton = this.btnBuscar;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(798, 476);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.btnAgregar);
            this.Controls.Add(this.btnEliminar);
            this.Controls.Add(this.btnModificar);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.lblListado);
            this.Controls.Add(this.dgvLis);
            this.Controls.Add(this.txtApel);
            this.Controls.Add(this.txtNom);
            this.Controls.Add(this.lblApel);
            this.Controls.Add(this.lblNom);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "BuscarUsuario";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Buscar Usuario";
            this.Activated += new System.EventHandler(this.BuscarUsuario_Activated);
            this.Load += new System.EventHandler(this.BuscarUsuario_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.BuscarUsuario_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.dgvLis)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtApel;
        private System.Windows.Forms.TextBox txtNom;
        private System.Windows.Forms.Label lblApel;
        private System.Windows.Forms.Label lblNom;
        private System.Windows.Forms.Label lblListado;
        private System.Windows.Forms.DataGridView dgvLis;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.Button btnCerrar;
        public System.Windows.Forms.Button btnAgregar;
        public System.Windows.Forms.Button btnEliminar;
        public System.Windows.Forms.Button btnModificar;
    }
}