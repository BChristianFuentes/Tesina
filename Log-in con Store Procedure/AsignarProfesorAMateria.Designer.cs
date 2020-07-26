namespace Log_in_con_Store_Procedure
{
    partial class AsignarProfesorAMateria
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
            this.label2 = new System.Windows.Forms.Label();
            this.txt_nomprof = new System.Windows.Forms.TextBox();
            this.btn_asignarprofesor = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.txt_idprof = new System.Windows.Forms.TextBox();
            this.dgv = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.cmb_curso = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label2.Location = new System.Drawing.Point(16, 23);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(73, 20);
            this.label2.TabIndex = 41;
            this.label2.Text = "Profesor:";
            // 
            // txt_nomprof
            // 
            this.txt_nomprof.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nomprof.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nomprof.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_nomprof.Location = new System.Drawing.Point(103, 21);
            this.txt_nomprof.Name = "txt_nomprof";
            this.txt_nomprof.ReadOnly = true;
            this.txt_nomprof.Size = new System.Drawing.Size(165, 26);
            this.txt_nomprof.TabIndex = 45;
            // 
            // btn_asignarprofesor
            // 
            this.btn_asignarprofesor.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_asignarprofesor.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_asignarprofesor.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_asignarprofesor.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_asignarprofesor.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btn_asignarprofesor.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_asignarprofesor.Location = new System.Drawing.Point(166, 449);
            this.btn_asignarprofesor.Name = "btn_asignarprofesor";
            this.btn_asignarprofesor.Size = new System.Drawing.Size(176, 45);
            this.btn_asignarprofesor.TabIndex = 49;
            this.btn_asignarprofesor.Text = "Asignar Profesor";
            this.btn_asignarprofesor.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_asignarprofesor.UseVisualStyleBackColor = false;
            this.btn_asignarprofesor.Click += new System.EventHandler(this.btn_asignarprofesor_Click);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label8.Location = new System.Drawing.Point(43, 251);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(34, 20);
            this.label8.TabIndex = 23;
            this.label8.Text = "id p";
            this.label8.Visible = false;
            // 
            // txt_idprof
            // 
            this.txt_idprof.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_idprof.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_idprof.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_idprof.Location = new System.Drawing.Point(122, 246);
            this.txt_idprof.Name = "txt_idprof";
            this.txt_idprof.Size = new System.Drawing.Size(165, 26);
            this.txt_idprof.TabIndex = 26;
            this.txt_idprof.Visible = false;
            // 
            // dgv
            // 
            this.dgv.AllowUserToAddRows = false;
            this.dgv.AllowUserToDeleteRows = false;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Location = new System.Drawing.Point(14, 85);
            this.dgv.Name = "dgv";
            this.dgv.Size = new System.Drawing.Size(472, 279);
            this.dgv.TabIndex = 30;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dgv);
            this.groupBox1.Controls.Add(this.cmb_curso);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txt_idprof);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(12, 64);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(492, 379);
            this.groupBox1.TabIndex = 40;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Buscar Materia:";
            // 
            // cmb_curso
            // 
            this.cmb_curso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_curso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_curso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_curso.FormattingEnabled = true;
            this.cmb_curso.Items.AddRange(new object[] {
            "a"});
            this.cmb_curso.Location = new System.Drawing.Point(91, 39);
            this.cmb_curso.Name = "cmb_curso";
            this.cmb_curso.Size = new System.Drawing.Size(150, 28);
            this.cmb_curso.TabIndex = 39;
            this.cmb_curso.SelectedIndexChanged += new System.EventHandler(this.cmb_curso_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(15, 39);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 20);
            this.label1.TabIndex = 34;
            this.label1.Text = "Curso:";
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // AsignarProfesorAMateria
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(518, 506);
            this.Controls.Add(this.btn_asignarprofesor);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txt_nomprof);
            this.Controls.Add(this.groupBox1);
            this.Name = "AsignarProfesorAMateria";
            this.Text = "Asignar Profesor a Materia";
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label2;
        public System.Windows.Forms.TextBox txt_nomprof;
        public System.Windows.Forms.Button btn_asignarprofesor;
        private System.Windows.Forms.Label label8;
        public System.Windows.Forms.TextBox txt_idprof;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox groupBox1;
        public System.Windows.Forms.ComboBox cmb_curso;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ErrorProvider Error;
    }
}