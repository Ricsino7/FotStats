using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace FotStats
{
    public partial class OsszeallitasokWindow : Window
    {
        private const string ConnStr =
            "Server=127.0.0.1;Port=3306;Database=fotstats;User ID=root;Password=;SslMode=None;";

        private List<OsszTeamWithPlayers> _teams = new List<OsszTeamWithPlayers>();

        public OsszeallitasokWindow()
        {
            InitializeComponent();
            Loaded += OsszeallitasokWindow_Loaded;
        }

        private async void OsszeallitasokWindow_Loaded(object sender, RoutedEventArgs e)
        {
            await LoadTeamsWithPlayersAsync();
        }

        private void Vissza_Click(object sender, RoutedEventArgs e)
        {
            new MainWindow().Show();
            Close();
        }

        private async void Frissites_Click(object sender, RoutedEventArgs e)
        {
            await LoadTeamsWithPlayersAsync();
        }

        private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            ApplyTeamFilter(SearchBox.Text);
        }

        private async Task LoadTeamsWithPlayersAsync()
        {
            try
            {
                var teamsMap = new Dictionary<int, OsszTeamWithPlayers>();

                const string sql = @"
SELECT
  c.id  AS CsapatId,
  c.nev AS CsapatNev,
  c.kep AS Kepek,
  j.id  AS JatekosId,
  j.nev AS JatekosNev,
  j.poszt AS JatekosPoszt,
  j.nemzetiseg AS JatekosNemzetiseg
FROM csapatok c
LEFT JOIN jatekosok j ON j.csapat_id = c.id
ORDER BY c.nev, j.nev;
";

                using (var conn = new MySqlConnection(ConnStr))
                {
                    await conn.OpenAsync();

                    using (var cmd = new MySqlCommand(sql, conn))
                    using (var r = await cmd.ExecuteReaderAsync())
                    {
                        while (await r.ReadAsync())
                        {
                            int csapatId = Convert.ToInt32(r["CsapatId"]);
                            string csapatNev = r["CsapatNev"]?.ToString() ?? "";
                            string kepek = r["Kepek"]?.ToString() ?? "";

                            if (!teamsMap.TryGetValue(csapatId, out var team))
                            {
                                team = new OsszTeamWithPlayers
                                {
                                    CsapatId = csapatId,
                                    CsapatNev = csapatNev,
                                    Kepek = kepek
                                };
                                teamsMap[csapatId] = team;
                            }

                            // LEFT JOIN miatt lehet NULL játékos
                            if (r["JatekosId"] != DBNull.Value)
                            {
                                team.Jatekosok.Add(new OsszPlayerRow
                                {
                                    Nev = r["JatekosNev"]?.ToString() ?? "",
                                    Poszt = r["JatekosPoszt"]?.ToString() ?? "",
                                    Nemzetiseg = r["JatekosNemzetiseg"]?.ToString() ?? ""
                                });
                            }
                        }
                    }
                }

                _teams = teamsMap.Values
                    .OrderBy(t => t.CsapatNev)
                    .ToList();

                ApplyTeamFilter(SearchBox.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "DB HIBA", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void ApplyTeamFilter(string text)
        {
            string q = (text ?? "").Trim().ToLower();

            IEnumerable<OsszTeamWithPlayers> filtered = _teams;

            if (!string.IsNullOrWhiteSpace(q))
            {
                filtered = _teams.Where(t =>
                    (t.CsapatNev ?? "").ToLower().Contains(q) ||
                    t.Jatekosok.Any(p =>
                        (p.Nev ?? "").ToLower().Contains(q) ||
                        (p.Poszt ?? "").ToLower().Contains(q) ||
                        (p.Nemzetiseg ?? "").ToLower().Contains(q)
                    )
                );
            }

            var list = filtered.ToList();
            TeamsList.ItemsSource = list;

            if (EmptyHint != null)
                EmptyHint.Visibility = list.Count > 0 ? Visibility.Collapsed : Visibility.Visible;
        }
    }

    public class OsszTeamWithPlayers
    {
        public int CsapatId { get; set; }
        public string CsapatNev { get; set; } = "";
        public string Kepek { get; set; } = "";
        public List<OsszPlayerRow> Jatekosok { get; set; } = new List<OsszPlayerRow>();
    }

    public class OsszPlayerRow
    {
        public string Nev { get; set; } = "";
        public string Poszt { get; set; } = "";
        public string Nemzetiseg { get; set; } = "";
    }
}
