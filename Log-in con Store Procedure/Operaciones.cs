using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using MySql.Data.MySqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.OleDb;
using Excel = Microsoft.Office.Interop.Excel;

namespace Log_in_con_Store_Procedure
{
    class Operaciones
    {
        Cargando abrir = new Cargando();
        private string QuitaSep(string cadena)
        {
            string aux;
            aux = cadena.Replace("/", "-");
            aux = aux.Replace(":", "-");
            aux = aux.Replace(".", "-");
            return aux;
        }
        public string NombreArchivo(bool Dia = false, bool Mes = false, bool Año = false, bool Hora = false)
        {
            string Nombre = "";
            if (Dia == true)
            {

            }
            DataTable dt = new DataTable();
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
            }
            MySqlTransaction tran = Global.Conexion.BeginTransaction();
            try
            {
                MySqlCommand comand = new MySqlCommand("Select DAY(CURRENT_DATE) as 'Dia' ,MONTH(CURRENT_DATE) as 'Mes', YEAR(CURRENT_DATE) as 'Anio', CURRENT_TIME as 'Hora'", Global.Conexion);

                comand.ExecuteNonQuery();
                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                adapter.Fill(dt);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo agregar al alumno");
                tran.Rollback();
            }
            Global.Conexion.Close();
            DataRow datos = dt.Rows[0];

            if (dt.Rows.Count > 0)
            {
                if (Dia == true)
                {
                    Nombre = Nombre + " " + datos["Dia"].ToString();
                }
                if (Mes == true)
                {
                    if (!(Nombre == ""))
                    {
                        Nombre = Nombre + "/" + datos["Mes"].ToString();
                    }
                    else
                    {
                        Nombre = Nombre + datos["Mes"].ToString();
                    }
                }
                if (Año == true)
                {
                    if (!(Nombre == ""))
                    {
                        Nombre = Nombre + "/" + datos["Anio"].ToString();
                    }
                    else
                    {
                        Nombre = Nombre + datos["Anio"].ToString();
                    }
                }
                if (Hora == true)
                {
                    if (!(Nombre == ""))
                    {
                        Nombre = Nombre + "-" + datos["Hora"].ToString();
                    }
                    else
                    {
                        Nombre = Nombre + datos["Hora"].ToString();
                    }
                    
                }
                return Nombre;
            }
            return Nombre;
        }
        public static void Ejemplo(DataGridViewCellEventArgs e, DataGridView dtg, Form formulario)
        {
            if (Application.OpenForms.OfType<AgregarModificarAlumnos>().Count() == 0)
            {

                AgregarModificarAlumnos edit = new AgregarModificarAlumnos();
                DataGridViewRow datos = dtg.Rows[e.RowIndex];
                edit.Show();
            }
        }
        public void Espera(bool ac)
        {
            
            if (ac)
            {
                abrir.Show();
            }
            else
            {
                abrir.Hide();
            }
        }
        private string Direccion;
        public void ExportarExcel(DataGridView dtv, String NombreInforme, string nomYcur, bool abrir)
        {
            try
            {
                Espera(abrir);
                
                SaveFileDialog fichero = new SaveFileDialog();
                fichero.Filter = "Excel (*.xlsx)|*.xlsx";

                fichero.FileName = "Archivo Importado";
                Excel.Application aplicacion;
                Excel.Workbook libros_trabajo;
                Excel.Worksheet hoja_trabajo;

                aplicacion = new Excel.Application();
                libros_trabajo = aplicacion.Workbooks.Add();
                hoja_trabajo = (Excel.Worksheet)libros_trabajo.Worksheets.get_Item(1);
                int columna = 0, fila = 0;

                foreach (DataGridViewColumn columnaListado in dtv.Columns)
                {
                    columna++;
                    hoja_trabajo.Cells[1, columna] = columnaListado.Name;
                }
                foreach (DataGridViewRow filaListado in dtv.Rows)
                {
                    fila++;
                    columna = 0;
                    foreach (DataGridViewColumn columnaListado in dtv.Columns)
                    {
                        columna++;
                        hoja_trabajo.Cells[fila + 1, columna] = filaListado.Cells[columnaListado.Name].Value.ToString();
                    }
                }
                hoja_trabajo.Columns.AutoFit();
                string Nombre = NombreInforme + " " + nomYcur + " " + this.NombreArchivo(true, true, true, true);
                Nombre = this.QuitaSep(Nombre);
                libros_trabajo.SaveAs(fichero.FileName = Nombre, Excel.XlFileFormat.xlWorkbookNormal);
                libros_trabajo.Close(true);

                aplicacion.Quit();
                Espera(false);
                if (abrir == true) MessageBox.Show("El archivo se ha exportado satisfactoriamente");

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al exportar la informacion debido a " + ex.ToString());
            }
        }
        public void ImportarExcel(DataGridView dgv)
        {
            try
            {
                OpenFileDialog buscar = new OpenFileDialog() { Filter = "Excel files |*.xlsx", ValidateNames = true };
                buscar.Title = "Seleccione el archivo de Excel";

                if (buscar.ShowDialog() == DialogResult.OK)
                {
                    Direccion = buscar.FileName;
                }

                OleDbConnection cnn = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; data source=" + Direccion + ";Extended Properties='Excel 12.0 Xml;HDR=Yes'");
                cnn.Open();
                OleDbDataAdapter dap = new OleDbDataAdapter("Select * from [Hoja1$]", cnn);
                DataTable dt = new DataTable();
                dap.Fill(dt);
                dgv.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo importar la reincorporación");
            }
        }
        private void ImprimirPDF()
        {/*
            OpenFileDialog buscar = new OpenFileDialog() { Filter = "PDF|*.pdf", ValidateNames = true };
            {
                if (buscar.ShowDialog() == DialogResult.OK)
                {
                    PdfDocument doc = new PdfDocument();
                    doc.LoadFromFile(buscar.FileName);

                    /*
                     
                     Para imprimir pdf de reincorporacion sin buscar pdf, llevar el pdf dentro del proyecto
                     sin poner dentro de ninguna carpeta y poner su direccion ej:

                     doc.LoadFromFile("reincorporacion.pdf");
                      
                    solo es necesario reemplazar esa parte del codigo y borrar arriba de:

                    PdfDocument doc = new PdfDocument();

                    el if y OpenFileDialog ya que servia para buscar y verificar si se encontro el archivo pdf
                    
                    

                    PrintDialog dialogPrint = new PrintDialog();
                    dialogPrint.AllowPrintToFile = true;
                    dialogPrint.AllowSomePages = true;
                    dialogPrint.PrinterSettings.MinimumPage = 1;
                    dialogPrint.PrinterSettings.MaximumPage = doc.Pages.Count;
                    dialogPrint.PrinterSettings.FromPage = 1;
                    dialogPrint.PrinterSettings.ToPage = doc.Pages.Count;

                    if (dialogPrint.ShowDialog() == DialogResult.OK)
                    {
                        //Set the pagenumber which you choose as the start page to print
                        doc.PrintFromPage = dialogPrint.PrinterSettings.FromPage;
                        //Set the pagenumber which you choose as the final page to print
                        doc.PrintToPage = dialogPrint.PrinterSettings.ToPage;
                        //Set the name of the printer which is to print the PDF
                        doc.PrinterName = dialogPrint.PrinterSettings.PrinterName;

                        PrintDocument printDoc = doc.PrintDocument;
                        dialogPrint.Document = printDoc;
                        printDoc.Print();
                    }
                }
            }*/

        }
        public void ExportarDataTable(DataTable dt)
        {
            try
            {
                Espera(true);
                SaveFileDialog fichero = new SaveFileDialog();
                fichero.Filter = "Excel (*.xlsx)|*.xlsx";

                fichero.FileName = "Archivo Importado";
                Excel.Application aplicacion;
                Excel.Workbook libros_trabajo;
                Excel.Worksheet hoja_trabajo;

                aplicacion = new Excel.Application();
                libros_trabajo = aplicacion.Workbooks.Add();
                hoja_trabajo = (Excel.Worksheet)libros_trabajo.Worksheets.get_Item(1);
                int columna = 0, fila = 0;

                foreach (DataColumn col in dt.Columns)//Establece los nombres de las columnas en excel
                {
                    columna++;
                    hoja_trabajo.Cells[1, columna] = col.ColumnName;
                }

                foreach (DataRow row in dt.Rows)
                {
                    fila++;
                    columna = 0;
                    foreach (DataColumn col in dt.Columns)
                    {
                        columna++;
                        hoja_trabajo.Cells[fila + 1, columna] = row[col.ColumnName];
                    }
                    hoja_trabajo.Columns.AutoFit();
                }

                string Nombre = "Informe";
                Nombre = this.QuitaSep(Nombre);
                libros_trabajo.SaveAs(fichero.FileName = Nombre, Excel.XlFileFormat.xlWorkbookNormal);
                libros_trabajo.Close(true);

                aplicacion.Quit();
                Espera(false);
                MessageBox.Show("El archivo se ha exportado satisfactoriamente");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al exportar la informacion debido a: " + ex.ToString());
            }
        }
        public void AbriryCerrar(DataTable dt)
        {//
            string ruta = Environment.CurrentDirectory + "\\Reincorporaciones\\Reincorporacion.xlsx";
            try
            {
                Excel.Application App = new Excel.Application();
                App.Workbooks.Open(ruta);
                
                SaveFileDialog fichero = new SaveFileDialog();
                fichero.Filter = "Excel (*.xlsx)|*.xlsx";

                fichero.FileName = "Archivo Importado";

                //Excel.Application aplicacion;
                Excel.Workbook libros_trabajo;
                Excel.Worksheet hoja_trabajo;

                //aplicacion = new Excel.Application();
                libros_trabajo = App.Workbooks.Item[1];
                hoja_trabajo = (Excel.Worksheet)libros_trabajo.Worksheets.get_Item(1);
                int columna = 0, fila = 0;

                foreach (DataColumn col in dt.Columns)//Establece los nombres de las columnas en excel
                {
                    columna++;
                    App.Cells[1, columna] = col.ColumnName;
                }

                foreach (DataRow row in dt.Rows)
                {
                    fila++;
                    columna = 0;
                    foreach (DataColumn col in dt.Columns)
                    {
                        columna++;
                        App.Cells[fila + 1, columna] = row[col.ColumnName];
                    }
                    App.Columns.AutoFit();
                }

                string Nombre = "Informe";
                Nombre = this.QuitaSep(Nombre);
                libros_trabajo.SaveAs(fichero.FileName = Nombre, Excel.XlFileFormat.xlWorkbookNormal);
                libros_trabajo.Close(true);

                App.Quit();

                MessageBox.Show("El archivo se ha exportado satisfactoriamente");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al exportar la informacion debido a: " + ex.ToString());
            }//
        }
        public void CeldaExacta(DataTable dt)
        {//
            string ruta = Environment.CurrentDirectory + "\\Reincorporaciones\\Reincorporacion.xlsx";
            try
            {
                Excel.Application App = new Excel.Application();
                App.Workbooks.Open(ruta);
                
                SaveFileDialog fichero = new SaveFileDialog();
                fichero.Filter = "Excel (*.xlsx)|*.xlsx";

                fichero.FileName = "Archivo Importado";

                //Excel.Application aplicacion;
                Excel.Workbook libros_trabajo;
                Excel.Worksheet hoja_trabajo;

                //aplicacion = new Excel.Application();
                libros_trabajo = App.Workbooks.Item[1];
                hoja_trabajo = (Excel.Worksheet)libros_trabajo.Worksheets.get_Item(1);
                //int columna = 0, fila = 0;
                /*
                 foreach (DataColumn col in dt.Columns)//Establece los nombres de las columnas en excel
                 {
                     columna++;
                     App.Cells[1, columna] = col.ColumnName;
                 }

                 foreach (DataRow row in dt.Rows)
                 {
                     fila++;
                     columna = 0;
                     foreach (DataColumn col in dt.Columns)
                     {
                         columna++;
                         App.Cells[fila + 1, columna] = row[col.ColumnName];
                     }
                     App.Columns.AutoFit();
                 }*/
                App.Cells[8, 3] = dt.Rows[0][0];
                string Nombre = "Informe";
                Nombre = this.QuitaSep(Nombre);
                libros_trabajo.SaveAs(fichero.FileName = Nombre, Excel.XlFileFormat.xlWorkbookNormal);
                libros_trabajo.Close(true);

                App.Quit();

                MessageBox.Show("El archivo se ha exportado satisfactoriamente");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al exportar la informacion debido a: " + ex.ToString());
            }//
        }
        public void CualitativoCurso(ComboBox cmbcurso, string fecha1, string fecha2, string Curso)//Sebas
        {
            int IdSubmotivo;
            string fecha;
            string curso;
            int TotalRegistros = 0, TotalColumnas = 0;
            int aumento = 0;
            string fechacampo;
            //Guardo los datos de los parametros en variables para trabajar mejor
            curso = Convert.ToString(cmbcurso.SelectedValue);
            DataTable DatosParaUsar = new DataTable();//Declaro el DataTable acá porque lo voy a usar en el for
            //Primer SP
            try
            {
                Global.Conexion.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error de Conexión");
            }
            MySqlTransaction tran = Global.Conexion.BeginTransaction();
            try
            {
                MySqlCommand comand = new MySqlCommand("cursoxcuali1", Global.Conexion, tran);
                comand.CommandType = CommandType.StoredProcedure;
                comand.Parameters.AddWithValue("pidCurso", curso);
                comand.Parameters.AddWithValue("pfecha1", fecha1);
                comand.Parameters.AddWithValue("pfecha2", fecha2);
                comand.ExecuteNonQuery();
                tran.Commit();
                MySqlDataAdapter adapter = new MySqlDataAdapter(comand);

                adapter.Fill(DatosParaUsar);//Lleno el DataTable con el resultado obtenido del SP1
                TotalRegistros = DatosParaUsar.Rows.Count;
                TotalColumnas = DatosParaUsar.Columns.Count;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error en el primer SP");
                tran.Rollback();
            }
            //Fin SP1

            //Ahora creo que libro de excel
            //Luego voy pegando los resultados del sp2
            Cargando Espera = new Cargando();
            Espera.Show();
            SaveFileDialog fichero = new SaveFileDialog();
            fichero.Filter = "Excel (*.xlsx)|*.xlsx";

            fichero.FileName = "Archivo Importado";
            Excel.Application aplicacion;
            Excel.Workbook libros_trabajo;
            Excel.Worksheet hoja_trabajo;

            aplicacion = new Excel.Application();
            libros_trabajo = aplicacion.Workbooks.Add();
            hoja_trabajo = (Excel.Worksheet)libros_trabajo.Worksheets.get_Item(1);
            int columna = 0;



            for (int f = 0; f < TotalRegistros; f++)///For que ejecta el SP2 tantas veces como registros tenga el resultado anterior
            {
                DataTable DatosParaImprimir = new DataTable();//DatosParaImprimir son los resultados listos para imprimir :v
                DataRow datos = DatosParaUsar.Rows[f];//Cada vez que el for avance a la siguiente fila
                IdSubmotivo = Convert.ToInt32(datos["idSubmotivo"]);//Se van a guardar los valores de estos campos
                fecha = datos["fecha"].ToString();//para usarlo como parametro en el SP2
                try
                {
                    MySqlCommand comand = new MySqlCommand("cursoxcuali2", Global.Conexion);
                    comand.CommandType = CommandType.StoredProcedure;
                    comand.Parameters.AddWithValue("pidCurso", curso);
                    comand.Parameters.AddWithValue("pFecha", fecha);
                    comand.Parameters.AddWithValue("pidSubmot", IdSubmotivo);
                    comand.ExecuteNonQuery();
                    //tran.Commit();
                    MySqlDataAdapter adapter = new MySqlDataAdapter(comand);
                    adapter.Fill(DatosParaImprimir);//Resultados del SP2
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error en el segundo SP");
                    //tran.Rollback();
                }

                //EXCEL
                //Acá empiezo a pegar los resultados en excel
                if (DatosParaImprimir.Rows.Count > 0)
                {
                    DataRow omitir = DatosParaImprimir.Rows[0];
                    fechacampo = omitir["fecha"].ToString();//Guardo el valor de la columna fecha
                    DatosParaImprimir.Columns.Remove("fecha");//Borro la columna fecha
                    DatosParaImprimir.Columns["asistencia"].ColumnName = fechacampo;//Establece el nombre de asistencia

                }

                if (f > 0)
                {
                    columna = columna - 3;
                }

                foreach (DataColumn col in DatosParaImprimir.Columns)//Establece los nombres de las columnas en excel
                {
                    columna++;
                    if (col.ColumnName == "fila")
                    {
                        hoja_trabajo.Cells[1, 1] = col.ColumnName;
                    }
                    else
                    {
                        if (col.ColumnName == "nombre")
                        {
                            hoja_trabajo.Cells[1, 3] = col.ColumnName;
                        }
                        else
                        {
                            if (col.ColumnName == "apellido")
                            {
                                hoja_trabajo.Cells[1, 2] = col.ColumnName;
                            }
                            else
                            {
                                hoja_trabajo.Cells[1, columna] = col.ColumnName;
                            }

                        }

                    }

                }
                int filafila = 0;
                foreach (DataRow row in DatosParaImprimir.Rows)
                {
                    //fila++;//aca se establece el valor de la fila por cada ronda
                    filafila = Convert.ToInt32(row["fila"]);
                    columna = aumento;//Y aca el de la columna
                    foreach (DataColumn col in DatosParaImprimir.Columns)
                    {
                        columna++;
                        if (col.ColumnName == "fila")
                        {
                            hoja_trabajo.Cells[filafila + 1, 1] = row[col.ColumnName];
                        }
                        else
                        {
                            if (col.ColumnName == "nombre")
                            {
                                hoja_trabajo.Cells[filafila + 1, 3] = row[col.ColumnName];
                            }
                            else
                            {
                                if (col.ColumnName == "apellido")
                                {
                                    hoja_trabajo.Cells[filafila + 1, 2] = row[col.ColumnName];
                                }
                                else
                                {
                                    hoja_trabajo.Cells[filafila + 1, columna] = row[col.ColumnName];
                                }

                            }

                        }
                    }
                    hoja_trabajo.Columns.AutoFit();
                    //hoja_trabajo.Range["A1"].EntireColumn.Select();
                    Excel.Range borrar = hoja_trabajo.Range["A1"];
                    borrar.EntireColumn.ClearContents();
                    
                }
                aumento += DatosParaImprimir.Columns.Count - 3;//Este acumulador sirve para poner los resultados uno al lado del otro
            }
            Global.Conexion.Close();
            string Nombre = "Informe Cualitativo Curso " + Curso + " " + this.NombreArchivo(true, true, true, true);
            Nombre = this.QuitaSep(Nombre);
            try
            {
                libros_trabajo.SaveAs(fichero.FileName = Nombre, Excel.XlFileFormat.xlWorkbookNormal);
                libros_trabajo.Close(true);

                aplicacion.Quit();
                Espera.Close();
                MessageBox.Show("El archivo se ha exportado satisfactoriamente");
            }
            catch (Exception ex)
            {
                aplicacion.Quit();
                Espera.Close();
                MessageBox.Show(ex.Message, "No se guardó el informe");
            }
            Global.Conexion.Open();
            try//Limpio la tabla temp
            {
                MySqlCommand comand = new MySqlCommand("vaciar temp", Global.Conexion);
                comand.CommandType = CommandType.StoredProcedure;
                comand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error en el segundo SP");
                //tran.Rollback();
            }
            Global.Conexion.Close();

        }

        public void ExportarRein(DataGridView dtv, string nom, string ape, string curso, string turno)
        {
            string ruta = Environment.CurrentDirectory + "\\Reincorporaciones\\Reincorporacion.xlsx";

            //dtv.Columns.Remove("");
            try
            {
                Espera(true);
                Excel.Application App = new Excel.Application();
                App.Workbooks.Open(ruta);

                SaveFileDialog fichero = new SaveFileDialog();
                fichero.Filter = "Excel (*.xlsx)|*.xlsx";

                fichero.FileName = "Archivo Importado";

                //Excel.Application aplicacion;
                Excel.Workbook libros_trabajo;
                Excel.Worksheet hoja_trabajo;

                //aplicacion = new Excel.Application();
                libros_trabajo = App.Workbooks.Item[1];
                hoja_trabajo = (Excel.Worksheet)libros_trabajo.Worksheets.get_Item(1);
                int columna = 2, fila = 6;//c=0 f=0

                App.Cells[3, 7] = ape + ", " + nom;
                App.Cells[4, 3] = curso;
                App.Cells[4, 11] = turno;

                /*
                foreach (DataGridViewColumn columnaListado in dtv.Columns)
                {
                    columna++;
                    hoja_trabajo.Cells[1, columna] = columnaListado.Name;//1
                }
                */
                foreach (DataGridViewRow filaListado in dtv.Rows)
                {
                    fila++;
                    columna = 2;//0
                    foreach (DataGridViewColumn columnaListado in dtv.Columns)
                    {
                        columna++;
                        hoja_trabajo.Cells[fila + 1, columna] = filaListado.Cells[columnaListado.Name].Value.ToString();
                    }
                }

                string Nombre = "Reincorporación " + this.NombreArchivo(true, true, true, true);
                Nombre = this.QuitaSep(Nombre);
                libros_trabajo.SaveAs(fichero.FileName = Nombre, Excel.XlFileFormat.xlWorkbookNormal);
                libros_trabajo.Close(true);

                App.Quit();
                Espera(false);
                MessageBox.Show("El archivo se ha exportado satisfactoriamente");

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al exportar la informacion debido a: " + ex.ToString());
                Espera(false);
            }
        }

        public void ExportarRein1(DataGridView dtv, string nom, string ape, string curso, string turno, string nomycur)
        {
            //string ruta = Environment.CurrentDirectory + "Reincorporacion1.xls";
            string ruta = Environment.CurrentDirectory + "\\Reincorporacion1.xls";

            //dtv.Columns.Remove("");
            try
            {
                Espera(true);
                Excel.Application App = new Excel.Application();
                App.Workbooks.Open(ruta);

                SaveFileDialog fichero = new SaveFileDialog();
                fichero.Filter = "Excel (*.xlsx)|*.xlsx";

                fichero.FileName = "Archivo Importado";

                //Excel.Application aplicacion;
                Excel.Workbook libros_trabajo;
                Excel.Worksheet hoja_trabajo;

                //aplicacion = new Excel.Application();
                libros_trabajo = App.Workbooks.Item[1];
                hoja_trabajo = (Excel.Worksheet)libros_trabajo.Worksheets.get_Item(1);
                int columna = 2, fila = 6;//c=0 f=0

                App.Cells[3, 7] = ape + ", " + nom;
                App.Cells[4, 3] = curso;
                App.Cells[4, 11] = turno;

                /*
                foreach (DataGridViewColumn columnaListado in dtv.Columns)
                {
                    columna++;
                    hoja_trabajo.Cells[1, columna] = columnaListado.Name;//1
                }
                */
                foreach (DataGridViewRow filaListado in dtv.Rows)
                {
                    fila++;
                    columna = 2;//0
                    foreach (DataGridViewColumn columnaListado in dtv.Columns)
                    {
                        columna++;
                        hoja_trabajo.Cells[fila + 1, columna] = filaListado.Cells[columnaListado.Name].Value.ToString();
                    }
                }

                string Nombre = "1º Reincorporación " + nomycur + this.NombreArchivo(true, true, true, true);
                Nombre = this.QuitaSep(Nombre);
                libros_trabajo.SaveAs(fichero.FileName = Nombre, Excel.XlFileFormat.xlWorkbookNormal);
                libros_trabajo.Close(true);

                App.Quit();
                Espera(false);
                MessageBox.Show("El archivo se ha exportado satisfactoriamente");

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al exportar la informacion debido a: " + ex.ToString());
                Espera(false);
            }
        }

        public void ExportarRein2(DataGridView dtv, string nom, string ape, string curso, string turno, string nomycur)
        {
            //string ruta = Environment.CurrentDirectory + "Reincorporacion2.xls";
            string ruta = Environment.CurrentDirectory + "\\Reincorporacion2.xls";

            //dtv.Columns.Remove("");
            try
            {
                Espera(true);
                Excel.Application App = new Excel.Application();
                App.Workbooks.Open(ruta);

                SaveFileDialog fichero = new SaveFileDialog();
                fichero.Filter = "Excel (*.xlsx)|*.xlsx";

                fichero.FileName = "Archivo Importado";

                //Excel.Application aplicacion;
                Excel.Workbook libros_trabajo;
                Excel.Worksheet hoja_trabajo;

                //aplicacion = new Excel.Application();
                libros_trabajo = App.Workbooks.Item[1];
                hoja_trabajo = (Excel.Worksheet)libros_trabajo.Worksheets.get_Item(1);
                int columna = 2, fila = 6;//c=0 f=0

                App.Cells[3, 7] = ape + ", " + nom;
                App.Cells[4, 3] = curso;
                App.Cells[4, 11] = turno;

                /*
                foreach (DataGridViewColumn columnaListado in dtv.Columns)
                {
                    columna++;
                    hoja_trabajo.Cells[1, columna] = columnaListado.Name;//1
                }
                */
                foreach (DataGridViewRow filaListado in dtv.Rows)
                {
                    fila++;
                    columna = 2;//0
                    foreach (DataGridViewColumn columnaListado in dtv.Columns)
                    {
                        columna++;
                        hoja_trabajo.Cells[fila + 1, columna] = filaListado.Cells[columnaListado.Name].Value.ToString();
                    }
                }

                string Nombre = "2º Reincorporación " + nomycur + this.NombreArchivo(true, true, true, true);
                Nombre = this.QuitaSep(Nombre);
                libros_trabajo.SaveAs(fichero.FileName = Nombre, Excel.XlFileFormat.xlWorkbookNormal);
                libros_trabajo.Close(true);

                App.Quit();
                Espera(false);
                MessageBox.Show("El archivo se ha exportado satisfactoriamente");

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al exportar la informacion debido a: " + ex.ToString());
                Espera(false);
            }
        }
    }
}
