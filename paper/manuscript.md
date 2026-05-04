# Summary Report
Alec L. Robitaille

## Data Summary

For this project, we are using three datasets. The first is a widely
accessible dataset through the `palmerpenguins` package and includes
many variables concerning penguin body condition.

``` r
tar_load(full_datasets)

datasummary_skim(data = full_datasets$penguins %>% select(-c(month, date, comments, clutch_completion, species, study_name)))
```

|  | Unique | Missing Pct. | Mean | SD | Min | Median | Max | Histogram |
|----|----|----|----|----|----|----|----|----|
| sample_number | 152 | 0 | 63.2 | 40.4 | 1.0 | 58.0 | 152.0 | <img src="tinytable_assets/tinytable_14_idop8baumbiyp8npypplhp.png"
height="16" /> |
| culmen_length_mm | 165 | 1 | 43.9 | 5.5 | 32.1 | 44.5 | 59.6 | <img src="tinytable_assets/tinytable_13_idle6oq1dxvcrwuaozp0oa.png"
height="16" /> |
| culmen_depth_mm | 81 | 1 | 17.2 | 2.0 | 13.1 | 17.3 | 21.5 | <img src="tinytable_assets/tinytable_08_id6ybbwazyjwdl24tjs4il.png"
height="16" /> |
| flipper_length_mm | 56 | 1 | 200.9 | 14.1 | 172.0 | 197.0 | 231.0 | <img src="tinytable_assets/tinytable_15_idpl4n0yd8zwykqq5mybb5.png"
height="16" /> |
| body_mass_g | 95 | 1 | 4201.8 | 802.0 | 2700.0 | 4050.0 | 6300.0 | <img src="tinytable_assets/tinytable_17_ideoet8ywmwhc0hmofv6wr.png"
height="16" /> |
| delta_15_n_o_oo | 331 | 4 | 8.7 | 0.6 | 7.6 | 8.7 | 10.0 | <img src="tinytable_assets/tinytable_07_idfo15lf8gpkxd1u0vzkdv.png"
height="16" /> |
| delta_13_c_o_oo | 332 | 4 | -25.7 | 0.8 | -27.0 | -25.8 | -23.8 | <img src="tinytable_assets/tinytable_01_id341yhveo8njcpsgrbaxr.png"
height="16" /> |
| mean_temperature_c | 5 | 0 | -0.4 | 0.9 | -1.3 | -0.8 | 1.5 | <img src="tinytable_assets/tinytable_02_idc7r1skeb9dq70rejc4ul.png"
height="16" /> |
| temperature_count | 2 | 0 | 30.0 | 0.2 | 30.0 | 30.0 | 31.0 | <img src="tinytable_assets/tinytable_09_idhe8n1lvqh895o5pa48w2.png"
height="16" /> |
| mean_pressure_mbar | 5 | 0 | 984.7 | 3.3 | 980.8 | 984.5 | 989.1 | <img src="tinytable_assets/tinytable_16_idvq54gwwtocx6a0wv0gei.png"
height="16" /> |
| pressure_count | 2 | 0 | 30.0 | 0.2 | 30.0 | 30.0 | 31.0 | <img src="tinytable_assets/tinytable_10_id7kllffylcvtbz357eu0b.png"
height="16" /> |
| mean_precipitation_mm | 5 | 33 | 1.3 | 0.6 | 0.6 | 1.4 | 1.9 | <img src="tinytable_assets/tinytable_18_id2t8mgc5ibtfpcwk7jct4.png"
height="16" /> |
| sum_precipitation_mm | 5 | 0 | 26.7 | 24.3 | 0.0 | 19.1 | 58.2 | <img src="tinytable_assets/tinytable_04_id16oc1d8eyblpdflcjbgt.png"
height="16" /> |
| precipitation_count | 3 | 0 | 20.3 | 14.1 | 0.0 | 30.0 | 31.0 | <img src="tinytable_assets/tinytable_05_ids48nk175jl1zhnat0lv2.png"
height="16" /> |
| mean_sea_surface_temperature_c | 5 | 0 | -0.5 | 0.6 | -1.4 | -0.3 | 0.4 | <img src="tinytable_assets/tinytable_03_idfys5jqj0s20kf0y7hza3.png"
height="16" /> |
| sea_surface_temperature_count | 2 | 0 | 30.0 | 0.2 | 30.0 | 30.0 | 31.0 | <img src="tinytable_assets/tinytable_11_id68vjglwjuc3xoixadtax.png"
height="16" /> |
| mean_windspeed_knots | 5 | 0 | 9.2 | 2.1 | 6.9 | 8.3 | 12.0 | <img src="tinytable_assets/tinytable_06_idxr2sif9m7fptc0rfp2c5.png"
height="16" /> |
| windspeed_count | 2 | 0 | 30.0 | 0.2 | 30.0 | 30.0 | 31.0 | <img src="tinytable_assets/tinytable_12_idutnn3x6dapidfneaevkh.png"
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

The second dataset describes the monthly weather conditions from Palmer
Station, Antarctica

``` r
tar_load(weather_raw) 

datasummary_skim(data = weather_raw %>% clean_names())
```

|  | Unique | Missing Pct. | Mean | SD | Min | Median | Max | Histogram |
|----|----|----|----|----|----|----|----|----|
| mean_temperature_c | 418 | 3 | -1.9 | 3.5 | -16.0 | -1.4 | 5.2 | <img src="tinytable_assets/tinytable_01_id8wa0eryhbzales4ll8rn.png"
height="16" /> |
| temperature_count | 7 | 30 | 30.3 | 1.7 | 0.0 | 31.0 | 31.0 | <img src="tinytable_assets/tinytable_05_idmf3vjlxmjig3idalmrw0.png"
height="16" /> |
| mean_pressure_mbar | 384 | 30 | 986.7 | 5.9 | 970.6 | 986.4 | 1003.2 | <img src="tinytable_assets/tinytable_11_idhf1ajovqmhlppytjms0p.png"
height="16" /> |
| pressure_count | 9 | 30 | 30.3 | 1.8 | 0.0 | 31.0 | 31.0 | <img src="tinytable_assets/tinytable_06_id854zxa22zcf7ng4ctejc.png"
height="16" /> |
| mean_precipitation_mm | 251 | 31 | 1.8 | 1.2 | 0.0 | 1.6 | 7.6 | <img src="tinytable_assets/tinytable_03_idshmxq9s3fdupzvn04pju.png"
height="16" /> |
| sum_precipitation_mm | 347 | 30 | 55.9 | 36.6 | 0.0 | 48.5 | 235.3 | <img src="tinytable_assets/tinytable_10_iddym30qad3ralaabr7jdv.png"
height="16" /> |
| precipitation_count | 7 | 30 | 30.2 | 2.5 | 0.0 | 31.0 | 31.0 | <img src="tinytable_assets/tinytable_07_id83umntxo2wbydijat82n.png"
height="16" /> |
| mean_sea_surface_temperature_c | 234 | 37 | -0.5 | 1.1 | -2.2 | -0.8 | 2.0 | <img src="tinytable_assets/tinytable_02_id8o4tuptsbe8qyns0jq63.png"
height="16" /> |
| sea_surface_temperature_count | 15 | 30 | 26.9 | 9.3 | 0.0 | 30.0 | 31.0 | <img src="tinytable_assets/tinytable_08_ide3ixovp5bk48tf103e6v.png"
height="16" /> |
| mean_windspeed_knots | 322 | 30 | 10.6 | 2.9 | 4.7 | 10.4 | 20.2 | <img src="tinytable_assets/tinytable_04_idrqoou4gdz0chx9jmst9w.png"
height="16" /> |
| windspeed_count | 8 | 30 | 30.3 | 1.8 | 0.0 | 31.0 | 31.0 | <img src="tinytable_assets/tinytable_09_idqyx8boqdffcvgij60rfw.png"
height="16" /> |

The final dataset includes adult and chick counts across several years.

``` r
datasummary_skim(data = full_datasets$counts %>% select(c(island, adults, chicks, year)))
```

|  | Unique | Missing Pct. | Mean | SD | Min | Median | Max | Histogram |
|----|----|----|----|----|----|----|----|----|
| adults | 201 | 0 | 32.3 | 55.3 | 0.0 | 4.0 | 386.0 | <img src="tinytable_assets/tinytable_1_id7z8mzjmm0p6lxsg75xov.png"
height="16" /> |
| chicks | 273 | 0 | 51.6 | 98.1 | 0.0 | 3.0 | 713.0 | <img src="tinytable_assets/tinytable_2_id7w3h9wnt5msz1sr6pnp1.png"
height="16" /> |
|  |  | N | % |  |  |  |  |  |
| island | CHR | 388 | 24.6 |  |  |  |  |  |
|  | COR | 203 | 12.9 |  |  |  |  |  |
|  | HUM | 261 | 16.6 |  |  |  |  |  |
|  | LIT | 261 | 16.6 |  |  |  |  |  |
|  | TOR | 462 | 29.3 |  |  |  |  |  |
| year | 1992 | 52 | 3.3 |  |  |  |  |  |
|  | 1993 | 52 | 3.3 |  |  |  |  |  |
|  | 1994 | 56 | 3.6 |  |  |  |  |  |
|  | 1995 | 55 | 3.5 |  |  |  |  |  |
|  | 1996 | 55 | 3.5 |  |  |  |  |  |
|  | 1997 | 57 | 3.6 |  |  |  |  |  |
|  | 1998 | 53 | 3.4 |  |  |  |  |  |
|  | 1999 | 55 | 3.5 |  |  |  |  |  |
|  | 2000 | 55 | 3.5 |  |  |  |  |  |
|  | 2001 | 55 | 3.5 |  |  |  |  |  |
|  | 2002 | 55 | 3.5 |  |  |  |  |  |
|  | 2003 | 55 | 3.5 |  |  |  |  |  |
|  | 2004 | 55 | 3.5 |  |  |  |  |  |
|  | 2005 | 55 | 3.5 |  |  |  |  |  |
|  | 2006 | 55 | 3.5 |  |  |  |  |  |
|  | 2007 | 54 | 3.4 |  |  |  |  |  |
|  | 2008 | 54 | 3.4 |  |  |  |  |  |
|  | 2009 | 54 | 3.4 |  |  |  |  |  |
|  | 2010 | 54 | 3.4 |  |  |  |  |  |
|  | 2011 | 54 | 3.4 |  |  |  |  |  |
|  | 2012 | 54 | 3.4 |  |  |  |  |  |
|  | 2013 | 54 | 3.4 |  |  |  |  |  |
|  | 2014 | 54 | 3.4 |  |  |  |  |  |
|  | 2015 | 53 | 3.4 |  |  |  |  |  |
|  | 2016 | 54 | 3.4 |  |  |  |  |  |
|  | 2017 | 54 | 3.4 |  |  |  |  |  |
|  | 2018 | 54 | 3.4 |  |  |  |  |  |
|  | 2019 | 54 | 3.4 |  |  |  |  |  |
|  | 2020 | 54 | 3.4 |  |  |  |  |  |

## Modelling

We had two groups of models. The first was

## Plots

## Next Steps

``` r
tar_load(plot_groups_counts)
tar_load(plot_groups_penguins)
tar_load(save_model_tables)
```
