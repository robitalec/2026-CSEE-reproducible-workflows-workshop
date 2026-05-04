# Summary Report
Alec L. Robitaille

## Data Summary

For this project, we are using three datasets. The first dataset
includes Adelie adult and chick counts across islands and years.

``` r
tar_load(full_datasets)

datasummary_skim(data = full_datasets$counts %>% select(c(island, adults, chicks)))
```

|  | Unique | Missing Pct. | Mean | SD | Min | Median | Max | Histogram |
|----|----|----|----|----|----|----|----|----|
| adults | 201 | 0 | 32.3 | 55.3 | 0.0 | 4.0 | 386.0 | <img src="tinytable_assets/tinytable_1_idd7jylygy47r2ezbgjisw.png"
height="16" /> |
| chicks | 273 | 0 | 51.6 | 98.1 | 0.0 | 3.0 | 713.0 | <img src="tinytable_assets/tinytable_2_idj7uk413m7zdvproy3no5.png"
height="16" /> |
| island | N | % |  |  |  |  |  |  |
| CHR | 388 | 24.6 |  |  |  |  |  |  |
| COR | 203 | 12.9 |  |  |  |  |  |  |
| HUM | 261 | 16.6 |  |  |  |  |  |  |
| LIT | 261 | 16.6 |  |  |  |  |  |  |
| TOR | 462 | 29.3 |  |  |  |  |  |  |

------------------------------------------------------------------------

The second dataset describes the monthly weather conditions from Palmer
Station, Antarctica

``` r
tar_load(weather_raw) 

datasummary_skim(data = weather_raw %>% clean_names())
```

|  | Unique | Missing Pct. | Mean | SD | Min | Median | Max | Histogram |
|----|----|----|----|----|----|----|----|----|
| mean_temperature_c | 418 | 3 | -1.9 | 3.5 | -16.0 | -1.4 | 5.2 | <img src="tinytable_assets/tinytable_01_id3waaltzmjaa9l5prnha0.png"
height="16" /> |
| temperature_count | 7 | 30 | 30.3 | 1.7 | 0.0 | 31.0 | 31.0 | <img src="tinytable_assets/tinytable_05_id5x8awas3rybki6324g0z.png"
height="16" /> |
| mean_pressure_mbar | 384 | 30 | 986.7 | 5.9 | 970.6 | 986.4 | 1003.2 | <img src="tinytable_assets/tinytable_11_ideno3x6kmbkrvyd058yut.png"
height="16" /> |
| pressure_count | 9 | 30 | 30.3 | 1.8 | 0.0 | 31.0 | 31.0 | <img src="tinytable_assets/tinytable_06_id8law1av7ggsxjupawtmn.png"
height="16" /> |
| mean_precipitation_mm | 251 | 31 | 1.8 | 1.2 | 0.0 | 1.6 | 7.6 | <img src="tinytable_assets/tinytable_03_id44420sdm1eupbzne1geq.png"
height="16" /> |
| sum_precipitation_mm | 347 | 30 | 55.9 | 36.6 | 0.0 | 48.5 | 235.3 | <img src="tinytable_assets/tinytable_10_id22803ouibq59f3rxjzjb.png"
height="16" /> |
| precipitation_count | 7 | 30 | 30.2 | 2.5 | 0.0 | 31.0 | 31.0 | <img src="tinytable_assets/tinytable_07_idey1f1dcy9sql5o0vi9v7.png"
height="16" /> |
| mean_sea_surface_temperature_c | 234 | 37 | -0.5 | 1.1 | -2.2 | -0.8 | 2.0 | <img src="tinytable_assets/tinytable_02_id7e9r0ex8z9uwisq9anxp.png"
height="16" /> |
| sea_surface_temperature_count | 15 | 30 | 26.9 | 9.3 | 0.0 | 30.0 | 31.0 | <img src="tinytable_assets/tinytable_08_idag96ccfquwmuryf5s1xq.png"
height="16" /> |
| mean_windspeed_knots | 322 | 30 | 10.6 | 2.9 | 4.7 | 10.4 | 20.2 | <img src="tinytable_assets/tinytable_04_id9a38vuknqzj2xcsro13r.png"
height="16" /> |
| windspeed_count | 8 | 30 | 30.3 | 1.8 | 0.0 | 31.0 | 31.0 | <img src="tinytable_assets/tinytable_09_id7vvtvnqwp0dynwfqutrm.png"
height="16" /> |

------------------------------------------------------------------------

The final dataset is a widely accessible dataset through the
`palmerpenguins` package and includes many variables concerning penguin
body condition.

``` r
datasummary_skim(data = full_datasets$penguins %>% select(-c(month, date, comments, clutch_completion, species, study_name)))
```

|  | Unique | Missing Pct. | Mean | SD | Min | Median | Max | Histogram |
|----|----|----|----|----|----|----|----|----|
| sample_number | 152 | 0 | 63.2 | 40.4 | 1.0 | 58.0 | 152.0 | <img src="tinytable_assets/tinytable_14_idbo9liqbzhawhii0l3dad.png"
height="16" /> |
| culmen_length_mm | 165 | 1 | 43.9 | 5.5 | 32.1 | 44.5 | 59.6 | <img src="tinytable_assets/tinytable_13_id79ecysvmykz6qbmgkmbr.png"
height="16" /> |
| culmen_depth_mm | 81 | 1 | 17.2 | 2.0 | 13.1 | 17.3 | 21.5 | <img src="tinytable_assets/tinytable_08_idhttwulmn3c48cbrf4ha6.png"
height="16" /> |
| flipper_length_mm | 56 | 1 | 200.9 | 14.1 | 172.0 | 197.0 | 231.0 | <img src="tinytable_assets/tinytable_15_idlb2yijrzezazis64a7od.png"
height="16" /> |
| body_mass_g | 95 | 1 | 4201.8 | 802.0 | 2700.0 | 4050.0 | 6300.0 | <img src="tinytable_assets/tinytable_17_idrf6ahdrgtc674k7t3ym6.png"
height="16" /> |
| delta_15_n_o_oo | 331 | 4 | 8.7 | 0.6 | 7.6 | 8.7 | 10.0 | <img src="tinytable_assets/tinytable_07_id7zxld7vvxxsg31l8ufm5.png"
height="16" /> |
| delta_13_c_o_oo | 332 | 4 | -25.7 | 0.8 | -27.0 | -25.8 | -23.8 | <img src="tinytable_assets/tinytable_01_idokb9i3l2ac8qj3nb8t2x.png"
height="16" /> |
| mean_temperature_c | 5 | 0 | -0.4 | 0.9 | -1.3 | -0.8 | 1.5 | <img src="tinytable_assets/tinytable_02_idk4hv8ww2fvnajowlt63w.png"
height="16" /> |
| temperature_count | 2 | 0 | 30.0 | 0.2 | 30.0 | 30.0 | 31.0 | <img src="tinytable_assets/tinytable_09_idhjj49brpbug6vpqks8au.png"
height="16" /> |
| mean_pressure_mbar | 5 | 0 | 984.7 | 3.3 | 980.8 | 984.5 | 989.1 | <img src="tinytable_assets/tinytable_16_idyszbr1ayimk3nc6pb3mr.png"
height="16" /> |
| pressure_count | 2 | 0 | 30.0 | 0.2 | 30.0 | 30.0 | 31.0 | <img src="tinytable_assets/tinytable_10_idl4tnu5pslmpm6g1d6pvq.png"
height="16" /> |
| mean_precipitation_mm | 5 | 33 | 1.3 | 0.6 | 0.6 | 1.4 | 1.9 | <img src="tinytable_assets/tinytable_18_idlo6t6stqq639hozdegzl.png"
height="16" /> |
| sum_precipitation_mm | 5 | 0 | 26.7 | 24.3 | 0.0 | 19.1 | 58.2 | <img src="tinytable_assets/tinytable_04_id7etkpgltv85g3q8mkp64.png"
height="16" /> |
| precipitation_count | 3 | 0 | 20.3 | 14.1 | 0.0 | 30.0 | 31.0 | <img src="tinytable_assets/tinytable_05_idysvcyfp38seu50mit30d.png"
height="16" /> |
| mean_sea_surface_temperature_c | 5 | 0 | -0.5 | 0.6 | -1.4 | -0.3 | 0.4 | <img src="tinytable_assets/tinytable_03_idp9xyz5bg1zvc04rce7cq.png"
height="16" /> |
| sea_surface_temperature_count | 2 | 0 | 30.0 | 0.2 | 30.0 | 30.0 | 31.0 | <img src="tinytable_assets/tinytable_11_idjgbbngeuu0nlhq9wacb4.png"
height="16" /> |
| mean_windspeed_knots | 5 | 0 | 9.2 | 2.1 | 6.9 | 8.3 | 12.0 | <img src="tinytable_assets/tinytable_06_idyi6buvvg9njfus6vnq1i.png"
height="16" /> |
| windspeed_count | 2 | 0 | 30.0 | 0.2 | 30.0 | 30.0 | 31.0 | <img src="tinytable_assets/tinytable_12_id27v1ntqpaa8d8x94o7kp.png"
height="16" /> |
|  |  | N | % |  |  |  |  |  |
|  | Anvers | 344 | 100.0 |  |  |  |  |  |
| island | Biscoe | 168 | 48.8 |  |  |  |  |  |
|  | Dream | 124 | 36.0 |  |  |  |  |  |
|  | Torgersen | 52 | 15.1 |  |  |  |  |  |
|  | Adult, 1 Egg Stage | 344 | 100.0 |  |  |  |  |  |
| sex | FEMALE | 165 | 48.0 |  |  |  |  |  |
|  | MALE | 168 | 48.8 |  |  |  |  |  |
|  | NA | 11 | 3.2 |  |  |  |  |  |
| year | 2007 | 110 | 32.0 |  |  |  |  |  |
|  | 2008 | 114 | 33.1 |  |  |  |  |  |
|  | 2009 | 120 | 34.9 |  |  |  |  |  |

## Modelling

We had two groups of models. The first was looking at how temperature
relates to chick counts on different islands.

``` r
tar_load(save_model_tables)

save_model_tables
```

|                           | CHR      | COR      | HUM     | LIT     | TOR      |
|---------------------------|----------|----------|---------|---------|----------|
| (Intercept)               | -11.159  | 5.038    | 4.977   | 0.487   | 2.428    |
|                           | (15.303) | (12.712) | (6.615) | (0.698) | (18.144) |
| mean_temperature_c_yearly | 15.643   | 4.678    | 7.291   | -0.144  | 5.465    |
|                           | (7.766)  | (6.451)  | (3.357) | (0.354) | (9.208)  |
| Num.Obs.                  | 10       | 10       | 10      | 10      | 10       |
| R2                        | 0.336    | 0.062    | 0.371   | 0.020   | 0.042    |
| R2 Adj.                   | 0.254    | -0.056   | 0.292   | -0.102  | -0.078   |
| AIC                       | 81.2     | 77.5     | 64.4    | 19.4    | 84.6     |
| BIC                       | 82.1     | 78.4     | 65.3    | 20.3    | 85.5     |
| Log.Lik.                  | -37.583  | -35.728  | -29.196 | -6.701  | -39.286  |
| RMSE                      | 10.37    | 8.62     | 4.48    | 0.47    | 12.30    |

------------------------------------------------------------------------

The second was looking at how precipitation affects body mass of Adelie
penguins.

``` r
tar_load(model_penguins_groups)
tar_load(penguin_keys)

model_penguins_groups %>% setNames(penguin_keys) %>% modelsummary()
```

|                                          | Biscoe    | Dream     | Torgersen |
|------------------------------------------|-----------|-----------|-----------|
| (Intercept)                              | 4861.941  | 3649.505  | 3782.967  |
|                                          | (239.100) | (201.288) | (329.505) |
| mean_precipitation_mm_yearly × sexFEMALE | -375.264  | -126.910  | -170.057  |
|                                          | (183.518) | (151.127) | (250.140) |
| mean_precipitation_mm_yearly × sexMALE   | 152.498   | 260.759   | 245.606   |
|                                          | (183.531) | (151.129) | (250.140) |
| Num.Obs.                                 | 6         | 4         | 4         |
| R2                                       | 0.858     | 0.914     | 0.805     |
| R2 Adj.                                  | 0.764     | 0.741     | 0.415     |
| AIC                                      | 85.2      | 55.1      | 59.3      |
| BIC                                      | 84.3      | 52.7      | 56.9      |
| Log.Lik.                                 | -38.588   | -23.567   | -25.672   |
| RMSE                                     | 150.26    | 87.61     | 148.27    |

## Plots

We can visualize these models. Chick counts:

``` r
tar_load(plot_groups_counts)

plot_groups_counts
```

    $plot_groups_counts_c6e81c6d66aa9356

![](manuscript_files/figure-commonmark/chicks-plots-1.png)


    $plot_groups_counts_14af2fcc0f5fab3b

![](manuscript_files/figure-commonmark/chicks-plots-2.png)


    $plot_groups_counts_6175988343e272df

![](manuscript_files/figure-commonmark/chicks-plots-3.png)


    $plot_groups_counts_5ea20e487840f116

![](manuscript_files/figure-commonmark/chicks-plots-4.png)


    $plot_groups_counts_8706c34d71e00f16

![](manuscript_files/figure-commonmark/chicks-plots-5.png)

Body mass:

``` r
tar_load(plot_groups_penguins)

plot_groups_penguins
```

    $plot_groups_penguins_9c4a6278aa2bb275

![](manuscript_files/figure-commonmark/penguins-plots-1.png)


    $plot_groups_penguins_5430fc749cf00f22

![](manuscript_files/figure-commonmark/penguins-plots-2.png)


    $plot_groups_penguins_99cfa7c2f8cfff38

![](manuscript_files/figure-commonmark/penguins-plots-3.png)

## Next Steps

There is a lot more we can do with a `{targets}` workflow! Check out the
Resources page of the workshop for more.
