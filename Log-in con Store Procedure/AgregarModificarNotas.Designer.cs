namespace Log_in_con_Store_Procedure
{
    partial class AgregarModificarNotas
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
            this.lbl_nom = new System.Windows.Forms.Label();
            this.txt_alumno = new System.Windows.Forms.TextBox();
            this.cmb_curso = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.cmb_cicloelectivo = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.dgv = new System.Windows.Forms.DataGridView();
            this.label3 = new System.Windows.Forms.Label();
            this.cmb_trimestre = new System.Windows.Forms.ComboBox();
            this.btn_modificarnota = new System.Windows.Forms.Button();
            this.btn_asignarnota = new System.Windows.Forms.Button();
            this.txt_idcurso = new System.Windows.Forms.TextBox();
            this.txt_idAXC = new System.Windows.Forms.TextBox();
            this.txt_nota = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txt_ciclo = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.txt_trim = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txt_apell = new System.Windows.Forms.TextBox();
            this.txt_nom = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.txt_idnota = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.txt_idMXC = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.txt_calificacion = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.txt_idPXMXC = new System.Windows.Forms.TextBox();
            this.label14 = new System.Windows.Forms.Label();
            this.Error = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).BeginInit();
            this.SuspendLayout();
            // 
            // lbl_nom
            // 
            this.lbl_nom.AutoSize = true;
            this.lbl_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.lbl_nom.Location = new System.Drawing.Point(44, 58);
            this.lbl_nom.Name = "lbl_nom";
            this.lbl_nom.Size = new System.Drawing.Size(67, 20);
            this.lbl_nom.TabIndex = 18;
            this.lbl_nom.Text = "Alumno:";
            // 
            // txt_alumno
            // 
            this.txt_alumno.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_alumno.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_alumno.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_alumno.Location = new System.Drawing.Point(120, 55);
            this.txt_alumno.MaxLength = 30;
            this.txt_alumno.Name = "txt_alumno";
            this.txt_alumno.Size = new System.Drawing.Size(165, 23);
            this.txt_alumno.TabIndex = 17;
            // 
            // cmb_curso
            // 
            this.cmb_curso.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_curso.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_curso.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_curso.FormattingEnabled = true;
            this.cmb_curso.Items.AddRange(new object[] {
            "a"});
            this.cmb_curso.Location = new System.Drawing.Point(120, 84);
            this.cmb_curso.Name = "cmb_curso";
            this.cmb_curso.Size = new System.Drawing.Size(165, 28);
            this.cmb_curso.TabIndex = 32;
            this.cmb_curso.SelectedIndexChanged += new System.EventHandler(this.cmb_curso_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(56, 94);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 20);
            this.label1.TabIndex = 31;
            this.label1.Text = "Curso:";
            // 
            // cmb_cicloelectivo
            // 
            this.cmb_cicloelectivo.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_cicloelectivo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_cicloelectivo.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_cicloelectivo.FormattingEnabled = true;
            this.cmb_cicloelectivo.Items.AddRange(new object[] {
            "a"});
            this.cmb_cicloelectivo.Location = new System.Drawing.Point(120, 21);
            this.cmb_cicloelectivo.Name = "cmb_cicloelectivo";
            this.cmb_cicloelectivo.Size = new System.Drawing.Size(165, 28);
            this.cmb_cicloelectivo.TabIndex = 34;
            this.cmb_cicloelectivo.SelectedIndexChanged += new System.EventHandler(this.cmb_cicloelectivo_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label2.Location = new System.Drawing.Point(12, 29);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(99, 20);
            this.label2.TabIndex = 33;
            this.label2.Text = "Año electivo:";
            // 
            // dgv
            // 
            this.dgv.AllowUserToAddRows = false;
            this.dgv.AllowUserToDeleteRows = false;
            this.dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv.Location = new System.Drawing.Point(305, 21);
            this.dgv.Name = "dgv";
            this.dgv.Size = new System.Drawing.Size(562, 233);
            this.dgv.TabIndex = 35;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label3.Location = new System.Drawing.Point(32, 155);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(79, 20);
            this.label3.TabIndex = 31;
            this.label3.Text = "Trimestre:";
            // 
            // cmb_trimestre
            // 
            this.cmb_trimestre.BackColor = System.Drawing.Color.PowderBlue;
            this.cmb_trimestre.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmb_trimestre.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cmb_trimestre.FormattingEnabled = true;
            this.cmb_trimestre.Items.AddRange(new object[] {
            "a"});
            this.cmb_trimestre.Location = new System.Drawing.Point(120, 147);
            this.cmb_trimestre.Name = "cmb_trimestre";
            this.cmb_trimestre.Size = new System.Drawing.Size(165, 28);
            this.cmb_trimestre.TabIndex = 32;
            this.cmb_trimestre.SelectedIndexChanged += new System.EventHandler(this.cmb_trimestre_SelectedIndexChanged);
            // 
            // btn_modificarnota
            // 
            this.btn_modificarnota.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_modificarnota.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_modificarnota.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_modificarnota.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_modificarnota.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Modificar;
            this.btn_modificarnota.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_modificarnota.Location = new System.Drawing.Point(81, 209);
            this.btn_modificarnota.Name = "btn_modificarnota";
            this.btn_modificarnota.Size = new System.Drawing.Size(165, 45);
            this.btn_modificarnota.TabIndex = 38;
            this.btn_modificarnota.Text = "Modificar nota";
            this.btn_modificarnota.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_modificarnota.UseVisualStyleBackColor = false;
            this.btn_modificarnota.Click += new System.EventHandler(this.btn_modificarnota_Click);
            // 
            // btn_asignarnota
            // 
            this.btn_asignarnota.BackColor = System.Drawing.Color.PowderBlue;
            this.btn_asignarnota.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btn_asignarnota.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_asignarnota.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.btn_asignarnota.Image = global::Log_in_con_Store_Procedure.Properties.Resources.Agregar;
            this.btn_asignarnota.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_asignarnota.Location = new System.Drawing.Point(81, 209);
            this.btn_asignarnota.Name = "btn_asignarnota";
            this.btn_asignarnota.Size = new System.Drawing.Size(165, 45);
            this.btn_asignarnota.TabIndex = 37;
            this.btn_asignarnota.Text = "Asignar nota";
            this.btn_asignarnota.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_asignarnota.UseVisualStyleBackColor = false;
            this.btn_asignarnota.Click += new System.EventHandler(this.btn_asignarnota_Click);
            // 
            // txt_idcurso
            // 
            this.txt_idcurso.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_idcurso.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_idcurso.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_idcurso.Location = new System.Drawing.Point(433, 180);
            this.txt_idcurso.MaxLength = 30;
            this.txt_idcurso.Name = "txt_idcurso";
            this.txt_idcurso.Size = new System.Drawing.Size(87, 23);
            this.txt_idcurso.TabIndex = 17;
            // 
            // txt_idAXC
            // 
            this.txt_idAXC.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_idAXC.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_idAXC.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_idAXC.Location = new System.Drawing.Point(433, 209);
            this.txt_idAXC.MaxLength = 30;
            this.txt_idAXC.Name = "txt_idAXC";
            this.txt_idAXC.Size = new System.Drawing.Size(87, 23);
            this.txt_idAXC.TabIndex = 17;
            // 
            // txt_nota
            // 
            this.txt_nota.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nota.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nota.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_nota.Location = new System.Drawing.Point(120, 118);
            this.txt_nota.MaxLength = 30;
            this.txt_nota.Name = "txt_nota";
            this.txt_nota.Size = new System.Drawing.Size(165, 23);
            this.txt_nota.TabIndex = 17;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label4.Location = new System.Drawing.Point(64, 121);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(47, 20);
            this.label4.TabIndex = 33;
            this.label4.Text = "Nota:";
            // 
            // txt_ciclo
            // 
            this.txt_ciclo.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_ciclo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_ciclo.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_ciclo.Location = new System.Drawing.Point(764, 181);
            this.txt_ciclo.MaxLength = 30;
            this.txt_ciclo.Name = "txt_ciclo";
            this.txt_ciclo.Size = new System.Drawing.Size(87, 23);
            this.txt_ciclo.TabIndex = 17;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label5.Location = new System.Drawing.Point(373, 212);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(54, 20);
            this.label5.TabIndex = 18;
            this.label5.Text = "idAXC";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label6.Location = new System.Drawing.Point(367, 183);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(60, 20);
            this.label6.TabIndex = 18;
            this.label6.Text = "idcurso";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label7.Location = new System.Drawing.Point(718, 184);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(40, 20);
            this.label7.TabIndex = 18;
            this.label7.Text = "ciclo";
            // 
            // txt_trim
            // 
            this.txt_trim.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_trim.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_trim.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_trim.Location = new System.Drawing.Point(589, 180);
            this.txt_trim.MaxLength = 30;
            this.txt_trim.Name = "txt_trim";
            this.txt_trim.Size = new System.Drawing.Size(87, 23);
            this.txt_trim.TabIndex = 17;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label8.Location = new System.Drawing.Point(530, 184);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(53, 20);
            this.label8.TabIndex = 18;
            this.label8.Text = "IdTrim";
            // 
            // txt_apell
            // 
            this.txt_apell.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_apell.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_apell.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_apell.Location = new System.Drawing.Point(512, 91);
            this.txt_apell.MaxLength = 30;
            this.txt_apell.Name = "txt_apell";
            this.txt_apell.Size = new System.Drawing.Size(87, 23);
            this.txt_apell.TabIndex = 17;
            // 
            // txt_nom
            // 
            this.txt_nom.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_nom.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_nom.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_nom.Location = new System.Drawing.Point(512, 57);
            this.txt_nom.MaxLength = 30;
            this.txt_nom.Name = "txt_nom";
            this.txt_nom.Size = new System.Drawing.Size(87, 23);
            this.txt_nom.TabIndex = 17;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label9.Location = new System.Drawing.Point(443, 60);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(63, 20);
            this.label9.TabIndex = 18;
            this.label9.Text = "nombre";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label10.Location = new System.Drawing.Point(443, 91);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(63, 20);
            this.label10.TabIndex = 18;
            this.label10.Text = "apellido";
            // 
            // txt_idnota
            // 
            this.txt_idnota.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_idnota.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_idnota.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_idnota.Location = new System.Drawing.Point(433, 151);
            this.txt_idnota.MaxLength = 30;
            this.txt_idnota.Name = "txt_idnota";
            this.txt_idnota.Size = new System.Drawing.Size(87, 23);
            this.txt_idnota.TabIndex = 17;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label11.Location = new System.Drawing.Point(372, 154);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(55, 20);
            this.label11.TabIndex = 18;
            this.label11.Text = "idNota";
            // 
            // txt_idMXC
            // 
            this.txt_idMXC.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_idMXC.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_idMXC.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_idMXC.Location = new System.Drawing.Point(589, 151);
            this.txt_idMXC.MaxLength = 30;
            this.txt_idMXC.Name = "txt_idMXC";
            this.txt_idMXC.Size = new System.Drawing.Size(87, 23);
            this.txt_idMXC.TabIndex = 17;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label12.Location = new System.Drawing.Point(527, 154);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(56, 20);
            this.label12.TabIndex = 18;
            this.label12.Text = "idMXC";
            // 
            // txt_calificacion
            // 
            this.txt_calificacion.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_calificacion.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_calificacion.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_calificacion.Location = new System.Drawing.Point(589, 209);
            this.txt_calificacion.MaxLength = 30;
            this.txt_calificacion.Name = "txt_calificacion";
            this.txt_calificacion.Size = new System.Drawing.Size(87, 23);
            this.txt_calificacion.TabIndex = 17;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label13.Location = new System.Drawing.Point(540, 212);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(43, 20);
            this.label13.TabIndex = 18;
            this.label13.Text = "Nota";
            // 
            // txt_idPXMXC
            // 
            this.txt_idPXMXC.BackColor = System.Drawing.Color.PowderBlue;
            this.txt_idPXMXC.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txt_idPXMXC.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txt_idPXMXC.Location = new System.Drawing.Point(764, 151);
            this.txt_idPXMXC.MaxLength = 30;
            this.txt_idPXMXC.Name = "txt_idPXMXC";
            this.txt_idPXMXC.Size = new System.Drawing.Size(87, 23);
            this.txt_idPXMXC.TabIndex = 17;
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label14.Location = new System.Drawing.Point(681, 154);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(77, 20);
            this.label14.TabIndex = 18;
            this.label14.Text = "idPXMXC";
            // 
            // Error
            // 
            this.Error.ContainerControl = this;
            // 
            // AgregarModificarNotas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(879, 266);
            this.Controls.Add(this.dgv);
            this.Controls.Add(this.btn_asignarnota);
            this.Controls.Add(this.cmb_cicloelectivo);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cmb_trimestre);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.cmb_curso);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.lbl_nom);
            this.Controls.Add(this.txt_trim);
            this.Controls.Add(this.txt_nom);
            this.Controls.Add(this.txt_calificacion);
            this.Controls.Add(this.txt_idnota);
            this.Controls.Add(this.txt_idMXC);
            this.Controls.Add(this.txt_idAXC);
            this.Controls.Add(this.txt_nota);
            this.Controls.Add(this.txt_idPXMXC);
            this.Controls.Add(this.txt_ciclo);
            this.Controls.Add(this.txt_apell);
            this.Controls.Add(this.txt_idcurso);
            this.Controls.Add(this.txt_alumno);
            this.Controls.Add(this.btn_modificarnota);
            this.Name = "AgregarModificarNotas";
            this.Text = "Agregar Notas";
            this.Activated += new System.EventHandler(this.AgregarModificarNotas_Activated);
            ((System.ComponentModel.ISupportInitialize)(this.dgv)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Error)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        public System.Windows.Forms.TextBox txt_alumno;
        public System.Windows.Forms.ComboBox cmb_curso;
        public System.Windows.Forms.ComboBox cmb_cicloelectivo;
        public System.Windows.Forms.ComboBox cmb_trimestre;
        public System.Windows.Forms.Button btn_modificarnota;
        public System.Windows.Forms.Button btn_asignarnota;
        public System.Windows.Forms.Label lbl_nom;
        public System.Windows.Forms.Label label1;
        public System.Windows.Forms.Label label2;
        public System.Windows.Forms.Label label3;
        public System.Windows.Forms.TextBox txt_idcurso;
        public System.Windows.Forms.TextBox txt_idAXC;
        public System.Windows.Forms.TextBox txt_nota;
        public System.Windows.Forms.Label label4;
        public System.Windows.Forms.TextBox txt_ciclo;
        public System.Windows.Forms.Label label5;
        public System.Windows.Forms.Label label6;
        public System.Windows.Forms.Label label7;
        public System.Windows.Forms.TextBox txt_trim;
        public System.Windows.Forms.Label label8;
        public System.Windows.Forms.TextBox txt_apell;
        public System.Windows.Forms.TextBox txt_nom;
        public System.Windows.Forms.Label label9;
        public System.Windows.Forms.Label label10;
        public System.Windows.Forms.DataGridView dgv;
        public System.Windows.Forms.TextBox txt_idnota;
        public System.Windows.Forms.Label label11;
        public System.Windows.Forms.TextBox txt_idMXC;
        public System.Windows.Forms.Label label12;
        public System.Windows.Forms.TextBox txt_calificacion;
        public System.Windows.Forms.Label label13;
        public System.Windows.Forms.TextBox txt_idPXMXC;
        public System.Windows.Forms.Label label14;
        private System.Windows.Forms.ErrorProvider Error;
    }
}