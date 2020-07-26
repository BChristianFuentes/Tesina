namespace Log_in_con_Store_Procedure
{
    partial class ModNotas
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
            this.dgv = new System.Windows.Forms.DataGridView();
            this.lbl_info = new System.Windows.Forms.Label();
            this.btn_modificarnota = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txt_nota = new System.Windows.Forms.TextBox();
            this.txt_id = new System.Windows.Forms.TextBox();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // dgv
            // 
            this.dgv.AllowUserToAddRows = false;
            this.dgv.AllowUserToDeleteRows = false;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Location = new System.Drawing.Point(12, 36);
            this.dgv.Name = "dgv";
            this.dgv.Size = new System.Drawing.Size(369, 312);
            this.dgv.TabIndex = 36;
            // 
            // lbl_info
            // 
            this.lbl_info.AutoSize = true;
            this.lbl_info.Location = new System.Drawing.Point(12, 9);
            this.lbl_info.Name = "lbl_info";
            this.lbl_info.Size = new System.Drawing.Size(40, 13);
            this.lbl_info.TabIndex = 37;
            this.lbl_info.Text = "lbl_info";
            // 
            // btn_modificarnota
            // 
            this.btn_modificarnota.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_modificarnota.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_modificarnota.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_modificarnota.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_modificarnota.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btn_modificarnota.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_modificarnota.Location = new System.Drawing.Point(216, 354);
            this.btn_modificarnota.Name = "btn_modificarnota";
            this.btn_modificarnota.Size = new System.Drawing.Size(165, 45);
            this.btn_modificarnota.TabIndex = 39;
            this.btn_modificarnota.Text = "Modificar nota";
            this.btn_modificarnota.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_modificarnota.UseVisualStyleBackColor = false;
            this.btn_modificarnota.Click += new System.EventHandler(this.btn_modificarnota_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 360);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(30, 13);
            this.label1.TabIndex = 40;
            this.label1.Text = "Nota";
            // 
            // txt_nota
            // 
            this.txt_nota.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nota.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nota.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_nota.Location = new System.Drawing.Point(48, 356);
            this.txt_nota.MaxLength = 30;
            this.txt_nota.Name = "txt_nota";
            this.txt_nota.Size = new System.Drawing.Size(165, 23);
            this.txt_nota.TabIndex = 41;
            this.txt_nota.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txt_nota_KeyPress);
            // 
            // txt_id
            // 
            this.txt_id.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_id.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_id.Enabled = false;
            this.txt_id.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_id.Location = new System.Drawing.Point(343, 5);
            this.txt_id.MaxLength = 30;
            this.txt_id.Name = "txt_id";
            this.txt_id.Size = new System.Drawing.Size(38, 23);
            this.txt_id.TabIndex = 42;
            this.txt_id.Visible = false;
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 386);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 13);
            this.label2.TabIndex = 43;
            this.label2.Text = "label2";
            this.label2.Visible = false;
            // 
            // ModNotas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(393, 408);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txt_id);
            this.Controls.Add(this.txt_nota);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btn_modificarnota);
            this.Controls.Add(this.lbl_info);
            this.Controls.Add(this.dgv);
            this.Name = "ModNotas";
            this.Text = "ModNotas";
            this.Load += new System.EventHandler(this.ModNotas_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.DataGridView dgv;
        public System.Windows.Forms.Button btn_modificarnota;
        public System.Windows.Forms.TextBox txt_nota;
        public System.Windows.Forms.Label lbl_info;
        public System.Windows.Forms.Label label1;
        public System.Windows.Forms.TextBox txt_id;
        private System.Windows.Forms.ErrorProvider Error;
        public System.Windows.Forms.Label label2;
    }
}