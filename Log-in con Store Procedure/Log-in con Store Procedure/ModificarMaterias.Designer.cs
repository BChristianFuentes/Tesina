namespace Log_in_con_Store_Procedure
{
    partial class ModificarMaterias
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
            this.txt_nommateria = new System.Windows.Forms.TextBox();
            this.lbl_esp = new System.Windows.Forms.Label();
            this.lbl_nom = new System.Windows.Forms.Label();
            this.dgv = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.cmb_curso = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txt_nomprof = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txt_nomprofbuscar = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txt_apeprofbuscar = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txt_documento = new System.Windows.Forms.TextBox();
            this.txt_idprof = new System.Windows.Forms.TextBox();
            this.dgv_idmax = new System.Windows.Forms.DataGridView();
            this.txt_idmateria = new System.Windows.Forms.TextBox();
            this.txt_idmateriaxcurso = new System.Windows.Forms.TextBox();
            this.txt_idprofesorxmateriaxcurso = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btn_buscar = new System.Windows.Forms.Button();
            this.btn_modificarmateria = new System.Windows.Forms.Button();
            this.errorModMateria = new System.Windows.Forms.ErrorProvider(this.components);
            this.errorModProf = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_idmax)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errorModMateria)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorModProf)).BeginInit();
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
            this.cmb_esp.Location = new System.Drawing.Point(119, 63);
            this.cmb_esp.Name = "cmb_esp";
            this.cmb_esp.Size = new System.Drawing.Size(165, 28);
            this.cmb_esp.TabIndex = 28;
            this.cmb_esp.SelectedIndexChanged += new System.EventHandler(this.cmb_esp_SelectedIndexChanged);
            // 
            // txt_nommateria
            // 
            this.txt_nommateria.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nommateria.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nommateria.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_nommateria.Location = new System.Drawing.Point(119, 22);
            this.txt_nommateria.Name = "txt_nommateria";
            this.txt_nommateria.Size = new System.Drawing.Size(165, 26);
            this.txt_nommateria.TabIndex = 26;
            // 
            // lbl_esp
            // 
            this.lbl_esp.AutoSize = true;
            this.lbl_esp.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_esp.Location = new System.Drawing.Point(10, 66);
            this.lbl_esp.Name = "lbl_esp";
            this.lbl_esp.Size = new System.Drawing.Size(103, 20);
            this.lbl_esp.TabIndex = 25;
            this.lbl_esp.Text = "Especialidad:";
            // 
            // lbl_nom
            // 
            this.lbl_nom.AutoSize = true;
            this.lbl_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_nom.Location = new System.Drawing.Point(47, 24);
            this.lbl_nom.Name = "lbl_nom";
            this.lbl_nom.Size = new System.Drawing.Size(66, 20);
            this.lbl_nom.TabIndex = 23;
            this.lbl_nom.Text = "Materia:";
            // 
            // dgv
            // 
            this.dgv.AllowUserToAddRows = false;
            this.dgv.AllowUserToDeleteRows = false;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Location = new System.Drawing.Point(14, 97);
            this.dgv.Name = "dgv";
            this.dgv.Size = new System.Drawing.Size(472, 277);
            this.dgv.TabIndex = 30;
            this.dgv.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgv_CellContentClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(58, 115);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 20);
            this.label1.TabIndex = 25;
            this.label1.Text = "Curso:";
            // 
            // cmb_curso
            // 
            this.cmb_curso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_curso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_curso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_curso.FormattingEnabled = true;
            this.cmb_curso.Items.AddRange(new object[] {
            "a"});
            this.cmb_curso.Location = new System.Drawing.Point(119, 112);
            this.cmb_curso.Name = "cmb_curso";
            this.cmb_curso.Size = new System.Drawing.Size(165, 28);
            this.cmb_curso.TabIndex = 28;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label2.Location = new System.Drawing.Point(40, 159);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(73, 20);
            this.label2.TabIndex = 23;
            this.label2.Text = "Profesor:";
            // 
            // txt_nomprof
            // 
            this.txt_nomprof.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nomprof.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nomprof.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_nomprof.Location = new System.Drawing.Point(119, 159);
            this.txt_nomprof.Name = "txt_nomprof";
            this.txt_nomprof.ReadOnly = true;
            this.txt_nomprof.Size = new System.Drawing.Size(165, 26);
            this.txt_nomprof.TabIndex = 26;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label3.Location = new System.Drawing.Point(321, 49);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(69, 20);
            this.label3.TabIndex = 23;
            this.label3.Text = "Nombre:";
            // 
            // txt_nomprofbuscar
            // 
            this.txt_nomprofbuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nomprofbuscar.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nomprofbuscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_nomprofbuscar.Location = new System.Drawing.Point(396, 47);
            this.txt_nomprofbuscar.Name = "txt_nomprofbuscar";
            this.txt_nomprofbuscar.Size = new System.Drawing.Size(120, 26);
            this.txt_nomprofbuscar.TabIndex = 26;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label4.Location = new System.Drawing.Point(321, 86);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(69, 20);
            this.label4.TabIndex = 23;
            this.label4.Text = "Apellido:";
            // 
            // txt_apeprofbuscar
            // 
            this.txt_apeprofbuscar.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_apeprofbuscar.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_apeprofbuscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_apeprofbuscar.Location = new System.Drawing.Point(396, 83);
            this.txt_apeprofbuscar.Name = "txt_apeprofbuscar";
            this.txt_apeprofbuscar.Size = new System.Drawing.Size(120, 26);
            this.txt_apeprofbuscar.TabIndex = 26;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label5.Location = new System.Drawing.Point(537, 51);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(41, 20);
            this.label5.TabIndex = 23;
            this.label5.Text = "DNI:";
            // 
            // txt_documento
            // 
            this.txt_documento.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_documento.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_documento.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_documento.Location = new System.Drawing.Point(584, 47);
            this.txt_documento.Name = "txt_documento";
            this.txt_documento.Size = new System.Drawing.Size(120, 26);
            this.txt_documento.TabIndex = 26;
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
            // dgv_idmax
            // 
            this.dgv_idmax.AllowUserToAddRows = false;
            this.dgv_idmax.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_idmax.Location = new System.Drawing.Point(324, 137);
            this.dgv_idmax.Name = "dgv_idmax";
            this.dgv_idmax.Size = new System.Drawing.Size(291, 202);
            this.dgv_idmax.TabIndex = 30;
            this.dgv_idmax.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgv_CellContentClick);
            // 
            // txt_idmateria
            // 
            this.txt_idmateria.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_idmateria.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_idmateria.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_idmateria.Location = new System.Drawing.Point(122, 214);
            this.txt_idmateria.Name = "txt_idmateria";
            this.txt_idmateria.Size = new System.Drawing.Size(165, 26);
            this.txt_idmateria.TabIndex = 26;
            this.txt_idmateria.Visible = false;
            // 
            // txt_idmateriaxcurso
            // 
            this.txt_idmateriaxcurso.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_idmateriaxcurso.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_idmateriaxcurso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_idmateriaxcurso.Location = new System.Drawing.Point(122, 182);
            this.txt_idmateriaxcurso.Name = "txt_idmateriaxcurso";
            this.txt_idmateriaxcurso.Size = new System.Drawing.Size(165, 26);
            this.txt_idmateriaxcurso.TabIndex = 26;
            this.txt_idmateriaxcurso.Visible = false;
            // 
            // txt_idprofesorxmateriaxcurso
            // 
            this.txt_idprofesorxmateriaxcurso.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_idprofesorxmateriaxcurso.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_idprofesorxmateriaxcurso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.txt_idprofesorxmateriaxcurso.Location = new System.Drawing.Point(122, 278);
            this.txt_idprofesorxmateriaxcurso.Name = "txt_idprofesorxmateriaxcurso";
            this.txt_idprofesorxmateriaxcurso.ReadOnly = true;
            this.txt_idprofesorxmateriaxcurso.Size = new System.Drawing.Size(165, 26);
            this.txt_idprofesorxmateriaxcurso.TabIndex = 26;
            this.txt_idprofesorxmateriaxcurso.Visible = false;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label6.Location = new System.Drawing.Point(43, 182);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(53, 20);
            this.label6.TabIndex = 23;
            this.label6.Text = "id mxc";
            this.label6.Visible = false;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label7.Location = new System.Drawing.Point(43, 214);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(38, 20);
            this.label7.TabIndex = 23;
            this.label7.Text = "id m";
            this.label7.Visible = false;
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
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label9.Location = new System.Drawing.Point(43, 280);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(69, 20);
            this.label9.TabIndex = 23;
            this.label9.Text = "id pxmxc";
            this.label9.Visible = false;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dgv);
            this.groupBox1.Controls.Add(this.txt_idprofesorxmateriaxcurso);
            this.groupBox1.Controls.Add(this.txt_idmateria);
            this.groupBox1.Controls.Add(this.txt_idmateriaxcurso);
            this.groupBox1.Controls.Add(this.txt_idprof);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(303, 22);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(492, 379);
            this.groupBox1.TabIndex = 31;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Modificar Profesor:";
            // 
            // btn_buscar
            // 
            this.btn_buscar.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_buscar.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_buscar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_buscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_buscar.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Buscar;
            this.btn_buscar.Location = new System.Drawing.Point(734, 49);
            this.btn_buscar.Name = "btn_buscar";
            this.btn_buscar.Size = new System.Drawing.Size(55, 40);
            this.btn_buscar.TabIndex = 29;
            this.btn_buscar.UseVisualStyleBackColor = false;
            this.btn_buscar.Click += new System.EventHandler(this.btn_buscar_Click);
            // 
            // btn_modificarmateria
            // 
            this.btn_modificarmateria.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_modificarmateria.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_modificarmateria.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_modificarmateria.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_modificarmateria.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btn_modificarmateria.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_modificarmateria.Location = new System.Drawing.Point(78, 351);
            this.btn_modificarmateria.Name = "btn_modificarmateria";
            this.btn_modificarmateria.Size = new System.Drawing.Size(176, 45);
            this.btn_modificarmateria.TabIndex = 29;
            this.btn_modificarmateria.Text = "Modificar Materia";
            this.btn_modificarmateria.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_modificarmateria.UseVisualStyleBackColor = false;
            this.btn_modificarmateria.Click += new System.EventHandler(this.btn_modificarmateria_Click);
            // 
            // errorModMateria
            // 
            this.errorModMateria.ContainerControl = this;
            // 
            // errorModProf
            // 
            this.errorModProf.ContainerControl = this;
            // 
            // ModificarMaterias
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(803, 406);
            this.Controls.Add(this.btn_buscar);
            this.Controls.Add(this.btn_modificarmateria);
            this.Controls.Add(this.cmb_curso);
            this.Controls.Add(this.cmb_esp);
            this.Controls.Add(this.txt_apeprofbuscar);
            this.Controls.Add(this.txt_documento);
            this.Controls.Add(this.txt_nomprofbuscar);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.lbl_esp);
            this.Controls.Add(this.lbl_nom);
            this.Controls.Add(this.txt_nomprof);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dgv_idmax);
            this.Controls.Add(this.txt_nommateria);
            this.MaximizeBox = false;
            this.Name = "ModificarMaterias";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Modificar Materia";
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_idmax)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errorModMateria)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorModProf)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        public System.Windows.Forms.ComboBox cmb_esp;
        private System.Windows.Forms.Label lbl_esp;
        private System.Windows.Forms.Label lbl_nom;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.Label label1;
        public System.Windows.Forms.ComboBox cmb_curso;
        public System.Windows.Forms.Button btn_buscar;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txt_nomprofbuscar;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txt_apeprofbuscar;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txt_documento;
        private System.Windows.Forms.DataGridView dgv_idmax;
        public System.Windows.Forms.Button btn_modificarmateria;
        public System.Windows.Forms.TextBox txt_nommateria;
        public System.Windows.Forms.TextBox txt_nomprof;
        public System.Windows.Forms.TextBox txt_idprof;
        public System.Windows.Forms.TextBox txt_idmateria;
        public System.Windows.Forms.TextBox txt_idmateriaxcurso;
        public System.Windows.Forms.TextBox txt_idprofesorxmateriaxcurso;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ErrorProvider errorModMateria;
        private System.Windows.Forms.ErrorProvider errorModProf;
    }
}