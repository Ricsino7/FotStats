using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

namespace FotStats
{
    public partial class HirekWindow : Window
    {
        private const string ConnStr =
            "Server=127.0.0.1;Port=3306;Database=fotstats;User ID=root;Password=;SslMode=None;";

        // Ide tedd a hírek képeit (pl: project mappa /img/news/ )
        private const string NewsImageFolder = "img/news";

        private List<NewsRow> _allNews = new List<NewsRow>();

        public HirekWindow()
        {
            InitializeComponent();
            Loaded += HirekWindow_Loaded;
        }

        private void HirekWindow_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                LoadNewsFromDb();
                ApplyFilter(SearchBox.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Hiba", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Vissza_Click(object sender, RoutedEventArgs e)
        {
            new MainWindow().Show();
            Close();
        }

        private void Frissites_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                LoadNewsFromDb();
                ApplyFilter(SearchBox.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Hiba", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void UjHir_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Új hír felvitel – később (űrlap + INSERT).");
        }

        private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            ApplyFilter(SearchBox.Text);
        }

        private void ApplyFilter(string text)
        {
            string q = (text ?? "").Trim().ToLower();

            IEnumerable<NewsRow> filtered = _allNews;

            if (!string.IsNullOrWhiteSpace(q))
            {
                filtered = _allNews.Where(n =>
                    (n.Cim ?? "").ToLower().Contains(q) ||
                    (n.Forras ?? "").ToLower().Contains(q) ||
                    (n.Osszefoglalo ?? "").ToLower().Contains(q) ||
                    (n.Datum ?? "").ToLower().Contains(q)
                );
            }

            NewsList.ItemsSource = filtered.ToList();
        }

        private void LoadNewsFromDb()
        {
            var list = new List<NewsRow>();

            const string sql = @"
SELECT id, cim, datum, forras, osszefoglalo, kep
FROM news
ORDER BY datum DESC, id DESC;
";

            using (var conn = new MySqlConnection(ConnStr))
            {
                conn.Open();
                using (var cmd = new MySqlCommand(sql, conn))
                using (var r = cmd.ExecuteReader())
                {
                    while (r.Read())
                    {
                        var kep = r["kep"] != null ? r["kep"].ToString() : "";

                        list.Add(new NewsRow
                        {
                            Id = SafeInt(r["id"]),
                            Cim = SafeStr(r["cim"]),
                            Datum = SafeStr(r["datum"]),
                            Forras = SafeStr(r["forras"]),
                            Osszefoglalo = SafeStr(r["osszefoglalo"]),
                            Kep = kep,
                            KepFullPath = MakeImagePath(kep)
                        });
                    }
                }
            }

            _allNews = list;
        }

        private string MakeImagePath(string fileName)
        {
            if (string.IsNullOrWhiteSpace(fileName))
                return NewsImageFolder + "no-image.png";

            return NewsImageFolder + fileName;
        }

        // Ha nem találja a képet, fallback no-image.png
        private void NewsImage_ImageFailed(object sender, ExceptionRoutedEventArgs e)
        {
            try
            {
                var img = sender as System.Windows.Controls.Image;
                if (img == null) return;

                img.Source = new BitmapImage(new Uri(NewsImageFolder + "no-image.png", UriKind.Relative));
            }
            catch { }
        }

        private int SafeInt(object v)
        {
            if (v == null || v == DBNull.Value) return 0;
            int x;
            return int.TryParse(v.ToString(), out x) ? x : 0;
        }

        private string SafeStr(object v)
        {
            if (v == null || v == DBNull.Value) return "";
            return v.ToString();
        }
    }

    public class NewsRow
    {
        public int Id { get; set; }
        public string Cim { get; set; }
        public string Datum { get; set; }
        public string Forras { get; set; }
        public string Osszefoglalo { get; set; }
        public string Kep { get; set; }

        // ezt használja az Image
        public string KepFullPath { get; set; }
    }
}
