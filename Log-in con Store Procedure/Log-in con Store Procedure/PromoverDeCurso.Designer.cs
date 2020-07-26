namespace Log_in_con_Store_Procedure
{
    partial class PromoverDeCurso
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
            this.txtNom = new System.Windows.Forms.TextBox();
            this.lblNom = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // txtNom
            // 
            this.txtNom.BackColor = System.Drawing.Color.PowderBlue;
            this.txtNom.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtNom.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtNom.Location = new System.Drawing.Point(94, 12);
            this.txtNom.MaxLength = 30;
            this.txtNom.Name = "txtNom";
            this.txtNom.Size = new System.Drawing.Size(130, 23);
            this.txtNom.TabIndex = 3;
            // 
            // lblNom
            // 
            this.lblNom.AutoSize = true;
            this.lblNom.BackColor = System.Drawing.Color.Transparent;
            this.lblNom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lblNom.Location = new System.Drawing.Point(19, 16);
            this.lblNom.Name = "lblNom";
            this.lblNom.Size = new System.Drawing.Size(69, 20);
            this.lblNom.TabIndex = 2;
            this.lblNom.Text = "Nombre:";
            // 
            // PromoverDeCurso
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(379, 441);
            this.Controls.Add(this.txtNom);
            this.Controls.Add(this.lblNom);
            this.Name = "PromoverDeCurso";
            this.Text = "PromoverDeCurso";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.TextBox txtNom;
        private System.Windows.Forms.Label lblNom;
    }
}