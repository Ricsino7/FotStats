using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace FotStats
{
    public partial class EredmenyekWindow : Window
    {
        private const string ConnStr =
            "Server=127.0.0.1;Port=3306;Database=fotstats;User ID=root;Password=;SslMode=None;";

        public EredmenyekWindow()
        {
            InitializeComponent();
            Loaded += EredmenyekWindow_Loaded;
        }

        private void EredmenyekWindow_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                LoadLigak();
                if (LigaCombo.Items.Count > 0)
                    LigaCombo.SelectedIndex = 0;
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
                var selected = LigaCombo.SelectedItem as LigaItem;
                LoadLigak();

                if (selected != null)
                {
                    var list = LigaCombo.ItemsSource as List<LigaItem>;
                    if (list != null)
                    {
                        for (int i = 0; i < list.Count; i++)
                        {
                            if (list[i].Id == selected.Id)
                            {
                                LigaCombo.SelectedIndex = i;
                                return;
                            }
                        }
                    }
                }

                if (LigaCombo.Items.Count > 0)
                    LigaCombo.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Hiba", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void LigaCombo_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                var liga = LigaCombo.SelectedItem as LigaItem;
                if (liga == null) return;

                LoadTabellaFromCsapatok_AutoColumns(liga.Id);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Hiba", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        // ---------------- Ligák ----------------

        private void LoadLigak()
        {
            var list = new List<LigaItem>();

            const string sql = @"SELECT id, nev FROM ligak ORDER BY nev;";

            using (var conn = new MySqlConnection(ConnStr))
            {
                conn.Open();
                using (var cmd = new MySqlCommand(sql, conn))
                using (var r = cmd.ExecuteReader())
                {
                    while (r.Read())
                    {
                        list.Add(new LigaItem
                        {
                            Id = Convert.ToInt32(r["id"]),
                            Nev = r["nev"] != null ? r["nev"].ToString() : ""
                        });
                    }
                }
            }

            LigaCombo.ItemsSource = list;
            LigaCombo.DisplayMemberPath = "Nev";
            LigaCombo.SelectedValuePath = "Id";
        }

        // ---------------- Tabella: csapatok táblából (AUTO oszlop-illesztés) ----------------

        private void LoadTabellaFromCsapatok_AutoColumns(int ligaId)
        {
            var rows = new List<TabellaRow>();

            using (var conn = new MySqlConnection(ConnStr))
            {
                conn.Open();

                // 1) Lekérjük, milyen oszlopok vannak a csapatok táblában
                var cols = GetColumns(conn, "csapatok");

                // 2) Megpróbáljuk kitalálni, melyik oszlop micsoda (több lehetséges névvel)
                string colHely = Pick(cols, new[] { "helyezes", "hely", "pozicio", "pos", "rank" });
                string colNev = Pick(cols, new[] { "nev", "csapatnev", "csapat_nev", "name" }); // ez szinte biztos "nev"
                string colMeccs = Pick(cols, new[] { "meccs", "meccsek", "lejatszott", "played", "m" });
                string colGy = Pick(cols, new[] { "gyozelem", "gy", "wins", "win" });
                string colD = Pick(cols, new[] { "dontetlen", "d", "draw", "draws" });
                string colV = Pick(cols, new[] { "vereseg", "v", "loss", "losses" });
                string colLG = Pick(cols, new[] { "lg", "lottgol", "lott_gol", "lottgolok", "goals_for", "gf" });
                string colKG = Pick(cols, new[] { "kg", "kapottgol", "kapott_gol", "kapottgolok", "goals_against", "ga" });
                string colPont = Pick(cols, new[] { "pont", "points", "pts" });

                // 3) SQL összeállítás: ami nincs, arra 0-t adunk, így NEM fog elhasalni
                // Fontos: a colNev és liga_id oszlopnak léteznie kell.
                if (string.IsNullOrWhiteSpace(colNev))
                    throw new Exception("A csapatok táblában nem találok csapatnév oszlopot (pl. nev).");

                string sql = @"
SELECT
  " + SqlSelect(colHely, "Helyezes", "0") + @",
  c.`" + colNev + @"` AS Csapat,
  " + SqlSelect(colMeccs, "Meccs", "0") + @",
  " + SqlSelect(colGy, "Gyozelem", "0") + @",
  " + SqlSelect(colD, "Dontetlen", "0") + @",
  " + SqlSelect(colV, "Vereseg", "0") + @",
  " + SqlSelect(colLG, "LottGol", "0") + @",
  " + SqlSelect(colKG, "KapottGol", "0") + @",
  " + SqlSelect(colPont, "Pont", "0") + @"
FROM csapatok c
WHERE c.liga_id = @ligaId
ORDER BY
  " + (string.IsNullOrWhiteSpace(colHely) ? "Pont DESC" : "c.`" + colHely + "` ASC") + @",
  Pont DESC,
  (LottGol - KapottGol) DESC,
  Csapat ASC;
";

                using (var cmd = new MySqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@ligaId", ligaId);

                    using (var r = cmd.ExecuteReader())
                    {
                        while (r.Read())
                        {
                            var tr = new TabellaRow();
                            tr.Helyezes = SafeInt(r["Helyezes"]);
                            tr.Csapat = SafeStr(r["Csapat"]);
                            tr.Meccs = SafeInt(r["Meccs"]);
                            tr.Gyozelem = SafeInt(r["Gyozelem"]);
                            tr.Dontetlen = SafeInt(r["Dontetlen"]);
                            tr.Vereseg = SafeInt(r["Vereseg"]);
                            tr.LottGol = SafeInt(r["LottGol"]);
                            tr.KapottGol = SafeInt(r["KapottGol"]);
                            tr.Pont = SafeInt(r["Pont"]);
                            rows.Add(tr);
                        }
                    }
                }
            }

            // Ha nincs helyezés oszlop a DB-ben, akkor kiosztjuk itt
            bool allZeroHely = rows.All(x => x.Helyezes == 0);
            if (allZeroHely && rows.Count > 0)
            {
                // rendezzük normál tabella logika szerint, majd kiosztjuk
                rows = rows
                    .OrderByDescending(x => x.Pont)
                    .ThenByDescending(x => x.Golkulonbseg)
                    .ThenByDescending(x => x.LottGol)
                    .ThenBy(x => x.Csapat)
                    .ToList();

                for (int i = 0; i < rows.Count; i++)
                    rows[i].Helyezes = i + 1;
            }

            TabellaGrid.ItemsSource = rows;

            if (EmptyHint != null)
                EmptyHint.Visibility = rows.Count > 0 ? Visibility.Collapsed : Visibility.Visible;
        }

        // ---------------- Helpers ----------------

        private List<string> GetColumns(MySqlConnection conn, string table)
        {
            var list = new List<string>();
            using (var cmd = new MySqlCommand("SHOW COLUMNS FROM `" + table + "`;", conn))
            using (var r = cmd.ExecuteReader())
            {
                while (r.Read())
                {
                    // Field oszlop neve: "Field"
                    list.Add(r["Field"].ToString());
                }
            }
            return list;
        }

        private string Pick(List<string> cols, string[] candidates)
        {
            // case-insensitive egyezés
            for (int i = 0; i < candidates.Length; i++)
            {
                string want = candidates[i].ToLower();
                for (int j = 0; j < cols.Count; j++)
                {
                    if ((cols[j] ?? "").ToLower() == want)
                        return cols[j]; // az eredeti névvel térünk vissza
                }
            }
            return null;
        }

        private string SqlSelect(string colName, string alias, string fallbackLiteral)
        {
            if (string.IsNullOrWhiteSpace(colName))
                return fallbackLiteral + " AS " + alias;

            return "IFNULL(c.`" + colName + "`, 0) AS " + alias;
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

    public class LigaItem
    {
        public int Id { get; set; }
        public string Nev { get; set; }
        public override string ToString() { return Nev; }
    }

    public class TabellaRow
    {
        public int Helyezes { get; set; }
        public string Csapat { get; set; }

        public int Meccs { get; set; }
        public int Gyozelem { get; set; }
        public int Dontetlen { get; set; }
        public int Vereseg { get; set; }

        public int LottGol { get; set; }
        public int KapottGol { get; set; }

        public int Golkulonbseg
        {
            get { return LottGol - KapottGol; }
        }

        public int Pont { get; set; }
    }
}
