namespace Log_in_con_Store_Procedure
{
    partial class AgregarModificarAlertas
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AgregarModificarAlertas));
            this.lblDescAlerta = new System.Windows.Forms.Label();
            this.lblTipoAlerta = new System.Windows.Forms.Label();
            this.txtDescAlerta = new System.Windows.Forms.TextBox();
            this.txtTipoAlerta = new System.Windows.Forms.TextBox();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.btnModificar = new System.Windows.Forms.Button();
            this.lblId = new System.Windows.Forms.Label();
            this.txtId = new System.Windows.Forms.TextBox();
            this.btnCerrar = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // lblDescAlerta
            // 
            this.lblDescAlerta.AutoSize = true;
            this.lblDescAlerta.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblDescAlerta.Location = new System.Drawing.Point(16, 81);
            this.lblDescAlerta.Name = "lblDescAlerta";
            this.lblDescAlerta.Size = new System.Drawing.Size(178, 19);
            this.lblDescAlerta.TabIndex = 0;
            this.lblDescAlerta.Text = "Descripción de la Alerta:";
            // 
            // lblTipoAlerta
            // 
            this.lblTipoAlerta.AutoSize = true;
            this.lblTipoAlerta.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblTipoAlerta.Location = new System.Drawing.Point(82, 52);
            this.lblTipoAlerta.Name = "lblTipoAlerta";
            this.lblTipoAlerta.Size = new System.Drawing.Size(112, 19);
            this.lblTipoAlerta.TabIndex = 0;
            this.lblTipoAlerta.Text = "Tipo de Alerta:";
            // 
            // txtDescAlerta
            // 
            this.txtDescAlerta.BackColor = System.Drawing.Color.PowderBlue;
            this.txtDescAlerta.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtDescAlerta.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtDescAlerta.Location = new System.Drawing.Point(213, 81);
            this.txtDescAlerta.MaxLength = 255;
            this.txtDescAlerta.Multiline = true;
            this.txtDescAlerta.Name = "txtDescAlerta";
            this.txtDescAlerta.Size = new System.Drawing.Size(190, 62);
            this.txtDescAlerta.TabIndex = 1;
            // 
            // txtTipoAlerta
            // 
            this.txtTipoAlerta.BackColor = System.Drawing.Color.PowderBlue;
            this.txtTipoAlerta.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtTipoAlerta.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtTipoAlerta.Location = new System.Drawing.Point(213, 52);
            this.txtTipoAlerta.MaxLength = 30;
            this.txtTipoAlerta.Name = "txtTipoAlerta";
            this.txtTipoAlerta.Size = new System.Drawing.Size(190, 23);
            this.txtTipoAlerta.TabIndex = 1;
            // 
            // btnAgregar
            // 
            this.btnAgregar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnAgregar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnAgregar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnAgregar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btnAgregar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnAgregar.Location = new System.Drawing.Point(225, 150);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(125, 45);
            this.btnAgregar.TabIndex = 2;
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnAgregar.UseVisualStyleBackColor = false;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // btnModificar
            // 
            this.btnModificar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnModificar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnModificar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnModificar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btnModificar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnModificar.Location = new System.Drawing.Point(225, 150);
            this.btnModificar.Name = "btnModificar";
            this.btnModificar.Size = new System.Drawing.Size(125, 45);
            this.btnModificar.TabIndex = 3;
            this.btnModificar.Text = "Modificar";
            this.btnModificar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnModificar.UseVisualStyleBackColor = false;
            this.btnModificar.Click += new System.EventHandler(this.btnModificar_Click);
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.lblId.Location = new System.Drawing.Point(165, 23);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(29, 19);
            this.lblId.TabIndex = 0;
            this.lblId.Text = "Id:";
            this.lblId.Visible = false;
            // 
            // txtId
            // 
            this.txtId.BackColor = System.Drawing.Color.PowderBlue;
            this.txtId.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtId.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtId.Location = new System.Drawing.Point(213, 23);
            this.txtId.Name = "txtId";
            this.txtId.Size = new System.Drawing.Size(190, 23);
            this.txtId.TabIndex = 1;
            this.txtId.Visible = false;
            // 
            // btnCerrar
            // 
            this.btnCerrar.BackColor = System.Drawing.Color.PowderBlue;
            this.btnCerrar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCerrar.Font = new System.Drawing.Font("Bodoni MT", 12F);
            this.btnCerrar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Salir;
            this.btnCerrar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCerrar.Location = new System.Drawing.Point(450, 178);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(125, 45);
            this.btnCerrar.TabIndex = 13;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCerrar.UseVisualStyleBackColor = false;
            this.btnCerrar.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Escudo_colegio1;
            this.pictureBox1.Location = new System.Drawing.Point(467, 12);
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
            // AgregarModificarAlertas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.LightSkyBlue;
            this.ClientSize = new System.Drawing.Size(587, 235);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.btnModificar);
            this.Controls.Add(this.btnAgregar);
            this.Controls.Add(this.txtTipoAlerta);
            this.Controls.Add(this.txtId);
            this.Controls.Add(this.txtDescAlerta);
            this.Controls.Add(this.lblTipoAlerta);
            this.Controls.Add(this.lblId);
            this.Controls.Add(this.lblDescAlerta);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AgregarModificarAlertas";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "AgregarModificarAlertas";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.AgregarModificarAlertas_FormClosing);
            this.Load += new System.EventHandler(this.AgregarModificarAlertas_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.AgregarModificarAlertas_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblDescAlerta;
        private System.Windows.Forms.Label lblTipoAlerta;
        private System.Windows.Forms.TextBox txtDescAlerta;
        private System.Windows.Forms.TextBox txtTipoAlerta;
        private System.Windows.Forms.Button btnAgregar;
        private System.Windows.Forms.Button btnModificar;
        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.TextBox txtId;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button btnCerrar;
        private System.Windows.Forms.ErrorProvider Error;
    }
}