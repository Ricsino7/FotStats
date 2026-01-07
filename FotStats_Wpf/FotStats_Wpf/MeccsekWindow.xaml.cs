using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace FotStats
{
    public partial class MeccsekWindow : Window
    {
        private const string ConnStr =
            "Server=localhost;Database=fotstats;User ID=root;Password=;SslMode=None;";

        private readonly ObservableCollection<MatchRow> _allMatches =
            new ObservableCollection<MatchRow>();

        public MeccsekWindow()
        {
            InitializeComponent();
            Loaded += async (s, e) => await LoadMatchesFromDbAsync();
        }

        private void Vissza_Click(object sender, RoutedEventArgs e)
        {
            new MainWindow().Show();
            Close();
        }

        private async void Frissites_Click(object sender, RoutedEventArgs e)
        {
            await LoadMatchesFromDbAsync();
        }

        private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            ApplyFilter(SearchBox.Text);
        }

        private async Task LoadMatchesFromDbAsync()
        {
            try
            {
                var rows = await FetchMatchesAsync();

                _allMatches.Clear();
                foreach (var r in rows)
                    _allMatches.Add(r);

                ApplyFilter(SearchBox.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show("DB hiba: " + ex.Message, "Hiba",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void ApplyFilter(string text)
        {
            var q = (text ?? "").Trim().ToLower();

            IEnumerable<MatchRow> filtered = _allMatches;

            if (!string.IsNullOrWhiteSpace(q))
            {
                filtered = _allMatches.Where(m =>
                    (m.Liga ?? "").ToLower().Contains(q) ||
                    (m.Hazai ?? "").ToLower().Contains(q) ||
                    (m.Vendeg ?? "").ToLower().Contains(q) ||
                    (m.Datum ?? "").ToLower().Contains(q) ||
                    (m.Eredmeny ?? "").ToLower().Contains(q)
                );
            }

            var list = filtered.ToList();
            MatchesCards.ItemsSource = list;

            EmptyHint.Visibility = list.Any()
                ? Visibility.Collapsed
                : Visibility.Visible;
        }

        private async Task<List<MatchRow>> FetchMatchesAsync()
        {
            var list = new List<MatchRow>();

            string sql = @"
SELECT
  m.id AS MeccsId,
  DATE_FORMAT(m.datum, '%Y-%m-%d') AS Datum,
  l.nev AS Liga,
  c1.nev AS Hazai,
  c2.nev AS Vendeg,
  IFNULL(m.eredmeny, '') AS Eredmeny
FROM meccsek m
JOIN csapatok c1 ON c1.id = m.csapat1_id
JOIN csapatok c2 ON c2.id = m.csapat2_id
JOIN ligak l ON l.id = m.liga_id
ORDER BY m.datum DESC, m.id DESC;
";


            using (var conn = new MySqlConnection(ConnStr))
            {
                await conn.OpenAsync();

                using (var cmd = new MySqlCommand(sql, conn))
                using (var reader = await cmd.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        list.Add(new MatchRow
                        {
                            Datum = reader["Datum"] != null ? reader["Datum"].ToString() : "",
                            Liga = reader["Liga"] != null ? reader["Liga"].ToString() : "",
                            Hazai = reader["Hazai"] != null ? reader["Hazai"].ToString() : "",
                            Vendeg = reader["Vendeg"] != null ? reader["Vendeg"].ToString() : "",
                            Eredmeny = reader["Eredmeny"] != null ? reader["Eredmeny"].ToString() : ""
                        });
                    }
                }
            }

            return list;
        }
    }

    public class MatchRow
    {
        public string Datum { get; set; } = "";
        public string Liga { get; set; } = "";
        public string Hazai { get; set; } = "";
        public string Vendeg { get; set; } = "";
        public string Eredmeny { get; set; } = "";
    }
}
