using System.Windows;

namespace FotStats
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Meccsek_Click(object sender, RoutedEventArgs e)
        {
            new MeccsekWindow().Show();
            Close();
        }

        private void Eredmenyek_Click(object sender, RoutedEventArgs e)
        {
            new EredmenyekWindow().Show();
            Close();
        }

        private void Osszeallitasok_Click(object sender, RoutedEventArgs e)
        {
            new OsszeallitasokWindow().Show();
            Close();
        }

        private void Hirek_Click(object sender, RoutedEventArgs e)
        {
            new HirekWindow().Show();
            Close();
        }

        private void Kilepes_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
