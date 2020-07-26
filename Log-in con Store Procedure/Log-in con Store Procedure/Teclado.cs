using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Log_in_con_Store_Procedure
{
    class Teclado
    {
        
        public void SoloCaracteres(KeyPressEventArgs T)
        {
            if (Char.IsLetter(T.KeyChar))
            {
                T.Handled = false;
            }
            else
            {
                if (Char.IsSeparator(T.KeyChar))
                {
                    T.Handled = false;
                }
                else
                {
                    if (Char.IsControl(T.KeyChar))
                    {
                        T.Handled = false;
                    }
                    else
                    {
                        T.Handled = true;
                    }
                }
            }
        }
        public void SoloNumeros(KeyPressEventArgs T)
        {
            if (Char.IsDigit(T.KeyChar))
            {
                T.Handled = false;
            }
            else
            {
                if (Char.IsSeparator(T.KeyChar))
                {
                    T.Handled = false;
                }
                else
                {
                    if (Char.IsControl(T.KeyChar))
                    {
                        T.Handled = false;
                    }
                    else
                    {
                        T.Handled = true;
                    }
                }
            }
        }
    }
}
