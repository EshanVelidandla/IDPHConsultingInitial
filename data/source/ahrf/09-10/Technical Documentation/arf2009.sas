  data arf;
  infile 'c:\arf2009.asc' lrecl=31959;
  input

    /*  ARF2009 SAS FD */

     @00001    f00001   $  01.  /*Blank                                                                 */
     @00002    f00002      05.  /*Header - FIPS St & Cty Code                                           */
     @00007    f00003   $  05.  /*Entity of File                   Equals 'AARF '                       */
     @00012    f00004   $  20.  /*Secondary Entity Of File         Mod FIPS St & Cty Code               */
     @00032    f00005   $  04.  /*Date of File                     Equals '2009'                        */
     @00036    f00006      05.  /*Date of Creation                 Equals '10213'                       */
     @00041    f00007      05.  /*File Length                      Equals '31881'                       */
     @00046    f00008   $  19.  /*State Name                                                            */
     @00065    f12424   $  02.  /*State Name Abbreviation                                               */
     @00067    f00010   $  25.  /*County Name                                                           */
     @00092    f04437   $  30.  /*County Name w/State Abbrev                                            */
     @00122    f00011   $  02.  /*FIPS State Code                                                       */
     @00124    f00012   $  03.  /*FIPS County Code                                                      */
     @00127    f04439   $  01.  /*Census Region Code                                                    */
     @00128    f04448   $  13.  /*Census Region Name                                                    */
     @00141    f04440   $  01.  /*Census Division Code                                                  */
     @00142    f04449   $  18.  /*Census Division Name                                                  */
     @00160    f00023   $  02.  /*Federal Region Code                                                   */
     @00162    f13156   $  05.  /*SSA Beneficiary Code                                                  */
     @00167    f1389108 $  05.  /*Metro/Micro Stat Area Code                                            */
     @00172    f1389208 $  50.  /*Metro/Micro Stat Area Name                                            */
     @00222    f1406708 $  01.  /*Metro/Micro Indicator Code       0 = Not, 1 = Metro, 2 = Micro        */
     @00223    f1419508 $  08.  /*Metro/Micro County Status        Central or Outlying                  */
     @00231    f1419308 $  05.  /*Metropolitan Division Code                                            */
     @00236    f1419408 $  50.  /*Metropolitan Division Name                                            */
     @00286    f1389308 $  03.  /*Combined Statistical Area Code                                        */
     @00289    f1389408 $  55.  /*Combined Statistical Area Name                                        */
     @00344    f0002003 $  02.  /*Rural/Urban Continuum Code                                            */
     @00346    f1255903 $  02.  /*Urban Influence Code                                                  */
     @00348    f1397304 $  02.  /*Economic-Dependnt Typology Code                                       */
     @00350    f1248104 $  02.  /*Farming-Dependent Typology Code                                       */
     @00352    f1248204 $  02.  /*Mining-Dependent Typology Code                                        */
     @00354    f1248304 $  02.  /*Manufacturing-Dep Typology Code                                       */
     @00356    f1248404 $  02.  /*Fed/St Govt-Depdnt Typolgy Code  Federal/State Government             */
     @00358    f1248504 $  02.  /*Service-Dependent Typology Code                                       */
     @00360    f1248604 $  02.  /*Nonspecializd-Dep Typology Code                                       */
     @00362    f1397404 $  02.  /*Housing Stress Typology Code                                          */
     @00364    f1397504 $  02.  /*Low Education Typology Code                                           */
     @00366    f1397604 $  02.  /*Low Employment Typology Code                                          */
     @00368    f1249004 $  02.  /*Persistent Povrty Typology Code                                       */
     @00370    f1397704 $  02.  /*Population Loss Typology Code                                         */
     @00372    f1397804 $  02.  /*Nonmetro Recreation Typlgy Code                                       */
     @00374    f1248704 $  02.  /*Retirement Destnatn Typlgy Code                                       */
     @00376    f0355304 $  03.  /*BEA Economic Area Code                                                */
     @00379    f1214404 $  03.  /*BEA Component Economc Area Code                                       */
     @00382    f0355404 $  51.  /*BEA Economic Area Name                                                */
     @00433    f1214604 $  51.  /*BEA Component Economc Area Name                                       */
     @00484    f1175088 $  03.  /*Health Service Area Codes                                             */
     @00487    f0970298 $  04.  /*AHEC Code                                                             */
     @00491    f0970398 $  25.  /*AHEC Name                                                             */
     @00516    f1319798    04.  /*AHEC Program Year of Initiation                                       */
     @00520    f1319898    04.  /*AHEC Center Year of Initiation                                        */
     @00524    f0107970 $  05.  /*Census County Group Code                                              */
     @00529    f0978709 $  01.  /*HPSA Code - Primary Care  12/09  1=Whole, 2=Part County               */
     @00530    f0978708 $  01.  /*HPSA Code - Primary Care  12/08  1=Whole, 2=Part County               */
     @00531    f0978707 $  01.  /*HPSA Code - Primary Care  12/07  1=Whole, 2=Part County               */
     @00532    f0978704 $  01.  /*HPSA Code - Primary Care  11/04  1=Whole, 2=Part County               */
     @00533    f0978703 $  01.  /*HPSA Code - Primary Care  12/03  1=Whole, 2=Part County               */
     @00534    f0978702 $  01.  /*HPSA Code - Primary Care  12/02  1=Whole, 2=Part County               */
     @00535    f0978701 $  01.  /*HPSA Code - Primary Care  12/01  1=Whole, 2=Part County               */
     @00536    f0978700 $  01.  /*HPSA Code - Primary Care  10/00  1=Whole, 2=Part County               */
     @00537    f0979209 $  01.  /*HPSA Code - Dentists      12/09  1=Whole, 2=Part County               */
     @00538    f0979208 $  01.  /*HPSA Code - Dentists      12/08  1=Whole, 2=Part County               */
     @00539    f0979207 $  01.  /*HPSA Code - Dentists      12/07  1=Whole, 2=Part County               */
     @00540    f0979204 $  01.  /*HPSA Code - Dentists      11/04  1=Whole, 2=Part County               */
     @00541    f0979203 $  01.  /*HPSA Code - Dentists      12/03  1=Whole, 2=Part County               */
     @00542    f0979202 $  01.  /*HPSA Code - Dentists      12/02  1=Whole, 2=Part County               */
     @00543    f0979201 $  01.  /*HPSA Code - Dentists      12/01  1=Whole, 2=Part County               */
     @00544    f0979200 $  01.  /*HPSA Code - Dentists      10/00  1=Whole, 2=Part County               */
     @00545    f1249209 $  01.  /*HPSA Code - Mental Health 12/09  1=Whole, 2=Part County               */
     @00546    f1249208 $  01.  /*HPSA Code - Mental Health 12/08  1=Whole, 2=Part County               */
     @00547    f1249207 $  01.  /*HPSA Code - Mental Health 12/07  1=Whole, 2=Part County               */
     @00548    f1249204 $  01.  /*HPSA Code - Mental Health 11/04  1=Whole, 2=Part County               */
     @00549    f1249203 $  01.  /*HPSA Code - Mental Health 12/03  1=Whole, 2=Part County               */
     @00550    f1249202 $  01.  /*HPSA Code - Mental Health 12/02  1=Whole, 2=Part County               */
     @00551    f1249201 $  01.  /*HPSA Code - Mental Health 12/01  1=Whole, 2=Part County               */
     @00552    f1249200 $  01.  /*HPSA Code - Mental Health 10/00  1=Whole, 2=Part County               */
     @00553    f0359588 $  03.  /*VA Primary Service Area Code     Veterans Administration              */
     @00556    f0359688 $  02.  /*VA Medical District Code         Veterans Administration              */
     @00558    f0359788 $  01.  /*VA Medical Region Code           Veterans Administration              */
     @00559    f0410180 $  05.  /*Contiguous County #  1           Zero If No Contig Cnty               */
     @00564    f0410280 $  05.  /*Contiguous County #  2           Zero If No Other Contig Cnty         */
     @00569    f0410380 $  05.  /*Contiguous County #  3           Zero If No Other Contig Cnty         */
     @00574    f0410480 $  05.  /*Contiguous County #  4           Zero If No Other Contig Cnty         */
     @00579    f0410580 $  05.  /*Contiguous County #  5           Zero If No Other Contig Cnty         */
     @00584    f0410680 $  05.  /*Contiguous County #  6           Zero If No Other Contig Cnty         */
     @00589    f0410780 $  05.  /*Contiguous County #  7           Zero If No Other Contig Cnty         */
     @00594    f0410880 $  05.  /*Contiguous County #  8           Zero If No Other Contig Cnty         */
     @00599    f0410980 $  05.  /*Contiguous County #  9           Zero If No Other Contig Cnty         */
     @00604    f0411080 $  05.  /*Contiguous County # 10           Zero If No Other Contig Cnty         */
     @00609    f0411180 $  05.  /*Contiguous County # 11           Zero If No Other Contig Cnty         */
     @00614    f0411280 $  05.  /*Contiguous County # 12           Zero If No Other Contig Cnty         */
     @00619    f0411380 $  05.  /*Contiguous County # 13           Zero If No Other Contig Cnty         */
     @00624    f0411480 $  05.  /*Contiguous County # 14           Zero If No Other Contig Cnty         */
     @00629    f1212908    05.  /*Tot Active M.D.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @00634    f1212907    05.  /*Tot Active M.D.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @00639    f1212905    05.  /*Tot Active M.D.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @00644    f0885708    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00649    f0885707    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00654    f0885706    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00659    f0885705    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00664    f0885704    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00669    f0885703    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00674    f0885702    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00679    f0885701    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00684    f0885700    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00689    f0885799    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00694    f0885798    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00699    f0885797    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00704    f0885796    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00709    f0885795    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00714    f0885794    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00719    f0885793    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00724    f0885792    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00729    f0885790    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00734    f0885789    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00739    f0885788    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00744    f0885786    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00749    f0885785    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00754    f0885783    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00759    f0885782    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00764    f0885781    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00769    f0885780    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00774    f0885775    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00779    f0885770    06.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00785    f0885760    06.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00791    f0885750    06.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00797    f0885740    06.  /*Total Active M.D.s Non-Federal   Act, Non-Fed, Except AK, HI          */
     @00803    f1212808    05.  /*Total M.D.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @00808    f1212807    05.  /*Total M.D.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @00813    f1212805    05.  /*Total M.D.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @00818    f0460208    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00823    f0460207    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00828    f0460206    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00833    f0460205    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00838    f0460204    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00843    f0460203    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00848    f0460202    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00853    f0460201    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00858    f0460200    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00863    f0460299    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00868    f0460298    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00873    f0460297    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00878    f0460296    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00883    f0460295    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00888    f0460290    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00893    f1121508    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00898    f1121507    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00903    f1121506    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00908    f1121505    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00913    f1121504    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00918    f1121503    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00923    f1121502    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00928    f1121501    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00933    f1121500    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00938    f1121599    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00943    f1121598    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00948    f1121597    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00953    f1121596    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00958    f1121595    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00963    f1121590    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00968    f0460308    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @00973    f0460307    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @00978    f0460306    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @00983    f0460305    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @00988    f0460304    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @00993    f0460303    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @00998    f0460302    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01003    f0460301    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01008    f0460300    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01013    f0460395    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01018    f0460390    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01023    f1121608    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01027    f1121607    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01031    f1121606    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01035    f1121605    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01039    f1121604    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01043    f1121603    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01047    f1121602    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01051    f1121601    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01055    f1121600    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01059    f1121695    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01063    f1121690    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01067    f1249908    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01072    f1249907    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01077    f1249906    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01082    f1249905    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01087    f1249904    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01092    f1249903    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01097    f1249902    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01102    f1249901    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01107    f1249900    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01112    f1249995    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01117    f0460490    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01122    f1106790    05.  /*M.D.'s, Tot PC,Clinical Fellows  Non-Fed;Patn Care Hosp-Based         */
     @01127    f0460508    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01132    f0460507    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01137    f0460506    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01142    f0460505    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01147    f0460504    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01152    f0460503    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01157    f0460502    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01162    f0460501    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01167    f0460500    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01172    f0460595    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01177    f0460590    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01182    f1121708    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01188    f1121707    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01194    f1121706    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01200    f1121705    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01206    f1121704    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01212    f1121703    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01218    f1121702    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01224    f1121701    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01230    f1121700    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01236    f1121795    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01242    f1121790    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01248    f0460608    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01253    f0460607    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01258    f0460606    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01263    f0460605    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01268    f0460604    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01273    f0460603    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01278    f0460602    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01283    f0460601    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01288    f0460600    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01293    f0460695    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01298    f0460690    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01303    f0460708    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01308    f0460707    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01313    f0460706    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01318    f0460705    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01323    f0460704    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01328    f0460703    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01333    f0460702    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01338    f0460701    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01343    f0460700    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01348    f0460795    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01353    f0460790    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01358    f1106808    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01363    f1106807    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01368    f1106806    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01373    f1106805    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01378    f1106804    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01383    f1106803    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01388    f1106802    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01393    f1106801    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01398    f1106800    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01403    f1106895    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01408    f1106890    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01413    f0460908    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01418    f0460907    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01423    f0460906    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01428    f0460905    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01433    f0460904    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01438    f0460903    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01443    f0460902    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01448    f0460901    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01453    f0460900    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01458    f0460995    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01463    f0460990    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01468    f0461008    05.  /*MD's, Total Gen Pract, Total     Non-Fed                              */
     @01473    f0461007    05.  /*MD's, Total Gen Pract, Total     Non-Fed                              */
     @01478    f0461005    05.  /*MD's, Total Gen Pract, Total     Non-Fed                              */
     @01483    f1106908    05.  /*MD's, Tot Gen Pract,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @01488    f1106907    05.  /*MD's, Tot Gen Pract,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @01493    f1106905    05.  /*MD's, Tot Gen Pract,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @01498    f0886008    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01502    f0886007    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01506    f0886006    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01510    f0886005    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01514    f0886000    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01518    f0886095    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01522    f0886090    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01526    f1250008    05.  /*MD's, Tot Gen Pract, PC,Hsp Res  Non-Fed;Patn Care Hosp-Based         */
     @01531    f1250007    05.  /*MD's, Tot Gen Pract, PC,Hsp Res  Non-Fed;Patn Care Hosp-Based         */
     @01536    f1250005    05.  /*MD's, Tot Gen Pract, PC,Hsp Res  Non-Fed;Patn Care Hosp-Based         */
     @01541    f0461308    05.  /*MD's,Tot Gen Prac,PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @01546    f0461307    05.  /*MD's,Tot Gen Prac,PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @01551    f0461305    05.  /*MD's,Tot Gen Prac,PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @01556    f0461408    05.  /*MD's, Tot Gen Pract, Administ    Non-Fed;MD's By Speclty/Actvty       */
     @01561    f0461407    05.  /*MD's, Tot Gen Pract, Administ    Non-Fed;MD's By Speclty/Actvty       */
     @01566    f0461405    05.  /*MD's, Tot Gen Pract, Administ    Non-Fed;MD's By Speclty/Actvty       */
     @01571    f0461508    05.  /*MD's, Tot Gen Pract, Teaching    Non-Fed;MD's By Speclty/Actvty       */
     @01576    f0461507    05.  /*MD's, Tot Gen Pract, Teaching    Non-Fed;MD's By Speclty/Actvty       */
     @01581    f0461505    05.  /*MD's, Tot Gen Pract, Teaching    Non-Fed;MD's By Speclty/Actvty       */
     @01586    f1107108    05.  /*MD's, Tot Gen Pract, Research    Non-Fed;MD's By Speclty/Actvty       */
     @01591    f1107107    05.  /*MD's, Tot Gen Pract, Research    Non-Fed;MD's By Speclty/Actvty       */
     @01596    f1107105    05.  /*MD's, Tot Gen Pract, Research    Non-Fed;MD's By Speclty/Actvty       */
     @01601    f0461708    05.  /*MD's, Tot Gen Pract, Other       Non-Fed;MD's By Speclty/Actvty       */
     @01606    f0461707    05.  /*MD's, Tot Gen Pract, Other       Non-Fed;MD's By Speclty/Actvty       */
     @01611    f0461705    05.  /*MD's, Tot Gen Pract, Other       Non-Fed;MD's By Speclty/Actvty       */
     @01616    f0994708    05.  /*MD's, Gen Pract, Total           Non-Fed                              */
     @01621    f0994707    05.  /*MD's, Gen Pract, Total           Non-Fed                              */
     @01626    f0994705    05.  /*MD's, Gen Pract, Total           Non-Fed                              */
     @01631    f1107208    05.  /*MD's, Gen Pract, Total Ptn Care  Non-Fed;Patient Care                 */
     @01636    f1107207    05.  /*MD's, Gen Pract, Total Ptn Care  Non-Fed;Patient Care                 */
     @01641    f1107205    05.  /*MD's, Gen Pract, Total Ptn Care  Non-Fed;Patient Care                 */
     @01646    f0994908    04.  /*MD's, Gen Pract, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @01650    f0994907    04.  /*MD's, Gen Pract, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @01654    f0994905    04.  /*MD's, Gen Pract, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @01658    f0995008    04.  /*MD's, Gen Pract, PC, Hsp Rsdnt   Non-Fed;Patn Care Hosp-Basd          */
     @01662    f0995007    04.  /*MD's, Gen Pract, PC, Hsp Rsdnt   Non-Fed;Patn Care Hosp-Basd          */
     @01666    f0995005    04.  /*MD's, Gen Pract, PC, Hsp Rsdnt   Non-Fed;Patn Care Hosp-Basd          */
     @01670    f0995108    04.  /*MD's, Gen Pract, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Basd          */
     @01674    f0995107    04.  /*MD's, Gen Pract, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Basd          */
     @01678    f0995105    04.  /*MD's, Gen Pract, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Basd          */
     @01682    f0995208    04.  /*MD's, Gen Pract, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @01686    f0995207    04.  /*MD's, Gen Pract, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @01690    f0995205    04.  /*MD's, Gen Pract, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @01694    f0995308    04.  /*MD's, Gen Pract, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @01698    f0995307    04.  /*MD's, Gen Pract, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @01702    f0995305    04.  /*MD's, Gen Pract, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @01706    f1107408    04.  /*MD's, Gen Pract, Research        Non-Fed;MD's By Speclty/Actvty       */
     @01710    f1107407    04.  /*MD's, Gen Pract, Research        Non-Fed;MD's By Speclty/Actvty       */
     @01714    f1107405    04.  /*MD's, Gen Pract, Research        Non-Fed;MD's By Speclty/Actvty       */
     @01718    f0995508    04.  /*MD's, Gen Pract, Other           Non-Fed;MD's By Speclty/Actvty       */
     @01722    f0995507    04.  /*MD's, Gen Pract, Other           Non-Fed;MD's By Speclty/Actvty       */
     @01726    f0995505    04.  /*MD's, Gen Pract, Other           Non-Fed;MD's By Speclty/Actvty       */
     @01730    f1199608    05.  /*MD's, Fam Med Gen, Total         Non-Fed                              */
     @01735    f1199607    05.  /*MD's, Fam Med Gen, Total         Non-Fed                              */
     @01740    f1199605    05.  /*MD's, Fam Med Gen, Total         Non-Fed                              */
     @01745    f1199708    05.  /*MD's, Fam Med Gen, Tot Ptn Cr    Non-Fed;Patient Care                 */
     @01750    f1199707    05.  /*MD's, Fam Med Gen, Tot Ptn Cr    Non-Fed;Patient Care                 */
     @01755    f1199705    05.  /*MD's, Fam Med Gen, Tot Ptn Cr    Non-Fed;Patient Care                 */
     @01760    f1199808    04.  /*MD's, Fam Med Gen,PC,Off Bsd     Non-Fed;Patn Care Office-Based       */
     @01764    f1199807    04.  /*MD's, Fam Med Gen,PC,Off Bsd     Non-Fed;Patn Care Office-Based       */
     @01768    f1199805    04.  /*MD's, Fam Med Gen,PC,Off Bsd     Non-Fed;Patn Care Office-Based       */
     @01772    f1250108    04.  /*MD's, Fam Med Gen,PC,Hsp Rsdnt   Non-Fed;Patn Care Hosp-Based         */
     @01776    f1250107    04.  /*MD's, Fam Med Gen,PC,Hsp Rsdnt   Non-Fed;Patn Care Hosp-Based         */
     @01780    f1250105    04.  /*MD's, Fam Med Gen,PC,Hsp Rsdnt   Non-Fed;Patn Care Hosp-Based         */
     @01784    f1200108    04.  /*MD's, Fam Med Gen,Hsp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @01788    f1200107    04.  /*MD's, Fam Med Gen,Hsp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @01792    f1200105    04.  /*MD's, Fam Med Gen,Hsp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @01796    f1200208    04.  /*MD's, Fam Med Gen,Administratn   Non-Fed;MD's By Speclty/Actvty       */
     @01800    f1200207    04.  /*MD's, Fam Med Gen,Administratn   Non-Fed;MD's By Speclty/Actvty       */
     @01804    f1200205    04.  /*MD's, Fam Med Gen,Administratn   Non-Fed;MD's By Speclty/Actvty       */
     @01808    f1200308    04.  /*MD's, Fam Med Gen,Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @01812    f1200307    04.  /*MD's, Fam Med Gen,Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @01816    f1200305    04.  /*MD's, Fam Med Gen,Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @01820    f1200408    04.  /*MD's, Fam Med Gen,Research       Non-Fed;MD's By Speclty/Actvty       */
     @01824    f1200407    04.  /*MD's, Fam Med Gen,Research       Non-Fed;MD's By Speclty/Actvty       */
     @01828    f1200405    04.  /*MD's, Fam Med Gen,Research       Non-Fed;MD's By Speclty/Actvty       */
     @01832    f1200508    04.  /*MD's, Fam Med Gen,Other          Non-Fed;MD's By Speclty/Actvty       */
     @01836    f1200507    04.  /*MD's, Fam Med Gen,Other          Non-Fed;MD's By Speclty/Actvty       */
     @01840    f1200505    04.  /*MD's, Fam Med Gen,Other          Non-Fed;MD's By Speclty/Actvty       */
     @01844    f1200608    05.  /*MD's, Fam Med Subspec, Total     Non-Fed                              */
     @01849    f1200607    05.  /*MD's, Fam Med Subspec, Total     Non-Fed                              */
     @01854    f1200605    05.  /*MD's, Fam Med Subspec, Total     Non-Fed                              */
     @01859    f1200708    05.  /*MD's, Fam Med Subsp,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @01864    f1200707    05.  /*MD's, Fam Med Subsp,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @01869    f1200705    05.  /*MD's, Fam Med Subsp,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @01874    f1200808    04.  /*MD's, Fam Med Subsp,PC,Off Bsd   Non-Fed;Patn Care Office-Based       */
     @01878    f1200807    04.  /*MD's, Fam Med Subsp,PC,Off Bsd   Non-Fed;Patn Care Office-Based       */
     @01882    f1200805    04.  /*MD's, Fam Med Subsp,PC,Off Bsd   Non-Fed;Patn Care Office-Based       */
     @01886    f1250208    04.  /*MD's, Fam Med Subsp,PC,Hsp Res   Non-Fed;Patn Care Hosp-Based         */
     @01890    f1250207    04.  /*MD's, Fam Med Subsp,PC,Hsp Res   Non-Fed;Patn Care Hosp-Based         */
     @01894    f1250205    04.  /*MD's, Fam Med Subsp,PC,Hsp Res   Non-Fed;Patn Care Hosp-Based         */
     @01898    f1201108    04.  /*MD's, Fam Med Subsp,Hsp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @01902    f1201107    04.  /*MD's, Fam Med Subsp,Hsp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @01906    f1201105    04.  /*MD's, Fam Med Subsp,Hsp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @01910    f1201208    04.  /*MD's, Fam Med Subsp,Admin        Non-Fed;MD's By Speclty/Actvty       */
     @01914    f1201207    04.  /*MD's, Fam Med Subsp,Admin        Non-Fed;MD's By Speclty/Actvty       */
     @01918    f1201205    04.  /*MD's, Fam Med Subsp,Admin        Non-Fed;MD's By Speclty/Actvty       */
     @01922    f1201308    04.  /*MD's, Fam Med Subsp,Teaching     Non-Fed;MD's By Speclty/Actvty       */
     @01926    f1201307    04.  /*MD's, Fam Med Subsp,Teaching     Non-Fed;MD's By Speclty/Actvty       */
     @01930    f1201305    04.  /*MD's, Fam Med Subsp,Teaching     Non-Fed;MD's By Speclty/Actvty       */
     @01934    f1201408    04.  /*MD's, Fam Med Subsp,Research     Non-Fed;MD's By Speclty/Actvty       */
     @01938    f1201407    04.  /*MD's, Fam Med Subsp,Research     Non-Fed;MD's By Speclty/Actvty       */
     @01942    f1201405    04.  /*MD's, Fam Med Subsp,Research     Non-Fed;MD's By Speclty/Actvty       */
     @01946    f1201508    04.  /*MD's, Fam Med Subsp,Other        Non-Fed;MD's By Speclty/Actvty       */
     @01950    f1201507    04.  /*MD's, Fam Med Subsp,Other        Non-Fed;MD's By Speclty/Actvty       */
     @01954    f1201505    04.  /*MD's, Fam Med Subsp,Other        Non-Fed;MD's By Speclty/Actvty       */
     @01958    f0461808    05.  /*Med Spec Tot, Total              Non-Fed;MD's By Speclty/Actvty       */
     @01963    f0461807    05.  /*Med Spec Tot, Total              Non-Fed;MD's By Speclty/Actvty       */
     @01968    f0461805    05.  /*Med Spec Tot, Total              Non-Fed;MD's By Speclty/Actvty       */
     @01973    f1107808    05.  /*Med Spec Tot, Total Patn Care    Non-Fed;Patient Care                 */
     @01978    f1107807    05.  /*Med Spec Tot, Total Patn Care    Non-Fed;Patient Care                 */
     @01983    f1107805    05.  /*Med Spec Tot, Total Patn Care    Non-Fed;Patient Care                 */
     @01988    f0886108    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @01992    f0886107    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @01996    f0886106    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02000    f0886105    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02004    f0886100    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02008    f0886195    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02012    f0886190    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02016    f1250308    05.  /*Med Spec Tot, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02021    f1250307    05.  /*Med Spec Tot, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02026    f1250305    05.  /*Med Spec Tot, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02031    f0462108    05.  /*Med Spec Tot, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02036    f0462107    05.  /*Med Spec Tot, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02041    f0462105    05.  /*Med Spec Tot, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02046    f0462208    05.  /*Med Spec Tot, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @02051    f0462207    05.  /*Med Spec Tot, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @02056    f0462205    05.  /*Med Spec Tot, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @02061    f0462308    05.  /*Med Spec Tot, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @02066    f0462307    05.  /*Med Spec Tot, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @02071    f0462305    05.  /*Med Spec Tot, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @02076    f1108008    05.  /*Med Spec Tot, Research           Non-Fed;MD's By Speclty/Actvty       */
     @02081    f1108007    05.  /*Med Spec Tot, Research           Non-Fed;MD's By Speclty/Actvty       */
     @02086    f1108005    05.  /*Med Spec Tot, Research           Non-Fed;MD's By Speclty/Actvty       */
     @02091    f0462508    05.  /*Med Spec Tot, Other              Non-Fed;MD's By Speclty/Actvty       */
     @02096    f0462507    05.  /*Med Spec Tot, Other              Non-Fed;MD's By Speclty/Actvty       */
     @02101    f0462505    05.  /*Med Spec Tot, Other              Non-Fed;MD's By Speclty/Actvty       */
     @02106    f1167408    05.  /*Allergy & Immunology, Total      Non-Fed;MD's By Speclty/Actvty       */
     @02111    f1167407    05.  /*Allergy & Immunology, Total      Non-Fed;MD's By Speclty/Actvty       */
     @02116    f1167405    05.  /*Allergy & Immunology, Total      Non-Fed;MD's By Speclty/Actvty       */
     @02121    f1167508    05.  /*Allergy&Immunology,Tot Patn Cr   Non-Fed;Patient Care                 */
     @02126    f1167507    05.  /*Allergy&Immunology,Tot Patn Cr   Non-Fed;Patient Care                 */
     @02131    f1167505    05.  /*Allergy&Immunology,Tot Patn Cr   Non-Fed;Patient Care                 */
     @02136    f1167608    04.  /*Allergy&Immunology,PC,Off Based  Non-Fed;Patn Care Office-Based       */
     @02140    f1167607    04.  /*Allergy&Immunology,PC,Off Based  Non-Fed;Patn Care Office-Based       */
     @02144    f1167605    04.  /*Allergy&Immunology,PC,Off Based  Non-Fed;Patn Care Office-Based       */
     @02148    f1250408    04.  /*Allergy&Immunology,Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @02152    f1250407    04.  /*Allergy&Immunology,Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @02156    f1250405    04.  /*Allergy&Immunology,Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @02160    f1167908    04.  /*Allergy&Immunlgy,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02164    f1167907    04.  /*Allergy&Immunlgy,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02168    f1167905    04.  /*Allergy&Immunlgy,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02172    f1168008    04.  /*Allergy&Immunlgy,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @02176    f1168007    04.  /*Allergy&Immunlgy,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @02180    f1168005    04.  /*Allergy&Immunlgy,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @02184    f1168108    04.  /*Allergy&Immunology, Teaching     Non-Fed;MD's By Speclty/Actvty       */
     @02188    f1168107    04.  /*Allergy&Immunology, Teaching     Non-Fed;MD's By Speclty/Actvty       */
     @02192    f1168105    04.  /*Allergy&Immunology, Teaching     Non-Fed;MD's By Speclty/Actvty       */
     @02196    f1168208    04.  /*Allergy&Immunology, Research     Non-Fed;MD's By Speclty/Actvty       */
     @02200    f1168207    04.  /*Allergy&Immunology, Research     Non-Fed;MD's By Speclty/Actvty       */
     @02204    f1168205    04.  /*Allergy&Immunology, Research     Non-Fed;MD's By Speclty/Actvty       */
     @02208    f1168308    04.  /*Allergy&Immunology, Other        Non-Fed;MD's By Speclty/Actvty       */
     @02212    f1168307    04.  /*Allergy&Immunology, Other        Non-Fed;MD's By Speclty/Actvty       */
     @02216    f1168305    04.  /*Allergy&Immunology, Other        Non-Fed;MD's By Speclty/Actvty       */
     @02220    f0463108    05.  /*Cardiovas Dis, Total             Non-Fed;MD's By Speclty/Actvty       */
     @02225    f0463107    05.  /*Cardiovas Dis, Total             Non-Fed;MD's By Speclty/Actvty       */
     @02230    f0463105    05.  /*Cardiovas Dis, Total             Non-Fed;MD's By Speclty/Actvty       */
     @02235    f1108408    05.  /*Cardiovas Dis, Total Patn Care   Non-Fed;Patient Care                 */
     @02240    f1108407    05.  /*Cardiovas Dis, Total Patn Care   Non-Fed;Patient Care                 */
     @02245    f1108405    05.  /*Cardiovas Dis, Total Patn Care   Non-Fed;Patient Care                 */
     @02250    f0463308    04.  /*Cardiovas Dis, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @02254    f0463307    04.  /*Cardiovas Dis, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @02258    f0463305    04.  /*Cardiovas Dis, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @02262    f1250508    04.  /*Cardiovas Dis, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @02266    f1250507    04.  /*Cardiovas Dis, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @02270    f1250505    04.  /*Cardiovas Dis, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @02274    f0463508    04.  /*Cardiovas Dis, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @02278    f0463507    04.  /*Cardiovas Dis, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @02282    f0463505    04.  /*Cardiovas Dis, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @02286    f0997708    04.  /*Cardiovas Dis, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @02290    f0997707    04.  /*Cardiovas Dis, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @02294    f0997705    04.  /*Cardiovas Dis, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @02298    f0997808    04.  /*Cardiovas Dis, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @02302    f0997807    04.  /*Cardiovas Dis, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @02306    f0997805    04.  /*Cardiovas Dis, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @02310    f1108608    04.  /*Cardiovas Dis, Research          Non-Fed;MD's By Speclty/Actvty       */
     @02314    f1108607    04.  /*Cardiovas Dis, Research          Non-Fed;MD's By Speclty/Actvty       */
     @02318    f1108605    04.  /*Cardiovas Dis, Research          Non-Fed;MD's By Speclty/Actvty       */
     @02322    f0998008    04.  /*Cardiovas Dis, Other             Non-Fed;MD's By Speclty/Actvty       */
     @02326    f0998007    04.  /*Cardiovas Dis, Other             Non-Fed;MD's By Speclty/Actvty       */
     @02330    f0998005    04.  /*Cardiovas Dis, Other             Non-Fed;MD's By Speclty/Actvty       */
     @02334    f0463608    05.  /*Dermatology, Total               Non-Fed;MD's By Speclty/Actvty       */
     @02339    f0463607    05.  /*Dermatology, Total               Non-Fed;MD's By Speclty/Actvty       */
     @02344    f0463605    05.  /*Dermatology, Total               Non-Fed;MD's By Speclty/Actvty       */
     @02349    f1108708    05.  /*Dermatology, Total Patnt Care    Non-Fed;Patient Care                 */
     @02354    f1108707    05.  /*Dermatology, Total Patnt Care    Non-Fed;Patient Care                 */
     @02359    f1108705    05.  /*Dermatology, Total Patnt Care    Non-Fed;Patient Care                 */
     @02364    f0463808    04.  /*Dermatology, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @02368    f0463807    04.  /*Dermatology, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @02372    f0463805    04.  /*Dermatology, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @02376    f1250608    04.  /*Dermatology, PC, Hosp Resident   Non-Fed;Patn Care Hosp-Based         */
     @02380    f1250607    04.  /*Dermatology, PC, Hosp Resident   Non-Fed;Patn Care Hosp-Based         */
     @02384    f1250605    04.  /*Dermatology, PC, Hosp Resident   Non-Fed;Patn Care Hosp-Based         */
     @02388    f0464008    04.  /*Dermatology, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @02392    f0464007    04.  /*Dermatology, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @02396    f0464005    04.  /*Dermatology, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @02400    f0998308    04.  /*Dermatology, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @02404    f0998307    04.  /*Dermatology, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @02408    f0998305    04.  /*Dermatology, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @02412    f0998408    04.  /*Dermatology, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @02416    f0998407    04.  /*Dermatology, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @02420    f0998405    04.  /*Dermatology, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @02424    f1108908    04.  /*Dermatology, Research            Non-Fed;MD's By Speclty/Actvty       */
     @02428    f1108907    04.  /*Dermatology, Research            Non-Fed;MD's By Speclty/Actvty       */
     @02432    f1108905    04.  /*Dermatology, Research            Non-Fed;MD's By Speclty/Actvty       */
     @02436    f0998608    04.  /*Dermatology, Other               Non-Fed;MD's By Speclty/Actvty       */
     @02440    f0998607    04.  /*Dermatology, Other               Non-Fed;MD's By Speclty/Actvty       */
     @02444    f0998605    04.  /*Dermatology, Other               Non-Fed;MD's By Speclty/Actvty       */
     @02448    f0464108    05.  /*Gastroenterology, Total          Non-Fed;MD's By Speclty/Actvty       */
     @02453    f0464107    05.  /*Gastroenterology, Total          Non-Fed;MD's By Speclty/Actvty       */
     @02458    f0464105    05.  /*Gastroenterology, Total          Non-Fed;MD's By Speclty/Actvty       */
     @02463    f1109008    05.  /*Gastroenterology, Total Ptn Cr   Non-Fed;Patient Care                 */
     @02468    f1109007    05.  /*Gastroenterology, Total Ptn Cr   Non-Fed;Patient Care                 */
     @02473    f1109005    05.  /*Gastroenterology, Total Ptn Cr   Non-Fed;Patient Care                 */
     @02478    f0464308    04.  /*Gastroenterology, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @02482    f0464307    04.  /*Gastroenterology, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @02486    f0464305    04.  /*Gastroenterology, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @02490    f1250708    04.  /*Gastroenterology, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @02494    f1250707    04.  /*Gastroenterology, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @02498    f1250705    04.  /*Gastroenterology, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @02502    f0464508    04.  /*Gastroenterology, PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02506    f0464507    04.  /*Gastroenterology, PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02510    f0464505    04.  /*Gastroenterology, PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02514    f0998908    04.  /*Gastroenterology, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @02518    f0998907    04.  /*Gastroenterology, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @02522    f0998905    04.  /*Gastroenterology, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @02526    f0999008    04.  /*Gastroenterology, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @02530    f0999007    04.  /*Gastroenterology, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @02534    f0999005    04.  /*Gastroenterology, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @02538    f1109208    04.  /*Gastroenterology, Research       Non-Fed;MD's By Speclty/Actvty       */
     @02542    f1109207    04.  /*Gastroenterology, Research       Non-Fed;MD's By Speclty/Actvty       */
     @02546    f1109205    04.  /*Gastroenterology, Research       Non-Fed;MD's By Speclty/Actvty       */
     @02550    f0999208    04.  /*Gastroenterology, Other          Non-Fed;MD's By Speclty/Actvty       */
     @02554    f0999207    04.  /*Gastroenterology, Other          Non-Fed;MD's By Speclty/Actvty       */
     @02558    f0999205    04.  /*Gastroenterology, Other          Non-Fed;MD's By Speclty/Actvty       */
     @02562    f1120808    05.  /*General Internal Med, Total      Non-Fed;MD's By Speclty/Actvty       */
     @02567    f1120807    05.  /*General Internal Med, Total      Non-Fed;MD's By Speclty/Actvty       */
     @02572    f1120805    05.  /*General Internal Med, Total      Non-Fed;MD's By Speclty/Actvty       */
     @02577    f1109308    05.  /*Gnrl Int Med, Total Patn Care    Non-Fed;Patient Care                 */
     @02582    f1109307    05.  /*Gnrl Int Med, Total Patn Care    Non-Fed;Patient Care                 */
     @02587    f1109305    05.  /*Gnrl Int Med, Total Patn Care    Non-Fed;Patient Care                 */
     @02592    f1120908    04.  /*Gnrl Int Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02596    f1120907    04.  /*Gnrl Int Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02600    f1120905    04.  /*Gnrl Int Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02604    f1250808    04.  /*Gnrl Int Med, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02608    f1250807    04.  /*Gnrl Int Med, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02612    f1250805    04.  /*Gnrl Int Med, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02616    f1121108    04.  /*Gnrl Int Med, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02620    f1121107    04.  /*Gnrl Int Med, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02624    f1121105    04.  /*Gnrl Int Med, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02628    f1121208    04.  /*General Int Med,Administration   Non-Fed;MD's By Speclty/Actvty       */
     @02632    f1121207    04.  /*General Int Med,Administration   Non-Fed;MD's By Speclty/Actvty       */
     @02636    f1121205    04.  /*General Int Med,Administration   Non-Fed;MD's By Speclty/Actvty       */
     @02640    f1121308    04.  /*General Int Med, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @02644    f1121307    04.  /*General Int Med, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @02648    f1121305    04.  /*General Int Med, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @02652    f1109508    04.  /*General Int Med, Research        Non-Fed;MD's By Speclty/Actvty       */
     @02656    f1109507    04.  /*General Int Med, Research        Non-Fed;MD's By Speclty/Actvty       */
     @02660    f1109505    04.  /*General Int Med, Research        Non-Fed;MD's By Speclty/Actvty       */
     @02664    f1121408    04.  /*General Int Med, Other           Non-Fed;MD's By Speclty/Actvty       */
     @02668    f1121407    04.  /*General Int Med, Other           Non-Fed;MD's By Speclty/Actvty       */
     @02672    f1121405    04.  /*General Int Med, Other           Non-Fed;MD's By Speclty/Actvty       */
     @02676    f1172408    05.  /*Int Med Subspecs, Total          Non-Fed;MD's By Speclty/Actvty       */
     @02681    f1172407    05.  /*Int Med Subspecs, Total          Non-Fed;MD's By Speclty/Actvty       */
     @02686    f1172405    05.  /*Int Med Subspecs, Total          Non-Fed;MD's By Speclty/Actvty       */
     @02691    f1172508    05.  /*Int Med Subspecs, Tot Patn Care  Non-Fed;Patient Care                 */
     @02696    f1172507    05.  /*Int Med Subspecs, Tot Patn Care  Non-Fed;Patient Care                 */
     @02701    f1172505    05.  /*Int Med Subspecs, Tot Patn Care  Non-Fed;Patient Care                 */
     @02706    f1172608    04.  /*Int Med Subspecs, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @02710    f1172607    04.  /*Int Med Subspecs, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @02714    f1172605    04.  /*Int Med Subspecs, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @02718    f1250908    04.  /*Int Med Subspecs, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @02722    f1250907    04.  /*Int Med Subspecs, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @02726    f1250905    04.  /*Int Med Subspecs, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @02730    f1172908    04.  /*Int Med Subspecs,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02734    f1172907    04.  /*Int Med Subspecs,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02738    f1172905    04.  /*Int Med Subspecs,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02742    f1173008    04.  /*Int Med Subspecs, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @02746    f1173007    04.  /*Int Med Subspecs, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @02750    f1173005    04.  /*Int Med Subspecs, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @02754    f1173108    04.  /*Int Med Subspecs, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @02758    f1173107    04.  /*Int Med Subspecs, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @02762    f1173105    04.  /*Int Med Subspecs, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @02766    f1173208    04.  /*Int Med Subspecs, Research       Non-Fed;MD's By Speclty/Actvty       */
     @02770    f1173207    04.  /*Int Med Subspecs, Research       Non-Fed;MD's By Speclty/Actvty       */
     @02774    f1173205    04.  /*Int Med Subspecs, Research       Non-Fed;MD's By Speclty/Actvty       */
     @02778    f1173308    04.  /*Int Med Subspecs, Other          Non-Fed;MD's By Speclty/Actvty       */
     @02782    f1173307    04.  /*Int Med Subspecs, Other          Non-Fed;MD's By Speclty/Actvty       */
     @02786    f1173305    04.  /*Int Med Subspecs, Other          Non-Fed;MD's By Speclty/Actvty       */
     @02790    f1170408    05.  /*Pediatrics, General, Total       Non-Fed;MD's By Speclty/Actvty       */
     @02795    f1170407    05.  /*Pediatrics, General, Total       Non-Fed;MD's By Speclty/Actvty       */
     @02800    f1170405    05.  /*Pediatrics, General, Total       Non-Fed;MD's By Speclty/Actvty       */
     @02805    f1170508    05.  /*Pediatrics,Gen,Tot Patient Care  Non-Fed;Patient Care                 */
     @02810    f1170507    05.  /*Pediatrics,Gen,Tot Patient Care  Non-Fed;Patient Care                 */
     @02815    f1170505    05.  /*Pediatrics,Gen,Tot Patient Care  Non-Fed;Patient Care                 */
     @02820    f1170608    04.  /*Pediatrics,Gen,PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @02824    f1170607    04.  /*Pediatrics,Gen,PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @02828    f1170605    04.  /*Pediatrics,Gen,PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @02832    f1251008    04.  /*Pediatrics,Gen,PC,Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02836    f1251007    04.  /*Pediatrics,Gen,PC,Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02840    f1251005    04.  /*Pediatrics,Gen,PC,Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02844    f1170908    04.  /*Pediatrics,Gen,PC,Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02848    f1170907    04.  /*Pediatrics,Gen,PC,Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02852    f1170905    04.  /*Pediatrics,Gen,PC,Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02856    f1171008    04.  /*Pediatrics,Gen, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @02860    f1171007    04.  /*Pediatrics,Gen, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @02864    f1171005    04.  /*Pediatrics,Gen, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @02868    f1171108    04.  /*Pediatrics,Gen, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @02872    f1171107    04.  /*Pediatrics,Gen, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @02876    f1171105    04.  /*Pediatrics,Gen, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @02880    f1171208    04.  /*Pediatrics,Gen, Research         Non-Fed;MD's By Speclty/Actvty       */
     @02884    f1171207    04.  /*Pediatrics,Gen, Research         Non-Fed;MD's By Speclty/Actvty       */
     @02888    f1171205    04.  /*Pediatrics,Gen, Research         Non-Fed;MD's By Speclty/Actvty       */
     @02892    f1171308    04.  /*Pediatrics,Gen, Other            Non-Fed;MD's By Speclty/Actvty       */
     @02896    f1171307    04.  /*Pediatrics,Gen, Other            Non-Fed;MD's By Speclty/Actvty       */
     @02900    f1171305    04.  /*Pediatrics,Gen, Other            Non-Fed;MD's By Speclty/Actvty       */
     @02904    f1171408    05.  /*Ped Subspecs, Total              Non-Fed;MD's By Speclty/Actvty       */
     @02909    f1171407    05.  /*Ped Subspecs, Total              Non-Fed;MD's By Speclty/Actvty       */
     @02914    f1171405    05.  /*Ped Subspecs, Total              Non-Fed;MD's By Speclty/Actvty       */
     @02919    f1171508    05.  /*Ped Subspecs, Total Patn Care    Non-Fed;Patient Care                 */
     @02924    f1171507    05.  /*Ped Subspecs, Total Patn Care    Non-Fed;Patient Care                 */
     @02929    f1171505    05.  /*Ped Subspecs, Total Patn Care    Non-Fed;Patient Care                 */
     @02934    f1171608    04.  /*Ped Subspecs, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02938    f1171607    04.  /*Ped Subspecs, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02942    f1171605    04.  /*Ped Subspecs, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02946    f1251108    04.  /*Ped Subspecs, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02950    f1251107    04.  /*Ped Subspecs, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02954    f1251105    04.  /*Ped Subspecs, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02958    f1171908    04.  /*Ped Subspecs, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02962    f1171907    04.  /*Ped Subspecs, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02966    f1171905    04.  /*Ped Subspecs, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02970    f1172008    04.  /*Ped Subspecs, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @02974    f1172007    04.  /*Ped Subspecs, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @02978    f1172005    04.  /*Ped Subspecs, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @02982    f1172108    04.  /*Ped Subspecs, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @02986    f1172107    04.  /*Ped Subspecs, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @02990    f1172105    04.  /*Ped Subspecs, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @02994    f1172208    04.  /*Ped Subspecs, Research           Non-Fed;MD's By Speclty/Actvty       */
     @02998    f1172207    04.  /*Ped Subspecs, Research           Non-Fed;MD's By Speclty/Actvty       */
     @03002    f1172205    04.  /*Ped Subspecs, Research           Non-Fed;MD's By Speclty/Actvty       */
     @03006    f1172308    04.  /*Ped Subspecs, Other              Non-Fed;MD's By Speclty/Actvty       */
     @03010    f1172307    04.  /*Ped Subspecs, Other              Non-Fed;MD's By Speclty/Actvty       */
     @03014    f1172305    04.  /*Ped Subspecs, Other              Non-Fed;MD's By Speclty/Actvty       */
     @03018    f0466108    05.  /*Ped Cardiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @03023    f0466107    05.  /*Ped Cardiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @03028    f0466105    05.  /*Ped Cardiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @03033    f1111208    05.  /*Ped Cardiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @03038    f1111207    05.  /*Ped Cardiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @03043    f1111205    05.  /*Ped Cardiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @03048    f0466308    04.  /*Ped Cardiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @03052    f0466307    04.  /*Ped Cardiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @03056    f0466305    04.  /*Ped Cardiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @03060    f1251208    04.  /*Ped Cardiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @03064    f1251207    04.  /*Ped Cardiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @03068    f1251205    04.  /*Ped Cardiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @03072    f0466508    04.  /*Ped Cardiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03076    f0466507    04.  /*Ped Cardiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03080    f0466505    04.  /*Ped Cardiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03084    f1001308    04.  /*Ped Cardiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @03088    f1001307    04.  /*Ped Cardiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @03092    f1001305    04.  /*Ped Cardiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @03096    f1001408    04.  /*Ped Cardiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @03100    f1001407    04.  /*Ped Cardiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @03104    f1001405    04.  /*Ped Cardiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @03108    f1111408    04.  /*Ped Cardiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @03112    f1111407    04.  /*Ped Cardiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @03116    f1111405    04.  /*Ped Cardiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @03120    f1001608    04.  /*Ped Cardiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @03124    f1001607    04.  /*Ped Cardiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @03128    f1001605    04.  /*Ped Cardiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @03132    f0466608    05.  /*Pulmonary Dis, Total             Non-Fed;MD's By Speclty/Actvty       */
     @03137    f0466607    05.  /*Pulmonary Dis, Total             Non-Fed;MD's By Speclty/Actvty       */
     @03142    f0466605    05.  /*Pulmonary Dis, Total             Non-Fed;MD's By Speclty/Actvty       */
     @03147    f1111508    05.  /*Pulmonary Dis, Total Patn Care   Non-Fed;Patient Care                 */
     @03152    f1111507    05.  /*Pulmonary Dis, Total Patn Care   Non-Fed;Patient Care                 */
     @03157    f1111505    05.  /*Pulmonary Dis, Total Patn Care   Non-Fed;Patient Care                 */
     @03162    f0466808    04.  /*Pulmonary Dis, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @03166    f0466807    04.  /*Pulmonary Dis, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @03170    f0466805    04.  /*Pulmonary Dis, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @03174    f1251308    04.  /*Pulmonary Dis, PC, Hosp Resdnt   Non-Fed,Patn Care Hosp-Based         */
     @03178    f1251307    04.  /*Pulmonary Dis, PC, Hosp Resdnt   Non-Fed,Patn Care Hosp-Based         */
     @03182    f1251305    04.  /*Pulmonary Dis, PC, Hosp Resdnt   Non-Fed,Patn Care Hosp-Based         */
     @03186    f0467008    04.  /*Pulmonary Dis, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03190    f0467007    04.  /*Pulmonary Dis, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03194    f0467005    04.  /*Pulmonary Dis, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03198    f1001908    04.  /*Pulmonary Dis, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @03202    f1001907    04.  /*Pulmonary Dis, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @03206    f1001905    04.  /*Pulmonary Dis, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @03210    f1002008    04.  /*Pulmonary Dis, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @03214    f1002007    04.  /*Pulmonary Dis, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @03218    f1002005    04.  /*Pulmonary Dis, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @03222    f1111708    04.  /*Pulmonary Dis, Research          Non-Fed;MD's By Speclty/Actvty       */
     @03226    f1111707    04.  /*Pulmonary Dis, Research          Non-Fed;MD's By Speclty/Actvty       */
     @03230    f1111705    04.  /*Pulmonary Dis, Research          Non-Fed;MD's By Speclty/Actvty       */
     @03234    f1002208    04.  /*Pulmonary Dis, Other             Non-Fed;MD's By Speclty/Actvty       */
     @03238    f1002207    04.  /*Pulmonary Dis, Other             Non-Fed;MD's By Speclty/Actvty       */
     @03242    f1002205    04.  /*Pulmonary Dis, Other             Non-Fed;MD's By Speclty/Actvty       */
     @03246    f0467108    05.  /*Surg Specs Tot, Total            Non-Fed;MD's By Speclty/Actvty       */
     @03251    f0467107    05.  /*Surg Specs Tot, Total            Non-Fed;MD's By Speclty/Actvty       */
     @03256    f0467105    05.  /*Surg Specs Tot, Total            Non-Fed;MD's By Speclty/Actvty       */
     @03261    f1111808    05.  /*Surg Specs Tot, Total Patn Care  Non-Fed;Patient Care                 */
     @03266    f1111807    05.  /*Surg Specs Tot, Total Patn Care  Non-Fed;Patient Care                 */
     @03271    f1111805    05.  /*Surg Specs Tot, Total Patn Care  Non-Fed;Patient Care                 */
     @03276    f0886208    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03280    f0886207    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03284    f0886206    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03288    f0886205    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03292    f0886200    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03296    f0886295    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03300    f0886290    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03304    f1251408    05.  /*Surg Specs Tot, PC, Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @03309    f1251407    05.  /*Surg Specs Tot, PC, Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @03314    f1251405    05.  /*Surg Specs Tot, PC, Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @03319    f0467508    05.  /*Surg Specs Tot, PC, Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @03324    f0467507    05.  /*Surg Specs Tot, PC, Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @03329    f0467505    05.  /*Surg Specs Tot, PC, Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @03334    f0467608    05.  /*Surg Specs Tot, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @03339    f0467607    05.  /*Surg Specs Tot, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @03344    f0467605    05.  /*Surg Specs Tot, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @03349    f0467708    05.  /*Surg Specs Tot, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @03354    f0467707    05.  /*Surg Specs Tot, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @03359    f0467705    05.  /*Surg Specs Tot, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @03364    f1112008    05.  /*Surg Specs Tot, Research         Non-Fed;MD's By Speclty/Actvty       */
     @03369    f1112007    05.  /*Surg Specs Tot, Research         Non-Fed;MD's By Speclty/Actvty       */
     @03374    f1112005    05.  /*Surg Specs Tot, Research         Non-Fed;MD's By Speclty/Actvty       */
     @03379    f0467908    05.  /*Surg Specs Tot, Other            Non-Fed;MD's By Speclty/Actvty       */
     @03384    f0467907    05.  /*Surg Specs Tot, Other            Non-Fed;MD's By Speclty/Actvty       */
     @03389    f0467905    05.  /*Surg Specs Tot, Other            Non-Fed;MD's By Speclty/Actvty       */
     @03394    f0468008    05.  /*Genrl Surg, Total                Non-Fed;MD's By Speclty/Actvty       */
     @03399    f0468007    05.  /*Genrl Surg, Total                Non-Fed;MD's By Speclty/Actvty       */
     @03404    f0468005    05.  /*Genrl Surg, Total                Non-Fed;MD's By Speclty/Actvty       */
     @03409    f1112108    05.  /*Genrl Surg, Total Patient Care   Non-Fed;Patient Care                 */
     @03414    f1112107    05.  /*Genrl Surg, Total Patient Care   Non-Fed;Patient Care                 */
     @03419    f1112105    05.  /*Genrl Surg, Total Patient Care   Non-Fed;Patient Care                 */
     @03424    f0468208    04.  /*Genrl Surg, PC, Office Based     Non-Fed;Patn Care Office-Based       */
     @03428    f0468207    04.  /*Genrl Surg, PC, Office Based     Non-Fed;Patn Care Office-Based       */
     @03432    f0468205    04.  /*Genrl Surg, PC, Office Based     Non-Fed;Patn Care Office-Based       */
     @03436    f1251508    04.  /*Genrl Surg, PC, Hosp Residents   Non-Fed;Patn Care Hosp-Based         */
     @03440    f1251507    04.  /*Genrl Surg, PC, Hosp Residents   Non-Fed;Patn Care Hosp-Based         */
     @03444    f1251505    04.  /*Genrl Surg, PC, Hosp Residents   Non-Fed;Patn Care Hosp-Based         */
     @03448    f0468408    04.  /*Genrl Surg, PC, Hosp FT Staff    Non-Fed;Patn Care Hosp-Based         */
     @03452    f0468407    04.  /*Genrl Surg, PC, Hosp FT Staff    Non-Fed;Patn Care Hosp-Based         */
     @03456    f0468405    04.  /*Genrl Surg, PC, Hosp FT Staff    Non-Fed;Patn Care Hosp-Based         */
     @03460    f1002708    04.  /*Genrl Surg, Administration       Non-Fed;MD's By Speclty/Actvty       */
     @03464    f1002707    04.  /*Genrl Surg, Administration       Non-Fed;MD's By Speclty/Actvty       */
     @03468    f1002705    04.  /*Genrl Surg, Administration       Non-Fed;MD's By Speclty/Actvty       */
     @03472    f1002808    04.  /*Genrl Surg, Teaching             Non-Fed;MD's By Speclty/Actvty       */
     @03476    f1002807    04.  /*Genrl Surg, Teaching             Non-Fed;MD's By Speclty/Actvty       */
     @03480    f1002805    04.  /*Genrl Surg, Teaching             Non-Fed;MD's By Speclty/Actvty       */
     @03484    f1112308    04.  /*Genrl Surg, Research             Non-Fed;MD's By Speclty/Actvty       */
     @03488    f1112307    04.  /*Genrl Surg, Research             Non-Fed;MD's By Speclty/Actvty       */
     @03492    f1112305    04.  /*Genrl Surg, Research             Non-Fed;MD's By Speclty/Actvty       */
     @03496    f1003008    04.  /*Genrl Surg, Other                Non-Fed;MD's By Speclty/Actvty       */
     @03500    f1003007    04.  /*Genrl Surg, Other                Non-Fed;MD's By Speclty/Actvty       */
     @03504    f1003005    04.  /*Genrl Surg, Other                Non-Fed;MD's By Speclty/Actvty       */
     @03508    f0468508    05.  /*Neurolgcal Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03513    f0468507    05.  /*Neurolgcal Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03518    f0468505    05.  /*Neurolgcal Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03523    f1112408    05.  /*Neurolgcal Surg, Total Ptn Care  Non-Fed;Patient Care                 */
     @03528    f1112407    05.  /*Neurolgcal Surg, Total Ptn Care  Non-Fed;Patient Care                 */
     @03533    f1112405    05.  /*Neurolgcal Surg, Total Ptn Care  Non-Fed;Patient Care                 */
     @03538    f0468708    04.  /*Neurolgcal Surg, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @03542    f0468707    04.  /*Neurolgcal Surg, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @03546    f0468705    04.  /*Neurolgcal Surg, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @03550    f1251608    04.  /*Neurolgcal Surg, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @03554    f1251607    04.  /*Neurolgcal Surg, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @03558    f1251605    04.  /*Neurolgcal Surg, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @03562    f0468908    04.  /*Neurolgcal Surg, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @03566    f0468907    04.  /*Neurolgcal Surg, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @03570    f0468905    04.  /*Neurolgcal Surg, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @03574    f1003308    04.  /*Neurolgcal Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03578    f1003307    04.  /*Neurolgcal Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03582    f1003305    04.  /*Neurolgcal Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03586    f1003408    04.  /*Neurolgcal Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03590    f1003407    04.  /*Neurolgcal Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03594    f1003405    04.  /*Neurolgcal Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03598    f1112608    04.  /*Neurolgcal Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03602    f1112607    04.  /*Neurolgcal Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03606    f1112605    04.  /*Neurolgcal Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03610    f1003608    04.  /*Neurolgcal Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03614    f1003607    04.  /*Neurolgcal Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03618    f1003605    04.  /*Neurolgcal Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03622    f1168408    05.  /*Ob-Gyn, General, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03627    f1168407    05.  /*Ob-Gyn, General, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03632    f1168405    05.  /*Ob-Gyn, General, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03637    f1168508    05.  /*Ob-Gyn, Gen, Total Patient Care  Non-Fed;Patient Care                 */
     @03642    f1168507    05.  /*Ob-Gyn, Gen, Total Patient Care  Non-Fed;Patient Care                 */
     @03647    f1168505    05.  /*Ob-Gyn, Gen, Total Patient Care  Non-Fed;Patient Care                 */
     @03652    f1168608    04.  /*Ob-Gyn, Gen, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @03656    f1168607    04.  /*Ob-Gyn, Gen, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @03660    f1168605    04.  /*Ob-Gyn, Gen, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @03664    f1251708    04.  /*Ob-Gyn, Gen, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @03668    f1251707    04.  /*Ob-Gyn, Gen, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @03672    f1251705    04.  /*Ob-Gyn, Gen, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @03676    f1168908    04.  /*Ob-Gyn, Gen, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @03680    f1168907    04.  /*Ob-Gyn, Gen, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @03684    f1168905    04.  /*Ob-Gyn, Gen, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @03688    f1169008    04.  /*Ob-Gyn, General, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03692    f1169007    04.  /*Ob-Gyn, General, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03696    f1169005    04.  /*Ob-Gyn, General, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03700    f1169108    04.  /*Ob-Gyn, General, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03704    f1169107    04.  /*Ob-Gyn, General, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03708    f1169105    04.  /*Ob-Gyn, General, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03712    f1169208    04.  /*Ob-Gyn, General, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03716    f1169207    04.  /*Ob-Gyn, General, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03720    f1169205    04.  /*Ob-Gyn, General, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03724    f1169308    04.  /*Ob-Gyn, General, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03728    f1169307    04.  /*Ob-Gyn, General, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03732    f1169305    04.  /*Ob-Gyn, General, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03736    f1169408    05.  /*Ob-Gyn Subspecs, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03741    f1169407    05.  /*Ob-Gyn Subspecs, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03746    f1169405    05.  /*Ob-Gyn Subspecs, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03751    f1169508    05.  /*Ob-Gyn Subspecs,Tot Patient Cr   Non-Fed;Patient Care                 */
     @03756    f1169507    05.  /*Ob-Gyn Subspecs,Tot Patient Cr   Non-Fed;Patient Care                 */
     @03761    f1169505    05.  /*Ob-Gyn Subspecs,Tot Patient Cr   Non-Fed;Patient Care                 */
     @03766    f1169608    04.  /*Ob-Gyn Subspecs,PC,Off Based     Non-Fed;Patn Care Office-Based       */
     @03770    f1169607    04.  /*Ob-Gyn Subspecs,PC,Off Based     Non-Fed;Patn Care Office-Based       */
     @03774    f1169605    04.  /*Ob-Gyn Subspecs,PC,Off Based     Non-Fed;Patn Care Office-Based       */
     @03778    f1251808    04.  /*Ob-Gyn Subspecs,PC,Hosp Residnt  Non-Fed;Patn Care Hosp-Based         */
     @03782    f1251807    04.  /*Ob-Gyn Subspecs,PC,Hosp Residnt  Non-Fed;Patn Care Hosp-Based         */
     @03786    f1251805    04.  /*Ob-Gyn Subspecs,PC,Hosp Residnt  Non-Fed;Patn Care Hosp-Based         */
     @03790    f1169908    04.  /*Ob-Gyn Subspecs,PC,Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03794    f1169907    04.  /*Ob-Gyn Subspecs,PC,Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03798    f1169905    04.  /*Ob-Gyn Subspecs,PC,Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03802    f1170008    04.  /*Ob-Gyn Subspecs, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03806    f1170007    04.  /*Ob-Gyn Subspecs, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03810    f1170005    04.  /*Ob-Gyn Subspecs, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03814    f1170108    04.  /*Ob-Gyn Subspecs, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03818    f1170107    04.  /*Ob-Gyn Subspecs, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03822    f1170105    04.  /*Ob-Gyn Subspecs, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03826    f1170208    04.  /*Ob-Gyn Subspecs, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03830    f1170207    04.  /*Ob-Gyn Subspecs, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03834    f1170205    04.  /*Ob-Gyn Subspecs, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03838    f1170308    04.  /*Ob-Gyn Subspecs, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03842    f1170307    04.  /*Ob-Gyn Subspecs, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03846    f1170305    04.  /*Ob-Gyn Subspecs, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03850    f0469508    05.  /*Ophthalmolgy, Total              Non-Fed;MD's By Speclty/Actvty       */
     @03855    f0469507    05.  /*Ophthalmolgy, Total              Non-Fed;MD's By Speclty/Actvty       */
     @03860    f0469505    05.  /*Ophthalmolgy, Total              Non-Fed;MD's By Speclty/Actvty       */
     @03865    f1113008    05.  /*Ophthalmolgy, Total Patn Care    Non-Fed;Patient Care                 */
     @03870    f1113007    05.  /*Ophthalmolgy, Total Patn Care    Non-Fed;Patient Care                 */
     @03875    f1113005    05.  /*Ophthalmolgy, Total Patn Care    Non-Fed;Patient Care                 */
     @03880    f0469708    04.  /*Ophthalmolgy, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @03884    f0469707    04.  /*Ophthalmolgy, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @03888    f0469705    04.  /*Ophthalmolgy, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @03892    f1251908    04.  /*Ophthalmolgy, PC, Hosp Resdnts   Non-Fed;Patn Care Hosp-Based         */
     @03896    f1251907    04.  /*Ophthalmolgy, PC, Hosp Resdnts   Non-Fed;Patn Care Hosp-Based         */
     @03900    f1251905    04.  /*Ophthalmolgy, PC, Hosp Resdnts   Non-Fed;Patn Care Hosp-Based         */
     @03904    f0469908    04.  /*Ophthalmolgy, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @03908    f0469907    04.  /*Ophthalmolgy, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @03912    f0469905    04.  /*Ophthalmolgy, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @03916    f1004508    04.  /*Ophthalmolgy, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @03920    f1004507    04.  /*Ophthalmolgy, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @03924    f1004505    04.  /*Ophthalmolgy, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @03928    f1004608    04.  /*Ophthalmolgy, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @03932    f1004607    04.  /*Ophthalmolgy, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @03936    f1004605    04.  /*Ophthalmolgy, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @03940    f1113208    04.  /*Ophthalmolgy, Research           Non-Fed;MD's By Speclty/Actvty       */
     @03944    f1113207    04.  /*Ophthalmolgy, Research           Non-Fed;MD's By Speclty/Actvty       */
     @03948    f1113205    04.  /*Ophthalmolgy, Research           Non-Fed;MD's By Speclty/Actvty       */
     @03952    f1004808    04.  /*Ophthalmolgy, Other              Non-Fed;MD's By Speclty/Actvty       */
     @03956    f1004807    04.  /*Ophthalmolgy, Other              Non-Fed;MD's By Speclty/Actvty       */
     @03960    f1004805    04.  /*Ophthalmolgy, Other              Non-Fed;MD's By Speclty/Actvty       */
     @03964    f0470008    05.  /*Orthopedic Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03969    f0470007    05.  /*Orthopedic Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03974    f0470005    05.  /*Orthopedic Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03979    f1113308    05.  /*Orthopedic Surg, Total Ptn Care  Non-Fed;Patient Care                 */
     @03984    f1113307    05.  /*Orthopedic Surg, Total Ptn Care  Non-Fed;Patient Care                 */
     @03989    f1113305    05.  /*Orthopedic Surg, Total Ptn Care  Non-Fed;Patient Care                 */
     @03994    f0470208    04.  /*Orthopedic Surg, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @03998    f0470207    04.  /*Orthopedic Surg, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04002    f0470205    04.  /*Orthopedic Surg, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04006    f1252008    04.  /*Orthopedic Surg, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @04010    f1252007    04.  /*Orthopedic Surg, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @04014    f1252005    04.  /*Orthopedic Surg, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @04018    f0470408    04.  /*Orthopedic Surg, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04022    f0470407    04.  /*Orthopedic Surg, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04026    f0470405    04.  /*Orthopedic Surg, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04030    f1005108    04.  /*Orthopedic Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @04034    f1005107    04.  /*Orthopedic Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @04038    f1005105    04.  /*Orthopedic Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @04042    f1005208    04.  /*Orthopedic Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @04046    f1005207    04.  /*Orthopedic Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @04050    f1005205    04.  /*Orthopedic Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @04054    f1113508    04.  /*Orthopedic Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @04058    f1113507    04.  /*Orthopedic Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @04062    f1113505    04.  /*Orthopedic Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @04066    f1005408    04.  /*Orthopedic Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @04070    f1005407    04.  /*Orthopedic Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @04074    f1005405    04.  /*Orthopedic Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @04078    f0470508    05.  /*Otolaryngolgy, Total             Non-Fed,MD's By Speclty/Actvty       */
     @04083    f0470507    05.  /*Otolaryngolgy, Total             Non-Fed,MD's By Speclty/Actvty       */
     @04088    f0470505    05.  /*Otolaryngolgy, Total             Non-Fed,MD's By Speclty/Actvty       */
     @04093    f1113608    05.  /*Otolaryngolgy, Total Ptn Care    Non-Fed;Patient Care                 */
     @04098    f1113607    05.  /*Otolaryngolgy, Total Ptn Care    Non-Fed;Patient Care                 */
     @04103    f1113605    05.  /*Otolaryngolgy, Total Ptn Care    Non-Fed;Patient Care                 */
     @04108    f0470708    04.  /*Otolaryngolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04112    f0470707    04.  /*Otolaryngolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04116    f0470705    04.  /*Otolaryngolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04120    f1252108    04.  /*Otolaryngolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04124    f1252107    04.  /*Otolaryngolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04128    f1252105    04.  /*Otolaryngolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04132    f0470908    04.  /*Otolaryngolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04136    f0470907    04.  /*Otolaryngolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04140    f0470905    04.  /*Otolaryngolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04144    f1005708    04.  /*Otolaryngolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04148    f1005707    04.  /*Otolaryngolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04152    f1005705    04.  /*Otolaryngolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04156    f1005808    04.  /*Otolaryngolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04160    f1005807    04.  /*Otolaryngolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04164    f1005805    04.  /*Otolaryngolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04168    f1113808    04.  /*Otolaryngolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04172    f1113807    04.  /*Otolaryngolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04176    f1113805    04.  /*Otolaryngolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04180    f1006008    04.  /*Otolaryngolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04184    f1006007    04.  /*Otolaryngolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04188    f1006005    04.  /*Otolaryngolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04192    f0471008    05.  /*Plastic Surg, Total              Non-Fed;MD's By Speclty/Actvty       */
     @04197    f0471007    05.  /*Plastic Surg, Total              Non-Fed;MD's By Speclty/Actvty       */
     @04202    f0471005    05.  /*Plastic Surg, Total              Non-Fed;MD's By Speclty/Actvty       */
     @04207    f1113908    05.  /*Plastic Surg, Total Patn Care    Non-Fed;Patient Care                 */
     @04212    f1113907    05.  /*Plastic Surg, Total Patn Care    Non-Fed;Patient Care                 */
     @04217    f1113905    05.  /*Plastic Surg, Total Patn Care    Non-Fed;Patient Care                 */
     @04222    f0471208    04.  /*Plastic Surg, PC, Office Based   Non-Fed;MD's By Speclty/Actvty       */
     @04226    f0471207    04.  /*Plastic Surg, PC, Office Based   Non-Fed;MD's By Speclty/Actvty       */
     @04230    f0471205    04.  /*Plastic Surg, PC, Office Based   Non-Fed;MD's By Speclty/Actvty       */
     @04234    f1252208    04.  /*Plastic Surg, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @04238    f1252207    04.  /*Plastic Surg, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @04242    f1252205    04.  /*Plastic Surg, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @04246    f0471408    04.  /*Plastic Surg, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @04250    f0471407    04.  /*Plastic Surg, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @04254    f0471405    04.  /*Plastic Surg, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @04258    f1006308    04.  /*Plastic Surg, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @04262    f1006307    04.  /*Plastic Surg, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @04266    f1006305    04.  /*Plastic Surg, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @04270    f1006408    04.  /*Plastic Surg, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @04274    f1006407    04.  /*Plastic Surg, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @04278    f1006405    04.  /*Plastic Surg, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @04282    f1114108    04.  /*Plastic Surg, Research           Non-Fed;MD's By Speclty/Actvty       */
     @04286    f1114107    04.  /*Plastic Surg, Research           Non-Fed;MD's By Speclty/Actvty       */
     @04290    f1114105    04.  /*Plastic Surg, Research           Non-Fed;MD's By Speclty/Actvty       */
     @04294    f1006608    04.  /*Plastic Surg, Other              Non-Fed;MD's By Speclty/Actvty       */
     @04298    f1006607    04.  /*Plastic Surg, Other              Non-Fed;MD's By Speclty/Actvty       */
     @04302    f1006605    04.  /*Plastic Surg, Other              Non-Fed;MD's By Speclty/Actvty       */
     @04306    f0471508    05.  /*Colon/Rectal Srg, Total          Non-Fed;MD's By Speclty/Actvty       */
     @04311    f0471507    05.  /*Colon/Rectal Srg, Total          Non-Fed;MD's By Speclty/Actvty       */
     @04316    f0471505    05.  /*Colon/Rectal Srg, Total          Non-Fed;MD's By Speclty/Actvty       */
     @04321    f1114208    05.  /*Colon/Rectal Srg, Total Ptn Cr   Non-Fed;Patient Care                 */
     @04326    f1114207    05.  /*Colon/Rectal Srg, Total Ptn Cr   Non-Fed;Patient Care                 */
     @04331    f1114205    05.  /*Colon/Rectal Srg, Total Ptn Cr   Non-Fed;Patient Care                 */
     @04336    f0471708    04.  /*Colon/Rectal Srg, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @04340    f0471707    04.  /*Colon/Rectal Srg, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @04344    f0471705    04.  /*Colon/Rectal Srg, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @04348    f1252308    04.  /*Colon/Rectal Srg, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @04352    f1252307    04.  /*Colon/Rectal Srg, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @04356    f1252305    04.  /*Colon/Rectal Srg, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @04360    f0471908    04.  /*Colon/Rectal Srg, PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04364    f0471907    04.  /*Colon/Rectal Srg, PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04368    f0471905    04.  /*Colon/Rectal Srg, PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04372    f1006908    04.  /*Colon/Rectal Srg, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @04376    f1006907    04.  /*Colon/Rectal Srg, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @04380    f1006905    04.  /*Colon/Rectal Srg, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @04384    f1007008    04.  /*Colon/Rectal Srg, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @04388    f1007007    04.  /*Colon/Rectal Srg, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @04392    f1007005    04.  /*Colon/Rectal Srg, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @04396    f1114408    04.  /*Colon/Rectal Srg, Research       Non-Fed;MD's By Speclty/Actvty       */
     @04400    f1114407    04.  /*Colon/Rectal Srg, Research       Non-Fed;MD's By Speclty/Actvty       */
     @04404    f1114405    04.  /*Colon/Rectal Srg, Research       Non-Fed;MD's By Speclty/Actvty       */
     @04408    f1007208    04.  /*Colon/Rectal Srg, Other          Non-Fed;MD's By Speclty/Actvty       */
     @04412    f1007207    04.  /*Colon/Rectal Srg, Other          Non-Fed;MD's By Speclty/Actvty       */
     @04416    f1007205    04.  /*Colon/Rectal Srg, Other          Non-Fed;MD's By Speclty/Actvty       */
     @04420    f0472008    05.  /*Thoracic Surg, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04425    f0472007    05.  /*Thoracic Surg, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04430    f0472005    05.  /*Thoracic Surg, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04435    f1114508    05.  /*Thoracic Surg, Total Patn Care   Non-Fed;Patient Care                 */
     @04440    f1114507    05.  /*Thoracic Surg, Total Patn Care   Non-Fed;Patient Care                 */
     @04445    f1114505    05.  /*Thoracic Surg, Total Patn Care   Non-Fed;Patient Care                 */
     @04450    f0472208    04.  /*Thoracic Surg, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04454    f0472207    04.  /*Thoracic Surg, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04458    f0472205    04.  /*Thoracic Surg, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04462    f1252408    04.  /*Thoracic Surg, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04466    f1252407    04.  /*Thoracic Surg, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04470    f1252405    04.  /*Thoracic Surg, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04474    f0472408    04.  /*Thoracic Surg, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04478    f0472407    04.  /*Thoracic Surg, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04482    f0472405    04.  /*Thoracic Surg, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04486    f1007508    04.  /*Thoracic Surg, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04490    f1007507    04.  /*Thoracic Surg, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04494    f1007505    04.  /*Thoracic Surg, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04498    f1007608    04.  /*Thoracic Surg, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04502    f1007607    04.  /*Thoracic Surg, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04506    f1007605    04.  /*Thoracic Surg, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04510    f1114708    04.  /*Thoracic Surg, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04514    f1114707    04.  /*Thoracic Surg, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04518    f1114705    04.  /*Thoracic Surg, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04522    f1007808    04.  /*Thoracic Surg, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04526    f1007807    04.  /*Thoracic Surg, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04530    f1007805    04.  /*Thoracic Surg, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04534    f0472508    05.  /*Urology, Total                   Non-Fed;MD's By Speclty/Actvty       */
     @04539    f0472507    05.  /*Urology, Total                   Non-Fed;MD's By Speclty/Actvty       */
     @04544    f0472505    05.  /*Urology, Total                   Non-Fed;MD's By Speclty/Actvty       */
     @04549    f1114808    05.  /*Urology, Total Patient Care      Non-Fed;Patient Care                 */
     @04554    f1114807    05.  /*Urology, Total Patient Care      Non-Fed;Patient Care                 */
     @04559    f1114805    05.  /*Urology, Total Patient Care      Non-Fed;Patient Care                 */
     @04564    f0472708    04.  /*Urology, PC, Office Based        Non-Fed;Patn Care Office-Based       */
     @04568    f0472707    04.  /*Urology, PC, Office Based        Non-Fed;Patn Care Office-Based       */
     @04572    f0472705    04.  /*Urology, PC, Office Based        Non-Fed;Patn Care Office-Based       */
     @04576    f1252508    04.  /*Urology, PC, Hosp Residents      Non-Fed;Patn Care Hosp-Based         */
     @04580    f1252507    04.  /*Urology, PC, Hosp Residents      Non-Fed;Patn Care Hosp-Based         */
     @04584    f1252505    04.  /*Urology, PC, Hosp Residents      Non-Fed;Patn Care Hosp-Based         */
     @04588    f0472908    04.  /*Urology, PC, Hosp FT Staff       Non-Fed;Patn Care Hosp-Based         */
     @04592    f0472907    04.  /*Urology, PC, Hosp FT Staff       Non-Fed;Patn Care Hosp-Based         */
     @04596    f0472905    04.  /*Urology, PC, Hosp FT Staff       Non-Fed;Patn Care Hosp-Based         */
     @04600    f1008108    04.  /*Urology, Administration          Non-Fed;MD's By Speclty/Actvty       */
     @04604    f1008107    04.  /*Urology, Administration          Non-Fed;MD's By Speclty/Actvty       */
     @04608    f1008105    04.  /*Urology, Administration          Non-Fed;MD's By Speclty/Actvty       */
     @04612    f1008208    04.  /*Urology, Teaching                Non-Fed;MD's By Speclty/Actvty       */
     @04616    f1008207    04.  /*Urology, Teaching                Non-Fed;MD's By Speclty/Actvty       */
     @04620    f1008205    04.  /*Urology, Teaching                Non-Fed;MD's By Speclty/Actvty       */
     @04624    f1115008    04.  /*Urology, Research                Non-Fed;MD's By Speclty/Actvty       */
     @04628    f1115007    04.  /*Urology, Research                Non-Fed;MD's By Speclty/Actvty       */
     @04632    f1115005    04.  /*Urology, Research                Non-Fed;MD's By Speclty/Actvty       */
     @04636    f1008408    04.  /*Urology, Other                   Non-Fed;MD's By Speclty/Actvty       */
     @04640    f1008407    04.  /*Urology, Other                   Non-Fed;MD's By Speclty/Actvty       */
     @04644    f1008405    04.  /*Urology, Other                   Non-Fed;MD's By Speclty/Actvty       */
     @04648    f0473008    05.  /*Other Spec, Tot, Total           Non-Fed;MD's By Speclty/Actvty       */
     @04653    f0473007    05.  /*Other Spec, Tot, Total           Non-Fed;MD's By Speclty/Actvty       */
     @04658    f0473005    05.  /*Other Spec, Tot, Total           Non-Fed;MD's By Speclty/Actvty       */
     @04663    f1115108    05.  /*Other Spec, Tot, Total Ptn Care  Non-Fed;Patient Care                 */
     @04668    f1115107    05.  /*Other Spec, Tot, Total Ptn Care  Non-Fed;Patient Care                 */
     @04673    f1115105    05.  /*Other Spec, Tot, Total Ptn Care  Non-Fed;Patient Care                 */
     @04678    f0886308    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04682    f0886307    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04686    f0886306    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04690    f0886305    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04694    f0886300    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04698    f0886395    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04702    f0886390    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04706    f1252608    05.  /*Other Spec, Tot, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @04711    f1252607    05.  /*Other Spec, Tot, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @04716    f1252605    05.  /*Other Spec, Tot, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @04721    f0473308    05.  /*Other Spec, Tot, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04726    f0473307    05.  /*Other Spec, Tot, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04731    f0473305    05.  /*Other Spec, Tot, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04736    f0473408    05.  /*Other Spec, Tot, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @04741    f0473407    05.  /*Other Spec, Tot, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @04746    f0473405    05.  /*Other Spec, Tot, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @04751    f0473508    05.  /*Other Spec, Tot, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @04756    f0473507    05.  /*Other Spec, Tot, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @04761    f0473505    05.  /*Other Spec, Tot, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @04766    f1115308    05.  /*Other Spec, Tot, Research        Non-Fed;MD's By Speclty/Actvty       */
     @04771    f1115307    05.  /*Other Spec, Tot, Research        Non-Fed;MD's By Speclty/Actvty       */
     @04776    f1115305    05.  /*Other Spec, Tot, Research        Non-Fed;MD's By Speclty/Actvty       */
     @04781    f0473708    05.  /*Other Spec, Tot, Other           Non-Fed;MD's By Speclty/Actvty       */
     @04786    f0473707    05.  /*Other Spec, Tot, Other           Non-Fed;MD's By Speclty/Actvty       */
     @04791    f0473705    05.  /*Other Spec, Tot, Other           Non-Fed;MD's By Speclty/Actvty       */
     @04796    f0473808    05.  /*Aerospace Med, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04801    f0473807    05.  /*Aerospace Med, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04806    f0473805    05.  /*Aerospace Med, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04811    f1115408    05.  /*Aerospace Med, Total Patn Care   Non-Fed;Patient Care                 */
     @04816    f1115407    05.  /*Aerospace Med, Total Patn Care   Non-Fed;Patient Care                 */
     @04821    f1115405    05.  /*Aerospace Med, Total Patn Care   Non-Fed;Patient Care                 */
     @04826    f0474008    04.  /*Aerospace Med, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04830    f0474007    04.  /*Aerospace Med, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04834    f0474005    04.  /*Aerospace Med, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04838    f1252708    04.  /*Aerospace Med, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04842    f1252707    04.  /*Aerospace Med, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04846    f1252705    04.  /*Aerospace Med, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04850    f0474208    04.  /*Aerospace Med, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04854    f0474207    04.  /*Aerospace Med, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04858    f0474205    04.  /*Aerospace Med, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04862    f1008908    04.  /*Aerospace Med, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04866    f1008907    04.  /*Aerospace Med, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04870    f1008905    04.  /*Aerospace Med, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04874    f1009008    04.  /*Aerospace Med, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04878    f1009007    04.  /*Aerospace Med, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04882    f1009005    04.  /*Aerospace Med, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04886    f1115608    04.  /*Aerospace Med, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04890    f1115607    04.  /*Aerospace Med, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04894    f1115605    04.  /*Aerospace Med, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04898    f1009208    04.  /*Aerospace Med, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04902    f1009207    04.  /*Aerospace Med, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04906    f1009205    04.  /*Aerospace Med, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04910    f0474308    05.  /*Anesthesiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04915    f0474307    05.  /*Anesthesiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04920    f0474305    05.  /*Anesthesiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04925    f1115708    05.  /*Anesthesiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @04930    f1115707    05.  /*Anesthesiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @04935    f1115705    05.  /*Anesthesiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @04940    f0474508    04.  /*Anesthesiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04944    f0474507    04.  /*Anesthesiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04948    f0474505    04.  /*Anesthesiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04952    f1252808    04.  /*Anesthesiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04956    f1252807    04.  /*Anesthesiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04960    f1252805    04.  /*Anesthesiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04964    f0474708    04.  /*Anesthesiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04968    f0474707    04.  /*Anesthesiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04972    f0474705    04.  /*Anesthesiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04976    f1009508    04.  /*Anesthesiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04980    f1009507    04.  /*Anesthesiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04984    f1009505    04.  /*Anesthesiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04988    f1009608    04.  /*Anesthesiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04992    f1009607    04.  /*Anesthesiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04996    f1009605    04.  /*Anesthesiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05000    f1115908    04.  /*Anesthesiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05004    f1115907    04.  /*Anesthesiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05008    f1115905    04.  /*Anesthesiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05012    f1009808    04.  /*Anesthesiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05016    f1009807    04.  /*Anesthesiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05020    f1009805    04.  /*Anesthesiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05024    f0474808    05.  /*Child Psych, Total               Non-Fed;MD's By Speclty/Actvty       */
     @05029    f0474807    05.  /*Child Psych, Total               Non-Fed;MD's By Speclty/Actvty       */
     @05034    f0474805    05.  /*Child Psych, Total               Non-Fed;MD's By Speclty/Actvty       */
     @05039    f1116008    05.  /*Child Psych, Total Patn Care     Non-Fed;Patient Care                 */
     @05044    f1116007    05.  /*Child Psych, Total Patn Care     Non-Fed;Patient Care                 */
     @05049    f1116005    05.  /*Child Psych, Total Patn Care     Non-Fed;Patient Care                 */
     @05054    f0475008    04.  /*Child Psych, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @05058    f0475007    04.  /*Child Psych, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @05062    f0475005    04.  /*Child Psych, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @05066    f1252908    04.  /*Child Psych, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @05070    f1252907    04.  /*Child Psych, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @05074    f1252905    04.  /*Child Psych, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @05078    f0475208    04.  /*Child Psych, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @05082    f0475207    04.  /*Child Psych, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @05086    f0475205    04.  /*Child Psych, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @05090    f1010108    04.  /*Child Psych, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @05094    f1010107    04.  /*Child Psych, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @05098    f1010105    04.  /*Child Psych, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @05102    f1010208    04.  /*Child Psych, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @05106    f1010207    04.  /*Child Psych, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @05110    f1010205    04.  /*Child Psych, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @05114    f1116208    04.  /*Child Psych, Research            Non-Fed;MD's By Speclty/Actvty       */
     @05118    f1116207    04.  /*Child Psych, Research            Non-Fed;MD's By Speclty/Actvty       */
     @05122    f1116205    04.  /*Child Psych, Research            Non-Fed;MD's By Speclty/Actvty       */
     @05126    f1010408    04.  /*Child Psych, Other               Non-Fed;MD's By Speclty/Actvty       */
     @05130    f1010407    04.  /*Child Psych, Other               Non-Fed;MD's By Speclty/Actvty       */
     @05134    f1010405    04.  /*Child Psych, Other               Non-Fed;MD's By Speclty/Actvty       */
     @05138    f0475308    05.  /*Diag Radiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05143    f0475307    05.  /*Diag Radiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05148    f0475305    05.  /*Diag Radiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05153    f1116308    05.  /*Diag Radiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @05158    f1116307    05.  /*Diag Radiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @05163    f1116305    05.  /*Diag Radiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @05168    f0475508    04.  /*Diag Radiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05172    f0475507    04.  /*Diag Radiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05176    f0475505    04.  /*Diag Radiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05180    f1253008    04.  /*Diag Radiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05184    f1253007    04.  /*Diag Radiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05188    f1253005    04.  /*Diag Radiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05192    f0475708    04.  /*Diag Radiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05196    f0475707    04.  /*Diag Radiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05200    f0475705    04.  /*Diag Radiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05204    f1010708    04.  /*Diag Radiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05208    f1010707    04.  /*Diag Radiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05212    f1010705    04.  /*Diag Radiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05216    f1010808    04.  /*Diag Radiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05220    f1010807    04.  /*Diag Radiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05224    f1010805    04.  /*Diag Radiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05228    f1116508    04.  /*Diag Radiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05232    f1116507    04.  /*Diag Radiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05236    f1116505    04.  /*Diag Radiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05240    f1011008    04.  /*Diag Radiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05244    f1011007    04.  /*Diag Radiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05248    f1011005    04.  /*Diag Radiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05252    f0982608    05.  /*Emergency Med, Total             Non-Fed;Subset Of Other Specs        */
     @05257    f0982607    05.  /*Emergency Med, Total             Non-Fed;Subset Of Other Specs        */
     @05262    f0982605    05.  /*Emergency Med, Total             Non-Fed;Subset Of Other Specs        */
     @05267    f1116608    05.  /*Emergency Med, Total Patn Care   Non-Fed;Subset Of Other Specs        */
     @05272    f1116607    05.  /*Emergency Med, Total Patn Care   Non-Fed;Subset Of Other Specs        */
     @05277    f1116605    05.  /*Emergency Med, Total Patn Care   Non-Fed;Subset Of Other Specs        */
     @05282    f0982808    04.  /*Emergency Med, PC, Office Based  Non-Fed;Subset Of Other Specs        */
     @05286    f0982807    04.  /*Emergency Med, PC, Office Based  Non-Fed;Subset Of Other Specs        */
     @05290    f0982805    04.  /*Emergency Med, PC, Office Based  Non-Fed;Subset Of Other Specs        */
     @05294    f1253108    04.  /*Emergency Med, PC, Hosp Resdnt   Non-Fed;Subset Of Other Specs        */
     @05298    f1253107    04.  /*Emergency Med, PC, Hosp Resdnt   Non-Fed;Subset Of Other Specs        */
     @05302    f1253105    04.  /*Emergency Med, PC, Hosp Resdnt   Non-Fed;Subset Of Other Specs        */
     @05306    f0983008    04.  /*Emergency Med, PC, Hosp FT Stf   Non-Fed;Subset Of Other Specs        */
     @05310    f0983007    04.  /*Emergency Med, PC, Hosp FT Stf   Non-Fed;Subset Of Other Specs        */
     @05314    f0983005    04.  /*Emergency Med, PC, Hosp FT Stf   Non-Fed;Subset Of Other Specs        */
     @05318    f1018508    04.  /*Emergency Med, Administration    Non-Fed;Subset Of Other Specs        */
     @05322    f1018507    04.  /*Emergency Med, Administration    Non-Fed;Subset Of Other Specs        */
     @05326    f1018505    04.  /*Emergency Med, Administration    Non-Fed;Subset Of Other Specs        */
     @05330    f1018608    04.  /*Emergency Med, Teaching          Non-Fed;Subset Of Other Specs        */
     @05334    f1018607    04.  /*Emergency Med, Teaching          Non-Fed;Subset Of Other Specs        */
     @05338    f1018605    04.  /*Emergency Med, Teaching          Non-Fed;Subset Of Other Specs        */
     @05342    f1116808    04.  /*Emergency Med, Research          Non-Fed;Subset Of Other Specs        */
     @05346    f1116807    04.  /*Emergency Med, Research          Non-Fed;Subset Of Other Specs        */
     @05350    f1116805    04.  /*Emergency Med, Research          Non-Fed;Subset Of Other Specs        */
     @05354    f1018808    04.  /*Emergency Med, Other             Non-Fed;Subset Of Other Specs        */
     @05358    f1018807    04.  /*Emergency Med, Other             Non-Fed;Subset Of Other Specs        */
     @05362    f1018805    04.  /*Emergency Med, Other             Non-Fed;Subset Of Other Specs        */
     @05366    f0475808    05.  /*Forensic Path, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05371    f0475807    05.  /*Forensic Path, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05376    f0475805    05.  /*Forensic Path, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05381    f1116908    05.  /*Forensic Path, Total Patn Care   Non-Fed;Patient Care                 */
     @05386    f1116907    05.  /*Forensic Path, Total Patn Care   Non-Fed;Patient Care                 */
     @05391    f1116905    05.  /*Forensic Path, Total Patn Care   Non-Fed;Patient Care                 */
     @05396    f0476008    04.  /*Forensic Path, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05400    f0476007    04.  /*Forensic Path, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05404    f0476005    04.  /*Forensic Path, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05408    f1253208    04.  /*Forensic Path, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05412    f1253207    04.  /*Forensic Path, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05416    f1253205    04.  /*Forensic Path, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05420    f0476208    04.  /*Forensic Path, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05424    f0476207    04.  /*Forensic Path, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05428    f0476205    04.  /*Forensic Path, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05432    f1011308    04.  /*Forensic Path, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05436    f1011307    04.  /*Forensic Path, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05440    f1011305    04.  /*Forensic Path, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05444    f1011408    04.  /*Forensic Path, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05448    f1011407    04.  /*Forensic Path, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05452    f1011405    04.  /*Forensic Path, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05456    f1117108    04.  /*Forensic Path, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05460    f1117107    04.  /*Forensic Path, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05464    f1117105    04.  /*Forensic Path, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05468    f1011608    04.  /*Forensic Path, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05472    f1011607    04.  /*Forensic Path, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05476    f1011605    04.  /*Forensic Path, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05480    f1242508    05.  /*Medical Genetics, Total          Non-Fed;MD's By Speclty/Actvty       */
     @05485    f1242507    05.  /*Medical Genetics, Total          Non-Fed;MD's By Speclty/Actvty       */
     @05490    f1242505    05.  /*Medical Genetics, Total          Non-Fed;MD's By Speclty/Actvty       */
     @05495    f1243208    05.  /*Medical Genetics,Tot Patnt Care  Non-Fed;Patient Care                 */
     @05500    f1243207    05.  /*Medical Genetics,Tot Patnt Care  Non-Fed;Patient Care                 */
     @05505    f1243205    05.  /*Medical Genetics,Tot Patnt Care  Non-Fed;Patient Care                 */
     @05510    f1243308    04.  /*Medical Genetics,PC,Off Based    Non-Fed;Patn Care Office-Based       */
     @05514    f1243307    04.  /*Medical Genetics,PC,Off Based    Non-Fed;Patn Care Office-Based       */
     @05518    f1243305    04.  /*Medical Genetics,PC,Off Based    Non-Fed;Patn Care Office-Based       */
     @05522    f1253308    04.  /*Medical Genetics,PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @05526    f1253307    04.  /*Medical Genetics,PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @05530    f1253305    04.  /*Medical Genetics,PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @05534    f1243608    04.  /*Medical Genetics,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @05538    f1243607    04.  /*Medical Genetics,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @05542    f1243605    04.  /*Medical Genetics,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @05546    f1243708    04.  /*Medical Genetics,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @05550    f1243707    04.  /*Medical Genetics,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @05554    f1243705    04.  /*Medical Genetics,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @05558    f1243808    04.  /*Medical Genetics, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @05562    f1243807    04.  /*Medical Genetics, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @05566    f1243805    04.  /*Medical Genetics, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @05570    f1243908    04.  /*Medical Genetics, Research       Non-Fed;MD's By Speclty/Actvty       */
     @05574    f1243907    04.  /*Medical Genetics, Research       Non-Fed;MD's By Speclty/Actvty       */
     @05578    f1243905    04.  /*Medical Genetics, Research       Non-Fed;MD's By Speclty/Actvty       */
     @05582    f1244008    04.  /*Medical Genetics, Other          Non-Fed;MD's By Speclty/Actvty       */
     @05586    f1244007    04.  /*Medical Genetics, Other          Non-Fed;MD's By Speclty/Actvty       */
     @05590    f1244005    04.  /*Medical Genetics, Other          Non-Fed;MD's By Speclty/Actvty       */
     @05594    f0476308    05.  /*Neurology, Total                 Non-Fed;MD's By Speclty/Actvty       */
     @05599    f0476307    05.  /*Neurology, Total                 Non-Fed;MD's By Speclty/Actvty       */
     @05604    f0476305    05.  /*Neurology, Total                 Non-Fed;MD's By Speclty/Actvty       */
     @05609    f1117208    05.  /*Neurology, Total Patient Care    Non-Fed;Patient Care                 */
     @05614    f1117207    05.  /*Neurology, Total Patient Care    Non-Fed;Patient Care                 */
     @05619    f1117205    05.  /*Neurology, Total Patient Care    Non-Fed;Patient Care                 */
     @05624    f0476508    04.  /*Neurology, PC, Office Based      Non-Fed;Patn Care Office-Based       */
     @05628    f0476507    04.  /*Neurology, PC, Office Based      Non-Fed;Patn Care Office-Based       */
     @05632    f0476505    04.  /*Neurology, PC, Office Based      Non-Fed;Patn Care Office-Based       */
     @05636    f1253408    04.  /*Neurology, PC, Hosp Residents    Non-Fed;Patn Care Hosp-Based         */
     @05640    f1253407    04.  /*Neurology, PC, Hosp Residents    Non-Fed;Patn Care Hosp-Based         */
     @05644    f1253405    04.  /*Neurology, PC, Hosp Residents    Non-Fed;Patn Care Hosp-Based         */
     @05648    f0476708    04.  /*Neurology, PC, Hosp FT Staff     Non-Fed;Patn Care Hosp-Based         */
     @05652    f0476707    04.  /*Neurology, PC, Hosp FT Staff     Non-Fed;Patn Care Hosp-Based         */
     @05656    f0476705    04.  /*Neurology, PC, Hosp FT Staff     Non-Fed;Patn Care Hosp-Based         */
     @05660    f1011908    04.  /*Neurology, Administration        Non-Fed;MD's By Speclty/Actvty       */
     @05664    f1011907    04.  /*Neurology, Administration        Non-Fed;MD's By Speclty/Actvty       */
     @05668    f1011905    04.  /*Neurology, Administration        Non-Fed;MD's By Speclty/Actvty       */
     @05672    f1012008    04.  /*Neurology, Teaching              Non-Fed;MD's By Speclty/Actvty       */
     @05676    f1012007    04.  /*Neurology, Teaching              Non-Fed;MD's By Speclty/Actvty       */
     @05680    f1012005    04.  /*Neurology, Teaching              Non-Fed;MD's By Speclty/Actvty       */
     @05684    f1117408    04.  /*Neurology, Research              Non-Fed;MD's By Speclty/Actvty       */
     @05688    f1117407    04.  /*Neurology, Research              Non-Fed;MD's By Speclty/Actvty       */
     @05692    f1117405    04.  /*Neurology, Research              Non-Fed;MD's By Speclty/Actvty       */
     @05696    f1012208    04.  /*Neurology, Other                 Non-Fed;MD's By Speclty/Actvty       */
     @05700    f1012207    04.  /*Neurology, Other                 Non-Fed;MD's By Speclty/Actvty       */
     @05704    f1012205    04.  /*Neurology, Other                 Non-Fed;MD's By Speclty/Actvty       */
     @05708    f0981608    05.  /*Nuclear Med, Total               Non-Fed;Subset Of Radiology          */
     @05713    f0981607    05.  /*Nuclear Med, Total               Non-Fed;Subset Of Radiology          */
     @05718    f0981605    05.  /*Nuclear Med, Total               Non-Fed;Subset Of Radiology          */
     @05723    f1117508    05.  /*Nuclear Med, Total Patient Care  Non-Fed;Subset Of Radiology          */
     @05728    f1117507    05.  /*Nuclear Med, Total Patient Care  Non-Fed;Subset Of Radiology          */
     @05733    f1117505    05.  /*Nuclear Med, Total Patient Care  Non-Fed;Subset Of Radiology          */
     @05738    f0981808    04.  /*Nuclear Med, PC, Office Based    Non-Fed;Subset Of Radiology          */
     @05742    f0981807    04.  /*Nuclear Med, PC, Office Based    Non-Fed;Subset Of Radiology          */
     @05746    f0981805    04.  /*Nuclear Med, PC, Office Based    Non-Fed;Subset Of Radiology          */
     @05750    f1253508    04.  /*Nuclear Med, PC, Hosp Residnts   Non-Fed;Subset Of Radiology          */
     @05754    f1253507    04.  /*Nuclear Med, PC, Hosp Residnts   Non-Fed;Subset Of Radiology          */
     @05758    f1253505    04.  /*Nuclear Med, PC, Hosp Residnts   Non-Fed;Subset Of Radiology          */
     @05762    f0982008    04.  /*Nuclear Med, PC, Hosp FT Staff   Non-Fed;Subset Of Radiology          */
     @05766    f0982007    04.  /*Nuclear Med, PC, Hosp FT Staff   Non-Fed;Subset Of Radiology          */
     @05770    f0982005    04.  /*Nuclear Med, PC, Hosp FT Staff   Non-Fed;Subset Of Radiology          */
     @05774    f1016708    04.  /*Nuclear Med, Administration      Non-Fed;Subset Of Radiology          */
     @05778    f1016707    04.  /*Nuclear Med, Administration      Non-Fed;Subset Of Radiology          */
     @05782    f1016705    04.  /*Nuclear Med, Administration      Non-Fed;Subset Of Radiology          */
     @05786    f1016808    04.  /*Nuclear Med, Teaching            Non-Fed;Subset Of Radiology          */
     @05790    f1016807    04.  /*Nuclear Med, Teaching            Non-Fed;Subset Of Radiology          */
     @05794    f1016805    04.  /*Nuclear Med, Teaching            Non-Fed;Subset Of Radiology          */
     @05798    f1117708    04.  /*Nuclear Med, Research            Non-Fed;Subset Of Radiology          */
     @05802    f1117707    04.  /*Nuclear Med, Research            Non-Fed;Subset Of Radiology          */
     @05806    f1117705    04.  /*Nuclear Med, Research            Non-Fed;Subset Of Radiology          */
     @05810    f1017008    04.  /*Nuclear Med, Other               Non-Fed;Subset Of Radiology          */
     @05814    f1017007    04.  /*Nuclear Med, Other               Non-Fed;Subset Of Radiology          */
     @05818    f1017005    04.  /*Nuclear Med, Other               Non-Fed;Subset Of Radiology          */
     @05822    f0476808    05.  /*Occupat Med, Total               Non-Fed;MD's By Speclty/Actvty       */
     @05827    f0476807    05.  /*Occupat Med, Total               Non-Fed;MD's By Speclty/Actvty       */
     @05832    f0476805    05.  /*Occupat Med, Total               Non-Fed;MD's By Speclty/Actvty       */
     @05837    f1117808    05.  /*Occupat Med, Total Patnt Care    Non-Fed;Patient Care                 */
     @05842    f1117807    05.  /*Occupat Med, Total Patnt Care    Non-Fed;Patient Care                 */
     @05847    f1117805    05.  /*Occupat Med, Total Patnt Care    Non-Fed;Patient Care                 */
     @05852    f0477008    04.  /*Occupat Med, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @05856    f0477007    04.  /*Occupat Med, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @05860    f0477005    04.  /*Occupat Med, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @05864    f1253608    04.  /*Occupat Med, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @05868    f1253607    04.  /*Occupat Med, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @05872    f1253605    04.  /*Occupat Med, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @05876    f0477208    04.  /*Occupat Med, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @05880    f0477207    04.  /*Occupat Med, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @05884    f0477205    04.  /*Occupat Med, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @05888    f1012508    04.  /*Occupat Med, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @05892    f1012507    04.  /*Occupat Med, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @05896    f1012505    04.  /*Occupat Med, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @05900    f1012608    04.  /*Occupat Med, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @05904    f1012607    04.  /*Occupat Med, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @05908    f1012605    04.  /*Occupat Med, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @05912    f1118008    04.  /*Occupat Med, Research            Non-Fed;MD's By Speclty/Actvty       */
     @05916    f1118007    04.  /*Occupat Med, Research            Non-Fed;MD's By Speclty/Actvty       */
     @05920    f1118005    04.  /*Occupat Med, Research            Non-Fed;MD's By Speclty/Actvty       */
     @05924    f1012808    04.  /*Occupat Med, Other               Non-Fed;MD's By Speclty/Actvty       */
     @05928    f1012807    04.  /*Occupat Med, Other               Non-Fed;MD's By Speclty/Actvty       */
     @05932    f1012805    04.  /*Occupat Med, Other               Non-Fed;MD's By Speclty/Actvty       */
     @05936    f0477308    05.  /*Psychiatry, Total                Non-Fed;MD's By Speclty/Actvty       */
     @05941    f0477307    05.  /*Psychiatry, Total                Non-Fed;MD's By Speclty/Actvty       */
     @05946    f0477305    05.  /*Psychiatry, Total                Non-Fed;MD's By Speclty/Actvty       */
     @05951    f1118108    05.  /*Psychiatry, Total Patient Care   Non-Fed;Patient Care                 */
     @05956    f1118107    05.  /*Psychiatry, Total Patient Care   Non-Fed;Patient Care                 */
     @05961    f1118105    05.  /*Psychiatry, Total Patient Care   Non-Fed;Patient Care                 */
     @05966    f0477508    04.  /*Psychiatry, PC, Office Based     Non-Fed;Patn Care Office-Based       */
     @05970    f0477507    04.  /*Psychiatry, PC, Office Based     Non-Fed;Patn Care Office-Based       */
     @05974    f0477505    04.  /*Psychiatry, PC, Office Based     Non-Fed;Patn Care Office-Based       */
     @05978    f1253708    04.  /*Psychiatry, PC, Hosp Residents   Non-Fed;Patn Care Hosp-Based         */
     @05982    f1253707    04.  /*Psychiatry, PC, Hosp Residents   Non-Fed;Patn Care Hosp-Based         */
     @05986    f1253705    04.  /*Psychiatry, PC, Hosp Residents   Non-Fed;Patn Care Hosp-Based         */
     @05990    f0477708    04.  /*Psychiatry, PC, Hosp FT Staff    Non-Fed;Patn Care Hosp-Based         */
     @05994    f0477707    04.  /*Psychiatry, PC, Hosp FT Staff    Non-Fed;Patn Care Hosp-Based         */
     @05998    f0477705    04.  /*Psychiatry, PC, Hosp FT Staff    Non-Fed;Patn Care Hosp-Based         */
     @06002    f1013108    04.  /*Psychiatry, Administration       Non-Fed;MD's By Speclty/Actvty       */
     @06006    f1013107    04.  /*Psychiatry, Administration       Non-Fed;MD's By Speclty/Actvty       */
     @06010    f1013105    04.  /*Psychiatry, Administration       Non-Fed;MD's By Speclty/Actvty       */
     @06014    f1013208    04.  /*Psychiatry, Teaching             Non-Fed;MD's By Speclty/Actvty       */
     @06018    f1013207    04.  /*Psychiatry, Teaching             Non-Fed;MD's By Speclty/Actvty       */
     @06022    f1013205    04.  /*Psychiatry, Teaching             Non-Fed;MD's By Speclty/Actvty       */
     @06026    f1118308    04.  /*Psychiatry, Research             Non-Fed;MD's By Speclty/Actvty       */
     @06030    f1118307    04.  /*Psychiatry, Research             Non-Fed;MD's By Speclty/Actvty       */
     @06034    f1118305    04.  /*Psychiatry, Research             Non-Fed;MD's By Speclty/Actvty       */
     @06038    f1013408    04.  /*Psychiatry, Other                Non-Fed;MD's By Speclty/Actvty       */
     @06042    f1013407    04.  /*Psychiatry, Other                Non-Fed;MD's By Speclty/Actvty       */
     @06046    f1013405    04.  /*Psychiatry, Other                Non-Fed;MD's By Speclty/Actvty       */
     @06050    f0477808    05.  /*Path,Anat/Clinic,Total           Non-Fed;MD's By Speclty/Actvty       */
     @06055    f0477807    05.  /*Path,Anat/Clinic,Total           Non-Fed;MD's By Speclty/Actvty       */
     @06060    f0477805    05.  /*Path,Anat/Clinic,Total           Non-Fed;MD's By Speclty/Actvty       */
     @06065    f1118408    05.  /*Path,Anat/Clinic,Tot Patient Cr  Non-Fed;Patient Care                 */
     @06070    f1118407    05.  /*Path,Anat/Clinic,Tot Patient Cr  Non-Fed;Patient Care                 */
     @06075    f1118405    05.  /*Path,Anat/Clinic,Tot Patient Cr  Non-Fed;Patient Care                 */
     @06080    f0478008    04.  /*Path,Anat/Clinic,PC,Off Based    Non-Fed;Patn Care Office-Based       */
     @06084    f0478007    04.  /*Path,Anat/Clinic,PC,Off Based    Non-Fed;Patn Care Office-Based       */
     @06088    f0478005    04.  /*Path,Anat/Clinic,PC,Off Based    Non-Fed;Patn Care Office-Based       */
     @06092    f1253808    04.  /*Path,Anat/Clinic,PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06096    f1253807    04.  /*Path,Anat/Clinic,PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06100    f1253805    04.  /*Path,Anat/Clinic,PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06104    f0478208    04.  /*Path,Anat/Clinic,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06108    f0478207    04.  /*Path,Anat/Clinic,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06112    f0478205    04.  /*Path,Anat/Clinic,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06116    f1013708    04.  /*Path,Anat/Clinic,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @06120    f1013707    04.  /*Path,Anat/Clinic,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @06124    f1013705    04.  /*Path,Anat/Clinic,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @06128    f1013808    04.  /*Path,Anat/Clinic,Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @06132    f1013807    04.  /*Path,Anat/Clinic,Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @06136    f1013805    04.  /*Path,Anat/Clinic,Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @06140    f1118608    04.  /*Path,Anat/Clinic,Research        Non-Fed;MD's By Speclty/Actvty       */
     @06144    f1118607    04.  /*Path,Anat/Clinic,Research        Non-Fed;MD's By Speclty/Actvty       */
     @06148    f1118605    04.  /*Path,Anat/Clinic,Research        Non-Fed;MD's By Speclty/Actvty       */
     @06152    f1014008    04.  /*Path,Anat/Clinic,Other           Non-Fed;MD's By Speclty/Actvty       */
     @06156    f1014007    04.  /*Path,Anat/Clinic,Other           Non-Fed;MD's By Speclty/Actvty       */
     @06160    f1014005    04.  /*Path,Anat/Clinic,Other           Non-Fed;MD's By Speclty/Actvty       */
     @06164    f0478308    05.  /*Phys Med/Rehab, Total            Non-Fed;MD's By Speclty/Actvty       */
     @06169    f0478307    05.  /*Phys Med/Rehab, Total            Non-Fed;MD's By Speclty/Actvty       */
     @06174    f0478305    05.  /*Phys Med/Rehab, Total            Non-Fed;MD's By Speclty/Actvty       */
     @06179    f1118708    05.  /*Phys Med/Rehab, Total Patnt Cr   Non-Fed;Patient Care                 */
     @06184    f1118707    05.  /*Phys Med/Rehab, Total Patnt Cr   Non-Fed;Patient Care                 */
     @06189    f1118705    05.  /*Phys Med/Rehab, Total Patnt Cr   Non-Fed;Patient Care                 */
     @06194    f0478508    04.  /*Phys Med/Rehab, PC, Office Base  Non-Fed;Patn Care Office-Based       */
     @06198    f0478507    04.  /*Phys Med/Rehab, PC, Office Base  Non-Fed;Patn Care Office-Based       */
     @06202    f0478505    04.  /*Phys Med/Rehab, PC, Office Base  Non-Fed;Patn Care Office-Based       */
     @06206    f1253908    04.  /*Phys Med/Rehab, PC, Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06210    f1253907    04.  /*Phys Med/Rehab, PC, Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06214    f1253905    04.  /*Phys Med/Rehab, PC, Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06218    f0478708    04.  /*Phys Med/Rehab, PC, Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06222    f0478707    04.  /*Phys Med/Rehab, PC, Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06226    f0478705    04.  /*Phys Med/Rehab, PC, Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06230    f1014308    04.  /*Phys Med/Rehab, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @06234    f1014307    04.  /*Phys Med/Rehab, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @06238    f1014305    04.  /*Phys Med/Rehab, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @06242    f1014408    04.  /*Phys Med/Rehab, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @06246    f1014407    04.  /*Phys Med/Rehab, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @06250    f1014405    04.  /*Phys Med/Rehab, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @06254    f1118908    04.  /*Phys Med/Rehab, Research         Non-Fed;MD's By Speclty/Actvty       */
     @06258    f1118907    04.  /*Phys Med/Rehab, Research         Non-Fed;MD's By Speclty/Actvty       */
     @06262    f1118905    04.  /*Phys Med/Rehab, Research         Non-Fed;MD's By Speclty/Actvty       */
     @06266    f1014608    04.  /*Phys Med/Rehab, Other            Non-Fed;MD's By Speclty/Actvty       */
     @06270    f1014607    04.  /*Phys Med/Rehab, Other            Non-Fed;MD's By Speclty/Actvty       */
     @06274    f1014605    04.  /*Phys Med/Rehab, Other            Non-Fed;MD's By Speclty/Actvty       */
     @06278    f0478808    05.  /*Gen Prev Med, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06283    f0478807    05.  /*Gen Prev Med, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06288    f0478805    05.  /*Gen Prev Med, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06293    f1119008    05.  /*Gen Prev Med, Total Patnt Care   Non-Fed;Patient Care                 */
     @06298    f1119007    05.  /*Gen Prev Med, Total Patnt Care   Non-Fed;Patient Care                 */
     @06303    f1119005    05.  /*Gen Prev Med, Total Patnt Care   Non-Fed;Patient Care                 */
     @06308    f0479008    04.  /*Gen Prev Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06312    f0479007    04.  /*Gen Prev Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06316    f0479005    04.  /*Gen Prev Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06320    f1254008    04.  /*Gen Prev Med, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @06324    f1254007    04.  /*Gen Prev Med, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @06328    f1254005    04.  /*Gen Prev Med, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @06332    f0479208    04.  /*Gen Prev Med, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @06336    f0479207    04.  /*Gen Prev Med, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @06340    f0479205    04.  /*Gen Prev Med, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @06344    f1014908    04.  /*Gen Prev Med, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06348    f1014907    04.  /*Gen Prev Med, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06352    f1014905    04.  /*Gen Prev Med, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06356    f1015008    04.  /*Gen Prev Med, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06360    f1015007    04.  /*Gen Prev Med, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06364    f1015005    04.  /*Gen Prev Med, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06368    f1119208    04.  /*Gen Prev Med, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06372    f1119207    04.  /*Gen Prev Med, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06376    f1119205    04.  /*Gen Prev Med, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06380    f1015208    04.  /*Gen Prev Med, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06384    f1015207    04.  /*Gen Prev Med, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06388    f1015205    04.  /*Gen Prev Med, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06392    f0479308    05.  /*Public Health, Total             Non-Fed;MD's By Speclty/Actvty       */
     @06397    f0479307    05.  /*Public Health, Total             Non-Fed;MD's By Speclty/Actvty       */
     @06402    f0479305    05.  /*Public Health, Total             Non-Fed;MD's By Speclty/Actvty       */
     @06407    f1119308    05.  /*Public Health, Total Patnt Care  Non-Fed;Patient Care                 */
     @06412    f1119307    05.  /*Public Health, Total Patnt Care  Non-Fed;Patient Care                 */
     @06417    f1119305    05.  /*Public Health, Total Patnt Care  Non-Fed;Patient Care                 */
     @06422    f0479508    04.  /*Public Health, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @06426    f0479507    04.  /*Public Health, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @06430    f0479505    04.  /*Public Health, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @06434    f1254108    04.  /*Public Health, PC, Hosp Residnt  Non-Fed;Patn Care Hosp-Based         */
     @06438    f1254107    04.  /*Public Health, PC, Hosp Residnt  Non-Fed;Patn Care Hosp-Based         */
     @06442    f1254105    04.  /*Public Health, PC, Hosp Residnt  Non-Fed;Patn Care Hosp-Based         */
     @06446    f0479708    04.  /*Public Health, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @06450    f0479707    04.  /*Public Health, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @06454    f0479705    04.  /*Public Health, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @06458    f1015508    04.  /*Public Health, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @06462    f1015507    04.  /*Public Health, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @06466    f1015505    04.  /*Public Health, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @06470    f1015608    04.  /*Public Health, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @06474    f1015607    04.  /*Public Health, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @06478    f1015605    04.  /*Public Health, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @06482    f1119508    04.  /*Public Health, Research          Non-Fed;MD's By Speclty/Actvty       */
     @06486    f1119507    04.  /*Public Health, Research          Non-Fed;MD's By Speclty/Actvty       */
     @06490    f1119505    04.  /*Public Health, Research          Non-Fed;MD's By Speclty/Actvty       */
     @06494    f1015808    04.  /*Public Health, Other             Non-Fed;MD's By Speclty/Actvty       */
     @06498    f1015807    04.  /*Public Health, Other             Non-Fed;MD's By Speclty/Actvty       */
     @06502    f1015805    04.  /*Public Health, Other             Non-Fed;MD's By Speclty/Actvty       */
     @06506    f0981108    05.  /*Radiology, Total                 Non-Fed;MD's By Speclty/Actvty       */
     @06511    f0981107    05.  /*Radiology, Total                 Non-Fed;MD's By Speclty/Actvty       */
     @06516    f0981105    05.  /*Radiology, Total                 Non-Fed;MD's By Speclty/Actvty       */
     @06521    f1119608    05.  /*Radiology, Total Patient Care    Non-Fed;Patient Care                 */
     @06526    f1119607    05.  /*Radiology, Total Patient Care    Non-Fed;Patient Care                 */
     @06531    f1119605    05.  /*Radiology, Total Patient Care    Non-Fed;Patient Care                 */
     @06536    f0981308    04.  /*Radiology, PC, Office Based      Non-Fed;Patn Care Office-Based       */
     @06540    f0981307    04.  /*Radiology, PC, Office Based      Non-Fed;Patn Care Office-Based       */
     @06544    f0981305    04.  /*Radiology, PC, Office Based      Non-Fed;Patn Care Office-Based       */
     @06548    f1254208    04.  /*Radiology, PC, Hosp Residents    Non-Fed;Patn Care Hosp-Based         */
     @06552    f1254207    04.  /*Radiology, PC, Hosp Residents    Non-Fed;Patn Care Hosp-Based         */
     @06556    f1254205    04.  /*Radiology, PC, Hosp Residents    Non-Fed;Patn Care Hosp-Based         */
     @06560    f0981508    04.  /*Radiology, PC, Hosp FT Staff     Non-Fed;Patn Care Hosp-Based         */
     @06564    f0981507    04.  /*Radiology, PC, Hosp FT Staff     Non-Fed;Patn Care Hosp-Based         */
     @06568    f0981505    04.  /*Radiology, PC, Hosp FT Staff     Non-Fed;Patn Care Hosp-Based         */
     @06572    f1016108    04.  /*Radiology, Administration        Non-Fed;MD's By Speclty/Actvty       */
     @06576    f1016107    04.  /*Radiology, Administration        Non-Fed;MD's By Speclty/Actvty       */
     @06580    f1016105    04.  /*Radiology, Administration        Non-Fed;MD's By Speclty/Actvty       */
     @06584    f1016208    04.  /*Radiology, Teaching              Non-Fed;MD's By Speclty/Actvty       */
     @06588    f1016207    04.  /*Radiology, Teaching              Non-Fed;MD's By Speclty/Actvty       */
     @06592    f1016205    04.  /*Radiology, Teaching              Non-Fed;MD's By Speclty/Actvty       */
     @06596    f1119808    04.  /*Radiology, Research              Non-Fed;MD's By Speclty/Actvty       */
     @06600    f1119807    04.  /*Radiology, Research              Non-Fed;MD's By Speclty/Actvty       */
     @06604    f1119805    04.  /*Radiology, Research              Non-Fed;MD's By Speclty/Actvty       */
     @06608    f1016408    04.  /*Radiology, Other                 Non-Fed;MD's By Speclty/Actvty       */
     @06612    f1016407    04.  /*Radiology, Other                 Non-Fed;MD's By Speclty/Actvty       */
     @06616    f1016405    04.  /*Radiology, Other                 Non-Fed;MD's By Speclty/Actvty       */
     @06620    f0480308    05.  /*Rad Oncology, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06625    f0480307    05.  /*Rad Oncology, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06630    f0480305    05.  /*Rad Oncology, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06635    f1119908    05.  /*Rad Oncology, Total Patnt Care   Non-Fed;Patient Care                 */
     @06640    f1119907    05.  /*Rad Oncology, Total Patnt Care   Non-Fed;Patient Care                 */
     @06645    f1119905    05.  /*Rad Oncology, Total Patnt Care   Non-Fed;Patient Care                 */
     @06650    f0480508    04.  /*Rad Oncology, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06654    f0480507    04.  /*Rad Oncology, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06658    f0480505    04.  /*Rad Oncology, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06662    f1254308    04.  /*Rad Oncology, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @06666    f1254307    04.  /*Rad Oncology, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @06670    f1254305    04.  /*Rad Oncology, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @06674    f0480708    04.  /*Rad Oncology, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @06678    f0480707    04.  /*Rad Oncology, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @06682    f0480705    04.  /*Rad Oncology, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @06686    f1017308    04.  /*Rad Oncology, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06690    f1017307    04.  /*Rad Oncology, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06694    f1017305    04.  /*Rad Oncology, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06698    f1017408    04.  /*Rad Oncology, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06702    f1017407    04.  /*Rad Oncology, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06706    f1017405    04.  /*Rad Oncology, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06710    f1120108    04.  /*Rad Oncology, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06714    f1120107    04.  /*Rad Oncology, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06718    f1120105    04.  /*Rad Oncology, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06722    f1017608    04.  /*Rad Oncology, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06726    f1017607    04.  /*Rad Oncology, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06730    f1017605    04.  /*Rad Oncology, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06734    f1365008    05.  /*Transplant Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @06739    f1365007    05.  /*Transplant Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @06744    f1365005    05.  /*Transplant Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @06749    f1365108    05.  /*Transplant Surg, Tot Patn Care   Non-Fed;Patient Care                 */
     @06754    f1365107    05.  /*Transplant Surg, Tot Patn Care   Non-Fed;Patient Care                 */
     @06759    f1365105    05.  /*Transplant Surg, Tot Patn Care   Non-Fed;Patient Care                 */
     @06764    f1365208    04.  /*Transplant Surg, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @06768    f1365207    04.  /*Transplant Surg, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @06772    f1365205    04.  /*Transplant Surg, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @06776    f1365308    04.  /*Transplant Surg, PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06780    f1365307    04.  /*Transplant Surg, PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06784    f1365305    04.  /*Transplant Surg, PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06788    f1365408    04.  /*Transplant Surg, PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06792    f1365407    04.  /*Transplant Surg, PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06796    f1365405    04.  /*Transplant Surg, PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06800    f1365508    04.  /*Transplant Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @06804    f1365507    04.  /*Transplant Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @06808    f1365505    04.  /*Transplant Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @06812    f1365608    04.  /*Transplant Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @06816    f1365607    04.  /*Transplant Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @06820    f1365605    04.  /*Transplant Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @06824    f1365708    04.  /*Transplant Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @06828    f1365707    04.  /*Transplant Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @06832    f1365705    04.  /*Transplant Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @06836    f1365808    04.  /*Transplant Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @06840    f1365807    04.  /*Transplant Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @06844    f1365805    04.  /*Transplant Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @06848    f1363508    05.  /*Vascular Med, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06853    f1363507    05.  /*Vascular Med, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06858    f1363505    05.  /*Vascular Med, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06863    f1363608    05.  /*Vascular Med, Total Patn Care    Non-Fed;Patient Care                 */
     @06868    f1363607    05.  /*Vascular Med, Total Patn Care    Non-Fed;Patient Care                 */
     @06873    f1363605    05.  /*Vascular Med, Total Patn Care    Non-Fed;Patient Care                 */
     @06878    f1363708    04.  /*Vascular Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06882    f1363707    04.  /*Vascular Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06886    f1363705    04.  /*Vascular Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06890    f1363808    04.  /*Vascular Med, PC, Hosp Resdnt    Non-Fed,Patn Care Hosp-Based         */
     @06894    f1363807    04.  /*Vascular Med, PC, Hosp Resdnt    Non-Fed,Patn Care Hosp-Based         */
     @06898    f1363805    04.  /*Vascular Med, PC, Hosp Resdnt    Non-Fed,Patn Care Hosp-Based         */
     @06902    f1363908    04.  /*Vascular Med, PC, Hosp FT Stf    Non-Fed;Patn Care Hosp-Based         */
     @06906    f1363907    04.  /*Vascular Med, PC, Hosp FT Stf    Non-Fed;Patn Care Hosp-Based         */
     @06910    f1363905    04.  /*Vascular Med, PC, Hosp FT Stf    Non-Fed;Patn Care Hosp-Based         */
     @06914    f1364008    04.  /*Vascular Med, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06918    f1364007    04.  /*Vascular Med, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06922    f1364005    04.  /*Vascular Med, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06926    f1364108    04.  /*Vascular Med, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06930    f1364107    04.  /*Vascular Med, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06934    f1364105    04.  /*Vascular Med, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06938    f1364208    04.  /*Vascular Med, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06942    f1364207    04.  /*Vascular Med, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06946    f1364205    04.  /*Vascular Med, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06950    f1364308    04.  /*Vascular Med, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06954    f1364307    04.  /*Vascular Med, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06958    f1364305    04.  /*Vascular Med, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06962    f0982108    05.  /*Other Specs, Total               Non-Fed;Specs Other Than Above       */
     @06967    f0982107    05.  /*Other Specs, Total               Non-Fed;Specs Other Than Above       */
     @06972    f0982105    05.  /*Other Specs, Total               Non-Fed;Specs Other Than Above       */
     @06977    f1120208    05.  /*Other Specs, Total Patnt Care    Non-Fed;Specs Other Than Above       */
     @06982    f1120207    05.  /*Other Specs, Total Patnt Care    Non-Fed;Specs Other Than Above       */
     @06987    f1120205    05.  /*Other Specs, Total Patnt Care    Non-Fed;Specs Other Than Above       */
     @06992    f0982308    04.  /*Other Specs, PC, Office Based    Non-Fed;Specs Other Than Above       */
     @06996    f0982307    04.  /*Other Specs, PC, Office Based    Non-Fed;Specs Other Than Above       */
     @07000    f0982305    04.  /*Other Specs, PC, Office Based    Non-Fed;Specs Other Than Above       */
     @07004    f1254408    04.  /*Other Specs, PC, Hosp Residents  Non-Fed;Specs Other Than Above       */
     @07008    f1254407    04.  /*Other Specs, PC, Hosp Residents  Non-Fed;Specs Other Than Above       */
     @07012    f1254405    04.  /*Other Specs, PC, Hosp Residents  Non-Fed;Specs Other Than Above       */
     @07016    f0982508    04.  /*Other Specs, PC, Hosp FT Staff   Non-Fed;Specs Other Than Above       */
     @07020    f0982507    04.  /*Other Specs, PC, Hosp FT Staff   Non-Fed;Specs Other Than Above       */
     @07024    f0982505    04.  /*Other Specs, PC, Hosp FT Staff   Non-Fed;Specs Other Than Above       */
     @07028    f1017908    04.  /*Other Specs, Administration      Non-Fed;Specs Other Than Above       */
     @07032    f1017907    04.  /*Other Specs, Administration      Non-Fed;Specs Other Than Above       */
     @07036    f1017905    04.  /*Other Specs, Administration      Non-Fed;Specs Other Than Above       */
     @07040    f1018008    04.  /*Other Specs, Teaching            Non-Fed;Specs Other Than Above       */
     @07044    f1018007    04.  /*Other Specs, Teaching            Non-Fed;Specs Other Than Above       */
     @07048    f1018005    04.  /*Other Specs, Teaching            Non-Fed;Specs Other Than Above       */
     @07052    f1120408    04.  /*Other Specs, Research            Non-Fed;Specs Other Than Above       */
     @07056    f1120407    04.  /*Other Specs, Research            Non-Fed;Specs Other Than Above       */
     @07060    f1120405    04.  /*Other Specs, Research            Non-Fed;Specs Other Than Above       */
     @07064    f1018208    04.  /*Other Specs, Other               Non-Fed;Specs Other Than Above       */
     @07068    f1018207    04.  /*Other Specs, Other               Non-Fed;Specs Other Than Above       */
     @07072    f1018205    04.  /*Other Specs, Other               Non-Fed;Specs Other Than Above       */
     @07076    f0481308    05.  /*Unspecified, Total               Non-Fed;MD's By Speclty/Actvty       */
     @07081    f0481307    05.  /*Unspecified, Total               Non-Fed;MD's By Speclty/Actvty       */
     @07086    f0481305    05.  /*Unspecified, Total               Non-Fed;MD's By Speclty/Actvty       */
     @07091    f1120508    05.  /*Unspecified, Total Patient Care  Non-Fed;Patient Care                 */
     @07096    f1120507    05.  /*Unspecified, Total Patient Care  Non-Fed;Patient Care                 */
     @07101    f1120505    05.  /*Unspecified, Total Patient Care  Non-Fed;Patient Care                 */
     @07106    f0481508    04.  /*Unspecified, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @07110    f0481507    04.  /*Unspecified, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @07114    f0481505    04.  /*Unspecified, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @07118    f1254508    04.  /*Unspecified, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @07122    f1254507    04.  /*Unspecified, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @07126    f1254505    04.  /*Unspecified, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @07130    f0481708    04.  /*Unspecified, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @07134    f0481707    04.  /*Unspecified, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @07138    f0481705    04.  /*Unspecified, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @07142    f1019108    04.  /*Unspecified, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @07146    f1019107    04.  /*Unspecified, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @07150    f1019105    04.  /*Unspecified, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @07154    f1019208    04.  /*Unspecified, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @07158    f1019207    04.  /*Unspecified, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @07162    f1019205    04.  /*Unspecified, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @07166    f1120708    04.  /*Unspecified, Research            Non-Fed;MD's By Speclty/Actvty       */
     @07170    f1120707    04.  /*Unspecified, Research            Non-Fed;MD's By Speclty/Actvty       */
     @07174    f1120705    04.  /*Unspecified, Research            Non-Fed;MD's By Speclty/Actvty       */
     @07178    f1019408    04.  /*Unspecified, Other               Non-Fed;MD's By Speclty/Actvty       */
     @07182    f1019407    04.  /*Unspecified, Other               Non-Fed;MD's By Speclty/Actvty       */
     @07186    f1019405    04.  /*Unspecified, Other               Non-Fed;MD's By Speclty/Actvty       */
     @07190    f0481808    05.  /*MD's Inactive, Total             Non-Fed                              */
     @07195    f0481807    05.  /*MD's Inactive, Total             Non-Fed                              */
     @07200    f0481805    05.  /*MD's Inactive, Total             Non-Fed                              */
     @07205    f0481908    05.  /*MD's Not Classified, Total       Non-Fed                              */
     @07210    f0481907    05.  /*MD's Not Classified, Total       Non-Fed                              */
     @07215    f0481905    05.  /*MD's Not Classified, Total       Non-Fed                              */
     @07220    f1126908    03.  /*M.D.'s, Tot PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07223    f1126907    03.  /*M.D.'s, Tot PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07226    f1126905    03.  /*M.D.'s, Tot PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07229    f1127008    04.  /*M.D.'s, Total PC, Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07233    f1127007    04.  /*M.D.'s, Total PC, Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07237    f1127005    04.  /*M.D.'s, Total PC, Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07241    f1127108    04.  /*M.D.'s, Total Oth Prof Activity  Fed                                  */
     @07245    f1127107    04.  /*M.D.'s, Total Oth Prof Activity  Fed                                  */
     @07249    f1127105    04.  /*M.D.'s, Total Oth Prof Activity  Fed                                  */
     @07253    f1387808    03.  /*M.D.'s, Total, Inactive          Fed                                  */
     @07256    f1387807    03.  /*M.D.'s, Total, Inactive          Fed                                  */
     @07259    f1387805    03.  /*M.D.'s, Total, Inactive          Fed                                  */
     @07262    f1127308    02.  /*MD's,Tot Gen Prac,PC,Hosp Res    Fed;Patn Care Hosp-Based             */
     @07264    f1127307    02.  /*MD's,Tot Gen Prac,PC,Hosp Res    Fed;Patn Care Hosp-Based             */
     @07266    f1127305    02.  /*MD's,Tot Gen Prac,PC,Hosp Res    Fed;Patn Care Hosp-Based             */
     @07268    f1127408    03.  /*MD's,Tot Gen Prac,PC,Hsp FT Stf  Fed;Patn Care Hosp-Based             */
     @07271    f1127407    03.  /*MD's,Tot Gen Prac,PC,Hsp FT Stf  Fed;Patn Care Hosp-Based             */
     @07274    f1127405    03.  /*MD's,Tot Gen Prac,PC,Hsp FT Stf  Fed;Patn Care Hosp-Based             */
     @07277    f1127508    03.  /*MD's,Tot Gen Prac,Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07280    f1127507    03.  /*MD's,Tot Gen Prac,Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07283    f1127505    03.  /*MD's,Tot Gen Prac,Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07286    f1127708    02.  /*Gen Int Med, PC, Hosp Residents  Fed;Patn Care Hosp-Based             */
     @07288    f1127707    02.  /*Gen Int Med, PC, Hosp Residents  Fed;Patn Care Hosp-Based             */
     @07290    f1127705    02.  /*Gen Int Med, PC, Hosp Residents  Fed;Patn Care Hosp-Based             */
     @07292    f1127808    03.  /*Gen Int Med, PC, Hosp FT Staff   Fed;Patn Care Hosp-Based             */
     @07295    f1127807    03.  /*Gen Int Med, PC, Hosp FT Staff   Fed;Patn Care Hosp-Based             */
     @07298    f1127805    03.  /*Gen Int Med, PC, Hosp FT Staff   Fed;Patn Care Hosp-Based             */
     @07301    f1127908    03.  /*Gen Internal Med, Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07304    f1127907    03.  /*Gen Internal Med, Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07307    f1127905    03.  /*Gen Internal Med, Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07310    f1173508    02.  /*Pediatrics,Gen,PC,Hosp Resident  Fed;Patn Care Hosp-Based             */
     @07312    f1173507    02.  /*Pediatrics,Gen,PC,Hosp Resident  Fed;Patn Care Hosp-Based             */
     @07314    f1173505    02.  /*Pediatrics,Gen,PC,Hosp Resident  Fed;Patn Care Hosp-Based             */
     @07316    f1173608    03.  /*Pediatrics,Gen,PC,Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07319    f1173607    03.  /*Pediatrics,Gen,PC,Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07322    f1173605    03.  /*Pediatrics,Gen,PC,Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07325    f1173708    03.  /*Pediatrics, Gen, Oth Prof Act    Fed;MD's By Speclty/Actvty           */
     @07328    f1173707    03.  /*Pediatrics, Gen, Oth Prof Act    Fed;MD's By Speclty/Actvty           */
     @07331    f1173705    03.  /*Pediatrics, Gen, Oth Prof Act    Fed;MD's By Speclty/Actvty           */
     @07334    f1173908    02.  /*Other Med, PC, Hosp Residents    Fed;Patn Care Hosp-Based             */
     @07336    f1173907    02.  /*Other Med, PC, Hosp Residents    Fed;Patn Care Hosp-Based             */
     @07338    f1173905    02.  /*Other Med, PC, Hosp Residents    Fed;Patn Care Hosp-Based             */
     @07340    f1174008    03.  /*Other Med, PC, Hosp FT Staff     Fed;Patn Care Hosp-Based             */
     @07343    f1174007    03.  /*Other Med, PC, Hosp FT Staff     Fed;Patn Care Hosp-Based             */
     @07346    f1174005    03.  /*Other Med, PC, Hosp FT Staff     Fed;Patn Care Hosp-Based             */
     @07349    f1174108    03.  /*Other Med, Other Prof Activity   Fed;MD's By Speclty/Actvty           */
     @07352    f1174107    03.  /*Other Med, Other Prof Activity   Fed;MD's By Speclty/Actvty           */
     @07355    f1174105    03.  /*Other Med, Other Prof Activity   Fed;MD's By Speclty/Actvty           */
     @07358    f1128908    02.  /*Genrl Surg, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07360    f1128907    02.  /*Genrl Surg, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07362    f1128905    02.  /*Genrl Surg, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07364    f1129008    03.  /*Genrl Surg, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07367    f1129007    03.  /*Genrl Surg, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07370    f1129005    03.  /*Genrl Surg, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07373    f1129108    02.  /*Genrl Surg, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07375    f1129107    02.  /*Genrl Surg, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07377    f1129105    02.  /*Genrl Surg, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07379    f1174308    02.  /*Ob-Gyn, Gen, PC,Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07381    f1174307    02.  /*Ob-Gyn, Gen, PC,Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07383    f1174305    02.  /*Ob-Gyn, Gen, PC,Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07385    f1174408    03.  /*Ob-Gyn, Gen, PC, Hosp FT Staff   Fed;Patn Care Hosp-Based             */
     @07388    f1174407    03.  /*Ob-Gyn, Gen, PC, Hosp FT Staff   Fed;Patn Care Hosp-Based             */
     @07391    f1174405    03.  /*Ob-Gyn, Gen, PC, Hosp FT Staff   Fed;Patn Care Hosp-Based             */
     @07394    f1174508    02.  /*Ob-Gyn, Gen, Oth Prof Activity   Fed;MD's By Speclty/Actvty           */
     @07396    f1174507    02.  /*Ob-Gyn, Gen, Oth Prof Activity   Fed;MD's By Speclty/Actvty           */
     @07398    f1174505    02.  /*Ob-Gyn, Gen, Oth Prof Activity   Fed;MD's By Speclty/Actvty           */
     @07400    f1174708    02.  /*Ob-Gyn Subspecs,PC,Hosp Resdnt   Fed;Patn Care Hosp-Based             */
     @07402    f1174707    02.  /*Ob-Gyn Subspecs,PC,Hosp Resdnt   Fed;Patn Care Hosp-Based             */
     @07404    f1174705    02.  /*Ob-Gyn Subspecs,PC,Hosp Resdnt   Fed;Patn Care Hosp-Based             */
     @07406    f1174808    02.  /*Ob-Gyn Subspecs,PC,Hosp FT Stf   Fed;Patn Care Hosp-Based             */
     @07408    f1174807    02.  /*Ob-Gyn Subspecs,PC,Hosp FT Stf   Fed;Patn Care Hosp-Based             */
     @07410    f1174805    02.  /*Ob-Gyn Subspecs,PC,Hosp FT Stf   Fed;Patn Care Hosp-Based             */
     @07412    f1174908    02.  /*Ob-Gyn Subspecs, Oth Prof Act    Fed;MD's By Speclty/Actvty           */
     @07414    f1174907    02.  /*Ob-Gyn Subspecs, Oth Prof Act    Fed;MD's By Speclty/Actvty           */
     @07416    f1174905    02.  /*Ob-Gyn Subspecs, Oth Prof Act    Fed;MD's By Speclty/Actvty           */
     @07418    f1129708    02.  /*Other Surg, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07420    f1129707    02.  /*Other Surg, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07422    f1129705    02.  /*Other Surg, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07424    f1129808    03.  /*Other Surg, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07427    f1129807    03.  /*Other Surg, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07430    f1129805    03.  /*Other Surg, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07433    f1129908    03.  /*Other Surg, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07436    f1129907    03.  /*Other Surg, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07439    f1129905    03.  /*Other Surg, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07442    f1130108    02.  /*Psychiatry, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07444    f1130107    02.  /*Psychiatry, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07446    f1130105    02.  /*Psychiatry, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07448    f1130208    03.  /*Psychiatry, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07451    f1130207    03.  /*Psychiatry, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07454    f1130205    03.  /*Psychiatry, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07457    f1130308    03.  /*Psychiatry, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07460    f1130307    03.  /*Psychiatry, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07463    f1130305    03.  /*Psychiatry, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07466    f1130508    02.  /*Oth Oth Spec, PC, Hosp Resident  Fed;Patn Care Hosp-Based             */
     @07468    f1130507    02.  /*Oth Oth Spec, PC, Hosp Resident  Fed;Patn Care Hosp-Based             */
     @07470    f1130505    02.  /*Oth Oth Spec, PC, Hosp Resident  Fed;Patn Care Hosp-Based             */
     @07472    f1130608    03.  /*Oth Oth Spec, PC, Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07475    f1130607    03.  /*Oth Oth Spec, PC, Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07478    f1130605    03.  /*Oth Oth Spec, PC, Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07481    f1130708    03.  /*Other Other Spec, Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07484    f1130707    03.  /*Other Other Spec, Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07487    f1130705    03.  /*Other Other Spec, Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07490    f0482008    05.  /*Total M.D.'s, Male               Non-Fed;Incl.Inact & Not Class       */
     @07495    f0482007    05.  /*Total M.D.'s, Male               Non-Fed;Incl.Inact & Not Class       */
     @07500    f0482005    05.  /*Total M.D.'s, Male               Non-Fed;Incl.Inact & Not Class       */
     @07505    f0482108    05.  /*Total M.D.'s, Female             Non-Fed;Incl.Inact & Not Class       */
     @07510    f0482107    05.  /*Total M.D.'s, Female             Non-Fed;Incl.Inact & Not Class       */
     @07515    f0482105    05.  /*Total M.D.'s, Female             Non-Fed;Incl.Inact & Not Class       */
     @07520    f0490008    04.  /*MD's, Inactive, Male             Non-Fed;MD's By Gender/Speclty       */
     @07524    f0490007    04.  /*MD's, Inactive, Male             Non-Fed;MD's By Gender/Speclty       */
     @07528    f0490005    04.  /*MD's, Inactive, Male             Non-Fed;MD's By Gender/Speclty       */
     @07532    f0490108    03.  /*MD's, Inactive, Female           Non-Fed;MD's By Gender/Speclty       */
     @07535    f0490107    03.  /*MD's, Inactive, Female           Non-Fed;MD's By Gender/Speclty       */
     @07538    f0490105    03.  /*MD's, Inactive, Female           Non-Fed;MD's By Gender/Speclty       */
     @07541    f0490408    05.  /*Total M.D.'s, < 35               Non-Fed;Incl.Inact & Not Class       */
     @07546    f0490407    05.  /*Total M.D.'s, < 35               Non-Fed;Incl.Inact & Not Class       */
     @07551    f0490405    05.  /*Total M.D.'s, < 35               Non-Fed;Incl.Inact & Not Class       */
     @07556    f0490508    05.  /*Total M.D.'s, 35-44              Non-Fed;Incl.Inact & Not Class       */
     @07561    f0490507    05.  /*Total M.D.'s, 35-44              Non-Fed;Incl.Inact & Not Class       */
     @07566    f0490505    05.  /*Total M.D.'s, 35-44              Non-Fed;Incl.Inact & Not Class       */
     @07571    f0490608    05.  /*Total M.D.'s, 45-54              Non-Fed;Incl.Inact & Not Class       */
     @07576    f0490607    05.  /*Total M.D.'s, 45-54              Non-Fed;Incl.Inact & Not Class       */
     @07581    f0490605    05.  /*Total M.D.'s, 45-54              Non-Fed;Incl.Inact & Not Class       */
     @07586    f0490708    05.  /*Total M.D.'s, 55-64              Non-Fed;Incl.Inact & Not Class       */
     @07591    f0490707    05.  /*Total M.D.'s, 55-64              Non-Fed;Incl.Inact & Not Class       */
     @07596    f0490705    05.  /*Total M.D.'s, 55-64              Non-Fed;Incl.Inact & Not Class       */
     @07601    f1201608    05.  /*Total M.D.'s, 65-74              Non-Fed;Incl.Inact & Not Class       */
     @07606    f1201607    05.  /*Total M.D.'s, 65-74              Non-Fed;Incl.Inact & Not Class       */
     @07611    f1201605    05.  /*Total M.D.'s, 65-74              Non-Fed;Incl.Inact & Not Class       */
     @07616    f1201708    05.  /*Total M.D.'s, 75 +               Non-Fed;Incl.Inact & Not Class       */
     @07621    f1201707    05.  /*Total M.D.'s, 75 +               Non-Fed;Incl.Inact & Not Class       */
     @07626    f1201705    05.  /*Total M.D.'s, 75 +               Non-Fed;Incl.Inact & Not Class       */
     @07631    f0491008    04.  /*MD's, Tot General Pract, < 35    Non-Fed;MD's By Age/Specialty        */
     @07635    f0491007    04.  /*MD's, Tot General Pract, < 35    Non-Fed;MD's By Age/Specialty        */
     @07639    f0491005    04.  /*MD's, Tot General Pract, < 35    Non-Fed;MD's By Age/Specialty        */
     @07643    f0491108    04.  /*MD's, Tot General Pract, 35-44   Non-Fed;MD's By Age/Specialty        */
     @07647    f0491107    04.  /*MD's, Tot General Pract, 35-44   Non-Fed;MD's By Age/Specialty        */
     @07651    f0491105    04.  /*MD's, Tot General Pract, 35-44   Non-Fed;MD's By Age/Specialty        */
     @07655    f0491208    04.  /*MD's, Tot General Pract, 45-54   Non-Fed;MD's By Age/Specialty        */
     @07659    f0491207    04.  /*MD's, Tot General Pract, 45-54   Non-Fed;MD's By Age/Specialty        */
     @07663    f0491205    04.  /*MD's, Tot General Pract, 45-54   Non-Fed;MD's By Age/Specialty        */
     @07667    f0491308    04.  /*MD's, Tot General Pract, 55-64   Non-Fed;MD's By Age/Specialty        */
     @07671    f0491307    04.  /*MD's, Tot General Pract, 55-64   Non-Fed;MD's By Age/Specialty        */
     @07675    f0491305    04.  /*MD's, Tot General Pract, 55-64   Non-Fed;MD's By Age/Specialty        */
     @07679    f1201808    04.  /*MD's, Tot General Pract, 65-74   Non-Fed;MD's By Age/Specialty        */
     @07683    f1201807    04.  /*MD's, Tot General Pract, 65-74   Non-Fed;MD's By Age/Specialty        */
     @07687    f1201805    04.  /*MD's, Tot General Pract, 65-74   Non-Fed;MD's By Age/Specialty        */
     @07691    f1201908    04.  /*MD's, Tot General Pract, 75 +    Non-Fed;MD's By Age/Specialty        */
     @07695    f1201907    04.  /*MD's, Tot General Pract, 75 +    Non-Fed;MD's By Age/Specialty        */
     @07699    f1201905    04.  /*MD's, Tot General Pract, 75 +    Non-Fed;MD's By Age/Specialty        */
     @07703    f1074908    04.  /*MD's, General Pract, < 35        Non-Fed;MD's By Age/Specialty        */
     @07707    f1074907    04.  /*MD's, General Pract, < 35        Non-Fed;MD's By Age/Specialty        */
     @07711    f1074905    04.  /*MD's, General Pract, < 35        Non-Fed;MD's By Age/Specialty        */
     @07715    f1075008    04.  /*MD's, General Pract, 35-44       Non-Fed;MD's By Age/Specialty        */
     @07719    f1075007    04.  /*MD's, General Pract, 35-44       Non-Fed;MD's By Age/Specialty        */
     @07723    f1075005    04.  /*MD's, General Pract, 35-44       Non-Fed;MD's By Age/Specialty        */
     @07727    f1075108    04.  /*MD's, General Pract, 45-54       Non-Fed;MD's By Age/Specialty        */
     @07731    f1075107    04.  /*MD's, General Pract, 45-54       Non-Fed;MD's By Age/Specialty        */
     @07735    f1075105    04.  /*MD's, General Pract, 45-54       Non-Fed;MD's By Age/Specialty        */
     @07739    f1075208    04.  /*MD's, General Pract, 55-64       Non-Fed;MD's By Age/Specialty        */
     @07743    f1075207    04.  /*MD's, General Pract, 55-64       Non-Fed;MD's By Age/Specialty        */
     @07747    f1075205    04.  /*MD's, General Pract, 55-64       Non-Fed;MD's By Age/Specialty        */
     @07751    f1202008    04.  /*MD's, General Pract, 65-74       Non-Fed;MD's By Age/Specialty        */
     @07755    f1202007    04.  /*MD's, General Pract, 65-74       Non-Fed;MD's By Age/Specialty        */
     @07759    f1202005    04.  /*MD's, General Pract, 65-74       Non-Fed;MD's By Age/Specialty        */
     @07763    f1202108    04.  /*MD's, General Pract, 75 +        Non-Fed;MD's By Age/Specialty        */
     @07767    f1202107    04.  /*MD's, General Pract, 75 +        Non-Fed;MD's By Age/Specialty        */
     @07771    f1202105    04.  /*MD's, General Pract, 75 +        Non-Fed;MD's By Age/Specialty        */
     @07775    f1202208    04.  /*MD's, Family Pract Gen, < 35     Non-Fed;MD's By Age/Specialty        */
     @07779    f1202207    04.  /*MD's, Family Pract Gen, < 35     Non-Fed;MD's By Age/Specialty        */
     @07783    f1202205    04.  /*MD's, Family Pract Gen, < 35     Non-Fed;MD's By Age/Specialty        */
     @07787    f1202308    04.  /*MD's, Family Pract Gen, 35-44    Non-Fed;MD's By Age/Specialty        */
     @07791    f1202307    04.  /*MD's, Family Pract Gen, 35-44    Non-Fed;MD's By Age/Specialty        */
     @07795    f1202305    04.  /*MD's, Family Pract Gen, 35-44    Non-Fed;MD's By Age/Specialty        */
     @07799    f1202408    04.  /*MD's, Family Pract Gen, 45-54    Non-Fed;MD's By Age/Specialty        */
     @07803    f1202407    04.  /*MD's, Family Pract Gen, 45-54    Non-Fed;MD's By Age/Specialty        */
     @07807    f1202405    04.  /*MD's, Family Pract Gen, 45-54    Non-Fed;MD's By Age/Specialty        */
     @07811    f1202508    04.  /*MD's, Family Pract Gen, 55-64    Non-Fed;MD's By Age/Specialty        */
     @07815    f1202507    04.  /*MD's, Family Pract Gen, 55-64    Non-Fed;MD's By Age/Specialty        */
     @07819    f1202505    04.  /*MD's, Family Pract Gen, 55-64    Non-Fed;MD's By Age/Specialty        */
     @07823    f1202608    04.  /*MD's, Family Pract Gen, 65-74    Non-Fed;MD's By Age/Specialty        */
     @07827    f1202607    04.  /*MD's, Family Pract Gen, 65-74    Non-Fed;MD's By Age/Specialty        */
     @07831    f1202605    04.  /*MD's, Family Pract Gen, 65-74    Non-Fed;MD's By Age/Specialty        */
     @07835    f1202708    04.  /*MD's, Family Pract Gen, 75 +     Non-Fed;MD's By Age/Specialty        */
     @07839    f1202707    04.  /*MD's, Family Pract Gen, 75 +     Non-Fed;MD's By Age/Specialty        */
     @07843    f1202705    04.  /*MD's, Family Pract Gen, 75 +     Non-Fed;MD's By Age/Specialty        */
     @07847    f1202808    04.  /*MD's, Family Prac Subsp, < 35    Non-Fed;MD's By Age/Specialty        */
     @07851    f1202807    04.  /*MD's, Family Prac Subsp, < 35    Non-Fed;MD's By Age/Specialty        */
     @07855    f1202805    04.  /*MD's, Family Prac Subsp, < 35    Non-Fed;MD's By Age/Specialty        */
     @07859    f1202908    04.  /*MD's, Family Prac Subsp, 35-44   Non-Fed;MD's By Age/Specialty        */
     @07863    f1202907    04.  /*MD's, Family Prac Subsp, 35-44   Non-Fed;MD's By Age/Specialty        */
     @07867    f1202905    04.  /*MD's, Family Prac Subsp, 35-44   Non-Fed;MD's By Age/Specialty        */
     @07871    f1203008    04.  /*MD's, Family Prac Subsp, 45-54   Non-Fed;MD's By Age/Specialty        */
     @07875    f1203007    04.  /*MD's, Family Prac Subsp, 45-54   Non-Fed;MD's By Age/Specialty        */
     @07879    f1203005    04.  /*MD's, Family Prac Subsp, 45-54   Non-Fed;MD's By Age/Specialty        */
     @07883    f1203108    04.  /*MD's, Family Prac Subsp, 55-64   Non-Fed;MD's By Age/Specialty        */
     @07887    f1203107    04.  /*MD's, Family Prac Subsp, 55-64   Non-Fed;MD's By Age/Specialty        */
     @07891    f1203105    04.  /*MD's, Family Prac Subsp, 55-64   Non-Fed;MD's By Age/Specialty        */
     @07895    f1203208    04.  /*MD's, Family Prac Subsp, 65-74   Non-Fed;MD's By Age/Specialty        */
     @07899    f1203207    04.  /*MD's, Family Prac Subsp, 65-74   Non-Fed;MD's By Age/Specialty        */
     @07903    f1203205    04.  /*MD's, Family Prac Subsp, 65-74   Non-Fed;MD's By Age/Specialty        */
     @07907    f1203308    04.  /*MD's, Family Prac Subsp, 75 +    Non-Fed;MD's By Age/Specialty        */
     @07911    f1203307    04.  /*MD's, Family Prac Subsp, 75 +    Non-Fed;MD's By Age/Specialty        */
     @07915    f1203305    04.  /*MD's, Family Prac Subsp, 75 +    Non-Fed;MD's By Age/Specialty        */
     @07919    f0491608    05.  /*Medical Specs, Total, < 35       Non-Fed;MD's By Age/Specialty        */
     @07924    f0491607    05.  /*Medical Specs, Total, < 35       Non-Fed;MD's By Age/Specialty        */
     @07929    f0491605    05.  /*Medical Specs, Total, < 35       Non-Fed;MD's By Age/Specialty        */
     @07934    f0491708    05.  /*Medical Specs, Total, 35-44      Non-Fed;MD's By Age/Specialty        */
     @07939    f0491707    05.  /*Medical Specs, Total, 35-44      Non-Fed;MD's By Age/Specialty        */
     @07944    f0491705    05.  /*Medical Specs, Total, 35-44      Non-Fed;MD's By Age/Specialty        */
     @07949    f0491808    05.  /*Medical Specs, Total, 45-54      Non-Fed;MD's By Age/Specialty        */
     @07954    f0491807    05.  /*Medical Specs, Total, 45-54      Non-Fed;MD's By Age/Specialty        */
     @07959    f0491805    05.  /*Medical Specs, Total, 45-54      Non-Fed;MD's By Age/Specialty        */
     @07964    f0491908    05.  /*Medical Specs, Total, 55-64      Non-Fed;MD's By Age/Specialty        */
     @07969    f0491907    05.  /*Medical Specs, Total, 55-64      Non-Fed;MD's By Age/Specialty        */
     @07974    f0491905    05.  /*Medical Specs, Total, 55-64      Non-Fed;MD's By Age/Specialty        */
     @07979    f1203408    05.  /*Medical Specs, Total, 65-74      Non-Fed;MD's By Age/Specialty        */
     @07984    f1203407    05.  /*Medical Specs, Total, 65-74      Non-Fed;MD's By Age/Specialty        */
     @07989    f1203405    05.  /*Medical Specs, Total, 65-74      Non-Fed;MD's By Age/Specialty        */
     @07994    f1203508    05.  /*Medical Specs, Total, 75 +       Non-Fed;MD's By Age/Specialty        */
     @07999    f1203507    05.  /*Medical Specs, Total, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08004    f1203505    05.  /*Medical Specs, Total, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08009    f1185908    04.  /*Allergy & Immunology, < 35       Non-Fed;MD's By Age/Specialty        */
     @08013    f1185907    04.  /*Allergy & Immunology, < 35       Non-Fed;MD's By Age/Specialty        */
     @08017    f1185905    04.  /*Allergy & Immunology, < 35       Non-Fed;MD's By Age/Specialty        */
     @08021    f1186008    04.  /*Allergy & Immunology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08025    f1186007    04.  /*Allergy & Immunology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08029    f1186005    04.  /*Allergy & Immunology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08033    f1186108    04.  /*Allergy & Immunology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08037    f1186107    04.  /*Allergy & Immunology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08041    f1186105    04.  /*Allergy & Immunology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08045    f1186208    04.  /*Allergy & Immunology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08049    f1186207    04.  /*Allergy & Immunology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08053    f1186205    04.  /*Allergy & Immunology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08057    f1203608    04.  /*Allergy & Immunology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08061    f1203607    04.  /*Allergy & Immunology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08065    f1203605    04.  /*Allergy & Immunology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08069    f1203708    04.  /*Allergy & Immunology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08073    f1203707    04.  /*Allergy & Immunology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08077    f1203705    04.  /*Allergy & Immunology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08081    f0492808    04.  /*Cardiovascular Diseases, < 35    Non-Fed;MD's By Age/Specialty        */
     @08085    f0492807    04.  /*Cardiovascular Diseases, < 35    Non-Fed;MD's By Age/Specialty        */
     @08089    f0492805    04.  /*Cardiovascular Diseases, < 35    Non-Fed;MD's By Age/Specialty        */
     @08093    f0492908    04.  /*Cardiovascular Diseases, 35-44   Non-Fed;MD's By Age/Specialty        */
     @08097    f0492907    04.  /*Cardiovascular Diseases, 35-44   Non-Fed;MD's By Age/Specialty        */
     @08101    f0492905    04.  /*Cardiovascular Diseases, 35-44   Non-Fed;MD's By Age/Specialty        */
     @08105    f0493008    04.  /*Cardiovascular Diseases, 45-54   Non-Fed;MD's By Age/Specialty        */
     @08109    f0493007    04.  /*Cardiovascular Diseases, 45-54   Non-Fed;MD's By Age/Specialty        */
     @08113    f0493005    04.  /*Cardiovascular Diseases, 45-54   Non-Fed;MD's By Age/Specialty        */
     @08117    f0493108    04.  /*Cardiovascular Diseases, 55-64   Non-Fed;MD's By Age/Specialty        */
     @08121    f0493107    04.  /*Cardiovascular Diseases, 55-64   Non-Fed;MD's By Age/Specialty        */
     @08125    f0493105    04.  /*Cardiovascular Diseases, 55-64   Non-Fed;MD's By Age/Specialty        */
     @08129    f1203808    04.  /*Cardiovascular Diseases, 65-74   Non-Fed;MD's By Age/Specialty        */
     @08133    f1203807    04.  /*Cardiovascular Diseases, 65-74   Non-Fed;MD's By Age/Specialty        */
     @08137    f1203805    04.  /*Cardiovascular Diseases, 65-74   Non-Fed;MD's By Age/Specialty        */
     @08141    f1203908    04.  /*Cardiovascular Diseases, 75 +    Non-Fed;MD's By Age/Specialty        */
     @08145    f1203907    04.  /*Cardiovascular Diseases, 75 +    Non-Fed;MD's By Age/Specialty        */
     @08149    f1203905    04.  /*Cardiovascular Diseases, 75 +    Non-Fed;MD's By Age/Specialty        */
     @08153    f0493408    04.  /*Dermatology, < 35                Non-Fed;MD's By Age/Specialty        */
     @08157    f0493407    04.  /*Dermatology, < 35                Non-Fed;MD's By Age/Specialty        */
     @08161    f0493405    04.  /*Dermatology, < 35                Non-Fed;MD's By Age/Specialty        */
     @08165    f0493508    04.  /*Dermatology, 35-44               Non-Fed;MD's By Age/Specialty        */
     @08169    f0493507    04.  /*Dermatology, 35-44               Non-Fed;MD's By Age/Specialty        */
     @08173    f0493505    04.  /*Dermatology, 35-44               Non-Fed;MD's By Age/Specialty        */
     @08177    f0493608    04.  /*Dermatology, 45-54               Non-Fed;MD's By Age/Specialty        */
     @08181    f0493607    04.  /*Dermatology, 45-54               Non-Fed;MD's By Age/Specialty        */
     @08185    f0493605    04.  /*Dermatology, 45-54               Non-Fed;MD's By Age/Specialty        */
     @08189    f0493708    04.  /*Dermatology, 55-64               Non-Fed;MD's By Age/Specialty        */
     @08193    f0493707    04.  /*Dermatology, 55-64               Non-Fed;MD's By Age/Specialty        */
     @08197    f0493705    04.  /*Dermatology, 55-64               Non-Fed;MD's By Age/Specialty        */
     @08201    f1204008    04.  /*Dermatology, 65-74               Non-Fed;MD's By Age/Specialty        */
     @08205    f1204007    04.  /*Dermatology, 65-74               Non-Fed;MD's By Age/Specialty        */
     @08209    f1204005    04.  /*Dermatology, 65-74               Non-Fed;MD's By Age/Specialty        */
     @08213    f1204108    04.  /*Dermatology, 75 +                Non-Fed;MD's By Age/Specialty        */
     @08217    f1204107    04.  /*Dermatology, 75 +                Non-Fed;MD's By Age/Specialty        */
     @08221    f1204105    04.  /*Dermatology, 75 +                Non-Fed;MD's By Age/Specialty        */
     @08225    f0494008    04.  /*Gastroenterology, < 35           Non-Fed;MD's By Age/Specialty        */
     @08229    f0494007    04.  /*Gastroenterology, < 35           Non-Fed;MD's By Age/Specialty        */
     @08233    f0494005    04.  /*Gastroenterology, < 35           Non-Fed;MD's By Age/Specialty        */
     @08237    f0494108    04.  /*Gastroenterology, 35-44          Non-Fed;MD's By Age/Specialty        */
     @08241    f0494107    04.  /*Gastroenterology, 35-44          Non-Fed;MD's By Age/Specialty        */
     @08245    f0494105    04.  /*Gastroenterology, 35-44          Non-Fed;MD's By Age/Specialty        */
     @08249    f0494208    04.  /*Gastroenterology, 45-54          Non-Fed;MD's By Age/Specialty        */
     @08253    f0494207    04.  /*Gastroenterology, 45-54          Non-Fed;MD's By Age/Specialty        */
     @08257    f0494205    04.  /*Gastroenterology, 45-54          Non-Fed;MD's By Age/Specialty        */
     @08261    f0494308    04.  /*Gastroenterology, 55-64          Non-Fed;MD's By Age/Specialty        */
     @08265    f0494307    04.  /*Gastroenterology, 55-64          Non-Fed;MD's By Age/Specialty        */
     @08269    f0494305    04.  /*Gastroenterology, 55-64          Non-Fed;MD's By Age/Specialty        */
     @08273    f1204208    04.  /*Gastroenterology, 65-74          Non-Fed;MD's By Age/Specialty        */
     @08277    f1204207    04.  /*Gastroenterology, 65-74          Non-Fed;MD's By Age/Specialty        */
     @08281    f1204205    04.  /*Gastroenterology, 65-74          Non-Fed;MD's By Age/Specialty        */
     @08285    f1204308    04.  /*Gastroenterology, 75 +           Non-Fed;MD's By Age/Specialty        */
     @08289    f1204307    04.  /*Gastroenterology, 75 +           Non-Fed;MD's By Age/Specialty        */
     @08293    f1204305    04.  /*Gastroenterology, 75 +           Non-Fed;MD's By Age/Specialty        */
     @08297    f1186408    04.  /*General Internal Med, < 35       Non-Fed;MD's By Age/Specialty        */
     @08301    f1186407    04.  /*General Internal Med, < 35       Non-Fed;MD's By Age/Specialty        */
     @08305    f1186405    04.  /*General Internal Med, < 35       Non-Fed;MD's By Age/Specialty        */
     @08309    f1186508    04.  /*General Internal Med, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08313    f1186507    04.  /*General Internal Med, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08317    f1186505    04.  /*General Internal Med, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08321    f1186608    04.  /*General Internal Med, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08325    f1186607    04.  /*General Internal Med, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08329    f1186605    04.  /*General Internal Med, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08333    f1186708    04.  /*General Internal Med, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08337    f1186707    04.  /*General Internal Med, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08341    f1186705    04.  /*General Internal Med, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08345    f1204408    04.  /*General Internal Med, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08349    f1204407    04.  /*General Internal Med, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08353    f1204405    04.  /*General Internal Med, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08357    f1204508    04.  /*General Internal Med, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08361    f1204507    04.  /*General Internal Med, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08365    f1204505    04.  /*General Internal Med, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08369    f1186908    04.  /*Internal Med Subspecs, < 35      Non-Fed;MD's By Age/Specialty        */
     @08373    f1186907    04.  /*Internal Med Subspecs, < 35      Non-Fed;MD's By Age/Specialty        */
     @08377    f1186905    04.  /*Internal Med Subspecs, < 35      Non-Fed;MD's By Age/Specialty        */
     @08381    f1187008    04.  /*Internal Med Subspecs, 35-44     Non-Fed;MD's By Age/Specialty        */
     @08385    f1187007    04.  /*Internal Med Subspecs, 35-44     Non-Fed;MD's By Age/Specialty        */
     @08389    f1187005    04.  /*Internal Med Subspecs, 35-44     Non-Fed;MD's By Age/Specialty        */
     @08393    f1187108    04.  /*Internal Med Subspecs, 45-54     Non-Fed;MD's By Age/Specialty        */
     @08397    f1187107    04.  /*Internal Med Subspecs, 45-54     Non-Fed;MD's By Age/Specialty        */
     @08401    f1187105    04.  /*Internal Med Subspecs, 45-54     Non-Fed;MD's By Age/Specialty        */
     @08405    f1187208    04.  /*Internal Med Subspecs, 55-64     Non-Fed;MD's By Age/Specialty        */
     @08409    f1187207    04.  /*Internal Med Subspecs, 55-64     Non-Fed;MD's By Age/Specialty        */
     @08413    f1187205    04.  /*Internal Med Subspecs, 55-64     Non-Fed;MD's By Age/Specialty        */
     @08417    f1204608    04.  /*Internal Med Subspecs, 65-74     Non-Fed;MD's By Age/Specialty        */
     @08421    f1204607    04.  /*Internal Med Subspecs, 65-74     Non-Fed;MD's By Age/Specialty        */
     @08425    f1204605    04.  /*Internal Med Subspecs, 65-74     Non-Fed;MD's By Age/Specialty        */
     @08429    f1204708    04.  /*Internal Med Subspecs, 75 +      Non-Fed;MD's By Age/Specialty        */
     @08433    f1204707    04.  /*Internal Med Subspecs, 75 +      Non-Fed;MD's By Age/Specialty        */
     @08437    f1204705    04.  /*Internal Med Subspecs, 75 +      Non-Fed;MD's By Age/Specialty        */
     @08441    f1187408    04.  /*Pediatrics, General, < 35        Non-Fed;MD's By Age/Specialty        */
     @08445    f1187407    04.  /*Pediatrics, General, < 35        Non-Fed;MD's By Age/Specialty        */
     @08449    f1187405    04.  /*Pediatrics, General, < 35        Non-Fed;MD's By Age/Specialty        */
     @08453    f1187508    04.  /*Pediatrics, General, 35-44       Non-Fed;MD's By Age/Specialty        */
     @08457    f1187507    04.  /*Pediatrics, General, 35-44       Non-Fed;MD's By Age/Specialty        */
     @08461    f1187505    04.  /*Pediatrics, General, 35-44       Non-Fed;MD's By Age/Specialty        */
     @08465    f1187608    04.  /*Pediatrics, General, 45-54       Non-Fed;MD's By Age/Specialty        */
     @08469    f1187607    04.  /*Pediatrics, General, 45-54       Non-Fed;MD's By Age/Specialty        */
     @08473    f1187605    04.  /*Pediatrics, General, 45-54       Non-Fed;MD's By Age/Specialty        */
     @08477    f1187708    04.  /*Pediatrics, General, 55-64       Non-Fed;MD's By Age/Specialty        */
     @08481    f1187707    04.  /*Pediatrics, General, 55-64       Non-Fed;MD's By Age/Specialty        */
     @08485    f1187705    04.  /*Pediatrics, General, 55-64       Non-Fed;MD's By Age/Specialty        */
     @08489    f1204808    04.  /*Pediatrics, General, 65-74       Non-Fed;MD's By Age/Specialty        */
     @08493    f1204807    04.  /*Pediatrics, General, 65-74       Non-Fed;MD's By Age/Specialty        */
     @08497    f1204805    04.  /*Pediatrics, General, 65-74       Non-Fed;MD's By Age/Specialty        */
     @08501    f1204908    04.  /*Pediatrics, General, 75 +        Non-Fed;MD's By Age/Specialty        */
     @08505    f1204907    04.  /*Pediatrics, General, 75 +        Non-Fed;MD's By Age/Specialty        */
     @08509    f1204905    04.  /*Pediatrics, General, 75 +        Non-Fed;MD's By Age/Specialty        */
     @08513    f1187908    04.  /*Pediatric Subspecs, < 35         Non-Fed;MD's By Age/Specialty        */
     @08517    f1187907    04.  /*Pediatric Subspecs, < 35         Non-Fed;MD's By Age/Specialty        */
     @08521    f1187905    04.  /*Pediatric Subspecs, < 35         Non-Fed;MD's By Age/Specialty        */
     @08525    f1188008    04.  /*Pediatric Subspecs, 35-44        Non-Fed;MD's By Age/Specialty        */
     @08529    f1188007    04.  /*Pediatric Subspecs, 35-44        Non-Fed;MD's By Age/Specialty        */
     @08533    f1188005    04.  /*Pediatric Subspecs, 35-44        Non-Fed;MD's By Age/Specialty        */
     @08537    f1188108    04.  /*Pediatric Subspecs, 45-54        Non-Fed;MD's By Age/Specialty        */
     @08541    f1188107    04.  /*Pediatric Subspecs, 45-54        Non-Fed;MD's By Age/Specialty        */
     @08545    f1188105    04.  /*Pediatric Subspecs, 45-54        Non-Fed;MD's By Age/Specialty        */
     @08549    f1188208    04.  /*Pediatric Subspecs, 55-64        Non-Fed;MD's By Age/Specialty        */
     @08553    f1188207    04.  /*Pediatric Subspecs, 55-64        Non-Fed;MD's By Age/Specialty        */
     @08557    f1188205    04.  /*Pediatric Subspecs, 55-64        Non-Fed;MD's By Age/Specialty        */
     @08561    f1205008    04.  /*Pediatric Subspecs, 65-74        Non-Fed;MD's By Age/Specialty        */
     @08565    f1205007    04.  /*Pediatric Subspecs, 65-74        Non-Fed;MD's By Age/Specialty        */
     @08569    f1205005    04.  /*Pediatric Subspecs, 65-74        Non-Fed;MD's By Age/Specialty        */
     @08573    f1205108    04.  /*Pediatric Subspecs, 75 +         Non-Fed;MD's By Age/Specialty        */
     @08577    f1205107    04.  /*Pediatric Subspecs, 75 +         Non-Fed;MD's By Age/Specialty        */
     @08581    f1205105    04.  /*Pediatric Subspecs, 75 +         Non-Fed;MD's By Age/Specialty        */
     @08585    f0496408    04.  /*Pediatric Cardiology, < 35       Non-Fed;MD's By Age/Specialty        */
     @08589    f0496407    04.  /*Pediatric Cardiology, < 35       Non-Fed;MD's By Age/Specialty        */
     @08593    f0496405    04.  /*Pediatric Cardiology, < 35       Non-Fed;MD's By Age/Specialty        */
     @08597    f0496508    04.  /*Pediatric Cardiology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08601    f0496507    04.  /*Pediatric Cardiology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08605    f0496505    04.  /*Pediatric Cardiology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08609    f0496608    04.  /*Pediatric Cardiology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08613    f0496607    04.  /*Pediatric Cardiology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08617    f0496605    04.  /*Pediatric Cardiology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08621    f0496708    04.  /*Pediatric Cardiology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08625    f0496707    04.  /*Pediatric Cardiology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08629    f0496705    04.  /*Pediatric Cardiology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08633    f1205208    04.  /*Pediatric Cardiology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08637    f1205207    04.  /*Pediatric Cardiology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08641    f1205205    04.  /*Pediatric Cardiology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08645    f1205308    04.  /*Pediatric Cardiology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08649    f1205307    04.  /*Pediatric Cardiology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08653    f1205305    04.  /*Pediatric Cardiology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08657    f0497008    04.  /*Pulmonary Diseases, < 35         Non-Fed;MD's By Age/Specialty        */
     @08661    f0497007    04.  /*Pulmonary Diseases, < 35         Non-Fed;MD's By Age/Specialty        */
     @08665    f0497005    04.  /*Pulmonary Diseases, < 35         Non-Fed;MD's By Age/Specialty        */
     @08669    f0497108    04.  /*Pulmonary Diseases, 35-44        Non-Fed;MD's By Age/Specialty        */
     @08673    f0497107    04.  /*Pulmonary Diseases, 35-44        Non-Fed;MD's By Age/Specialty        */
     @08677    f0497105    04.  /*Pulmonary Diseases, 35-44        Non-Fed;MD's By Age/Specialty        */
     @08681    f0497208    04.  /*Pulmonary Diseases, 45-54        Non-Fed;MD's By Age/Specialty        */
     @08685    f0497207    04.  /*Pulmonary Diseases, 45-54        Non-Fed;MD's By Age/Specialty        */
     @08689    f0497205    04.  /*Pulmonary Diseases, 45-54        Non-Fed;MD's By Age/Specialty        */
     @08693    f0497308    04.  /*Pulmonary Diseases, 55-64        Non-Fed;MD's By Age/Specialty        */
     @08697    f0497307    04.  /*Pulmonary Diseases, 55-64        Non-Fed;MD's By Age/Specialty        */
     @08701    f0497305    04.  /*Pulmonary Diseases, 55-64        Non-Fed;MD's By Age/Specialty        */
     @08705    f1205408    04.  /*Pulmonary Diseases, 65-74        Non-Fed;MD's By Age/Specialty        */
     @08709    f1205407    04.  /*Pulmonary Diseases, 65-74        Non-Fed;MD's By Age/Specialty        */
     @08713    f1205405    04.  /*Pulmonary Diseases, 65-74        Non-Fed;MD's By Age/Specialty        */
     @08717    f1205508    04.  /*Pulmonary Diseases, 75 +         Non-Fed;MD's By Age/Specialty        */
     @08721    f1205507    04.  /*Pulmonary Diseases, 75 +         Non-Fed;MD's By Age/Specialty        */
     @08725    f1205505    04.  /*Pulmonary Diseases, 75 +         Non-Fed;MD's By Age/Specialty        */
     @08729    f0497608    05.  /*Surgical Specs, Total, < 35      Non-Fed;MD's By Age/Specialty        */
     @08734    f0497607    05.  /*Surgical Specs, Total, < 35      Non-Fed;MD's By Age/Specialty        */
     @08739    f0497605    05.  /*Surgical Specs, Total, < 35      Non-Fed;MD's By Age/Specialty        */
     @08744    f0497708    05.  /*Surgical Specs, Total, 35-44     Non-Fed;MD's By Age/Specialty        */
     @08749    f0497707    05.  /*Surgical Specs, Total, 35-44     Non-Fed;MD's By Age/Specialty        */
     @08754    f0497705    05.  /*Surgical Specs, Total, 35-44     Non-Fed;MD's By Age/Specialty        */
     @08759    f0497808    05.  /*Surgical Specs, Total, 45-54     Non-Fed;MD's By Age/Specialty        */
     @08764    f0497807    05.  /*Surgical Specs, Total, 45-54     Non-Fed;MD's By Age/Specialty        */
     @08769    f0497805    05.  /*Surgical Specs, Total, 45-54     Non-Fed;MD's By Age/Specialty        */
     @08774    f0497908    05.  /*Surgical Specs, Total, 55-64     Non-Fed;MD's By Age/Specialty        */
     @08779    f0497907    05.  /*Surgical Specs, Total, 55-64     Non-Fed;MD's By Age/Specialty        */
     @08784    f0497905    05.  /*Surgical Specs, Total, 55-64     Non-Fed;MD's By Age/Specialty        */
     @08789    f1205608    05.  /*Surgical Specs, Total, 65-74     Non-Fed;MD's By Age/Specialty        */
     @08794    f1205607    05.  /*Surgical Specs, Total, 65-74     Non-Fed;MD's By Age/Specialty        */
     @08799    f1205605    05.  /*Surgical Specs, Total, 65-74     Non-Fed;MD's By Age/Specialty        */
     @08804    f1205708    05.  /*Surgical Specs, Total, 75 +      Non-Fed;MD's By Age/Specialty        */
     @08809    f1205707    05.  /*Surgical Specs, Total, 75 +      Non-Fed;MD's By Age/Specialty        */
     @08814    f1205705    05.  /*Surgical Specs, Total, 75 +      Non-Fed;MD's By Age/Specialty        */
     @08819    f0498208    04.  /*General Surgery, < 35            Non-Fed;MD's By Age/Specialty        */
     @08823    f0498207    04.  /*General Surgery, < 35            Non-Fed;MD's By Age/Specialty        */
     @08827    f0498205    04.  /*General Surgery, < 35            Non-Fed;MD's By Age/Specialty        */
     @08831    f0498308    04.  /*General Surgery, 35-44           Non-Fed;MD's By Age/Specialty        */
     @08835    f0498307    04.  /*General Surgery, 35-44           Non-Fed;MD's By Age/Specialty        */
     @08839    f0498305    04.  /*General Surgery, 35-44           Non-Fed;MD's By Age/Specialty        */
     @08843    f0498408    04.  /*General Surgery, 45-54           Non-Fed;MD's By Age/Specialty        */
     @08847    f0498407    04.  /*General Surgery, 45-54           Non-Fed;MD's By Age/Specialty        */
     @08851    f0498405    04.  /*General Surgery, 45-54           Non-Fed;MD's By Age/Specialty        */
     @08855    f0498508    04.  /*General Surgery, 55-64           Non-Fed;MD's By Age/Specialty        */
     @08859    f0498507    04.  /*General Surgery, 55-64           Non-Fed;MD's By Age/Specialty        */
     @08863    f0498505    04.  /*General Surgery, 55-64           Non-Fed;MD's By Age/Specialty        */
     @08867    f1205808    04.  /*General Surgery, 65-74           Non-Fed;MD's By Age/Specialty        */
     @08871    f1205807    04.  /*General Surgery, 65-74           Non-Fed;MD's By Age/Specialty        */
     @08875    f1205805    04.  /*General Surgery, 65-74           Non-Fed;MD's By Age/Specialty        */
     @08879    f1205908    04.  /*General Surgery, 75 +            Non-Fed;MD's By Age/Specialty        */
     @08883    f1205907    04.  /*General Surgery, 75 +            Non-Fed;MD's By Age/Specialty        */
     @08887    f1205905    04.  /*General Surgery, 75 +            Non-Fed;MD's By Age/Specialty        */
     @08891    f0498808    04.  /*Neurological Surgery, < 35       Non-Fed;MD's By Age/Specialty        */
     @08895    f0498807    04.  /*Neurological Surgery, < 35       Non-Fed;MD's By Age/Specialty        */
     @08899    f0498805    04.  /*Neurological Surgery, < 35       Non-Fed;MD's By Age/Specialty        */
     @08903    f0498908    04.  /*Neurological Surgery, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08907    f0498907    04.  /*Neurological Surgery, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08911    f0498905    04.  /*Neurological Surgery, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08915    f0499008    04.  /*Neurological Surgery, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08919    f0499007    04.  /*Neurological Surgery, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08923    f0499005    04.  /*Neurological Surgery, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08927    f0499108    04.  /*Neurological Surgery, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08931    f0499107    04.  /*Neurological Surgery, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08935    f0499105    04.  /*Neurological Surgery, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08939    f1206008    04.  /*Neurological Surgery, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08943    f1206007    04.  /*Neurological Surgery, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08947    f1206005    04.  /*Neurological Surgery, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08951    f1206108    04.  /*Neurological Surgery, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08955    f1206107    04.  /*Neurological Surgery, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08959    f1206105    04.  /*Neurological Surgery, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08963    f1188408    04.  /*Ob-Gyn, General, < 35            Non-Fed;MD's By Age/Specialty        */
     @08967    f1188407    04.  /*Ob-Gyn, General, < 35            Non-Fed;MD's By Age/Specialty        */
     @08971    f1188405    04.  /*Ob-Gyn, General, < 35            Non-Fed;MD's By Age/Specialty        */
     @08975    f1188508    04.  /*Ob-Gyn, General, 35-44           Non-Fed;MD's By Age/Specialty        */
     @08979    f1188507    04.  /*Ob-Gyn, General, 35-44           Non-Fed;MD's By Age/Specialty        */
     @08983    f1188505    04.  /*Ob-Gyn, General, 35-44           Non-Fed;MD's By Age/Specialty        */
     @08987    f1188608    04.  /*Ob-Gyn, General, 45-54           Non-Fed;MD's By Age/Specialty        */
     @08991    f1188607    04.  /*Ob-Gyn, General, 45-54           Non-Fed;MD's By Age/Specialty        */
     @08995    f1188605    04.  /*Ob-Gyn, General, 45-54           Non-Fed;MD's By Age/Specialty        */
     @08999    f1188708    04.  /*Ob-Gyn, General, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09003    f1188707    04.  /*Ob-Gyn, General, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09007    f1188705    04.  /*Ob-Gyn, General, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09011    f1206208    04.  /*Ob-Gyn, General, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09015    f1206207    04.  /*Ob-Gyn, General, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09019    f1206205    04.  /*Ob-Gyn, General, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09023    f1206308    04.  /*Ob-Gyn, General, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09027    f1206307    04.  /*Ob-Gyn, General, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09031    f1206305    04.  /*Ob-Gyn, General, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09035    f1188908    04.  /*Ob-Gyn Subspecs, < 35            Non-Fed;MD's By Age/Specialty        */
     @09039    f1188907    04.  /*Ob-Gyn Subspecs, < 35            Non-Fed;MD's By Age/Specialty        */
     @09043    f1188905    04.  /*Ob-Gyn Subspecs, < 35            Non-Fed;MD's By Age/Specialty        */
     @09047    f1189008    04.  /*Ob-Gyn Subspecs, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09051    f1189007    04.  /*Ob-Gyn Subspecs, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09055    f1189005    04.  /*Ob-Gyn Subspecs, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09059    f1189108    04.  /*Ob-Gyn Subspecs, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09063    f1189107    04.  /*Ob-Gyn Subspecs, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09067    f1189105    04.  /*Ob-Gyn Subspecs, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09071    f1189208    04.  /*Ob-Gyn Subspecs, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09075    f1189207    04.  /*Ob-Gyn Subspecs, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09079    f1189205    04.  /*Ob-Gyn Subspecs, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09083    f1206408    04.  /*Ob-Gyn Subspecs, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09087    f1206407    04.  /*Ob-Gyn Subspecs, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09091    f1206405    04.  /*Ob-Gyn Subspecs, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09095    f1206508    04.  /*Ob-Gyn Subspecs, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09099    f1206507    04.  /*Ob-Gyn Subspecs, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09103    f1206505    04.  /*Ob-Gyn Subspecs, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09107    f0500008    04.  /*Ophthalmology, < 35              Non-Fed;MD's By Age/Specialty        */
     @09111    f0500007    04.  /*Ophthalmology, < 35              Non-Fed;MD's By Age/Specialty        */
     @09115    f0500005    04.  /*Ophthalmology, < 35              Non-Fed;MD's By Age/Specialty        */
     @09119    f0500108    04.  /*Ophthalmology, 35-44             Non-Fed;MD's By Age/Specialty        */
     @09123    f0500107    04.  /*Ophthalmology, 35-44             Non-Fed;MD's By Age/Specialty        */
     @09127    f0500105    04.  /*Ophthalmology, 35-44             Non-Fed;MD's By Age/Specialty        */
     @09131    f0500208    04.  /*Ophthalmology, 45-54             Non-Fed;MD's By Age/Specialty        */
     @09135    f0500207    04.  /*Ophthalmology, 45-54             Non-Fed;MD's By Age/Specialty        */
     @09139    f0500205    04.  /*Ophthalmology, 45-54             Non-Fed;MD's By Age/Specialty        */
     @09143    f0500308    04.  /*Ophthalmology, 55-64             Non-Fed;MD's By Age/Specialty        */
     @09147    f0500307    04.  /*Ophthalmology, 55-64             Non-Fed;MD's By Age/Specialty        */
     @09151    f0500305    04.  /*Ophthalmology, 55-64             Non-Fed;MD's By Age/Specialty        */
     @09155    f1206608    04.  /*Ophthalmology, 65-74             Non-Fed;MD's By Age/Specialty        */
     @09159    f1206607    04.  /*Ophthalmology, 65-74             Non-Fed;MD's By Age/Specialty        */
     @09163    f1206605    04.  /*Ophthalmology, 65-74             Non-Fed;MD's By Age/Specialty        */
     @09167    f1206708    04.  /*Ophthalmology, 75 +              Non-Fed;MD's By Age/Specialty        */
     @09171    f1206707    04.  /*Ophthalmology, 75 +              Non-Fed;MD's By Age/Specialty        */
     @09175    f1206705    04.  /*Ophthalmology, 75 +              Non-Fed;MD's By Age/Specialty        */
     @09179    f0500608    04.  /*Orthopedic Surgery, < 35         Non-Fed;MD's By Age/Specialty        */
     @09183    f0500607    04.  /*Orthopedic Surgery, < 35         Non-Fed;MD's By Age/Specialty        */
     @09187    f0500605    04.  /*Orthopedic Surgery, < 35         Non-Fed;MD's By Age/Specialty        */
     @09191    f0500708    04.  /*Orthopedic Surgery, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09195    f0500707    04.  /*Orthopedic Surgery, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09199    f0500705    04.  /*Orthopedic Surgery, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09203    f0500808    04.  /*Orthopedic Surgery, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09207    f0500807    04.  /*Orthopedic Surgery, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09211    f0500805    04.  /*Orthopedic Surgery, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09215    f0500908    04.  /*Orthopedic Surgery, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09219    f0500907    04.  /*Orthopedic Surgery, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09223    f0500905    04.  /*Orthopedic Surgery, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09227    f1206808    04.  /*Orthopedic Surgery, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09231    f1206807    04.  /*Orthopedic Surgery, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09235    f1206805    04.  /*Orthopedic Surgery, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09239    f1206908    04.  /*Orthopedic Surgery, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09243    f1206907    04.  /*Orthopedic Surgery, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09247    f1206905    04.  /*Orthopedic Surgery, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09251    f0501208    04.  /*Otolaryngology, < 35             Non-Fed;MD's By Age/Specialty        */
     @09255    f0501207    04.  /*Otolaryngology, < 35             Non-Fed;MD's By Age/Specialty        */
     @09259    f0501205    04.  /*Otolaryngology, < 35             Non-Fed;MD's By Age/Specialty        */
     @09263    f0501308    04.  /*Otolaryngology, 35-44            Non-Fed;MD's By Age/Specialty        */
     @09267    f0501307    04.  /*Otolaryngology, 35-44            Non-Fed;MD's By Age/Specialty        */
     @09271    f0501305    04.  /*Otolaryngology, 35-44            Non-Fed;MD's By Age/Specialty        */
     @09275    f0501408    04.  /*Otolaryngology, 45-54            Non-Fed;MD's By Age/Specialty        */
     @09279    f0501407    04.  /*Otolaryngology, 45-54            Non-Fed;MD's By Age/Specialty        */
     @09283    f0501405    04.  /*Otolaryngology, 45-54            Non-Fed;MD's By Age/Specialty        */
     @09287    f0501508    04.  /*Otolaryngology, 55-64            Non-Fed;MD's By Age/Specialty        */
     @09291    f0501507    04.  /*Otolaryngology, 55-64            Non-Fed;MD's By Age/Specialty        */
     @09295    f0501505    04.  /*Otolaryngology, 55-64            Non-Fed;MD's By Age/Specialty        */
     @09299    f1207008    04.  /*Otolaryngology, 65-74            Non-Fed;MD's By Age/Specialty        */
     @09303    f1207007    04.  /*Otolaryngology, 65-74            Non-Fed;MD's By Age/Specialty        */
     @09307    f1207005    04.  /*Otolaryngology, 65-74            Non-Fed;MD's By Age/Specialty        */
     @09311    f1207108    04.  /*Otolaryngology, 75 +             Non-Fed;MD's By Age/Specialty        */
     @09315    f1207107    04.  /*Otolaryngology, 75 +             Non-Fed;MD's By Age/Specialty        */
     @09319    f1207105    04.  /*Otolaryngology, 75 +             Non-Fed;MD's By Age/Specialty        */
     @09323    f0501808    04.  /*Plastic Surgery, < 35            Non-Fed;MD's By Age/Specialty        */
     @09327    f0501807    04.  /*Plastic Surgery, < 35            Non-Fed;MD's By Age/Specialty        */
     @09331    f0501805    04.  /*Plastic Surgery, < 35            Non-Fed;MD's By Age/Specialty        */
     @09335    f0501908    04.  /*Plastic Surgery, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09339    f0501907    04.  /*Plastic Surgery, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09343    f0501905    04.  /*Plastic Surgery, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09347    f0502008    04.  /*Plastic Surgery, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09351    f0502007    04.  /*Plastic Surgery, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09355    f0502005    04.  /*Plastic Surgery, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09359    f0502108    04.  /*Plastic Surgery, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09363    f0502107    04.  /*Plastic Surgery, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09367    f0502105    04.  /*Plastic Surgery, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09371    f1207208    04.  /*Plastic Surgery, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09375    f1207207    04.  /*Plastic Surgery, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09379    f1207205    04.  /*Plastic Surgery, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09383    f1207308    04.  /*Plastic Surgery, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09387    f1207307    04.  /*Plastic Surgery, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09391    f1207305    04.  /*Plastic Surgery, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09395    f0502408    04.  /*Colon & Rectal Surgery, < 35     Non-Fed;MD's By Age/Specialty        */
     @09399    f0502407    04.  /*Colon & Rectal Surgery, < 35     Non-Fed;MD's By Age/Specialty        */
     @09403    f0502405    04.  /*Colon & Rectal Surgery, < 35     Non-Fed;MD's By Age/Specialty        */
     @09407    f0502508    04.  /*Colon & Rectal Surgery, 35-44    Non-Fed;MD's By Age/Specialty        */
     @09411    f0502507    04.  /*Colon & Rectal Surgery, 35-44    Non-Fed;MD's By Age/Specialty        */
     @09415    f0502505    04.  /*Colon & Rectal Surgery, 35-44    Non-Fed;MD's By Age/Specialty        */
     @09419    f0502608    04.  /*Colon & Rectal Surgery, 45-54    Non-Fed;MD's By Age/Specialty        */
     @09423    f0502607    04.  /*Colon & Rectal Surgery, 45-54    Non-Fed;MD's By Age/Specialty        */
     @09427    f0502605    04.  /*Colon & Rectal Surgery, 45-54    Non-Fed;MD's By Age/Specialty        */
     @09431    f0502708    04.  /*Colon & Rectal Surgery, 55-64    Non-Fed;MD's By Age/Specialty        */
     @09435    f0502707    04.  /*Colon & Rectal Surgery, 55-64    Non-Fed;MD's By Age/Specialty        */
     @09439    f0502705    04.  /*Colon & Rectal Surgery, 55-64    Non-Fed;MD's By Age/Specialty        */
     @09443    f1207408    04.  /*Colon & Rectal Surgery, 65-74    Non-Fed;MD's By Age/Specialty        */
     @09447    f1207407    04.  /*Colon & Rectal Surgery, 65-74    Non-Fed;MD's By Age/Specialty        */
     @09451    f1207405    04.  /*Colon & Rectal Surgery, 65-74    Non-Fed;MD's By Age/Specialty        */
     @09455    f1207508    04.  /*Colon & Rectal Surgery, 75 +     Non-Fed;MD's By Age/Specialty        */
     @09459    f1207507    04.  /*Colon & Rectal Surgery, 75 +     Non-Fed;MD's By Age/Specialty        */
     @09463    f1207505    04.  /*Colon & Rectal Surgery, 75 +     Non-Fed;MD's By Age/Specialty        */
     @09467    f0503008    04.  /*Thoracic Surgery, < 35           Non-Fed;MD's By Age/Specialty        */
     @09471    f0503007    04.  /*Thoracic Surgery, < 35           Non-Fed;MD's By Age/Specialty        */
     @09475    f0503005    04.  /*Thoracic Surgery, < 35           Non-Fed;MD's By Age/Specialty        */
     @09479    f0503108    04.  /*Thoracic Surgery, 35-44          Non-Fed;MD's By Age/Specialty        */
     @09483    f0503107    04.  /*Thoracic Surgery, 35-44          Non-Fed;MD's By Age/Specialty        */
     @09487    f0503105    04.  /*Thoracic Surgery, 35-44          Non-Fed;MD's By Age/Specialty        */
     @09491    f0503208    04.  /*Thoracic Surgery, 45-54          Non-Fed;MD's By Age/Specialty        */
     @09495    f0503207    04.  /*Thoracic Surgery, 45-54          Non-Fed;MD's By Age/Specialty        */
     @09499    f0503205    04.  /*Thoracic Surgery, 45-54          Non-Fed;MD's By Age/Specialty        */
     @09503    f0503308    04.  /*Thoracic Surgery, 55-64          Non-Fed;MD's By Age/Specialty        */
     @09507    f0503307    04.  /*Thoracic Surgery, 55-64          Non-Fed;MD's By Age/Specialty        */
     @09511    f0503305    04.  /*Thoracic Surgery, 55-64          Non-Fed;MD's By Age/Specialty        */
     @09515    f1207608    04.  /*Thoracic Surgery, 65-74          Non-Fed;MD's By Age/Specialty        */
     @09519    f1207607    04.  /*Thoracic Surgery, 65-74          Non-Fed;MD's By Age/Specialty        */
     @09523    f1207605    04.  /*Thoracic Surgery, 65-74          Non-Fed;MD's By Age/Specialty        */
     @09527    f1207708    04.  /*Thoracic Surgery, 75 +           Non-Fed;MD's By Age/Specialty        */
     @09531    f1207707    04.  /*Thoracic Surgery, 75 +           Non-Fed;MD's By Age/Specialty        */
     @09535    f1207705    04.  /*Thoracic Surgery, 75 +           Non-Fed;MD's By Age/Specialty        */
     @09539    f0503608    04.  /*Urology, < 35                    Non-Fed;MD's By Age/Specialty        */
     @09543    f0503607    04.  /*Urology, < 35                    Non-Fed;MD's By Age/Specialty        */
     @09547    f0503605    04.  /*Urology, < 35                    Non-Fed;MD's By Age/Specialty        */
     @09551    f0503708    04.  /*Urology, 35-44                   Non-Fed;MD's By Age/Specialty        */
     @09555    f0503707    04.  /*Urology, 35-44                   Non-Fed;MD's By Age/Specialty        */
     @09559    f0503705    04.  /*Urology, 35-44                   Non-Fed;MD's By Age/Specialty        */
     @09563    f0503808    04.  /*Urology, 45-54                   Non-Fed;MD's By Age/Specialty        */
     @09567    f0503807    04.  /*Urology, 45-54                   Non-Fed;MD's By Age/Specialty        */
     @09571    f0503805    04.  /*Urology, 45-54                   Non-Fed;MD's By Age/Specialty        */
     @09575    f0503908    04.  /*Urology, 55-64                   Non-Fed;MD's By Age/Specialty        */
     @09579    f0503907    04.  /*Urology, 55-64                   Non-Fed;MD's By Age/Specialty        */
     @09583    f0503905    04.  /*Urology, 55-64                   Non-Fed;MD's By Age/Specialty        */
     @09587    f1207808    04.  /*Urology, 65-74                   Non-Fed;MD's By Age/Specialty        */
     @09591    f1207807    04.  /*Urology, 65-74                   Non-Fed;MD's By Age/Specialty        */
     @09595    f1207805    04.  /*Urology, 65-74                   Non-Fed;MD's By Age/Specialty        */
     @09599    f1207908    04.  /*Urology, 75 +                    Non-Fed;MD's By Age/Specialty        */
     @09603    f1207907    04.  /*Urology, 75 +                    Non-Fed;MD's By Age/Specialty        */
     @09607    f1207905    04.  /*Urology, 75 +                    Non-Fed;MD's By Age/Specialty        */
     @09611    f0504208    05.  /*Other Specs, Total, < 35         Non-Fed;MD's By Age/Specialty        */
     @09616    f0504207    05.  /*Other Specs, Total, < 35         Non-Fed;MD's By Age/Specialty        */
     @09621    f0504205    05.  /*Other Specs, Total, < 35         Non-Fed;MD's By Age/Specialty        */
     @09626    f0504308    05.  /*Other Specs, Total, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09631    f0504307    05.  /*Other Specs, Total, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09636    f0504305    05.  /*Other Specs, Total, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09641    f0504408    05.  /*Other Specs, Total, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09646    f0504407    05.  /*Other Specs, Total, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09651    f0504405    05.  /*Other Specs, Total, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09656    f0504508    05.  /*Other Specs, Total, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09661    f0504507    05.  /*Other Specs, Total, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09666    f0504505    05.  /*Other Specs, Total, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09671    f1208008    05.  /*Other Specs, Total, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09676    f1208007    05.  /*Other Specs, Total, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09681    f1208005    05.  /*Other Specs, Total, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09686    f1208108    05.  /*Other Specs, Total, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09691    f1208107    05.  /*Other Specs, Total, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09696    f1208105    05.  /*Other Specs, Total, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09701    f0504808    04.  /*Aerospace Medicine, < 35         Non-Fed;MD's By Age/Specialty        */
     @09705    f0504807    04.  /*Aerospace Medicine, < 35         Non-Fed;MD's By Age/Specialty        */
     @09709    f0504805    04.  /*Aerospace Medicine, < 35         Non-Fed;MD's By Age/Specialty        */
     @09713    f0504908    04.  /*Aerospace Medicine, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09717    f0504907    04.  /*Aerospace Medicine, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09721    f0504905    04.  /*Aerospace Medicine, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09725    f0505008    04.  /*Aerospace Medicine, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09729    f0505007    04.  /*Aerospace Medicine, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09733    f0505005    04.  /*Aerospace Medicine, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09737    f0505108    04.  /*Aerospace Medicine, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09741    f0505107    04.  /*Aerospace Medicine, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09745    f0505105    04.  /*Aerospace Medicine, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09749    f1208208    04.  /*Aerospace Medicine, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09753    f1208207    04.  /*Aerospace Medicine, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09757    f1208205    04.  /*Aerospace Medicine, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09761    f1208308    04.  /*Aerospace Medicine, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09765    f1208307    04.  /*Aerospace Medicine, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09769    f1208305    04.  /*Aerospace Medicine, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09773    f0505408    04.  /*Anesthesiology, < 35             Non-Fed;MD's By Age/Specialty        */
     @09777    f0505407    04.  /*Anesthesiology, < 35             Non-Fed;MD's By Age/Specialty        */
     @09781    f0505405    04.  /*Anesthesiology, < 35             Non-Fed;MD's By Age/Specialty        */
     @09785    f0505508    04.  /*Anesthesiology, 35-44            Non-Fed;MD's By Age/Specialty        */
     @09789    f0505507    04.  /*Anesthesiology, 35-44            Non-Fed;MD's By Age/Specialty        */
     @09793    f0505505    04.  /*Anesthesiology, 35-44            Non-Fed;MD's By Age/Specialty        */
     @09797    f0505608    04.  /*Anesthesiology, 45-54            Non-Fed;MD's By Age/Specialty        */
     @09801    f0505607    04.  /*Anesthesiology, 45-54            Non-Fed;MD's By Age/Specialty        */
     @09805    f0505605    04.  /*Anesthesiology, 45-54            Non-Fed;MD's By Age/Specialty        */
     @09809    f0505708    04.  /*Anesthesiology, 55-64            Non-Fed;MD's By Age/Specialty        */
     @09813    f0505707    04.  /*Anesthesiology, 55-64            Non-Fed;MD's By Age/Specialty        */
     @09817    f0505705    04.  /*Anesthesiology, 55-64            Non-Fed;MD's By Age/Specialty        */
     @09821    f1208408    04.  /*Anesthesiology, 65-74            Non-Fed;MD's By Age/Specialty        */
     @09825    f1208407    04.  /*Anesthesiology, 65-74            Non-Fed;MD's By Age/Specialty        */
     @09829    f1208405    04.  /*Anesthesiology, 65-74            Non-Fed;MD's By Age/Specialty        */
     @09833    f1208508    04.  /*Anesthesiology, 75 +             Non-Fed;MD's By Age/Specialty        */
     @09837    f1208507    04.  /*Anesthesiology, 75 +             Non-Fed;MD's By Age/Specialty        */
     @09841    f1208505    04.  /*Anesthesiology, 75 +             Non-Fed;MD's By Age/Specialty        */
     @09845    f0506008    04.  /*Child Psychiatry, < 35           Non-Fed;MD's By Age/Specialty        */
     @09849    f0506007    04.  /*Child Psychiatry, < 35           Non-Fed;MD's By Age/Specialty        */
     @09853    f0506005    04.  /*Child Psychiatry, < 35           Non-Fed;MD's By Age/Specialty        */
     @09857    f0506108    04.  /*Child Psychiatry, 35-44          Non-Fed;MD's By Age/Specialty        */
     @09861    f0506107    04.  /*Child Psychiatry, 35-44          Non-Fed;MD's By Age/Specialty        */
     @09865    f0506105    04.  /*Child Psychiatry, 35-44          Non-Fed;MD's By Age/Specialty        */
     @09869    f0506208    04.  /*Child Psychiatry, 45-54          Non-Fed;MD's By Age/Specialty        */
     @09873    f0506207    04.  /*Child Psychiatry, 45-54          Non-Fed;MD's By Age/Specialty        */
     @09877    f0506205    04.  /*Child Psychiatry, 45-54          Non-Fed;MD's By Age/Specialty        */
     @09881    f0506308    04.  /*Child Psychiatry, 55-64          Non-Fed;MD's By Age/Specialty        */
     @09885    f0506307    04.  /*Child Psychiatry, 55-64          Non-Fed;MD's By Age/Specialty        */
     @09889    f0506305    04.  /*Child Psychiatry, 55-64          Non-Fed;MD's By Age/Specialty        */
     @09893    f1208608    04.  /*Child Psychiatry, 65-74          Non-Fed;MD's By Age/Specialty        */
     @09897    f1208607    04.  /*Child Psychiatry, 65-74          Non-Fed;MD's By Age/Specialty        */
     @09901    f1208605    04.  /*Child Psychiatry, 65-74          Non-Fed;MD's By Age/Specialty        */
     @09905    f1208708    04.  /*Child Psychiatry, 75 +           Non-Fed;MD's By Age/Specialty        */
     @09909    f1208707    04.  /*Child Psychiatry, 75 +           Non-Fed;MD's By Age/Specialty        */
     @09913    f1208705    04.  /*Child Psychiatry, 75 +           Non-Fed;MD's By Age/Specialty        */
     @09917    f0506608    04.  /*Diagnostic Radiology, < 35       Non-Fed;MD's By Age/Specialty        */
     @09921    f0506607    04.  /*Diagnostic Radiology, < 35       Non-Fed;MD's By Age/Specialty        */
     @09925    f0506605    04.  /*Diagnostic Radiology, < 35       Non-Fed;MD's By Age/Specialty        */
     @09929    f0506708    04.  /*Diagnostic Radiology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @09933    f0506707    04.  /*Diagnostic Radiology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @09937    f0506705    04.  /*Diagnostic Radiology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @09941    f0506808    04.  /*Diagnostic Radiology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @09945    f0506807    04.  /*Diagnostic Radiology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @09949    f0506805    04.  /*Diagnostic Radiology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @09953    f0506908    04.  /*Diagnostic Radiology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @09957    f0506907    04.  /*Diagnostic Radiology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @09961    f0506905    04.  /*Diagnostic Radiology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @09965    f1208808    04.  /*Diagnostic Radiology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @09969    f1208807    04.  /*Diagnostic Radiology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @09973    f1208805    04.  /*Diagnostic Radiology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @09977    f1208908    04.  /*Diagnostic Radiology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @09981    f1208907    04.  /*Diagnostic Radiology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @09985    f1208905    04.  /*Diagnostic Radiology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @09989    f1075908    04.  /*Emergency Medicine, < 35         Non-Fed;MD's By Age/Specialty        */
     @09993    f1075907    04.  /*Emergency Medicine, < 35         Non-Fed;MD's By Age/Specialty        */
     @09997    f1075905    04.  /*Emergency Medicine, < 35         Non-Fed;MD's By Age/Specialty        */
     @10001    f1076008    04.  /*Emergency Medicine, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10005    f1076007    04.  /*Emergency Medicine, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10009    f1076005    04.  /*Emergency Medicine, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10013    f1076108    04.  /*Emergency Medicine, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10017    f1076107    04.  /*Emergency Medicine, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10021    f1076105    04.  /*Emergency Medicine, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10025    f1076208    04.  /*Emergency Medicine, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10029    f1076207    04.  /*Emergency Medicine, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10033    f1076205    04.  /*Emergency Medicine, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10037    f1209008    04.  /*Emergency Medicine, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10041    f1209007    04.  /*Emergency Medicine, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10045    f1209005    04.  /*Emergency Medicine, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10049    f1209108    04.  /*Emergency Medicine, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10053    f1209107    04.  /*Emergency Medicine, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10057    f1209105    04.  /*Emergency Medicine, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10061    f0507208    04.  /*Forensic Pathology, < 35         Non-Fed;MD's By Age/Specialty        */
     @10065    f0507207    04.  /*Forensic Pathology, < 35         Non-Fed;MD's By Age/Specialty        */
     @10069    f0507205    04.  /*Forensic Pathology, < 35         Non-Fed;MD's By Age/Specialty        */
     @10073    f0507308    04.  /*Forensic Pathology, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10077    f0507307    04.  /*Forensic Pathology, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10081    f0507305    04.  /*Forensic Pathology, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10085    f0507408    04.  /*Forensic Pathology, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10089    f0507407    04.  /*Forensic Pathology, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10093    f0507405    04.  /*Forensic Pathology, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10097    f0507508    04.  /*Forensic Pathology, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10101    f0507507    04.  /*Forensic Pathology, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10105    f0507505    04.  /*Forensic Pathology, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10109    f1209208    04.  /*Forensic Pathology, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10113    f1209207    04.  /*Forensic Pathology, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10117    f1209205    04.  /*Forensic Pathology, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10121    f1209308    04.  /*Forensic Pathology, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10125    f1209307    04.  /*Forensic Pathology, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10129    f1209305    04.  /*Forensic Pathology, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10133    f1242608    04.  /*Medical Genetics, < 35           Non-Fed;MD's By Age/Specialty        */
     @10137    f1242607    04.  /*Medical Genetics, < 35           Non-Fed;MD's By Age/Specialty        */
     @10141    f1242605    04.  /*Medical Genetics, < 35           Non-Fed;MD's By Age/Specialty        */
     @10145    f1242708    04.  /*Medical Genetics, 35-44          Non-Fed;MD's By Age/Specialty        */
     @10149    f1242707    04.  /*Medical Genetics, 35-44          Non-Fed;MD's By Age/Specialty        */
     @10153    f1242705    04.  /*Medical Genetics, 35-44          Non-Fed;MD's By Age/Specialty        */
     @10157    f1242808    04.  /*Medical Genetics, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10161    f1242807    04.  /*Medical Genetics, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10165    f1242805    04.  /*Medical Genetics, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10169    f1242908    04.  /*Medical Genetics, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10173    f1242907    04.  /*Medical Genetics, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10177    f1242905    04.  /*Medical Genetics, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10181    f1243008    04.  /*Medical Genetics, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10185    f1243007    04.  /*Medical Genetics, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10189    f1243005    04.  /*Medical Genetics, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10193    f1243108    04.  /*Medical Genetics, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10197    f1243107    04.  /*Medical Genetics, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10201    f1243105    04.  /*Medical Genetics, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10205    f0507808    04.  /*Neurology, < 35                  Non-Fed;MD's By Age/Specialty        */
     @10209    f0507807    04.  /*Neurology, < 35                  Non-Fed;MD's By Age/Specialty        */
     @10213    f0507805    04.  /*Neurology, < 35                  Non-Fed;MD's By Age/Specialty        */
     @10217    f0507908    04.  /*Neurology, 35-44                 Non-Fed;MD's By Age/Specialty        */
     @10221    f0507907    04.  /*Neurology, 35-44                 Non-Fed;MD's By Age/Specialty        */
     @10225    f0507905    04.  /*Neurology, 35-44                 Non-Fed;MD's By Age/Specialty        */
     @10229    f0508008    04.  /*Neurology, 45-54                 Non-Fed;MD's By Age/Specialty        */
     @10233    f0508007    04.  /*Neurology, 45-54                 Non-Fed;MD's By Age/Specialty        */
     @10237    f0508005    04.  /*Neurology, 45-54                 Non-Fed;MD's By Age/Specialty        */
     @10241    f0508108    04.  /*Neurology, 55-64                 Non-Fed;MD's By Age/Specialty        */
     @10245    f0508107    04.  /*Neurology, 55-64                 Non-Fed;MD's By Age/Specialty        */
     @10249    f0508105    04.  /*Neurology, 55-64                 Non-Fed;MD's By Age/Specialty        */
     @10253    f1209408    04.  /*Neurology, 65-74                 Non-Fed;MD's By Age/Specialty        */
     @10257    f1209407    04.  /*Neurology, 65-74                 Non-Fed;MD's By Age/Specialty        */
     @10261    f1209405    04.  /*Neurology, 65-74                 Non-Fed;MD's By Age/Specialty        */
     @10265    f1209508    04.  /*Neurology, 75 +                  Non-Fed;MD's By Age/Specialty        */
     @10269    f1209507    04.  /*Neurology, 75 +                  Non-Fed;MD's By Age/Specialty        */
     @10273    f1209505    04.  /*Neurology, 75 +                  Non-Fed;MD's By Age/Specialty        */
     @10277    f1076408    04.  /*Nuclear Medicine, < 35           Non-Fed;MD's By Age/Specialty        */
     @10281    f1076407    04.  /*Nuclear Medicine, < 35           Non-Fed;MD's By Age/Specialty        */
     @10285    f1076405    04.  /*Nuclear Medicine, < 35           Non-Fed;MD's By Age/Specialty        */
     @10289    f1076508    04.  /*Nuclear Medicine, 35-44          Non-Fed;MD's By Age/Specialty        */
     @10293    f1076507    04.  /*Nuclear Medicine, 35-44          Non-Fed;MD's By Age/Specialty        */
     @10297    f1076505    04.  /*Nuclear Medicine, 35-44          Non-Fed;MD's By Age/Specialty        */
     @10301    f1076608    04.  /*Nuclear Medicine, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10305    f1076607    04.  /*Nuclear Medicine, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10309    f1076605    04.  /*Nuclear Medicine, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10313    f1076708    04.  /*Nuclear Medicine, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10317    f1076707    04.  /*Nuclear Medicine, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10321    f1076705    04.  /*Nuclear Medicine, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10325    f1209608    04.  /*Nuclear Medicine, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10329    f1209607    04.  /*Nuclear Medicine, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10333    f1209605    04.  /*Nuclear Medicine, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10337    f1209708    04.  /*Nuclear Medicine, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10341    f1209707    04.  /*Nuclear Medicine, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10345    f1209705    04.  /*Nuclear Medicine, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10349    f0508408    04.  /*Occupational Medicine, < 35      Non-Fed;MD's By Age/Specialty        */
     @10353    f0508407    04.  /*Occupational Medicine, < 35      Non-Fed;MD's By Age/Specialty        */
     @10357    f0508405    04.  /*Occupational Medicine, < 35      Non-Fed;MD's By Age/Specialty        */
     @10361    f0508508    04.  /*Occupational Medicine, 35-44     Non-Fed;MD's By Age/Specialty        */
     @10365    f0508507    04.  /*Occupational Medicine, 35-44     Non-Fed;MD's By Age/Specialty        */
     @10369    f0508505    04.  /*Occupational Medicine, 35-44     Non-Fed;MD's By Age/Specialty        */
     @10373    f0508608    04.  /*Occupational Medicine, 45-54     Non-Fed;MD's By Age/Specialty        */
     @10377    f0508607    04.  /*Occupational Medicine, 45-54     Non-Fed;MD's By Age/Specialty        */
     @10381    f0508605    04.  /*Occupational Medicine, 45-54     Non-Fed;MD's By Age/Specialty        */
     @10385    f0508708    04.  /*Occupational Medicine, 55-64     Non-Fed;MD's By Age/Specialty        */
     @10389    f0508707    04.  /*Occupational Medicine, 55-64     Non-Fed;MD's By Age/Specialty        */
     @10393    f0508705    04.  /*Occupational Medicine, 55-64     Non-Fed;MD's By Age/Specialty        */
     @10397    f1209808    04.  /*Occupational Medicine, 65-74     Non-Fed;MD's By Age/Specialty        */
     @10401    f1209807    04.  /*Occupational Medicine, 65-74     Non-Fed;MD's By Age/Specialty        */
     @10405    f1209805    04.  /*Occupational Medicine, 65-74     Non-Fed;MD's By Age/Specialty        */
     @10409    f1209908    04.  /*Occupational Medicine, 75 +      Non-Fed;MD's By Age/Specialty        */
     @10413    f1209907    04.  /*Occupational Medicine, 75 +      Non-Fed;MD's By Age/Specialty        */
     @10417    f1209905    04.  /*Occupational Medicine, 75 +      Non-Fed;MD's By Age/Specialty        */
     @10421    f0509008    04.  /*Psychiatry, < 35                 Non-Fed;MD's By Age/Specialty        */
     @10425    f0509007    04.  /*Psychiatry, < 35                 Non-Fed;MD's By Age/Specialty        */
     @10429    f0509005    04.  /*Psychiatry, < 35                 Non-Fed;MD's By Age/Specialty        */
     @10433    f0509108    04.  /*Psychiatry, 35-44                Non-Fed;MD's By Age/Specialty        */
     @10437    f0509107    04.  /*Psychiatry, 35-44                Non-Fed;MD's By Age/Specialty        */
     @10441    f0509105    04.  /*Psychiatry, 35-44                Non-Fed;MD's By Age/Specialty        */
     @10445    f0509208    04.  /*Psychiatry, 45-54                Non-Fed;MD's By Age/Specialty        */
     @10449    f0509207    04.  /*Psychiatry, 45-54                Non-Fed;MD's By Age/Specialty        */
     @10453    f0509205    04.  /*Psychiatry, 45-54                Non-Fed;MD's By Age/Specialty        */
     @10457    f0509308    04.  /*Psychiatry, 55-64                Non-Fed;MD's By Age/Specialty        */
     @10461    f0509307    04.  /*Psychiatry, 55-64                Non-Fed;MD's By Age/Specialty        */
     @10465    f0509305    04.  /*Psychiatry, 55-64                Non-Fed;MD's By Age/Specialty        */
     @10469    f1210008    04.  /*Psychiatry, 65-74                Non-Fed;MD's By Age/Specialty        */
     @10473    f1210007    04.  /*Psychiatry, 65-74                Non-Fed;MD's By Age/Specialty        */
     @10477    f1210005    04.  /*Psychiatry, 65-74                Non-Fed;MD's By Age/Specialty        */
     @10481    f1210108    04.  /*Psychiatry, 75 +                 Non-Fed;MD's By Age/Specialty        */
     @10485    f1210107    04.  /*Psychiatry, 75 +                 Non-Fed;MD's By Age/Specialty        */
     @10489    f1210105    04.  /*Psychiatry, 75 +                 Non-Fed;MD's By Age/Specialty        */
     @10493    f0509608    04.  /*Pathology, Anat/Clinic, < 35     Non-Fed;MD's By Age/Specialty        */
     @10497    f0509607    04.  /*Pathology, Anat/Clinic, < 35     Non-Fed;MD's By Age/Specialty        */
     @10501    f0509605    04.  /*Pathology, Anat/Clinic, < 35     Non-Fed;MD's By Age/Specialty        */
     @10505    f0509708    04.  /*Pathology, Anat/Clinic, 35-44    Non-Fed;MD's By Age/Specialty        */
     @10509    f0509707    04.  /*Pathology, Anat/Clinic, 35-44    Non-Fed;MD's By Age/Specialty        */
     @10513    f0509705    04.  /*Pathology, Anat/Clinic, 35-44    Non-Fed;MD's By Age/Specialty        */
     @10517    f0509808    04.  /*Pathology, Anat/Clinic, 45-54    Non-Fed;MD's By Age/Specialty        */
     @10521    f0509807    04.  /*Pathology, Anat/Clinic, 45-54    Non-Fed;MD's By Age/Specialty        */
     @10525    f0509805    04.  /*Pathology, Anat/Clinic, 45-54    Non-Fed;MD's By Age/Specialty        */
     @10529    f0509908    04.  /*Pathology, Anat/Clinic, 55-64    Non-Fed;MD's By Age/Specialty        */
     @10533    f0509907    04.  /*Pathology, Anat/Clinic, 55-64    Non-Fed;MD's By Age/Specialty        */
     @10537    f0509905    04.  /*Pathology, Anat/Clinic, 55-64    Non-Fed;MD's By Age/Specialty        */
     @10541    f1210208    04.  /*Pathology, Anat/Clinic, 65-74    Non-Fed;MD's By Age/Specialty        */
     @10545    f1210207    04.  /*Pathology, Anat/Clinic, 65-74    Non-Fed;MD's By Age/Specialty        */
     @10549    f1210205    04.  /*Pathology, Anat/Clinic, 65-74    Non-Fed;MD's By Age/Specialty        */
     @10553    f1210308    04.  /*Pathology, Anat/Clinic, 75 +     Non-Fed;MD's By Age/Specialty        */
     @10557    f1210307    04.  /*Pathology, Anat/Clinic, 75 +     Non-Fed;MD's By Age/Specialty        */
     @10561    f1210305    04.  /*Pathology, Anat/Clinic, 75 +     Non-Fed;MD's By Age/Specialty        */
     @10565    f0510208    04.  /*Physical Med & Rehab, < 35       Non-Fed;MD's By Age/Specialty        */
     @10569    f0510207    04.  /*Physical Med & Rehab, < 35       Non-Fed;MD's By Age/Specialty        */
     @10573    f0510205    04.  /*Physical Med & Rehab, < 35       Non-Fed;MD's By Age/Specialty        */
     @10577    f0510308    04.  /*Physical Med & Rehab, 35-44      Non-Fed;MD's By Age/Specialty        */
     @10581    f0510307    04.  /*Physical Med & Rehab, 35-44      Non-Fed;MD's By Age/Specialty        */
     @10585    f0510305    04.  /*Physical Med & Rehab, 35-44      Non-Fed;MD's By Age/Specialty        */
     @10589    f0510408    04.  /*Physical Med & Rehab, 45-54      Non-Fed;MD's By Age/Specialty        */
     @10593    f0510407    04.  /*Physical Med & Rehab, 45-54      Non-Fed;MD's By Age/Specialty        */
     @10597    f0510405    04.  /*Physical Med & Rehab, 45-54      Non-Fed;MD's By Age/Specialty        */
     @10601    f0510508    04.  /*Physical Med & Rehab, 55-64      Non-Fed;MD's By Age/Specialty        */
     @10605    f0510507    04.  /*Physical Med & Rehab, 55-64      Non-Fed;MD's By Age/Specialty        */
     @10609    f0510505    04.  /*Physical Med & Rehab, 55-64      Non-Fed;MD's By Age/Specialty        */
     @10613    f1210408    04.  /*Physical Med & Rehab, 65-74      Non-Fed;MD's By Age/Specialty        */
     @10617    f1210407    04.  /*Physical Med & Rehab, 65-74      Non-Fed;MD's By Age/Specialty        */
     @10621    f1210405    04.  /*Physical Med & Rehab, 65-74      Non-Fed;MD's By Age/Specialty        */
     @10625    f1210508    04.  /*Physical Med & Rehab, 75 +       Non-Fed;MD's By Age/Specialty        */
     @10629    f1210507    04.  /*Physical Med & Rehab, 75 +       Non-Fed;MD's By Age/Specialty        */
     @10633    f1210505    04.  /*Physical Med & Rehab, 75 +       Non-Fed;MD's By Age/Specialty        */
     @10637    f0510808    04.  /*General Preventive Med, < 35     Non-Fed;MD's By Age/Specialty        */
     @10641    f0510807    04.  /*General Preventive Med, < 35     Non-Fed;MD's By Age/Specialty        */
     @10645    f0510805    04.  /*General Preventive Med, < 35     Non-Fed;MD's By Age/Specialty        */
     @10649    f0510908    04.  /*General Preventive Med, 35-44    Non-Fed;MD's By Age/Specialty        */
     @10653    f0510907    04.  /*General Preventive Med, 35-44    Non-Fed;MD's By Age/Specialty        */
     @10657    f0510905    04.  /*General Preventive Med, 35-44    Non-Fed;MD's By Age/Specialty        */
     @10661    f0511008    04.  /*General Preventive Med, 45-54    Non-Fed;MD's By Age/Specialty        */
     @10665    f0511007    04.  /*General Preventive Med, 45-54    Non-Fed;MD's By Age/Specialty        */
     @10669    f0511005    04.  /*General Preventive Med, 45-54    Non-Fed;MD's By Age/Specialty        */
     @10673    f0511108    04.  /*General Preventive Med, 55-64    Non-Fed;MD's By Age/Specialty        */
     @10677    f0511107    04.  /*General Preventive Med, 55-64    Non-Fed;MD's By Age/Specialty        */
     @10681    f0511105    04.  /*General Preventive Med, 55-64    Non-Fed;MD's By Age/Specialty        */
     @10685    f1210608    04.  /*General Preventive Med, 65-74    Non-Fed;MD's By Age/Specialty        */
     @10689    f1210607    04.  /*General Preventive Med, 65-74    Non-Fed;MD's By Age/Specialty        */
     @10693    f1210605    04.  /*General Preventive Med, 65-74    Non-Fed;MD's By Age/Specialty        */
     @10697    f1210708    04.  /*General Preventive Med, 75 +     Non-Fed;MD's By Age/Specialty        */
     @10701    f1210707    04.  /*General Preventive Med, 75 +     Non-Fed;MD's By Age/Specialty        */
     @10705    f1210705    04.  /*General Preventive Med, 75 +     Non-Fed;MD's By Age/Specialty        */
     @10709    f0511408    04.  /*Public Health, < 35              Non-Fed;MD's By Age/Specialty        */
     @10713    f0511407    04.  /*Public Health, < 35              Non-Fed;MD's By Age/Specialty        */
     @10717    f0511405    04.  /*Public Health, < 35              Non-Fed;MD's By Age/Specialty        */
     @10721    f0511508    04.  /*Public Health, 35-44             Non-Fed;MD's By Age/Specialty        */
     @10725    f0511507    04.  /*Public Health, 35-44             Non-Fed;MD's By Age/Specialty        */
     @10729    f0511505    04.  /*Public Health, 35-44             Non-Fed;MD's By Age/Specialty        */
     @10733    f0511608    04.  /*Public Health, 45-54             Non-Fed;MD's By Age/Specialty        */
     @10737    f0511607    04.  /*Public Health, 45-54             Non-Fed;MD's By Age/Specialty        */
     @10741    f0511605    04.  /*Public Health, 45-54             Non-Fed;MD's By Age/Specialty        */
     @10745    f0511708    04.  /*Public Health, 55-64             Non-Fed;MD's By Age/Specialty        */
     @10749    f0511707    04.  /*Public Health, 55-64             Non-Fed;MD's By Age/Specialty        */
     @10753    f0511705    04.  /*Public Health, 55-64             Non-Fed;MD's By Age/Specialty        */
     @10757    f1210808    04.  /*Public Health, 65-74             Non-Fed;MD's By Age/Specialty        */
     @10761    f1210807    04.  /*Public Health, 65-74             Non-Fed;MD's By Age/Specialty        */
     @10765    f1210805    04.  /*Public Health, 65-74             Non-Fed;MD's By Age/Specialty        */
     @10769    f1210908    04.  /*Public Health, 75 +              Non-Fed;MD's By Age/Specialty        */
     @10773    f1210907    04.  /*Public Health, 75 +              Non-Fed;MD's By Age/Specialty        */
     @10777    f1210905    04.  /*Public Health, 75 +              Non-Fed;MD's By Age/Specialty        */
     @10781    f1077308    04.  /*Radiology, < 35                  Non-Fed;MD's By Age/Specialty        */
     @10785    f1077307    04.  /*Radiology, < 35                  Non-Fed;MD's By Age/Specialty        */
     @10789    f1077305    04.  /*Radiology, < 35                  Non-Fed;MD's By Age/Specialty        */
     @10793    f1077408    04.  /*Radiology, 35-44                 Non-Fed;MD's By Age/Specialty        */
     @10797    f1077407    04.  /*Radiology, 35-44                 Non-Fed;MD's By Age/Specialty        */
     @10801    f1077405    04.  /*Radiology, 35-44                 Non-Fed;MD's By Age/Specialty        */
     @10805    f1077508    04.  /*Radiology, 45-54                 Non-Fed;MD's By Age/Specialty        */
     @10809    f1077507    04.  /*Radiology, 45-54                 Non-Fed;MD's By Age/Specialty        */
     @10813    f1077505    04.  /*Radiology, 45-54                 Non-Fed;MD's By Age/Specialty        */
     @10817    f1077608    04.  /*Radiology, 55-64                 Non-Fed;MD's By Age/Specialty        */
     @10821    f1077607    04.  /*Radiology, 55-64                 Non-Fed;MD's By Age/Specialty        */
     @10825    f1077605    04.  /*Radiology, 55-64                 Non-Fed;MD's By Age/Specialty        */
     @10829    f1211008    04.  /*Radiology, 65-74                 Non-Fed;MD's By Age/Specialty        */
     @10833    f1211007    04.  /*Radiology, 65-74                 Non-Fed;MD's By Age/Specialty        */
     @10837    f1211005    04.  /*Radiology, 65-74                 Non-Fed;MD's By Age/Specialty        */
     @10841    f1211108    04.  /*Radiology, 75 +                  Non-Fed;MD's By Age/Specialty        */
     @10845    f1211107    04.  /*Radiology, 75 +                  Non-Fed;MD's By Age/Specialty        */
     @10849    f1211105    04.  /*Radiology, 75 +                  Non-Fed;MD's By Age/Specialty        */
     @10853    f0512608    04.  /*Radiation Oncology, < 35         Non-Fed;MD's By Age/Specialty        */
     @10857    f0512607    04.  /*Radiation Oncology, < 35         Non-Fed;MD's By Age/Specialty        */
     @10861    f0512605    04.  /*Radiation Oncology, < 35         Non-Fed;MD's By Age/Specialty        */
     @10865    f0512708    04.  /*Radiation Oncology, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10869    f0512707    04.  /*Radiation Oncology, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10873    f0512705    04.  /*Radiation Oncology, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10877    f0512808    04.  /*Radiation Oncology, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10881    f0512807    04.  /*Radiation Oncology, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10885    f0512805    04.  /*Radiation Oncology, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10889    f0512908    04.  /*Radiation Oncology, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10893    f0512907    04.  /*Radiation Oncology, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10897    f0512905    04.  /*Radiation Oncology, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10901    f1211208    04.  /*Radiation Oncology, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10905    f1211207    04.  /*Radiation Oncology, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10909    f1211205    04.  /*Radiation Oncology, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10913    f1211308    04.  /*Radiation Oncology, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10917    f1211307    04.  /*Radiation Oncology, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10921    f1211305    04.  /*Radiation Oncology, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10925    f1365908    04.  /*Transplantation Surgery, < 35    Non-Fed;MD's By Age/Specialty        */
     @10929    f1365907    04.  /*Transplantation Surgery, < 35    Non-Fed;MD's By Age/Specialty        */
     @10933    f1365905    04.  /*Transplantation Surgery, < 35    Non-Fed;MD's By Age/Specialty        */
     @10937    f1366008    04.  /*Transplantation Surgery, 35-44   Non-Fed;MD's By Age/Specialty        */
     @10941    f1366007    04.  /*Transplantation Surgery, 35-44   Non-Fed;MD's By Age/Specialty        */
     @10945    f1366005    04.  /*Transplantation Surgery, 35-44   Non-Fed;MD's By Age/Specialty        */
     @10949    f1366108    04.  /*Transplantation Surgery, 45-54   Non-Fed;MD's By Age/Specialty        */
     @10953    f1366107    04.  /*Transplantation Surgery, 45-54   Non-Fed;MD's By Age/Specialty        */
     @10957    f1366105    04.  /*Transplantation Surgery, 45-54   Non-Fed;MD's By Age/Specialty        */
     @10961    f1366208    04.  /*Transplantation Surgery, 55-64   Non-Fed;MD's By Age/Specialty        */
     @10965    f1366207    04.  /*Transplantation Surgery, 55-64   Non-Fed;MD's By Age/Specialty        */
     @10969    f1366205    04.  /*Transplantation Surgery, 55-64   Non-Fed;MD's By Age/Specialty        */
     @10973    f1366308    04.  /*Transplantation Surgery, 65-74   Non-Fed;MD's By Age/Specialty        */
     @10977    f1366307    04.  /*Transplantation Surgery, 65-74   Non-Fed;MD's By Age/Specialty        */
     @10981    f1366305    04.  /*Transplantation Surgery, 65-74   Non-Fed;MD's By Age/Specialty        */
     @10985    f1366408    04.  /*Transplantation Surgery, 75 +    Non-Fed;MD's By Age/Specialty        */
     @10989    f1366407    04.  /*Transplantation Surgery, 75 +    Non-Fed;MD's By Age/Specialty        */
     @10993    f1366405    04.  /*Transplantation Surgery, 75 +    Non-Fed;MD's By Age/Specialty        */
     @10997    f1364408    04.  /*Vascular Medicine, < 35          Non-Fed;MD's By Age/Specialty        */
     @11001    f1364407    04.  /*Vascular Medicine, < 35          Non-Fed;MD's By Age/Specialty        */
     @11005    f1364405    04.  /*Vascular Medicine, < 35          Non-Fed;MD's By Age/Specialty        */
     @11009    f1364508    04.  /*Vascular Medicine, 35-44         Non-Fed;MD's By Age/Specialty        */
     @11013    f1364507    04.  /*Vascular Medicine, 35-44         Non-Fed;MD's By Age/Specialty        */
     @11017    f1364505    04.  /*Vascular Medicine, 35-44         Non-Fed;MD's By Age/Specialty        */
     @11021    f1364608    04.  /*Vascular Medicine, 45-54         Non-Fed;MD's By Age/Specialty        */
     @11025    f1364607    04.  /*Vascular Medicine, 45-54         Non-Fed;MD's By Age/Specialty        */
     @11029    f1364605    04.  /*Vascular Medicine, 45-54         Non-Fed;MD's By Age/Specialty        */
     @11033    f1364708    04.  /*Vascular Medicine, 55-64         Non-Fed;MD's By Age/Specialty        */
     @11037    f1364707    04.  /*Vascular Medicine, 55-64         Non-Fed;MD's By Age/Specialty        */
     @11041    f1364705    04.  /*Vascular Medicine, 55-64         Non-Fed;MD's By Age/Specialty        */
     @11045    f1364808    04.  /*Vascular Medicine, 65-74         Non-Fed;MD's By Age/Specialty        */
     @11049    f1364807    04.  /*Vascular Medicine, 65-74         Non-Fed;MD's By Age/Specialty        */
     @11053    f1364805    04.  /*Vascular Medicine, 65-74         Non-Fed;MD's By Age/Specialty        */
     @11057    f1364908    04.  /*Vascular Medicine, 75 +          Non-Fed;MD's By Age/Specialty        */
     @11061    f1364907    04.  /*Vascular Medicine, 75 +          Non-Fed;MD's By Age/Specialty        */
     @11065    f1364905    04.  /*Vascular Medicine, 75 +          Non-Fed;MD's By Age/Specialty        */
     @11069    f1077708    04.  /*Other Specialty, < 35            Non-Fed;Specs Other Than Above       */
     @11073    f1077707    04.  /*Other Specialty, < 35            Non-Fed;Specs Other Than Above       */
     @11077    f1077705    04.  /*Other Specialty, < 35            Non-Fed;Specs Other Than Above       */
     @11081    f1077808    04.  /*Other Specialty, 35-44           Non-Fed;Specs Other Than Above       */
     @11085    f1077807    04.  /*Other Specialty, 35-44           Non-Fed;Specs Other Than Above       */
     @11089    f1077805    04.  /*Other Specialty, 35-44           Non-Fed;Specs Other Than Above       */
     @11093    f1077908    04.  /*Other Specialty, 45-54           Non-Fed;Specs Other Than Above       */
     @11097    f1077907    04.  /*Other Specialty, 45-54           Non-Fed;Specs Other Than Above       */
     @11101    f1077905    04.  /*Other Specialty, 45-54           Non-Fed;Specs Other Than Above       */
     @11105    f1078008    04.  /*Other Specialty, 55-64           Non-Fed;Specs Other Than Above       */
     @11109    f1078007    04.  /*Other Specialty, 55-64           Non-Fed;Specs Other Than Above       */
     @11113    f1078005    04.  /*Other Specialty, 55-64           Non-Fed;Specs Other Than Above       */
     @11117    f1211408    04.  /*Other Specialty, 65-74           Non-Fed;Specs Other Than Above       */
     @11121    f1211407    04.  /*Other Specialty, 65-74           Non-Fed;Specs Other Than Above       */
     @11125    f1211405    04.  /*Other Specialty, 65-74           Non-Fed;Specs Other Than Above       */
     @11129    f1211508    04.  /*Other Specialty, 75 +            Non-Fed;Specs Other Than Above       */
     @11133    f1211507    04.  /*Other Specialty, 75 +            Non-Fed;Specs Other Than Above       */
     @11137    f1211505    04.  /*Other Specialty, 75 +            Non-Fed;Specs Other Than Above       */
     @11141    f0513808    04.  /*Unspecified, < 35                Non-Fed;MD's By Age/Specialty        */
     @11145    f0513807    04.  /*Unspecified, < 35                Non-Fed;MD's By Age/Specialty        */
     @11149    f0513805    04.  /*Unspecified, < 35                Non-Fed;MD's By Age/Specialty        */
     @11153    f0513908    04.  /*Unspecified, 35-44               Non-Fed;MD's By Age/Specialty        */
     @11157    f0513907    04.  /*Unspecified, 35-44               Non-Fed;MD's By Age/Specialty        */
     @11161    f0513905    04.  /*Unspecified, 35-44               Non-Fed;MD's By Age/Specialty        */
     @11165    f0514008    04.  /*Unspecified, 45-54               Non-Fed;MD's By Age/Specialty        */
     @11169    f0514007    04.  /*Unspecified, 45-54               Non-Fed;MD's By Age/Specialty        */
     @11173    f0514005    04.  /*Unspecified, 45-54               Non-Fed;MD's By Age/Specialty        */
     @11177    f0514108    04.  /*Unspecified, 55-64               Non-Fed;MD's By Age/Specialty        */
     @11181    f0514107    04.  /*Unspecified, 55-64               Non-Fed;MD's By Age/Specialty        */
     @11185    f0514105    04.  /*Unspecified, 55-64               Non-Fed;MD's By Age/Specialty        */
     @11189    f1211608    04.  /*Unspecified, 65-74               Non-Fed;MD's By Age/Specialty        */
     @11193    f1211607    04.  /*Unspecified, 65-74               Non-Fed;MD's By Age/Specialty        */
     @11197    f1211605    04.  /*Unspecified, 65-74               Non-Fed;MD's By Age/Specialty        */
     @11201    f1211708    04.  /*Unspecified, 75 +                Non-Fed;MD's By Age/Specialty        */
     @11205    f1211707    04.  /*Unspecified, 75 +                Non-Fed;MD's By Age/Specialty        */
     @11209    f1211705    04.  /*Unspecified, 75 +                Non-Fed;MD's By Age/Specialty        */
     @11213    f0514408    04.  /*MD's, Inactive, < 35             Non-Fed;MD's By Age/Specialty        */
     @11217    f0514407    04.  /*MD's, Inactive, < 35             Non-Fed;MD's By Age/Specialty        */
     @11221    f0514405    04.  /*MD's, Inactive, < 35             Non-Fed;MD's By Age/Specialty        */
     @11225    f0514508    04.  /*MD's, Inactive, 35-44            Non-Fed;MD's By Age/Specialty        */
     @11229    f0514507    04.  /*MD's, Inactive, 35-44            Non-Fed;MD's By Age/Specialty        */
     @11233    f0514505    04.  /*MD's, Inactive, 35-44            Non-Fed;MD's By Age/Specialty        */
     @11237    f0514608    04.  /*MD's, Inactive, 45-54            Non-Fed;MD's By Age/Specialty        */
     @11241    f0514607    04.  /*MD's, Inactive, 45-54            Non-Fed;MD's By Age/Specialty        */
     @11245    f0514605    04.  /*MD's, Inactive, 45-54            Non-Fed;MD's By Age/Specialty        */
     @11249    f0514708    04.  /*MD's, Inactive, 55-64            Non-Fed;MD's By Age/Specialty        */
     @11253    f0514707    04.  /*MD's, Inactive, 55-64            Non-Fed;MD's By Age/Specialty        */
     @11257    f0514705    04.  /*MD's, Inactive, 55-64            Non-Fed;MD's By Age/Specialty        */
     @11261    f1211808    04.  /*MD's, Inactive, 65-74            Non-Fed;MD's By Age/Specialty        */
     @11265    f1211807    04.  /*MD's, Inactive, 65-74            Non-Fed;MD's By Age/Specialty        */
     @11269    f1211805    04.  /*MD's, Inactive, 65-74            Non-Fed;MD's By Age/Specialty        */
     @11273    f1211908    04.  /*MD's, Inactive, 75 +             Non-Fed;MD's By Age/Specialty        */
     @11277    f1211907    04.  /*MD's, Inactive, 75 +             Non-Fed;MD's By Age/Specialty        */
     @11281    f1211905    04.  /*MD's, Inactive, 75 +             Non-Fed;MD's By Age/Specialty        */
     @11285    f0515008    04.  /*MD's, Not Classified, < 35       Non-Fed;MD's By Age/Specialty        */
     @11289    f0515007    04.  /*MD's, Not Classified, < 35       Non-Fed;MD's By Age/Specialty        */
     @11293    f0515005    04.  /*MD's, Not Classified, < 35       Non-Fed;MD's By Age/Specialty        */
     @11297    f0515107    04.  /*MD's, Not Classified, 35-44      Non-Fed;MD's By Age/Specialty        */
     @11301    f0515105    04.  /*MD's, Not Classified, 35-44      Non-Fed;MD's By Age/Specialty        */
     @11305    f0515208    04.  /*MD's, Not Classified, 45-54      Non-Fed;MD's By Age/Specialty        */
     @11309    f0515207    04.  /*MD's, Not Classified, 45-54      Non-Fed;MD's By Age/Specialty        */
     @11313    f0515205    04.  /*MD's, Not Classified, 45-54      Non-Fed;MD's By Age/Specialty        */
     @11317    f0515308    04.  /*MD's, Not Classified, 55-64      Non-Fed;MD's By Age/Specialty        */
     @11321    f0515307    04.  /*MD's, Not Classified, 55-64      Non-Fed;MD's By Age/Specialty        */
     @11325    f0515305    04.  /*MD's, Not Classified, 55-64      Non-Fed;MD's By Age/Specialty        */
     @11329    f1212008    04.  /*MD's, Not Classified, 65-74      Non-Fed;MD's By Age/Specialty        */
     @11333    f1212007    04.  /*MD's, Not Classified, 65-74      Non-Fed;MD's By Age/Specialty        */
     @11337    f1212005    04.  /*MD's, Not Classified, 65-74      Non-Fed;MD's By Age/Specialty        */
     @11341    f1212108    04.  /*MD's, Not Classified, 75 +       Non-Fed;MD's By Age/Specialty        */
     @11345    f1212107    04.  /*MD's, Not Classified, 75 +       Non-Fed;MD's By Age/Specialty        */
     @11349    f1212105    04.  /*MD's, Not Classified, 75 +       Non-Fed;MD's By Age/Specialty        */
     @11353    f0861200    07.  /*Physicians and Surgeons          Table 1, Code 306                    */
     @11360    f0861290    06.  /*Physicians, M.D.'s & D.O.'s                                           */
     @11366    f0861280    06.  /*Physicians, M.D.'s & D.O.'s                                           */
     @11372    f1387908    04.  /*Total D.O.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @11376    f1387906    05.  /*Total D.O.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @11381    f1387905    05.  /*Total D.O.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @11386    f1388008    04.  /*Total D.O.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @11390    f1388006    05.  /*Total D.O.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @11395    f1388005    05.  /*Total D.O.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @11400    f1388108    03.  /*Total D.O.'s, Total Federal      Fed;Incl Inact/Not Class             */
     @11403    f1388106    05.  /*Total D.O.'s, Total Federal      Fed;Incl Inact/Not Class             */
     @11408    f1388105    05.  /*Total D.O.'s, Total Federal      Fed;Incl Inact/Not Class             */
     @11413    f1388208    04.  /*Tot Active D.O.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @11417    f1388206    05.  /*Tot Active D.O.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @11422    f1388205    05.  /*Tot Active D.O.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @11427    f1388308    04.  /*Total Active D.O.s Non-Federal   Non-Fed; Excl Inact                  */
     @11431    f1388306    05.  /*Total Active D.O.s Non-Federal   Non-Fed; Excl Inact                  */
     @11436    f1388305    05.  /*Total Active D.O.s Non-Federal   Non-Fed; Excl Inact                  */
     @11441    f1388408    03.  /*Total Active D.O.s Federal       Fed; Excl Inact                      */
     @11444    f1388406    05.  /*Total Active D.O.s Federal       Fed; Excl Inact                      */
     @11449    f1388405    05.  /*Total Active D.O.s Federal       Fed; Excl Inact                      */
     @11454    f1359907    04.  /*D.O. Total Active Non-Fed & Fed                                       */
     @11458    f1359904    04.  /*D.O. Total Active Non-Fed & Fed                                       */
     @11462    f1359903    04.  /*D.O. Total Active Non-Fed & Fed                                       */
     @11466    f1359901    04.  /*D.O. Total Active Non-Fed & Fed                                       */
     @11470    f1359607    04.  /*D.O. Total Non-Federal           Incl Inactive/Retired                */
     @11474    f1359604    04.  /*D.O. Total Non-Federal           Incl Inactive/Retired                */
     @11478    f1359603    04.  /*D.O. Total Non-Federal           Incl Inactive/Retired                */
     @11482    f1359601    04.  /*D.O. Total Non-Federal           Incl Inactive/Retired                */
     @11486    f1325707    04.  /*D.O. Total Active Non-Federal                                         */
     @11490    f1325704    04.  /*D.O. Total Active Non-Federal                                         */
     @11494    f1325703    04.  /*D.O. Total Active Non-Federal                                         */
     @11498    f1325701    04.  /*D.O. Total Active Non-Federal                                         */
     @11502    f1325798    04.  /*D.O. Total Active Non-Federal                                         */
     @11506    f1398507    04.  /*D.O. Total Patient Care          Non-Fed by Major Prof Activity       */
     @11510    f1398504    03.  /*D.O. Patient Care                Non-Fed by Major Prof Activity       */
     @11513    f1398503    03.  /*D.O. Patient Care                Non-Fed by Major Prof Activity       */
     @11516    f1325801    03.  /*D.O. Patient Care                Non-Fed by Practice Type             */
     @11519    f1325898    03.  /*D.O. Patient Care                Non-Fed by Practice Type             */
     @11522    f1412307    03.  /*D.O. Office Based, Patient Care  Non-Fed by Major Prof Activity       */
     @11525    f1412407    03.  /*D.O. Hospital Staff, Patn Care   Non-Fed by Major Prof Activity       */
     @11528    f1412507    03.  /*D.O. Postdoc Train, Patn Care    Non-Fed by Major Prof Activity       */
     @11531    f1325901    03.  /*D.O. Internship/Residency        Non-Fed by Practice Type             */
     @11534    f1325998    03.  /*D.O. Internship/Residency        Non-Fed by Practice Type             */
     @11537    f1398607    03.  /*D.O. Administration              Non-Fed by Major Prof Activity       */
     @11540    f1398604    03.  /*D.O. Administration              Non-Fed by Major Prof Activity       */
     @11543    f1398603    03.  /*D.O. Administration              Non-Fed by Major Prof Activity       */
     @11546    f1326001    03.  /*D.O. Administration              Non-Fed by Practice Type             */
     @11549    f1326098    03.  /*D.O. Administration              Non-Fed by Practice Type             */
     @11552    f1398707    03.  /*D.O. Teaching                    Non-Fed by Major Prof Activity       */
     @11555    f1398704    03.  /*D.O. Teaching                    Non-Fed by Major Prof Activity       */
     @11558    f1398703    03.  /*D.O. Teaching                    Non-Fed by Major Prof Activity       */
     @11561    f1326101    03.  /*D.O. Teaching                    Non-Fed by Practice Type             */
     @11564    f1326198    03.  /*D.O. Teaching                    Non-Fed by Practice Type             */
     @11567    f1398807    03.  /*D.O. Research                    Non-Fed by Major Prof Activity       */
     @11570    f1398804    03.  /*D.O. Research                    Non-Fed by Major Prof Activity       */
     @11573    f1398803    03.  /*D.O. Research                    Non-Fed by Major Prof Activity       */
     @11576    f1326201    03.  /*D.O. Research                    Non-Fed by Practice Type             */
     @11579    f1326298    03.  /*D.O. Research                    Non-Fed by Practice Type             */
     @11582    f1398907    03.  /*D.O. Other Major Prof Activity   Non-Fed by Major Prof Activity       */
     @11585    f1398904    03.  /*D.O. Other Major Prof Activity   Non-Fed by Major Prof Activity       */
     @11588    f1398903    03.  /*D.O. Other Major Prof Activity   Non-Fed by Major Prof Activity       */
     @11591    f1326301    03.  /*D.O. Other Practice Type         Non-Fed by Practice Type             */
     @11594    f1326398    03.  /*D.O. Other Practice Type         Non-Fed by Practice Type             */
     @11597    f1399007    03.  /*D.O. Inactive/Retired            Non-Fed by Major Prof Activity       */
     @11600    f1399004    03.  /*D.O. Inactive/Retired            Non-Fed by Major Prof Activity       */
     @11603    f1399003    03.  /*D.O. Inactive/Retired            Non-Fed by Major Prof Activity       */
     @11606    f1359701    03.  /*D.O. Inactive/Retired            Non-Fed by Practice Type             */
     @11609    f1412607    02.  /*D.O. Major Prof Activity Unknwn  Non-Fed by Major Prof Activity       */
     @11611    f1326407    04.  /*D.O. Total Male                  Non-Fed by Gender                    */
     @11615    f1326404    03.  /*D.O. Total Male                  Non-Fed by Gender                    */
     @11618    f1326403    03.  /*D.O. Total Male                  Non-Fed by Gender                    */
     @11621    f1326401    03.  /*D.O. Total Male                  Non-Fed by Gender                    */
     @11624    f1326498    03.  /*D.O. Total Male                  Non-Fed by Gender                    */
     @11627    f1326507    03.  /*D.O. Total Female                Non-Fed by Gender                    */
     @11630    f1326504    03.  /*D.O. Total Female                Non-Fed by Gender                    */
     @11633    f1326503    03.  /*D.O. Total Female                Non-Fed by Gender                    */
     @11636    f1326501    03.  /*D.O. Total Female                Non-Fed by Gender                    */
     @11639    f1326598    03.  /*D.O. Total Female                Non-Fed by Gender                    */
     @11642    f1359803    03.  /*D.O. Gender Unknown              Non-Fed by Gender                    */
     @11645    f1359801    03.  /*D.O. Gender Unknown              Non-Fed by Gender                    */
     @11648    f1326607    03.  /*D.O. Board Certified             Non-Fed by Osteo Board Cert          */
     @11651    f1326604    03.  /*D.O. Board Certified             Non-Fed by Osteo Board Cert          */
     @11654    f1326603    03.  /*D.O. Board Certified             Non-Fed by Osteo Board Cert          */
     @11657    f1326601    03.  /*D.O. Board Certified             Non-Fed by Osteo Board Cert          */
     @11660    f1326698    03.  /*D.O. Board Certified             Non-Fed by Osteo Board Cert          */
     @11663    f1326707    03.  /*D.O. Not Board Certified         Non-Fed by Osteo Board Cert          */
     @11666    f1326704    03.  /*D.O. Not Board Certified         Non-Fed by Osteo Board Cert          */
     @11669    f1326703    03.  /*D.O. Not Board Certified         Non-Fed by Osteo Board Cert          */
     @11672    f1326701    03.  /*D.O. Not Board Certified         Non-Fed by Osteo Board Cert          */
     @11675    f1326798    03.  /*D.O. Not Board Certified         Non-Fed by Osteo Board Cert          */
     @11678    f1326807    03.  /*D.O. < 35                        Non-Fed by Age                       */
     @11681    f1326804    03.  /*D.O. < 35                        Non-Fed by Age                       */
     @11684    f1326803    03.  /*D.O. < 35                        Non-Fed by Age                       */
     @11687    f1326801    03.  /*D.O. < 35                        Non-Fed by Age                       */
     @11690    f1326898    03.  /*D.O. < 35                        Non-Fed by Age                       */
     @11693    f1326907    03.  /*D.O. 35-44                       Non-Fed by Age                       */
     @11696    f1326904    03.  /*D.O. 35-44                       Non-Fed by Age                       */
     @11699    f1326903    03.  /*D.O. 35-44                       Non-Fed by Age                       */
     @11702    f1326901    03.  /*D.O. 35-44                       Non-Fed by Age                       */
     @11705    f1326998    03.  /*D.O. 35-44                       Non-Fed by Age                       */
     @11708    f1327007    03.  /*D.O. 45-54                       Non-Fed by Age                       */
     @11711    f1327004    03.  /*D.O. 45-54                       Non-Fed by Age                       */
     @11714    f1327003    03.  /*D.O. 45-54                       Non-Fed by Age                       */
     @11717    f1327001    03.  /*D.O. 45-54                       Non-Fed by Age                       */
     @11720    f1327098    03.  /*D.O. 45-54                       Non-Fed by Age                       */
     @11723    f1327107    03.  /*D.O. 55-64                       Non-Fed by Age                       */
     @11726    f1327104    03.  /*D.O. 55-64                       Non-Fed by Age                       */
     @11729    f1327103    03.  /*D.O. 55-64                       Non-Fed by Age                       */
     @11732    f1327101    03.  /*D.O. 55-64                       Non-Fed by Age                       */
     @11735    f1327198    03.  /*D.O. 55-64                       Non-Fed by Age                       */
     @11738    f1327207    03.  /*D.O. 65-74                       Non-Fed by Age                       */
     @11741    f1327204    03.  /*D.O. 65-74                       Non-Fed by Age                       */
     @11744    f1327203    03.  /*D.O. 65-74                       Non-Fed by Age                       */
     @11747    f1327201    03.  /*D.O. 65-74                       Non-Fed by Age                       */
     @11750    f1327298    03.  /*D.O. 65-74                       Non-Fed by Age                       */
     @11753    f1327307    03.  /*D.O. > 74                        Non-Fed by Age                       */
     @11756    f1327304    03.  /*D.O. > 74                        Non-Fed by Age                       */
     @11759    f1327303    03.  /*D.O. > 74                        Non-Fed by Age                       */
     @11762    f1327301    03.  /*D.O. > 74                        Non-Fed by Age                       */
     @11765    f1327398    03.  /*D.O. > 74                        Non-Fed by Age                       */
     @11768    f1327407    03.  /*D.O. Age Unknown                 Non-Fed by Age                       */
     @11771    f1327404    03.  /*D.O. Age Unknown                 Non-Fed by Age                       */
     @11774    f1327403    03.  /*D.O. Age Unknown                 Non-Fed by Age                       */
     @11777    f1327401    03.  /*D.O. Age Unknown                 Non-Fed by Age                       */
     @11780    f1327498    03.  /*D.O. Age Unknown                 Non-Fed by Age                       */
     @11783    f1399107    03.  /*D.O. General/Family Practice     Non-Fed by Specialty Category        */
     @11786    f1399104    03.  /*D.O. General/Family Practice     Non-Fed by Specialty Category        */
     @11789    f1399103    03.  /*D.O. General/Family Practice     Non-Fed by Specialty Category        */
     @11792    f1327501    03.  /*D.O. General/Family Practice     Non-Fed by Primary Care Status       */
     @11795    f1327598    03.  /*D.O. General/Family Practice     Non-Fed by Primary Care Status       */
     @11798    f1399207    03.  /*D.O. General Pediatrics          Non-Fed by Specialty Category        */
     @11801    f1399204    03.  /*D.O. General Pediatrics          Non-Fed by Specialty Category        */
     @11804    f1399203    03.  /*D.O. General Pediatrics          Non-Fed by Specialty Category        */
     @11807    f1327601    03.  /*D.O. General Pediatrics          Non-Fed by Primary Care Status       */
     @11810    f1327698    03.  /*D.O. General Pediatrics          Non-Fed by Primary Care Status       */
     @11813    f1399307    03.  /*D.O. General Internal Medicine   Non-Fed by Specialty Category        */
     @11816    f1399304    03.  /*D.O. General Internal Medicine   Non-Fed by Specialty Category        */
     @11819    f1399303    03.  /*D.O. General Internal Medicine   Non-Fed by Specialty Category        */
     @11822    f1327701    03.  /*D.O. General Internal Medicine   Non-Fed by Primary Care Status       */
     @11825    f1327798    03.  /*D.O. General Internal Medicine   Non-Fed by Primary Care Status       */
     @11828    f1399407    03.  /*D.O. Obstetrics and Gynecology   Non-Fed by Specialty Category        */
     @11831    f1399404    03.  /*D.O. Obstetrics and Gynecology   Non-Fed by Specialty Category        */
     @11834    f1399403    03.  /*D.O. Obstetrics and Gynecology   Non-Fed by Specialty Category        */
     @11837    f1327801    03.  /*D.O. Obstetrics and Gynecology   Non-Fed by Primary Care Status       */
     @11840    f1327898    03.  /*D.O. Obstetrics and Gynecology   Non-Fed by Primary Care Status       */
     @11843    f1399507    03.  /*D.O. Osteopathic Specialties     Non-Fed by Specialty Category        */
     @11846    f1399504    03.  /*D.O. Osteopathic Specialties     Non-Fed by Specialty Category        */
     @11849    f1399503    03.  /*D.O. Osteopathic Specialties     Non-Fed by Specialty Category        */
     @11852    f1327901    03.  /*D.O. Osteo Manipulative Treatmt  Non-Fed by Primary Care Status       */
     @11855    f1327998    03.  /*D.O. Osteo Manipulative Treatmt  Non-Fed by Primary Care Status       */
     @11858    f1328001    03.  /*D.O. Non Primary Care            Non-Fed by Primary Care Status       */
     @11861    f1328098    03.  /*D.O. Non Primary Care            Non-Fed by Primary Care Status       */
     @11864    f1399607    03.  /*D.O. Other Specialty             Non-Fed by Specialty Category        */
     @11867    f1399604    03.  /*D.O. Other Specialty             Non-Fed by Specialty Category        */
     @11870    f1399603    03.  /*D.O. Other Specialty             Non-Fed by Specialty Category        */
     @11873    f1399707    03.  /*D.O. Presumed in Postdoc Train   Non-Fed by Specialty Category        */
     @11876    f1399704    03.  /*D.O. Presumed in Postdoc Train   Non-Fed by Specialty Category        */
     @11879    f1399703    03.  /*D.O. Presumed in Postdoc Train   Non-Fed by Specialty Category        */
     @11882    f1399807    03.  /*D.O. Specialty Unknown           Non-Fed by Specialty Category        */
     @11885    f1399804    03.  /*D.O. Specialty Unknown           Non-Fed by Specialty Category        */
     @11888    f1399803    03.  /*D.O. Specialty Unknown           Non-Fed by Specialty Category        */
     @11891    f1328101    03.  /*D.O. Primary Cre Status Unknown  Non-Fed by Primary Care Status       */
     @11894    f1328198    03.  /*D.O. Primary Cre Status Unknown  Non-Fed by Primary Care Status       */
     @11897    f1318307    06.  /*Dentists, Total Prof Active      Non-Fed & Fed                        */
     @11903    f1318398    06.  /*Dentists, Total Prof Active      Non-Fed & Fed                        */
     @11909    f1318395    06.  /*Dentists, Total Prof Active      Non-Fed & Fed                        */
     @11915    f1317791    06.  /*Dentists, Total Prof Active      NF&Fed;Calc Field;See User Doc       */
     @11921    f1317107    06.  /*Dentists, Total Priv Practice    Non-Fed                              */
     @11927    f1317198    06.  /*Dentists, Total Priv Practice    Non-Fed                              */
     @11933    f1317195    06.  /*Dentists, Total Priv Practice    Non-Fed                              */
     @11939    f1317891    06.  /*Dentists, Total Priv Practice    NonFed;Calc Field;See User Doc       */
     @11945    f1317907    05.  /*Dentists, State or Local Govt    Non-Fed                              */
     @11950    f1317998    05.  /*Dentists, State or Local Govt    Non-Fed                              */
     @11955    f1317995    05.  /*Dentists, State or Local Govt    Non-Fed                              */
     @11960    f1328207    05.  /*Dent,Staff, Fac & Staf,Hlth Org  Non-Fed                              */
     @11965    f1328298    05.  /*Dent,Staff, Fac & Staf,Hlth Org  Non-Fed                              */
     @11970    f1318095    05.  /*Dentists, Hosp Stf or Other Org  Non-Fed                              */
     @11975    f1318107    05.  /*Dentists, Intern/Resident        Non-Fed                              */
     @11980    f1318198    05.  /*Dentists, Intern/Resident        Non-Fed                              */
     @11985    f1318195    05.  /*Dentists, Graduate Student       Non-Fed                              */
     @11990    f1318407    05.  /*Dent,Armed Forces & Oth Fed Srv  Fed                                  */
     @11995    f1318498    05.  /*Dent,Armed Forces & Oth Fed Srv  Fed                                  */
     @12000    f1318495    05.  /*Dent,Armed Forces & Oth Fed Srv  Fed                                  */
     @12005    f1328607    05.  /*Dentists, Faculty                Non-Fed                              */
     @12010    f1328698    05.  /*Dentists, Faculty                Non-Fed                              */
     @12015    f1409207    03.  /*Dentists,PT Faculty/PT Practice  Non-Fed                              */
     @12018    f1409307    02.  /*Dentists, Seeking Employment     Non-Fed; Not in Pratice              */
     @12020    f1328307    05.  /*Dentists, Other                  Non-Fed                              */
     @12025    f1328398    05.  /*Dentists, Other                  Non-Fed                              */
     @12030    f1328407    05.  /*Dentists, No Longer in Practice  Non-Fed                              */
     @12035    f1328498    05.  /*Dentists, Retired                Non-Fed                              */
     @12040    f1409407    05.  /*Dentists, Occup Type Unknown     Non-Fed                              */
     @12045    f1050607    06.  /*Dentists, Total, Priv Pract, FT  Non-Fed                              */
     @12051    f1050698    06.  /*Dentists, Total, Priv Pract, FT  Non-Fed                              */
     @12057    f1050695    06.  /*Dentists, Total, Priv Pract, FT  Non-Fed                              */
     @12063    f1050707    06.  /*Dentists, Total, Priv Pract, PT  Non-Fed                              */
     @12069    f1050798    06.  /*Dentists, Total, Priv Pract, PT  Non-Fed                              */
     @12075    f1050795    06.  /*Dentists, Total, Priv Pract, PT  Non-Fed                              */
     @12081    f1317207    06.  /*Dent, Total Male, Priv Pract     Non-Fed                              */
     @12087    f1317298    06.  /*Dent, Total Male, Priv Pract     Non-Fed                              */
     @12093    f1317295    06.  /*Dent, Total Male, Priv Pract     Non-Fed                              */
     @12099    f1317307    06.  /*Dent, Total Female, Priv Pract   Non-Fed                              */
     @12105    f1317398    06.  /*Dent, Total Female, Priv Pract   Non-Fed                              */
     @12111    f1317395    06.  /*Dent, Total Female, Priv Pract   Non-Fed                              */
     @12117    f1409507    03.  /*Dent, Gender Unknown,Priv Pract  Non-Fed                              */
     @12120    f0861300    07.  /*Dentists                         Table 1, Code 301                    */
     @12127    f0861390    06.  /*Dentists                                                              */
     @12133    f0861380    06.  /*Dentists                                                              */
     @12139    f0350687    05.  /*Dentists, Total Active           Non-Fed                              */
     @12144    f0350681    05.  /*Dentists, Total Active           Non-Fed                              */
     @12149    f1317407    06.  /*Dent, Priv Pract,Tot GPs & Ped   Non-Fed;General & Pediatrics         */
     @12155    f1317498    06.  /*Dent, Priv Pract,Tot GPs & Ped   Non-Fed;General & Pediatrics         */
     @12161    f1317495    06.  /*Dent, Priv Pract,Tot GPs & Ped   Non-Fed;General & Pediatrics         */
     @12167    f1317507    06.  /*Dent, Priv Pract,Tot Other Spec  Non-Fed;All Other Specialties        */
     @12173    f1317598    06.  /*Dent, Priv Pract,Tot Other Spec  Non-Fed;All Other Specialties        */
     @12179    f1317595    06.  /*Dent, Priv Pract,Tot Other Spec  Non-Fed;All Other Specialties        */
     @12185    f1049807    06.  /*# Active Dentists < 35           Non-Fed;Private Practice             */
     @12191    f1049898    06.  /*# Active Dentists < 35           Non-Fed;Private Practice             */
     @12197    f1049895    06.  /*# Active Dentists < 35           Non-Fed;Private Practice             */
     @12203    f1049887    05.  /*# Active Dentists < 35           Non-Fed                              */
     @12208    f1049881    05.  /*# Active Dentists < 35           Non-Fed                              */
     @12213    f1131807    06.  /*# Active Dentists 35-44          Non-Fed;Private Practice             */
     @12219    f1131898    06.  /*# Active Dentists 35-44          Non-Fed;Private Practice             */
     @12225    f1131895    06.  /*# Active Dentists 35-44          Non-Fed;Private Practice             */
     @12231    f1131887    05.  /*# Active Dentists 35-44          Non-Fed                              */
     @12236    f1049981    05.  /*# Active Dentists 35-39          Non-Fed                              */
     @12241    f1050081    05.  /*# Active Dentists 40-44          Non-Fed                              */
     @12246    f1131907    06.  /*# Active Dentists 45-54          Non-Fed;Private Practice             */
     @12252    f1131998    06.  /*# Active Dentists 45-54          Non-Fed;Private Practice             */
     @12258    f1131995    06.  /*# Active Dentists 45-54          Non-Fed;Private Practice             */
     @12264    f1131987    05.  /*# Active Dentists 45-54          Non-Fed                              */
     @12269    f1050181    05.  /*# Active Dentists 45-49          Non-Fed                              */
     @12274    f1050281    05.  /*# Active Dentists 50-54          Non-Fed                              */
     @12279    f1317607    06.  /*# Active Dentists 55-64          Non-Fed;Private Practice             */
     @12285    f1317698    06.  /*# Active Dentists 55-64          Non-Fed;Private Practice             */
     @12291    f1317695    06.  /*# Active Dentists 55-64          Non-Fed;Private Practice             */
     @12297    f1050387    05.  /*# Active Dentists 55-59          Non-Fed                              */
     @12302    f1050381    05.  /*# Active Dentists 55-59          Non-Fed                              */
     @12307    f1050487    05.  /*# Active Dentists 60-64          Non-Fed                              */
     @12312    f1050481    05.  /*# Active Dentists 60-64          Non-Fed                              */
     @12317    f1050507    06.  /*# Active Dentists 65 +           Non-Fed;Private Practice             */
     @12323    f1050598    06.  /*# Active Dentists 65 +           Non-Fed;Private Practice             */
     @12329    f1050595    06.  /*# Active Dentists 65 +           Non-Fed;Private Practice             */
     @12335    f1050587    05.  /*# Active Dentists 65 +           Non-Fed                              */
     @12340    f1050581    05.  /*# Active Dentists 65 +           Non-Fed                              */
     @12345    f1328507    05.  /*# Active Dentists Age Unknown    Non-Fed;Private Practice             */
     @12350    f1328598    05.  /*# Active Dentists Age Unknown    Non-Fed;Private Practice             */
     @12355    f0862800    07.  /*Dental Hygienists                Table 1, Code 331                    */
     @12362    f0862890    06.  /*Dental Hygienists                                                     */
     @12368    f0862880    06.  /*Dental Hygienists                                                     */
     @12374    f0863300    07.  /*Dental Assistants                Table 1, Code 364                    */
     @12381    f0863390    06.  /*Dental Assistants                                                     */
     @12387    f0863380    06.  /*Dental Assistants                                                     */
     @12393    f0864190    06.  /*Dental Lab/Med Appl. Technician                                       */
     @12399    f0864180    06.  /*Dental Lab/Med Appl. Technician                                       */
     @12405    f1322809    04.  /*Physician Assistants             Projections                          */
     @12409    f1322808    04.  /*Physician Assistants             Projections                          */
     @12413    f1322807    04.  /*Physician Assistants             Projections                          */
     @12417    f1322803    04.  /*Physician Assistants             Projections                          */
     @12421    f1322801    04.  /*Physician Assistants             Projections                          */
     @12425    f1322899    03.  /*Physician Assistants             Projections                          */
     @12428    f1322898    03.  /*Physician Assistants             Projections                          */
     @12431    f1322909    04.  /*Physician Assistants, Female     Projections                          */
     @12435    f1322908    04.  /*Physician Assistants, Female     Projections                          */
     @12439    f1322907    04.  /*Physician Assistants, Female     Projections                          */
     @12443    f1322903    04.  /*Physician Assistants, Female     Projections                          */
     @12447    f1322901    04.  /*Physician Assistants, Female     Projections                          */
     @12451    f1322999    03.  /*Physician Assistants, Female     Projections                          */
     @12454    f1322998    03.  /*Physician Assistants, Female     Projections                          */
     @12457    f1323009    04.  /*Physician Assistants, Male       Projections                          */
     @12461    f1323008    04.  /*Physician Assistants, Male       Projections                          */
     @12465    f1323007    04.  /*Physician Assistants, Male       Projections                          */
     @12469    f1323003    04.  /*Physician Assistants, Male       Projections                          */
     @12473    f1323001    04.  /*Physician Assistants, Male       Projections                          */
     @12477    f1323099    03.  /*Physician Assistants, Male       Projections                          */
     @12480    f1323098    03.  /*Physician Assistants, Male       Projections                          */
     @12483    f1366509    04.  /*Physician Assist,Gender Unknown  Projections                          */
     @12487    f1366508    04.  /*Physician Assist,Gender Unknown  Projections                          */
     @12491    f1366507    04.  /*Physician Assist,Gender Unknown  Projections                          */
     @12495    f1366503    04.  /*Physician Assist,Gender Unknown  Projections                          */
     @12499    f1366501    04.  /*Physician Assist,Gender Unknown  Projections                          */
     @12503    f1366609    04.  /*Physician Assistants, Active     Projections                          */
     @12507    f1366608    04.  /*Physician Assistants, Active     Projections                          */
     @12511    f1366607    04.  /*Physician Assistants, Active     Projections                          */
     @12515    f1366603    04.  /*Physician Assistants, Active     Projections                          */
     @12519    f1366601    04.  /*Physician Assistants, Active     Projections                          */
     @12523    f1395809    04.  /*Physician Assistants, Inactive   Projections                          */
     @12527    f1395808    04.  /*Physician Assistants, Inactive   Projections                          */
     @12531    f1395807    04.  /*Physician Assistants, Inactive   Projections                          */
     @12535    f1395803    04.  /*Physician Assistants, Inactive   Projections                          */
     @12539    f1395903    04.  /*Physician Assistants, Prim Care  Projections                          */
     @12543    f1396003    04.  /*Physician Assistants, Surg Spec  Projections                          */
     @12547    f1396103    04.  /*Physician Assistants,Other Spec  Projections                          */
     @12551    f1396203    04.  /*Physician Assistants, Unk Spec   Projections                          */
     @12555    f0862600    07.  /*Physician Assistants             Table 1, Code 311                    */
     @12562    f0862690    06.  /*Physician Assistants                                                  */
     @12568    f0862680    06.  /*Physician Assistants                                                  */
     @12574    f1423808    05.  /*Active Nurse Practitioner(APRN)  In State: See User Doc               */
     @12579    f1367501    05.  /*Nurse Practitioners                                                   */
     @12584    f1423708    05.  /*Active Nurse Anesthetists(CRNA)  See User Doc for notes               */
     @12589    f1424508    05.  /*Active Certified Nurse Midwives  In State: See User Doc               */
     @12594    f1396303    03.  /*Certified Nurse Midwives                                              */
     @12597    f1396403    03.  /*Certified Nurse Midwives, FT     Full Time (35 or more hours)         */
     @12600    f1396503    03.  /*Certified Nurse Midwives, PT     Part Time (34 or less hours)         */
     @12603    f1396603    03.  /*Cert Nurse Midwvs,Retrd/Not Emp  Retired or Not Emloyed               */
     @12606    f1396703    03.  /*Cert Nurse Midwve,Unk Emp Stat   No Response                          */
     @12609    f1396803    03.  /*Cert Nurse Midwvs,FT Hosp/Med    Hospital/Medical Center              */
     @12612    f1396903    03.  /*Cert Nurse Midwvs,FT Mid/PhysPr  Midwife or Phys Owned Practice       */
     @12615    f1397003    03.  /*Cert Nurse Midwvs,FT Educ Inst   Educational Institution              */
     @12618    f1397103    03.  /*Cert Nurse Midwvs,FT Oth EmpTyp  Other Employment Type                */
     @12621    f1397203    03.  /*Cert Nurse Midwvs,FT Unk EmpTyp  No Responded to Employmnt Type       */
     @12624    f0861900    07.  /*Registered Nurses                Table 1, Code 313                    */
     @12631    f0861990    06.  /*Registered Nurses                                                     */
     @12637    f0861980    06.  /*Registered Nurses                                                     */
     @12643    f0863100    07.  /*LPNs/LVNs                        Table 1, Code 350                    */
     @12650    f0863190    06.  /*Licensed Practical Nurses                                             */
     @12656    f0863180    06.  /*Licensed Practical Nurses                                             */
     @12662    f1366701    04.  /*Chiropractors                                                         */
     @12666    f1393800    07.  /*Chiropractors                    Table 1, Code 300                    */
     @12673    f1393900    07.  /*Dieticians and Nutritionists     Table 1, Code 303                    */
     @12680    f0862090    06.  /*Dieticians                                                            */
     @12686    f0862080    06.  /*Dieticians                                                            */
     @12692    f1423908    05.  /*Active Optometrists              In State: See User Doc               */
     @12697    f0861500    07.  /*Optometrists                     Table 1, Code 304                    */
     @12704    f0861590    06.  /*Optometrists                                                          */
     @12710    f0861580    06.  /*Optometrists                                                          */
     @12716    f1424008    05.  /*Active Pharmacists               In State: See User Doc               */
     @12721    f0861800    07.  /*Pharmacists                      Table 1, Code 305                    */
     @12728    f0861890    06.  /*Pharmacists                                                           */
     @12734    f0861880    06.  /*Pharmacists                                                           */
     @12740    f1424208    05.  /*Active Podiatrists               In State: See User Doc               */
     @12745    f0861400    07.  /*Podiatrists                      Table 1, Code 312                    */
     @12752    f0861490    06.  /*Podiatrists                                                           */
     @12758    f0861480    06.  /*Podiatrists                                                           */
     @12764    f1423608    05.  /*Active Audiologists              In State: See User Doc               */
     @12769    f1394000    07.  /*Audiologists                     Table 1, Code 314                    */
     @12776    f0862200    07.  /*Occupational Therapists          Table 1, Code 315                    */
     @12783    f0862290    06.  /*Occupational Therapists                                               */
     @12789    f0862280    06.  /*Occupational Therapists                                               */
     @12795    f1424108    05.  /*Active Physical Therapists       In State: See User Doc               */
     @12800    f0862300    07.  /*Physical Therapists              Table 1, Code 316                    */
     @12807    f0862390    06.  /*Physical Therapists                                                   */
     @12813    f0862380    06.  /*Physical Therapists                                                   */
     @12819    f1394100    07.  /*Radiation Therapists             Table 1, Code 320                    */
     @12826    f1394200    07.  /*Recreational Therapists          Table 1, Code 321                    */
     @12833    f0862100    07.  /*Respiratory Therapists           Table 1, Code 322                    */
     @12840    f0862190    06.  /*Respiratory Therapists                                                */
     @12846    f0862180    06.  /*Inhalation Therapists                                                 */
     @12852    f1424408    05.  /*Active Speech-Language Path      In State: See User Doc               */
     @12857    f0862400    07.  /*Speech-Language Pathologists     Table 1, Code 323                    */
     @12864    f0862490    06.  /*Speech Therapists                                                     */
     @12870    f0862480    06.  /*Speech Therapists                                                     */
     @12876    f1394300    07.  /*Therapists, All Other            Table 1, Code 324                    */
     @12883    f0862590    06.  /*Therapists,N.E.C.                Not Elsewhere Classified             */
     @12889    f0862580    06.  /*Therapists,N.E.C.                Not Elsewhere Classified             */
     @12895    f0861600    07.  /*Veterinarians                    Table 1, Code 325                    */
     @12902    f0861690    06.  /*Veterinarians                                                         */
     @12908    f0861680    06.  /*Veterinarians                                                         */
     @12914    f1394400    07.  /*Hlth Diag&Treat Practioners,Oth  Table 1, Code 326                    */
     @12921    f0861790    06.  /*Health Diag Practitioners,N.E.C  Not Elsewhere Classified             */
     @12927    f0861780    06.  /*Health Diag Practitioners,N.E.C  Not Elsewhere Classified             */
     @12933    f1395700    07.  /*Healthcare Practitioner Prof     Table 3, Code 03, All Counties       */
     @12940    f0862700    07.  /*Clinic Lab Technlgsts&Techncns   Table 1, Code 330                    */
     @12947    f0862790    06.  /*Clinical Laboratory Technicians                                       */
     @12953    f0862780    06.  /*Clinical Laboratory Technicians                                       */
     @12959    f1394500    07.  /*Diag Relatd Technlgsts&Techncns  Table 1, Code 332                    */
     @12966    f1394600    07.  /*Emerg Med Technicns&Paramedics   Table 1, Code 340                    */
     @12973    f1394700    07.  /*Hlth Diag&Treat Practr SuppTech  Table 1, Code 341                    */
     @12980    f0862900    07.  /*Med Records & Health Info Techs  Table 1, Code 351                    */
     @12987    f0862990    06.  /*Health Record Technicians                                             */
     @12993    f0862980    06.  /*Health Record Technicians                                             */
     @12999    f0864000    07.  /*Opticians, Dispensing            Table 1, Code 352                    */
     @13006    f0864090    06.  /*Optical Goods Workers                                                 */
     @13012    f0864080    06.  /*Optical Goods Workers                                                 */
     @13018    f1394800    07.  /*Misc Hlth Technlgsts&Techncns    Table 1, Code 353                    */
     @13025    f1394900    07.  /*Oth Hlthcare Practr & Tech Occp  Table 1, Code 354                    */
     @13032    f1395000    07.  /*Nursing,Psych,& Home Hlth Aides  Table 1, Code 360                    */
     @13039    f0863590    06.  /*Nurs Aides Orderlies/Attendents                                       */
     @13045    f0863580    06.  /*Nurs Aides Orderlies/Attendents                                       */
     @13051    f0863490    06.  /*Health Aides Except Nursing                                           */
     @13057    f0863480    06.  /*Health Aides Except Nursing                                           */
     @13063    f1395100    07.  /*Occuptn Therapist Assists/Aides  Table 1, Code 361                    */
     @13070    f1395200    07.  /*Physical Therapst Assists/Aides  Table 1, Code 362                    */
     @13077    f1395300    07.  /*Massage Therapists               Table 1, Code 363                    */
     @13084    f1395400    07.  /*Med Asst&Oth Hlthcare Supp Occp  Table 1, Code 365                    */
     @13091    f0863900    07.  /*Medical Scientists               Table 1, Code 165                    */
     @13098    f0863990    06.  /*Medical Scientists                                                    */
     @13104    f0863980    06.  /*Medical Scientists                                                    */
     @13110    f1424308    05.  /*Active Psychologists             In State: See User Doc               */
     @13115    f1249500    07.  /*Psychologists                    Table 1, Code 182                    */
     @13122    f1249590    06.  /*Psychologists                                                         */
     @13128    f1249690    06.  /*Sociologists                                                          */
     @13134    f1395500    07.  /*Misc Social Scientist,Sociolgst  Table 1, Code 186                    */
     @13141    f1249800    07.  /*Social Workers                   Table 1, Code 201                    */
     @13148    f1249890    06.  /*Social Workers                                                        */
     @13154    f1395600    07.  /*Misc Comm&Social Serv Speclsts   Table 1, Code 202                    */
     @13161    f0863090    06.  /*Radiologic Technicians                                                */
     @13167    f0863080    06.  /*Radiologic Technicians                                                */
     @13173    f0863290    06.  /*Health Tech N.E.C.               Not Elsewhere Classified             */
     @13179    f0863280    06.  /*Health Tech N.E.C.               Not Elsewhere Classified             */
     @13185    f0863690    06.  /*Managers Medicine/Health                                              */
     @13191    f0863680    06.  /*Managers Medicine/Health                                              */
     @13197    f0863790    06.  /*Medical Science Teachers                                              */
     @13203    f0863780    06.  /*Medical Science Teachers                                              */
     @13209    f0863890    06.  /*Health Specialties Teachers                                           */
     @13215    f0863880    06.  /*Health Specialties Teachers                                           */
     @13221    f1249390    06.  /*Psychology Teachers                                                   */
     @13227    f1249490    06.  /*Social Work Teachers                                                  */
     @13233    f0886807    03.  /*Total Number Hospitals                                                */
     @13236    f0886806    03.  /*Total Number Hospitals                                                */
     @13239    f0886805    03.  /*Total Number Hospitals                                                */
     @13242    f0886804    03.  /*Total Number Hospitals                                                */
     @13245    f0886803    03.  /*Total Number Hospitals                                                */
     @13248    f0886802    03.  /*Total Number Hospitals                                                */
     @13251    f0886801    03.  /*Total Number Hospitals                                                */
     @13254    f0886800    03.  /*Total Number Hospitals                                                */
     @13257    f0886895    03.  /*Total Number Hospitals                                                */
     @13260    f0886907    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13263    f0886906    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13266    f0886905    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13269    f0886904    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13272    f0886903    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13275    f0886902    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13278    f0886901    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13281    f0886900    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13284    f0886995    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13287    f0887007    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13290    f0887006    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13293    f0887005    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13296    f0887004    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13299    f0887003    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13302    f0887002    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13305    f0887001    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13308    f0887000    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13311    f0887095    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13314    f0887107    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13317    f0887106    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13320    f0887105    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13323    f0887104    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13326    f0887103    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13329    f0887102    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13332    f0887101    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13335    f0887100    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13338    f0887195    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13341    f1318507    02.  /*# Psychiatric Short Term Hosps   Short Term Hospitals                 */
     @13343    f1318607    02.  /*# Rehabilitation ST Hosps        Short Term Hospitals                 */
     @13345    f1318707    02.  /*# Children's Psych ST Hosps      Short Term Hospitals                 */
     @13347    f1411807    02.  /*# Acute Long-Term Care ST Hosps  Short Term Hospitals                 */
     @13349    f1067707    03.  /*# Gen Medical/Surgical LT Hosps  Long Term Hospitals                  */
     @13352    f1067807    03.  /*# Psychiatric LT Hosps           Long Term Hospitals                  */
     @13355    f1067907    03.  /*# Rehabilitation LT Hosps        Long Term Hospitals                  */
     @13358    f1068007    03.  /*# Chronic Disease LT Hosps       Long Term Hospitals                  */
     @13361    f1068207    03.  /*# Instn/Mentally Retrd LT Hosps  Long Term Hospitals                  */
     @13364    f1068307    03.  /*# Children's Psych LT Hosps      Long Term Hospitals                  */
     @13367    f1411907    02.  /*# Acute Long-Term Care LT Hosps  Long Term Hospitals                  */
     @13369    f0887207    03.  /*# Short Term Community Hosps     See User Doc For Definition          */
     @13372    f0887205    03.  /*# Short Term Community Hosps     See User Doc For Definition          */
     @13375    f0887200    03.  /*# Short Term Community Hosps     See User Doc For Definition          */
     @13378    f0887295    03.  /*# Short Term Community Hosps     See User Doc For Definition          */
     @13381    f0887607    03.  /*# Veterans' Hospitals            Coded Hosp Control = '45'            */
     @13384    f1403107    03.  /*# Critical Access Hospitals      Total Hospitals                      */
     @13387    f1403207    03.  /*# Critical Access ST Gen Hosps   Short Term General Hospitals         */
     @13390    f1403307    03.  /*# Rural Referral Centers         Total Hospitals                      */
     @13393    f1403407    03.  /*# Sole Community Providers       Total Hospitals                      */
     @13396    f1241707    03.  /*# Hosp Participating in Network  Total Hospitals                      */
     @13399    f0887707    03.  /*# Hosp W/JCAHO Accreditation     Short Term General Hospitals         */
     @13402    f0887807    03.  /*# Hosp W/JCAHO Accreditation     ST Non-Gen + Long Term Hosps         */
     @13405    f0887907    03.  /*# Hosp W/Residency Training      Short Term General Hospitals         */
     @13408    f0888007    03.  /*# Hosp W/Residency Training      ST Non-Gen + Long Term Hosps         */
     @13411    f0888107    03.  /*# Hosp W/Medical School Affiln   Short Term General Hospitals         */
     @13414    f0888207    03.  /*# Hosp W/Medical School Affiln   ST Non-Gen + Long Term Hosps         */
     @13417    f0888307    03.  /*# Hosp W/Medical School Affiln   Veterans Hospitals                   */
     @13420    f0888607    03.  /*# Hosp W/Prof Nursing School     Short Term General Hospitals         */
     @13423    f0888707    03.  /*# Hosp W/Prof Nursing School     Short Term Community                 */
     @13426    f0888907    03.  /*# Hosp W/Prof Nursing School     ST Non-Gen + Long Term Hosps         */
     @13429    f0889007    03.  /*# Member Council Teaching Hosp   Short Term General                   */
     @13432    f0889107    03.  /*# Member Council Teaching Hosp   Veterans Hospitals                   */
     @13435    f0889207    03.  /*# Member Council Teaching Hosp   Short Term Community                 */
     @13438    f0889407    03.  /*# Member Council Teaching Hosp   ST Non-Gen + Long Term Hosps         */
     @13441    f0889507    03.  /*# Hsp W/Amer Osteo Assoc Accred  Short Term General Hospitals         */
     @13444    f0889607    03.  /*# Hsp W/Amer Osteo Assoc Accred  ST Non-Gen + Long Term Hosps         */
     @13447    f0889707    03.  /*# Hsp W/Amer Osteo Assoc Intern  Short Term General Hospitals         */
     @13450    f0889807    03.  /*# Hsp W/Amer Osteo Assoc Intern  ST Non-Gen + Long Term Hosps         */
     @13453    f0889907    03.  /*# Hsp W/Amer Osteo Assoc Residn  Short Term General Hospitals         */
     @13456    f0890007    03.  /*# Hsp W/Amer Osteo Assoc Residn  ST Non-Gen + Long Term Hosps         */
     @13459    f0890307    03.  /*#Hsp W/Blue Crss Contrct/Partcn  Short Term General Hospitals         */
     @13462    f0890407    03.  /*#Hsp W/Blue Crss Contrct/Partcn  ST Non-Gen + Long Term Hosps         */
     @13465    f0890507    03.  /*# Hosp W/Medicare Certification  Short Term General Hospitals         */
     @13468    f0890607    03.  /*# Hosp W/Medicare Certification  ST Non-Gen + Long Term Hosps         */
     @13471    f0890907    08.  /*Hospital Admissions              Total Hospitals                      */
     @13479    f0890906    08.  /*Hospital Admissions              Total Hospitals                      */
     @13487    f0890905    08.  /*Hospital Admissions              Total Hospitals                      */
     @13495    f0890904    08.  /*Hospital Admissions              Total Hospitals                      */
     @13503    f0890903    08.  /*Hospital Admissions              Total Hospitals                      */
     @13511    f0890902    08.  /*Hospital Admissions              Total Hospitals                      */
     @13519    f0890901    08.  /*Hospital Admissions              Total Hospitals                      */
     @13527    f0890900    08.  /*Hospital Admissions              Total Hospitals                      */
     @13535    f0890995    08.  /*Hospital Admissions              Total Hospitals                      */
     @13543    f0891007    07.  /*Short Term Gen Hosp Admissions                                        */
     @13550    f0891006    07.  /*Short Term Gen Hosp Admissions                                        */
     @13557    f0891005    09.  /*Short Term Gen Hosp Admissions                                        */
     @13566    f0891004    09.  /*Short Term Gen Hosp Admissions                                        */
     @13575    f0891003    09.  /*Short Term Gen Hosp Admissions                                        */
     @13584    f0891002    09.  /*Short Term Gen Hosp Admissions                                        */
     @13593    f0891001    09.  /*Short Term Gen Hosp Admissions                                        */
     @13602    f0891000    09.  /*Short Term Gen Hosp Admissions                                        */
     @13611    f0891095    09.  /*Short Term Gen Hosp Admissions                                        */
     @13620    f0891107    07.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13627    f0891106    07.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13634    f0891105    09.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13643    f0891104    09.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13652    f0891103    09.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13661    f0891102    09.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13670    f0891101    09.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13679    f0891100    09.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13688    f0891195    09.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13697    f0891207    07.  /*Short Term Community Hosp Admis                                       */
     @13704    f0891205    09.  /*Short Term Community Hosp Admis                                       */
     @13713    f0891200    09.  /*Short Term Community Hosp Admis                                       */
     @13722    f0891295    09.  /*Short Term Community Hosp Admis                                       */
     @13731    f0892007    06.  /*Veterans' Hospital Admissions                                         */
     @13737    f1405307    06.  /*Nurs Home Admissions, Tot Hosp   Total Hospitals                      */
     @13743    f1405306    06.  /*Nurs Home Admissions, Tot Hosp   Total Hospitals                      */
     @13749    f1405305    06.  /*Nurs Home Admissions, Tot Hosp   Total Hospitals                      */
     @13755    f1405304    06.  /*Nurs Home Admissions, Tot Hosp   Total Hospitals                      */
     @13761    f1405303    06.  /*Nurs Home Admissions, Tot Hosp   Total Hospitals                      */
     @13767    f1405407    06.  /*Nurs Home Admissions,STGEN Hosp  Short Term General Hospitals         */
     @13773    f1405406    06.  /*Nurs Home Admissions,STGEN Hosp  Short Term General Hospitals         */
     @13779    f1405405    06.  /*Nurs Home Admissions,STGEN Hosp  Short Term General Hospitals         */
     @13785    f1405404    06.  /*Nurs Home Admissions,STGEN Hosp  Short Term General Hospitals         */
     @13791    f1405403    06.  /*Nurs Home Admissions,STGEN Hosp  Short Term General Hospitals         */
     @13797    f1405507    06.  /*Nurs Home Admissions, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @13803    f1405506    06.  /*Nurs Home Admissions, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @13809    f1405505    06.  /*Nurs Home Admissions, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @13815    f1405504    06.  /*Nurs Home Admissions, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @13821    f1405503    06.  /*Nurs Home Admissions, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @13827    f0892107    07.  /*Hospital Beds                    Total Hospitals                      */
     @13834    f0892106    07.  /*Hospital Beds                    Total Hospitals                      */
     @13841    f0892105    07.  /*Hospital Beds                    Total Hospitals                      */
     @13848    f0892104    07.  /*Hospital Beds                    Total Hospitals                      */
     @13855    f0892103    07.  /*Hospital Beds                    Total Hospitals                      */
     @13862    f0892102    07.  /*Hospital Beds                    Total Hospitals                      */
     @13869    f0892101    07.  /*Hospital Beds                    Total Hospitals                      */
     @13876    f0892100    07.  /*Hospital Beds                    Total Hospitals                      */
     @13883    f0892195    07.  /*Hospital Beds                    Total Hospitals                      */
     @13890    f0892207    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @13897    f0892206    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @13904    f0892205    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @13911    f0892204    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @13918    f0892203    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @13925    f0892202    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @13932    f0892201    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @13939    f0892200    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @13946    f0892295    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @13953    f0892307    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @13960    f0892306    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @13967    f0892305    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @13974    f0892304    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @13981    f0892303    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @13988    f0892302    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @13995    f0892301    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @14002    f0892300    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @14009    f0892395    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @14016    f0892407    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14023    f0892406    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14030    f0892405    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14037    f0892404    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14044    f0892403    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14051    f0892402    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14058    f0892401    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14065    f0892400    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14072    f0892495    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14079    f0892507    07.  /*Short Term Community Hosp Beds                                        */
     @14086    f0892505    07.  /*Short Term Community Hosp Beds                                        */
     @14093    f0892500    07.  /*Short Term Community Hosp Beds                                        */
     @14100    f0892595    07.  /*Short Term Community Hosp Beds                                        */
     @14107    f0892907    07.  /*Veterans' Hospital Beds                                               */
     @14114    f1404907    05.  /*Nursing Home Beds, Total Hosp    Total Hospitals                      */
     @14119    f1404906    05.  /*Nursing Home Beds, Total Hosp    Total Hospitals                      */
     @14124    f1404905    05.  /*Nursing Home Beds, Total Hosp    Total Hospitals                      */
     @14129    f1404904    05.  /*Nursing Home Beds, Total Hosp    Total Hospitals                      */
     @14134    f1404903    05.  /*Nursing Home Beds, Total Hosp    Total Hospitals                      */
     @14139    f1405007    05.  /*Nursing Home Beds, ST Gen Hosp   Short Term General Hospitals         */
     @14144    f1405006    05.  /*Nursing Home Beds, ST Gen Hosp   Short Term General Hospitals         */
     @14149    f1405005    05.  /*Nursing Home Beds, ST Gen Hosp   Short Term General Hospitals         */
     @14154    f1405004    05.  /*Nursing Home Beds, ST Gen Hosp   Short Term General Hospitals         */
     @14159    f1405003    05.  /*Nursing Home Beds, ST Gen Hosp   Short Term General Hospitals         */
     @14164    f1405107    05.  /*Nursing Home Beds, STNG Hosp     Short Tern Non-Gen Hospitals         */
     @14169    f1405106    05.  /*Nursing Home Beds, STNG Hosp     Short Tern Non-Gen Hospitals         */
     @14174    f1405105    05.  /*Nursing Home Beds, STNG Hosp     Short Tern Non-Gen Hospitals         */
     @14179    f1405104    05.  /*Nursing Home Beds, STNG Hosp     Short Tern Non-Gen Hospitals         */
     @14184    f1405103    05.  /*Nursing Home Beds, STNG Hosp     Short Tern Non-Gen Hospitals         */
     @14189    f1405207    05.  /*Nursing Home Beds,Long Term Hsp  Long Term Hospitals                  */
     @14194    f1405206    05.  /*Nursing Home Beds,Long Term Hsp  Long Term Hospitals                  */
     @14199    f1405205    05.  /*Nursing Home Beds,Long Term Hsp  Long Term Hospitals                  */
     @14204    f1405204    05.  /*Nursing Home Beds,Long Term Hsp  Long Term Hospitals                  */
     @14209    f1405203    05.  /*Nursing Home Beds,Long Term Hsp  Long Term Hospitals                  */
     @14214    f1404107    07.  /*Licensed Beds, Total Hospital    Incl Nurs Home;Total Hosps           */
     @14221    f1404106    07.  /*Licensed Beds, Total Hospital    Incl Nurs Home;Total Hosps           */
     @14228    f1404105    07.  /*Licensed Beds, Total Hospital    Incl Nurs Home;Total Hosps           */
     @14235    f1404104    07.  /*Licensed Beds, Total Hospital    Incl Nurs Home;Total Hosps           */
     @14242    f1404103    07.  /*Licensed Beds, Total Hospital    Incl Nurs Home;Total Hosps           */
     @14249    f1404207    07.  /*Licensed Beds, Short Term Hosp   Incl Nurs Homes                      */
     @14256    f1404206    07.  /*Licensed Beds, Short Term Hosp   Incl Nurs Homes                      */
     @14263    f1404205    07.  /*Licensed Beds, Short Term Hosp   Incl Nurs Homes                      */
     @14270    f1404204    07.  /*Licensed Beds, Short Term Hosp   Incl Nurs Homes                      */
     @14277    f1404203    07.  /*Licensed Beds, Short Term Hosp   Incl Nurs Homes                      */
     @14284    f1404307    07.  /*Licensed Beds,Short Non-Gen Hsp  Incl Nurs Homes                      */
     @14291    f1404306    07.  /*Licensed Beds,Short Non-Gen Hsp  Incl Nurs Homes                      */
     @14298    f1404305    07.  /*Licensed Beds,Short Non-Gen Hsp  Incl Nurs Homes                      */
     @14305    f1404304    07.  /*Licensed Beds,Short Non-Gen Hsp  Incl Nurs Homes                      */
     @14312    f1404303    07.  /*Licensed Beds,Short Non-Gen Hsp  Incl Nurs Homes                      */
     @14319    f1404407    07.  /*Licensed Beds, Long Term Hosp    Incl Nurs Homes                      */
     @14326    f1404406    07.  /*Licensed Beds, Long Term Hosp    Incl Nurs Homes                      */
     @14333    f1404405    07.  /*Licensed Beds, Long Term Hosp    Incl Nurs Homes                      */
     @14340    f1404404    07.  /*Licensed Beds, Long Term Hosp    Incl Nurs Homes                      */
     @14347    f1404403    07.  /*Licensed Beds, Long Term Hosp    Incl Nurs Homes                      */
     @14354    f1404507    05.  /*Licensed Nursing Home Beds       Total Hospitals                      */
     @14359    f1404506    05.  /*Licensed Nursing Home Beds       Total Hospitals                      */
     @14364    f1404505    05.  /*Licensed Nursing Home Beds       Total Hospitals                      */
     @14369    f1404504    05.  /*Licensed Nursing Home Beds       Total Hospitals                      */
     @14374    f1404503    05.  /*Licensed Nursing Home Beds       Total Hospitals                      */
     @14379    f1404607    05.  /*Licensed Nurs Home Beds, STGEN   Short Term General Hospitals         */
     @14384    f1404606    05.  /*Licensed Nurs Home Beds, STGEN   Short Term General Hospitals         */
     @14389    f1404605    05.  /*Licensed Nurs Home Beds, STGEN   Short Term General Hospitals         */
     @14394    f1404604    05.  /*Licensed Nurs Home Beds, STGEN   Short Term General Hospitals         */
     @14399    f1404603    05.  /*Licensed Nurs Home Beds, STGEN   Short Term General Hospitals         */
     @14404    f1404707    05.  /*Licensed Nurs Home Beds, STNG    Short Tern Non-Gen Hospitals         */
     @14409    f1404706    05.  /*Licensed Nurs Home Beds, STNG    Short Tern Non-Gen Hospitals         */
     @14414    f1404705    05.  /*Licensed Nurs Home Beds, STNG    Short Tern Non-Gen Hospitals         */
     @14419    f1404704    05.  /*Licensed Nurs Home Beds, STNG    Short Tern Non-Gen Hospitals         */
     @14424    f1404703    05.  /*Licensed Nurs Home Beds, STNG    Short Tern Non-Gen Hospitals         */
     @14429    f1404807    05.  /*Licensed Nurs Home Beds, LT      Long Term Hospitals                  */
     @14434    f1404806    05.  /*Licensed Nurs Home Beds, LT      Long Term Hospitals                  */
     @14439    f1404805    05.  /*Licensed Nurs Home Beds, LT      Long Term Hospitals                  */
     @14444    f1404804    05.  /*Licensed Nurs Home Beds, LT      Long Term Hospitals                  */
     @14449    f1404803    05.  /*Licensed Nurs Home Beds, LT      Long Term Hospitals                  */
     @14454    f0893007    06.  /*Bassinets Set Up & Staffed       Short Term General Hospitals         */
     @14460    f0893005    06.  /*Bassinets Set Up & Staffed       Short Term General Hospitals         */
     @14466    f0893000    06.  /*Bassinets Set Up & Staffed       Short Term General Hospitals         */
     @14472    f0893095    06.  /*Bassinets Set Up & Staffed       Short Term General Hospitals         */
     @14478    f0893107    06.  /*Bassinets Set Up & Staffed       ST Non-Gen + Long Term Hosps         */
     @14484    f0893105    06.  /*Bassinets Set Up & Staffed       ST Non-Gen + Long Term Hosps         */
     @14490    f0893100    06.  /*Bassinets Set Up & Staffed       ST Non-Gen + Long Term Hosps         */
     @14496    f0893195    06.  /*Bassinets Set Up & Staffed       ST Non-Gen + Long Term Hosps         */
     @14502    f1138607    03.  /*# ST Gen Hosp, 006-049 Beds                                           */
     @14505    f1138605    03.  /*# ST Gen Hosp, 006-049 Beds                                           */
     @14508    f1138600    03.  /*# ST Gen Hosp, 006-049 Beds                                           */
     @14511    f1138695    03.  /*# ST Gen Hosp, 006-049 Beds                                           */
     @14514    f1138707    03.  /*# ST Gen Hosp, 050-099 Beds                                           */
     @14517    f1138705    03.  /*# ST Gen Hosp, 050-099 Beds                                           */
     @14520    f1138700    03.  /*# ST Gen Hosp, 050-099 Beds                                           */
     @14523    f1138795    03.  /*# ST Gen Hosp, 050-099 Beds                                           */
     @14526    f1138807    03.  /*# ST Gen Hosp, 100-199 Beds                                           */
     @14529    f1138805    03.  /*# ST Gen Hosp, 100-199 Beds                                           */
     @14532    f1138800    03.  /*# ST Gen Hosp, 100-199 Beds                                           */
     @14535    f1138895    03.  /*# ST Gen Hosp, 100-199 Beds                                           */
     @14538    f1138907    03.  /*# ST Gen Hosp, 200-299 Beds                                           */
     @14541    f1138905    03.  /*# ST Gen Hosp, 200-299 Beds                                           */
     @14544    f1138900    03.  /*# ST Gen Hosp, 200-299 Beds                                           */
     @14547    f1138995    03.  /*# ST Gen Hosp, 200-299 Beds                                           */
     @14550    f1139007    03.  /*# ST Gen Hosp, 300+ Beds                                              */
     @14553    f1139005    03.  /*# ST Gen Hosp, 300+ Beds                                              */
     @14556    f1139000    03.  /*# ST Gen Hosp, 300+ Beds                                              */
     @14559    f1139095    03.  /*# ST Gen Hosp, 300+ Beds                                              */
     @14562    f1139907    03.  /*# STNG/LT Hosps,006-049 Beds     ST Non-Gen + Long Term Hosps         */
     @14565    f1140007    03.  /*# STNG/LT Hosps,050-099 Beds     ST Non-Gen + Long Term Hosps         */
     @14568    f1140107    03.  /*# STNG/LT Hosps,100-199 Beds     ST Non-Gen + Long Term Hosps         */
     @14571    f1140207    03.  /*# STNG/LT Hosps,200-299 Beds     ST Non-Gen + Long Term Hosps         */
     @14574    f1140307    03.  /*# STNG/LT Hosps,300+ Beds        ST Non-Gen + Long Term Hosps         */
     @14577    f1140407    03.  /*# Veteran Hosp, 006-049 Beds                                          */
     @14580    f1140507    03.  /*# Veteran Hosp, 050-099 Beds                                          */
     @14583    f1140607    03.  /*# Veteran Hosp, 100-199 Beds                                          */
     @14586    f1140707    03.  /*# Veteran Hosp, 200-299 Beds                                          */
     @14589    f1140807    03.  /*# Veteran Hosp, 300+ Beds                                             */
     @14592    f1256207    03.  /*# Hosp W/Gen Med/Surg Cr, Adult  Short Term General Hospitals         */
     @14595    f1256307    03.  /*# Hosp W/Gen Med/Surg Care, Ped  Short Term General Hospitals         */
     @14598    f1256407    03.  /*# Hosp W/Obstetric Care          Short Term General Hospitals         */
     @14601    f1256507    03.  /*# Hosp W/Medical/Surg Intens Cr  Short Term General Hospitals         */
     @14604    f1256607    03.  /*# Hosp W/Cardiac Intensive Care  Short Term General Hospitals         */
     @14607    f1256707    03.  /*# Hosp W/Neonatal Intens Care    Short Term General Hospitals         */
     @14610    f1256807    03.  /*# Hosp W/Neonatal Intermed Care  Short Term General Hospitals         */
     @14613    f1256907    03.  /*# Hosp W/Pediatric Intens Care   Short Term General Hospitals         */
     @14616    f1257007    03.  /*# Hosp W/Burn Care               Short Term General Hospitals         */
     @14619    f1257107    03.  /*# Hosp W/Other Special Care      Short Term General Hospitals         */
     @14622    f1331007    03.  /*# Hosp W/Other Intensive Care    Short Term General Hospitals         */
     @14625    f1257207    03.  /*# Hosp W/Physical Rehab Care     Short Term General Hospitals         */
     @14628    f1257307    03.  /*# Hosp W/Alc/Drug Abuse IP Care  Short Term General Hospitals         */
     @14631    f1257407    03.  /*# Hosp W/Psychiatric Care        Short Term General Hospitals         */
     @14634    f1257507    03.  /*# Hosp W/Skilled Nursing Care    Short Term General Hospitals         */
     @14637    f1257607    03.  /*# Hosp W/Intermediate Nurs Care  Short Term General Hospitals         */
     @14640    f1331207    03.  /*# Hosp W/Acute Long-Term Care    Short Term General Hospitals         */
     @14643    f1257707    03.  /*# Hosp W/Other Long-Term Care    Short Term General Hospitals         */
     @14646    f1257807    03.  /*# Hosp W/Other Care              Short Term General Hospitals         */
     @14649    f1257907    03.  /*# Hosp W/Adult Day Care Program  Short Term General Hospitals         */
     @14652    f1392807    03.  /*# Hosp W/Airborne Inf Isol Room  Short Term General Hospitals         */
     @14655    f1258007    03.  /*# Hosp W/Alc/Drug Abuse OP Serv  Short Term General Hospitals         */
     @14658    f1400007    03.  /*# Hosp W/Alzheimer Center        Short Term General Hospitals         */
     @14661    f1361307    03.  /*# Hosp W/Ambulance Services      Short Term General Hospitals         */
     @14664    f1412707    03.  /*# Hosp W/Ambulatory Surgery Ctr  Short Term General Hospitals         */
     @14667    f1258207    03.  /*# Hosp W/Arthritis Treatmt Cntr  Short Term General Hospitals         */
     @14670    f1258307    03.  /*# Hosp W/Assisted Living         Short Term General Hospitals         */
     @14673    f1331307    03.  /*# Hosp W/Auxiliary Services      Short Term General Hospitals         */
     @14676    f1393007    03.  /*# Hosp W/Bariart/Wgt Cntrl Serv  Short Term General Hospitals         */
     @14679    f1258407    03.  /*# Hsp W/Birth Rm/LDR Rm/LDRP Rm  Short Term General Hospitals         */
     @14682    f1409607    03.  /*# Hosp W/Blood Donor Center      Short Term General Hospitals         */
     @14685    f1258507    03.  /*# Hosp W/Breast Cancer Scrn/Mam  Short Term General Hospitals         */
     @14688    f1406807    03.  /*#Hsp W/Adlt Diagn/Invasive Cath  Short Term General Hospitals         */
     @14691    f1406907    03.  /*# Hsp W/Ped Diagn/Invasive Cath  Short Term General Hospitals         */
     @14694    f1407007    03.  /*#Hsp W/Adlt Intervntnl Card Cth  Short Term General Hospitals         */
     @14697    f1407107    03.  /*#Hsp W/Ped Intervntnl Card Cath  Short Term General Hospitals         */
     @14700    f1407207    03.  /*# Hosp W/Adult Cardiac Surgery   Short Term General Hospitals         */
     @14703    f1407307    03.  /*# Hosp W/Ped Cardiac Surgery     Short Term General Hospitals         */
     @14706    f1409707    03.  /*# Hosp W/Cardiac Rehabilitation  Short Term General Hospitals         */
     @14709    f1258707    03.  /*# Hosp W/Case Management         Short Term General Hospitals         */
     @14712    f1410907    03.  /*# Hosp W/Case Management         ST Non-Gen + Long Term Hosps         */
     @14715    f1393107    03.  /*# Hosp W/Chapl/Pastor Care Serv  Short Term General Hospitals         */
     @14718    f1400207    03.  /*# Hosp W/Chemotherapy            Short Term General Hospitals         */
     @14721    f1258807    03.  /*# Hosp W/Child Wellness Program  Short Term General Hospitals         */
     @14724    f1331407    03.  /*# Hosp W/Chiropractic Services   Short Term General Hospitals         */
     @14727    f1258907    03.  /*# Hosp W/Community Outreach      Short Term General Hospitals         */
     @14730    f1331507    03.  /*# Hosp W/Complementary Med Serv  Short Term General Hospitals         */
     @14733    f1409807    03.  /*# Hosp W/Computer Asst Orth Srg  Short Term General Hospitals         */
     @14736    f1259007    03.  /*# Hosp W/Crisis Prevention       Short Term General Hospitals         */
     @14739    f1259107    03.  /*# Hosp W/Dental Services         Short Term General Hospitals         */
     @14742    f1259207    03.  /*# Hosp W/Emergency Department    Short Term General Hospitals         */
     @14745    f1409907    03.  /*#Hsp W/Freestnd/Satllt Emer Dpt  Short Term General Hospitals         */
     @14748    f1259307    03.  /*# Hosp W/Certified Trauma Cntr   Short Term General Hospitals         */
     @14751    f1361407    03.  /*# Hosp W/Enabling Services       Short Term General Hospitals         */
     @14754    f1260307    03.  /*# Hosp W/Hospice                 Short Term General Hospitals         */
     @14757    f1331707    03.  /*# Hosp W/Pain Management Pgm     Short Term General Hospitals         */
     @14760    f1361507    03.  /*# Hosp W/Palliative Care Pgm     Short Term General Hospitals         */
     @14763    f1420907    03.  /*# Hosp W/IP Palliative Cre Unit  Short Term General Hospitals         */
     @14766    f1421007    03.  /*# Hosp W/Endoscopic Ultrasound   Short Term General Hospitals         */
     @14769    f1421107    03.  /*# Hosp W/Ablat of Barrets Esoph  Short Term General Hospitals         */
     @14772    f1421207    03.  /*# Hosp W/Esoph Impedance Study   Short Term General Hospitals         */
     @14775    f1421307    03.  /*# Hosp W/ECRP                    Short Term General Hospitals         */
     @14778    f1361607    03.  /*# Hosp W/Enrollment Assist Pgm   Short Term General Hospitals         */
     @14781    f1259407    03.  /*# Hosp W/Extracorporeal Shock    Short Term General Hospitals         */
     @14784    f1259507    03.  /*# Hosp W/Fitness Center          Short Term General Hospitals         */
     @14787    f1259607    03.  /*# Hosp W/Freestandng Outpat Ctr  Short Term General Hospitals         */
     @14790    f1259707    03.  /*# Hosp W/Geriatric Services      Short Term General Hospitals         */
     @14793    f1411007    03.  /*# Hosp W/Geriatric Services      ST Non-Gen + Long Term Hosps         */
     @14796    f1259807    03.  /*# Hosp W/Health Fair             Short Term General Hospitals         */
     @14799    f1259907    03.  /*# Hosp W/Community Health Educ   Short Term General Hospitals         */
     @14802    f1260007    03.  /*# Hosp W/Health Screenings       Short Term General Hospitals         */
     @14805    f1421407    03.  /*# Hosp W/Health Research         Short Term General Hospitals         */
     @14808    f1361707    03.  /*# Hosp W/Hemodialysis            Short Term General Hospitals         */
     @14811    f1260107    03.  /*# Hosp W/HIV-AIDS Services       Short Term General Hospitals         */
     @14814    f1260207    03.  /*# Hosp W/Home Health Services    Short Term General Hospitals         */
     @14817    f1260407    03.  /*#Hsp W/Hsp-Bsd Outpat Cr Ctr/Sv  Short Term General Hospitals         */
     @14820    f1421507    03.  /*# Hosp W/Immunization Program    Short Term General Hospitals         */
     @14823    f1410007    03.  /*# Hosp W/Indigent Care Clinic    Short Term General Hospitals         */
     @14826    f1393207    03.  /*# Hosp W/Ling/Translation Serv   Short Term General Hospitals         */
     @14829    f1411107    03.  /*# Hosp W/Ling/Translation Serv   ST Non-Gen + Long Term Hosps         */
     @14832    f1260507    03.  /*# Hosp W/Meals On Wheels         Short Term General Hospitals         */
     @14835    f1410107    03.  /*# Hosp W/Mobile Health Services  Short Term General Hospitals         */
     @14838    f1393307    03.  /*# Hosp W/Neurological Services   Short Term General Hospitals         */
     @14841    f1260607    03.  /*# Hosp W/Nutrition Programs      Short Term General Hospitals         */
     @14844    f1411207    03.  /*# Hosp W/Nutrition Programs      ST Non-Gen + Long Term Hosps         */
     @14847    f1260707    03.  /*# Hosp W/Occupational Hlth Serv  Short Term General Hospitals         */
     @14850    f1411307    03.  /*# Hosp W/Occupational Hlth Serv  ST Non-Gen + Long Term Hosps         */
     @14853    f1260807    03.  /*# Hosp W/Oncology Services       Short Term General Hospitals         */
     @14856    f1393407    03.  /*# Hosp W/Orthopedic Services     Short Term General Hospitals         */
     @14859    f1261107    03.  /*# Hosp W/Outpatient Surgery      Short Term General Hospitals         */
     @14862    f1407407    03.  /*# Hosp W/Patient Ctrl Analgesia  Short Term General Hospitals         */
     @14865    f1261207    03.  /*# Hosp W/Patient Education Cntr  Short Term General Hospitals         */
     @14868    f1261307    03.  /*# Hosp W/Patient Repr Services   Short Term General Hospitals         */
     @14871    f1411407    03.  /*# Hosp W/Patient Repr Services   ST Non-Gen + Long Term Hosps         */
     @14874    f1261407    03.  /*# Hosp W/Physical Rehab OP Serv  Short Term General Hospitals         */
     @14877    f1411507    03.  /*# Hosp W/Physical Rehab OP Serv  ST Non-Gen + Long Term Hosps         */
     @14880    f1261507    03.  /*# Hosp W/Primary Care Dept       Short Term General Hospitals         */
     @14883    f1261607    03.  /*# Hosp W/Psych Child/Adoles Ser  Short Term General Hospitals         */
     @14886    f1261707    03.  /*# Hosp W/Psych Consl/Liaisn Ser  Short Term General Hospitals         */
     @14889    f1261807    03.  /*# Hosp W/Psych Consl/Liaisn Ser  ST Non-Gen + Long Term Hosps         */
     @14892    f1261907    03.  /*# Hosp W/Psych Educational Serv  Short Term General Hospitals         */
     @14895    f1262007    03.  /*# Hosp W/Psych Emergency Serv    Short Term General Hospitals         */
     @14898    f1262107    03.  /*# Hosp W/Psych Geriatric Serv    Short Term General Hospitals         */
     @14901    f1262207    03.  /*# Hosp W/Psych Outpatient Serv   Short Term General Hospitals         */
     @14904    f1262307    03.  /*# Hosp W/Psych Part Hosp Prog    Short Term General Hospitals         */
     @14907    f1412807    03.  /*# Hosp W/Radiology, Therapeutic  Short Term General Hospitals         */
     @14910    f1410207    03.  /*# Hosp W/Image-guided Rad Ther   Short Term General Hospitals         */
     @14913    f1400407    03.  /*#Hsp W/Intens-Modulatd Rad Ther  Short Term General Hospitals         */
     @14916    f1421607    03.  /*# Hosp W/Proton Therapy          Short Term General Hospitals         */
     @14919    f1407507    03.  /*# Hosp W/Shaped Beam Rad System  Short Term General Hospitals         */
     @14922    f1410707    03.  /*# Hosp W/Stereotactic Radiosurg  Short Term General Hospitals         */
     @14925    f1262507    03.  /*# Hosp W/C.T. Scanner            Short Term General Hospitals         */
     @14928    f1262607    03.  /*# Hosp W/Diag Radioisotope Fac   Short Term General Hospitals         */
     @14931    f1400507    03.  /*#Hsp W/Electrn Beam Comp Tomogr  Short Term General Hospitals         */
     @14934    f1410307    03.  /*# Hsp W/Full-field Digit Mammog  Short Term General Hospitals         */
     @14937    f1262707    03.  /*# Hosp W/Mag Resonance Imaging   Short Term General Hospitals         */
     @14940    f1262807    03.  /*# Hosp W/Mag Resonance Imaging   ST Non-Gen + Long Term Hosps         */
     @14943    f1421707    03.  /*# Hosp W/Intraoperative MRI      Short Term General Hospitals         */
     @14946    f1400607    03.  /*#Hsp W/Multislce Sp Com Tom <64  Short Term General Hospitals         */
     @14949    f1410407    03.  /*#Hsp W/Multislce Sp Com Tom 64+  Short Term General Hospitals         */
     @14952    f1262907    03.  /*# Hosp W/Positron Emission Tom   Short Term General Hospitals         */
     @14955    f1410507    03.  /*# Hosp W/Positron Emiss Tom/CT   Short Term General Hospitals         */
     @14958    f1263007    03.  /*# Hsp W/Singl Photon Emis Tomog  Short Term General Hospitals         */
     @14961    f1263107    03.  /*# Hosp W/Ultrasound              Short Term General Hospitals         */
     @14964    f1400707    03.  /*# Hosp W/Fertility Clinic        Short Term General Hospitals         */
     @14967    f1400807    03.  /*#Hosp W/Genetic Test/Counseling  Short Term General Hospitals         */
     @14970    f1263307    03.  /*# Hosp W/Retirement Housing      Short Term General Hospitals         */
     @14973    f1410607    03.  /*# Hosp W/Robotic Surgery         Short Term General Hospitals         */
     @14976    f1361807    03.  /*# Hosp W/Sleep Center            Short Term General Hospitals         */
     @14979    f1263407    03.  /*# Hosp W/Social Work Services    Short Term General Hospitals         */
     @14982    f1411607    03.  /*# Hosp W/Social Work Services    ST Non-Gen + Long Term Hosps         */
     @14985    f1263507    03.  /*# Hosp W/Sports Medicine         Short Term General Hospitals         */
     @14988    f1263607    03.  /*# Hosp W/Support Groups          Short Term General Hospitals         */
     @14991    f1411707    03.  /*# Hosp W/Support Groups          ST Non-Gen + Long Term Hosps         */
     @14994    f1393507    03.  /*# Hosp W/Swing Bed Services      Short Term General Hospitals         */
     @14997    f1263707    03.  /*# Hosp W/Teen Outreach Services  Short Term General Hospitals         */
     @15000    f1361907    03.  /*# Hosp W/Tobacco Treatment Serv  Short Term General Hospitals         */
     @15003    f1407607    03.  /*#Hsp W/Bone Marrow Transplt Ser  Short Term General Hospitals         */
     @15006    f1407707    03.  /*# Hosp W/Heart Transplant        Short Term General Hospitals         */
     @15009    f1407807    03.  /*# Hosp W/Kidney Transplant       Short Term General Hospitals         */
     @15012    f1407907    03.  /*# Hosp W/Liver Transplant        Short Term General Hospitals         */
     @15015    f1408007    03.  /*# Hosp W/Lung Transplant         Short Term General Hospitals         */
     @15018    f1408107    03.  /*# Hosp W/Tissue Transplant       Short Term General Hospitals         */
     @15021    f1408207    03.  /*# Hosp W/Oth Transplant Service  Short Term General Hospitals         */
     @15024    f1263907    03.  /*# Hosp W/Transport to Hlth Fac   Short Term General Hospitals         */
     @15027    f1264007    03.  /*# Hosp W/Urgent Care Center      Short Term General Hospitals         */
     @15030    f1410807    03.  /*# Hosp W/Virtual Colonoscopy     Short Term General Hospitals         */
     @15033    f1264107    03.  /*# Hosp W/Volunteer Serv Dept     Short Term General Hospitals         */
     @15036    f1264207    03.  /*# Hosp W/Women's Hlth Cntr/Serv  Short Term General Hospitals         */
     @15039    f1393607    03.  /*# Hosp W/Wound Mngmnt Services   Short Term General Hospitals         */
     @15042    f1403507    03.  /*# Hosp w/Hospitalists Care       Short Term General Hospitals         */
     @15045    f1403607    03.  /*# Hosp w/Hospitalists Care       ST Non-Gen + Long Term Hosps         */
     @15048    f1264307    03.  /*# Hsp Participtn in Phys Arrang  Short Term General Hospitals         */
     @15051    f1264407    03.  /*# Hsp Developmnt of Ins Product  Short Term General Hospitals         */
     @15054    f0907107    05.  /*Gen Med/Surg, Adult, Bed Set Up  Short Term General Hospitals         */
     @15059    f0907707    05.  /*Gen Med/Surg, Ped, Beds Set Up   Short Term General Hospitals         */
     @15064    f0908307    05.  /*Obstetrics Care, Beds Set Up     Short Term General Hospitals         */
     @15069    f0913907    05.  /*Med/Surg Intens Cr, Beds Set Up  Short Term General Hospitals         */
     @15074    f0913307    05.  /*Cardiac Intens Cr, Beds Set Up   Short Term General Hospitals         */
     @15079    f0914507    05.  /*Neonatal Intens Cr, Beds Set Up  Short Term General Hospitals         */
     @15084    f0915107    05.  /*Neonat Intermed Cr, Beds Set Up  Short Term General Hospitals         */
     @15089    f0916307    05.  /*Pediatric Intens Cr, Bed Set Up  Short Term General Hospitals         */
     @15094    f0912707    05.  /*Burn Care, Beds Set Up           Short Term General Hospitals         */
     @15099    f0910307    05.  /*Oth Special Care, Beds Set Up    Short Term General Hospitals         */
     @15104    f1330907    05.  /*Other Intensive Cr, Bed Set Up   Short Term General Hospitals         */
     @15109    f0921507    05.  /*Rehabilitation Care, Bed Set Up  Short Term General Hospitals         */
     @15114    f1143907    05.  /*Alchl/Chem Depend Cr,Bed Set Up  Short Term General Hospitals         */
     @15119    f1143707    05.  /*Psychiatric Care, Beds Set Up    Short Term General Hospitals         */
     @15124    f1133707    05.  /*Skilled Nurs Care, Beds Set Up   Short Term General Hospitals         */
     @15129    f1133907    05.  /*Intermediate Care, Beds Set Up   Short Term General Hospitals         */
     @15134    f1331107    05.  /*Acute LT Care, Beds Set Up       Short Term General Hospitals         */
     @15139    f1256007    05.  /*Other LT Care, Beds Set Up       Short Term General Hospitals         */
     @15144    f1256107    05.  /*Other Care, Beds Set Up          Short Term General Hospitals         */
     @15149    f0904707    06.  /*Total Inpatient, Beds Set Up     Short Term General Hospitals         */
     @15155    f0930707    06.  /*# FTE Total Facility Personnel   Incl Nurs Homes; ST Gen Hosps        */
     @15161    f0930705    06.  /*# FTE Total Facility Personnel   Incl Nurs Homes; ST Gen Hosps        */
     @15167    f0930700    06.  /*# FTE Total Facility Personnel   Incl Nurs Homes; ST Gen Hosps        */
     @15173    f0930807    06.  /*# FTE Total Facility Personnel   Incl Nurs Homes; STNG/LT Hosps       */
     @15179    f0930805    06.  /*# FTE Total Facility Personnel   Incl Nurs Homes; STNG/LT Hosps       */
     @15185    f0930800    06.  /*# FTE Total Facility Personnel   Incl Nurs Homes; STNG/LT Hosps       */
     @15191    f1130807    05.  /*# FTE Physicians & Dentists      Incl Nurs Homes; ST Gen Hosps        */
     @15196    f1130805    05.  /*# FTE Physicians & Dentists      Incl Nurs Homes; ST Gen Hosps        */
     @15201    f1130800    05.  /*# FTE Physicians & Dentists      Incl Nurs Homes; ST Gen Hosps        */
     @15206    f1130907    05.  /*# FTE Physicians & Dentists      Incl Nurs Homes; STNG/LT Hosps       */
     @15211    f1130905    05.  /*# FTE Physicians & Dentists      Incl Nurs Homes; STNG/LT Hosps       */
     @15216    f1130900    05.  /*# FTE Physicians & Dentists      Incl Nurs Homes; STNG/LT Hosps       */
     @15221    f0931107    04.  /*# FTE Physicians & Dentists      Incl Nurs Homes;Veterans Hosps       */
     @15225    f1266307    06.  /*# FTE Medical & Dental Residnts  Incl Nurs Homes; ST Gen Hosps        */
     @15231    f1266305    06.  /*# FTE Medical & Dental Residnts  Incl Nurs Homes; ST Gen Hosps        */
     @15237    f1266300    06.  /*# FTE Medical & Dental Residnts  Incl Nurs Homes; ST Gen Hosps        */
     @15243    f1266407    06.  /*# FTE Medical & Dental Residnts  Incl Nurs Homes; STNG/LT Hosps       */
     @15249    f1266405    06.  /*# FTE Medical & Dental Residnts  Incl Nurs Homes; STNG/LT Hosps       */
     @15255    f1266400    06.  /*# FTE Medical & Dental Residnts  Incl Nurs Homes; STNG/LT Hosps       */
     @15261    f0931407    04.  /*# FTE Other Trainees             Incl Nurs Homes; ST Gen Hosps        */
     @15265    f0931405    04.  /*# FTE Other Trainees             Incl Nurs Homes; ST Gen Hosps        */
     @15269    f0931400    07.  /*# FTE Other Trainees             Incl Nurs Homes; ST Gen Hosps        */
     @15276    f0931507    04.  /*# FTE Other Trainees             Incl Nurs Homes; STNG/LT Hosps       */
     @15280    f0931505    04.  /*# FTE Other Trainees             Incl Nurs Homes; STNG/LT Hosps       */
     @15284    f0931500    07.  /*# FTE Other Trainees             Incl Nurs Homes; STNG/LT Hosps       */
     @15291    f1266507    05.  /*# FTE Total Trainees             Incl Nurs Homes; ST Gen Hosps        */
     @15296    f1266505    05.  /*# FTE Total Trainees             Incl Nurs Homes; ST Gen Hosps        */
     @15301    f1266500    07.  /*# FTE Total Trainees             Incl Nurs Homes; ST Gen Hosps        */
     @15308    f1266607    05.  /*# FTE Total Trainees             Incl Nurs Homes; STNG/LT Hosps       */
     @15313    f1266605    05.  /*# FTE Total Trainees             Incl Nurs Homes; STNG/LT Hosps       */
     @15318    f1266600    07.  /*# FTE Total Trainees             Incl Nurs Homes; STNG/LT Hosps       */
     @15325    f0931607    06.  /*# FTE R.N.s                      Incl Nurs Homes; ST Gen Hosps        */
     @15331    f0931605    06.  /*# FTE R.N.s                      Incl Nurs Homes; ST Gen Hosps        */
     @15337    f0931600    06.  /*# FTE R.N.s                      Incl Nurs Homes; ST Gen Hosps        */
     @15343    f0931707    06.  /*# FTE R.N.s                      Incl Nurs Homes; STNG/LT Hosps       */
     @15349    f0931705    06.  /*# FTE R.N.s                      Incl Nurs Homes; STNG/LT Hosps       */
     @15355    f0931700    06.  /*# FTE R.N.s                      Incl Nurs Homes; STNG/LT Hosps       */
     @15361    f0931807    06.  /*# FTE R.N.s                      Incl Nurs Homes;Veterans Hosps       */
     @15367    f0931907    06.  /*# FTE L.P.N.s & L.V.N.s          Incl Nurs Homes; ST Gen Hosps        */
     @15373    f0931905    06.  /*# FTE L.P.N.s & L.V.N.s          Incl Nurs Homes; ST Gen Hosps        */
     @15379    f0931900    06.  /*# FTE L.P.N.s & L.V.N.s          Incl Nurs Homes; ST Gen Hosps        */
     @15385    f0932007    06.  /*# FTE L.P.N.s & L.V.N.s          Incl Nurs Homes; STNG/LT Hosps       */
     @15391    f0932005    06.  /*# FTE L.P.N.s & L.V.N.s          Incl Nurs Homes; STNG/LT Hosps       */
     @15397    f0932000    06.  /*# FTE L.P.N.s & L.V.N.s          Incl Nurs Homes; STNG/LT Hosps       */
     @15403    f1266107    07.  /*# FTE Other Personnel            Incl Nurs Homes; ST Gen Hosps        */
     @15410    f1266105    07.  /*# FTE Other Personnel            Incl Nurs Homes; ST Gen Hosps        */
     @15417    f1266100    07.  /*# FTE Other Personnel            Incl Nurs Homes; ST Gen Hosps        */
     @15424    f1266207    07.  /*# FTE Other Personnel            Incl Nurs Homes; STNG/LT Hosps       */
     @15431    f1266205    07.  /*# FTE Other Personnel            Incl Nurs Homes; STNG/LT Hosps       */
     @15438    f1266200    07.  /*# FTE Other Personnel            Incl Nurs Homes; STNG/LT Hosps       */
     @15445    f0932307    06.  /*# FTE All Oth Personnel,VA Hosp  Incl NH; Res,Train,LPN/LVN&Oth       */
     @15451    f1266707    07.  /*# FTE Total Hospital Personnel   Short Term General Hospitals         */
     @15458    f1266705    07.  /*# FTE Total Hospital Personnel   Short Term General Hospitals         */
     @15465    f1266700    07.  /*# FTE Total Hospital Personnel   Short Term General Hospitals         */
     @15472    f1266807    07.  /*# FTE Total Hospital Personnel   ST Non-Gen + Long Term Hosps         */
     @15479    f1266805    07.  /*# FTE Total Hospital Personnel   ST Non-Gen + Long Term Hosps         */
     @15486    f1266800    07.  /*# FTE Total Hospital Personnel   ST Non-Gen + Long Term Hosps         */
     @15493    f0962307    06.  /*# FTE Tot Nurs Home Personnel    Short Term General Hospitals         */
     @15499    f0962305    06.  /*# FTE Tot Nurs Home Personnel    Short Term General Hospitals         */
     @15505    f0962300    06.  /*# FTE Tot Nurs Home Personnel    Short Term General Hospitals         */
     @15511    f0962407    06.  /*# FTE Tot Nurs Home Personnel    ST Non-Gen + Long Term Hosps         */
     @15517    f0962405    06.  /*# FTE Tot Nurs Home Personnel    ST Non-Gen + Long Term Hosps         */
     @15523    f0962400    06.  /*# FTE Tot Nurs Home Personnel    ST Non-Gen + Long Term Hosps         */
     @15529    f1033707    08.  /*Total Facility Personnel, FT     Incl Nurs Homes; ST Gen Hosps        */
     @15537    f1033705    08.  /*Total Facility Personnel, FT     Incl Nurs Homes; ST Gen Hosps        */
     @15545    f1033700    08.  /*Total Facility Personnel, FT     Incl Nurs Homes; ST Gen Hosps        */
     @15553    f1033807    08.  /*Total Facility Personnel, FT     Incl Nurs Homes; STNG/LT Hosps       */
     @15561    f1033805    08.  /*Total Facility Personnel, FT     Incl Nurs Homes; STNG/LT Hosps       */
     @15569    f1033800    08.  /*Total Facility Personnel, FT     Incl Nurs Homes; STNG/LT Hosps       */
     @15577    f1033907    06.  /*Total Facility Personnel, PT     Incl Nurs Homes; ST Gen Hosps        */
     @15583    f1033905    06.  /*Total Facility Personnel, PT     Incl Nurs Homes; ST Gen Hosps        */
     @15589    f1033900    06.  /*Total Facility Personnel, PT     Incl Nurs Homes; ST Gen Hosps        */
     @15595    f1034007    06.  /*Total Facility Personnel, PT     Incl Nurs Homes; STNG/LT Hosps       */
     @15601    f1034005    06.  /*Total Facility Personnel, PT     Incl Nurs Homes; STNG/LT Hosps       */
     @15607    f1034000    06.  /*Total Facility Personnel, PT     Incl Nurs Homes; STNG/LT Hosps       */
     @15613    f1264507    06.  /*Physicians & Dentists, FT        Incl Nurs Homes; ST Gen Hosps        */
     @15619    f1264607    06.  /*Physicians & Dentists, FT        Incl Nurs Homes; STNG/LT Hosps       */
     @15625    f1265307    06.  /*Physicians & Dentists, PT        Incl Nurs Homes; ST Gen Hosps        */
     @15631    f1265407    06.  /*Physicians & Dentists, PT        Incl Nurs Homes; STNG/LT Hosps       */
     @15637    f1197307    06.  /*Medical/Dental Res/Interns, FT   Incl Nurs Homes; ST Gen Hosps        */
     @15643    f1197807    06.  /*Medical/Dental Res/Interns, FT   Incl Nurs Homes; STNG/LT Hosps       */
     @15649    f1197407    06.  /*Medical/Dental Res/Interns, PT   Incl Nurs Homes; ST Gen Hosps        */
     @15655    f1197907    06.  /*Medical/Dental Res/Interns, PT   Incl Nurs Homes; STNG/LT Hosps       */
     @15661    f1213007    06.  /*Other Trainees, Full-Time        See User Doc for Def;ST Gen Hs       */
     @15667    f1213107    06.  /*Other Trainees, Full-Time        See User Doc for Def;STNG/LT         */
     @15673    f1213207    06.  /*Other Trainees, Part-Time        See User Doc for Def;ST Gen Hs       */
     @15679    f1213307    06.  /*Other Trainees, Part-Time        See User Doc for Def;STNG/LT         */
     @15685    f1264707    06.  /*Registered Nurses, Full-Time     Incl Nurs Homes; ST Gen Hosps        */
     @15691    f1264807    06.  /*Registered Nurses, Full-Time     Incl Nurs Homes; STNG/LT Hosps       */
     @15697    f1265507    06.  /*Registered Nurses, Part-Time     Incl Nurs Homes; ST Gen Hosps        */
     @15703    f1265607    06.  /*Registered Nurses, Part-Time     Incl Nurs Homes; STNG/LT Hosps       */
     @15709    f1264907    06.  /*LPN/LVNs, Full-Time              Incl Nurs Homes; ST Gen Hosps        */
     @15715    f1265007    06.  /*LPN/LVNs, Full-Time              Incl Nurs Homes; STNG/LT Hosps       */
     @15721    f1265707    06.  /*LPN/LVNs, Part-Time              Incl Nurs Homes; ST Gen Hosps        */
     @15727    f1265807    06.  /*LPN/LVNs, Part-Time              Incl Nurs Homes; STNG/LT Hosps       */
     @15733    f1400907    06.  /*Nursing Assistive Personnel, FT  Incl Nurs Homes; ST Gen Hosps        */
     @15739    f1401007    06.  /*Nursing Assistive Personnel, FT  Incl Nurs Homes; STNG/LT Hosps       */
     @15745    f1401107    06.  /*Nursing Assistive Personnel, PT  Incl Nurs Homes; ST Gen Hosps        */
     @15751    f1401207    06.  /*Nursing Assistive Personnel, PT  Incl Nurs Homes; STNG/LT Hosps       */
     @15757    f1412907    06.  /*Radiology Technicians, FT        Incl Nurs Homes; ST Gen Hosps        */
     @15763    f1413007    06.  /*Radiology Technicians, FT        Incl Nurs Homes; STNG/LT Hosps       */
     @15769    f1413107    06.  /*Radiology Technicians, PT        Incl Nurs Homes; ST Gen Hosps        */
     @15775    f1413207    06.  /*Radiology Technicians, PT        Incl Nurs Homes; STNG/LT Hosps       */
     @15781    f1413307    06.  /*Laboratory Technicians, FT       Incl Nurs Homes; ST Gen Hosps        */
     @15787    f1413407    06.  /*Laboratory Technicians, FT       Incl Nurs Homes; STNG/LT Hosps       */
     @15793    f1413507    06.  /*Laboratory Technicians, PT       Incl Nurs Homes; ST Gen Hosps        */
     @15799    f1413607    06.  /*Laboratory Technicians, PT       Incl Nurs Homes; STNG/LT Hosps       */
     @15805    f1413707    06.  /*Pharmacists, Licensed, FT        Incl Nurs Homes; ST Gen Hosps        */
     @15811    f1413807    06.  /*Pharmacists, Licensed, FT        Incl Nurs Homes; STNG/LT Hosps       */
     @15817    f1413907    06.  /*Pharmacists, Licensed, PT        Incl Nurs Homes; ST Gen Hosps        */
     @15823    f1414007    06.  /*Pharmacists, Licensed, PT        Incl Nurs Homes; STNG/LT Hosps       */
     @15829    f1414107    06.  /*Pharmacy Technicians, FT         Incl Nurs Homes; ST Gen Hosps        */
     @15835    f1414207    06.  /*Pharmacy Technicians, FT         Incl Nurs Homes; STNG/LT Hosps       */
     @15841    f1414307    06.  /*Pharmacy Technicians, PT         Incl Nurs Homes; ST Gen Hosps        */
     @15847    f1414407    06.  /*Pharmacy Technicians, PT         Incl Nurs Homes; STNG/LT Hosps       */
     @15853    f1421907    06.  /*Respiratory Therapists, FT       Incl Nurs Homes; ST Gen Hosps        */
     @15859    f1422007    06.  /*Respiratory Therapists, FT       Incl Nurs Homes; STNG/LT Hosps       */
     @15865    f1422107    06.  /*Respiratory Therapists, PT       Incl Nurs Homes; ST Gen Hosps        */
     @15871    f1422207    06.  /*Respiratory Therapists, PT       Incl Nurs Homes; STNG/LT Hosps       */
     @15877    f1265107    06.  /*All Other Personnel, Full-Time   Incl Nurs Homes; ST Gen Hosps        */
     @15883    f1265207    06.  /*All Other Personnel, Full-Time   Incl Nurs Homes; STNG/LT Hosps       */
     @15889    f1265907    06.  /*All Other Personnel, Part-Time   Incl Nurs Homes; ST Gen Hosps        */
     @15895    f1266007    06.  /*All Other Personnel, Part-Time   Incl Nurs Homes; STNG/LT Hosps       */
     @15901    f0932407    06.  /*Total Hosp Personnel, Full-Time  Short Term General Hospitals         */
     @15907    f0932405    06.  /*Total Hosp Personnel, Full-Time  Short Term General Hospitals         */
     @15913    f0932400    06.  /*Total Hosp Personnel, Full-Time  Short Term General Hospitals         */
     @15919    f0932507    06.  /*Total Hosp Personnel, Full-Time  ST Non-Gen + Long Term Hosps         */
     @15925    f0932505    06.  /*Total Hosp Personnel, Full-Time  ST Non-Gen + Long Term Hosps         */
     @15931    f0932500    06.  /*Total Hosp Personnel, Full-Time  ST Non-Gen + Long Term Hosps         */
     @15937    f0932607    06.  /*Total Hosp Personnel, Part-Time  Short Term General Hospitals         */
     @15943    f0932605    06.  /*Total Hosp Personnel, Part-Time  Short Term General Hospitals         */
     @15949    f0932600    06.  /*Total Hosp Personnel, Part-Time  Short Term General Hospitals         */
     @15955    f0932707    06.  /*Total Hosp Personnel, Part-Time  ST Non-Gen + Long Term Hosps         */
     @15961    f0932705    06.  /*Total Hosp Personnel, Part-Time  ST Non-Gen + Long Term Hosps         */
     @15967    f0932700    06.  /*Total Hosp Personnel, Part-Time  ST Non-Gen + Long Term Hosps         */
     @15973    f0941507    06.  /*Nursing Home Personnel Tot, FT   Short Term General Hospitals         */
     @15979    f0941505    06.  /*Nursing Home Personnel Tot, FT   Short Term General Hospitals         */
     @15985    f0941500    06.  /*Nursing Home Personnel Tot, FT   Short Term General Hospitals         */
     @15991    f0941607    06.  /*Nursing Home Personnel Tot, FT   ST Non-Gen + Long Term Hosps         */
     @15997    f0941605    06.  /*Nursing Home Personnel Tot, FT   ST Non-Gen + Long Term Hosps         */
     @16003    f0941600    06.  /*Nursing Home Personnel Tot, FT   ST Non-Gen + Long Term Hosps         */
     @16009    f0941707    06.  /*Nursing Home Personnel Tot, PT   Short Term General Hospitals         */
     @16015    f0941705    06.  /*Nursing Home Personnel Tot, PT   Short Term General Hospitals         */
     @16021    f0941700    06.  /*Nursing Home Personnel Tot, PT   Short Term General Hospitals         */
     @16027    f0941807    06.  /*Nursing Home Personnel Tot, PT   ST Non-Gen + Long Term Hosps         */
     @16033    f0941805    06.  /*Nursing Home Personnel Tot, PT   ST Non-Gen + Long Term Hosps         */
     @16039    f0941800    06.  /*Nursing Home Personnel Tot, PT   ST Non-Gen + Long Term Hosps         */
     @16045    f1403707    04.  /*Hospitalists, Full-Time          Short Term General Hospitals         */
     @16049    f1403705    04.  /*Hospitalists, Full-Time          Short Term General Hospitals         */
     @16053    f1403807    04.  /*Hospitalists, Full-Time          ST Non-Gen + Long Term Hosps         */
     @16057    f1403805    04.  /*Hospitalists, Full-Time          ST Non-Gen + Long Term Hosps         */
     @16061    f1403907    04.  /*Hospitalists, Part-Time          Short Term General Hospitals         */
     @16065    f1403905    04.  /*Hospitalists, Part-Time          Short Term General Hospitals         */
     @16069    f1404007    04.  /*Hospitalists, Part-Time          ST Non-Gen + Long Term Hosps         */
     @16073    f1404005    04.  /*Hospitalists, Part-Time          ST Non-Gen + Long Term Hosps         */
     @16077    f0953707    03.  /*Dist Hosp By 00 - 04 Services    Short Term General Hospitals         */
     @16080    f0953705    03.  /*Dist Hosp By 00 - 04 Services    Short Term General Hospitals         */
     @16083    f0953700    03.  /*Dist Hosp By 00 - 04 Services    Short Term General Hospitals         */
     @16086    f0953795    03.  /*Dist Hosp By 00 - 04 Services    Short Term General Hospitals         */
     @16089    f0953807    03.  /*Dist Hosp By 00 - 04 Services    ST Non-Gen + Long Term Hosps         */
     @16092    f0953805    03.  /*Dist Hosp By 00 - 04 Services    ST Non-Gen + Long Term Hosps         */
     @16095    f0953800    03.  /*Dist Hosp By 00 - 04 Services    ST Non-Gen + Long Term Hosps         */
     @16098    f0953895    03.  /*Dist Hosp By 00 - 04 Services    ST Non-Gen + Long Term Hosps         */
     @16101    f0953907    03.  /*Dist Hosp By 05 - 14 Services    Short Term General Hospitals         */
     @16104    f0953905    03.  /*Dist Hosp By 05 - 14 Services    Short Term General Hospitals         */
     @16107    f0953900    03.  /*Dist Hosp By 05 - 14 Services    Short Term General Hospitals         */
     @16110    f0953995    03.  /*Dist Hosp By 05 - 14 Services    Short Term General Hospitals         */
     @16113    f0954007    03.  /*Dist Hosp By 05 - 14 Services    ST Non-Gen + Long Term Hosps         */
     @16116    f0954005    03.  /*Dist Hosp By 05 - 14 Services    ST Non-Gen + Long Term Hosps         */
     @16119    f0954000    03.  /*Dist Hosp By 05 - 14 Services    ST Non-Gen + Long Term Hosps         */
     @16122    f0954095    03.  /*Dist Hosp By 05 - 14 Services    ST Non-Gen + Long Term Hosps         */
     @16125    f0954107    03.  /*Dist Hosp By 15 - 24 Services    Short Term General Hospitals         */
     @16128    f0954105    03.  /*Dist Hosp By 15 - 24 Services    Short Term General Hospitals         */
     @16131    f0954100    03.  /*Dist Hosp By 15 - 24 Services    Short Term General Hospitals         */
     @16134    f0954195    03.  /*Dist Hosp By 15 - 24 Services    Short Term General Hospitals         */
     @16137    f0954207    03.  /*Dist Hosp By 15 - 24 Services    ST Non-Gen + Long Term Hosps         */
     @16140    f0954205    03.  /*Dist Hosp By 15 - 24 Services    ST Non-Gen + Long Term Hosps         */
     @16143    f0954200    03.  /*Dist Hosp By 15 - 24 Services    ST Non-Gen + Long Term Hosps         */
     @16146    f0954295    03.  /*Dist Hosp By 15 - 24 Services    ST Non-Gen + Long Term Hosps         */
     @16149    f0954307    03.  /*Dist Hosp By 25+ Services        Short Term General Hospitals         */
     @16152    f0954305    03.  /*Dist Hosp By 25+ Services        Short Term General Hospitals         */
     @16155    f0954300    03.  /*Dist Hosp By 25+ Services        Short Term General Hospitals         */
     @16158    f0954395    03.  /*Dist Hosp By 25+ Services        Short Term General Hospitals         */
     @16161    f0954407    03.  /*Dist Hosp By 25+ Services        ST Non-Gen + Long Term Hosps         */
     @16164    f0954405    03.  /*Dist Hosp By 25+ Services        ST Non-Gen + Long Term Hosps         */
     @16167    f0954400    03.  /*Dist Hosp By 25+ Services        ST Non-Gen + Long Term Hosps         */
     @16170    f0954495    03.  /*Dist Hosp By 25+ Services        ST Non-Gen + Long Term Hosps         */
     @16173    f1321108    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16178    f1321107    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16183    f1321106    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16188    f1321105    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16193    f1321104    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16198    f1321103    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16203    f1321102    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16208    f1321101    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16213    f1321100    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16218    f1321208    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16223    f1321207    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16228    f1321206    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16233    f1321205    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16238    f1321204    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16243    f1321203    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16248    f1321202    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16253    f1321201    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16258    f1321200    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16263    f1321308    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16268    f1321307    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16273    f1321306    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16278    f1321305    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16283    f1321304    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16288    f1321303    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16293    f1321302    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16298    f1321301    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16303    f1321300    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16308    f1321508    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16313    f1321507    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16318    f1321506    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16323    f1321505    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16328    f1321504    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16333    f1321503    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16338    f1321502    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16343    f1321501    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16348    f1321500    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16353    f1321608    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16358    f1321607    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16363    f1321606    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16368    f1321605    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16373    f1321604    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16378    f1321603    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16383    f1321602    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16388    f1321601    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16393    f1321600    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16398    f1321708    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16403    f1321707    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16408    f1321706    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16413    f1321705    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16418    f1321704    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16423    f1321703    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16428    f1321702    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16433    f1321701    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16438    f1321700    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16443    f1321408    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16448    f1321407    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16453    f1321406    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16458    f1321405    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16463    f1321404    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16468    f1321403    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16473    f1321402    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16478    f1321401    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16483    f1321400    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16488    f1321808    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16493    f1321807    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16498    f1321806    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16503    f1321805    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16508    f1321804    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16513    f1321803    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16518    f1321802    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16523    f1321801    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16528    f1321800    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16533    f1321908    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16538    f1321907    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16543    f1321906    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16548    f1321905    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16553    f1321904    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16558    f1321903    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16563    f1321902    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16568    f1321901    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16573    f1321900    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16578    f1322008    05.  /*# Hospices                       Certified Medicare Providers         */
     @16583    f1322007    05.  /*# Hospices                       Certified Medicare Providers         */
     @16588    f1322006    05.  /*# Hospices                       Certified Medicare Providers         */
     @16593    f1322005    05.  /*# Hospices                       Certified Medicare Providers         */
     @16598    f1322004    05.  /*# Hospices                       Certified Medicare Providers         */
     @16603    f1322003    05.  /*# Hospices                       Certified Medicare Providers         */
     @16608    f1322002    05.  /*# Hospices                       Certified Medicare Providers         */
     @16613    f1322001    05.  /*# Hospices                       Certified Medicare Providers         */
     @16618    f1322000    05.  /*# Hospices                       Certified Medicare Providers         */
     @16623    f1322108    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16628    f1322107    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16633    f1322106    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16638    f1322105    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16643    f1322104    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16648    f1322103    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16653    f1322102    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16658    f1322101    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16663    f1322100    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16668    f1332008    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16673    f1332007    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16678    f1332006    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16683    f1332005    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16688    f1332004    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16693    f1332003    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16698    f1332002    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16703    f1332001    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16708    f1332000    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16713    f1406604    03.  /*# PPO's by Headquarter Location                                       */
     @16716    f0969104    03.  /*# HMO's by Headquarter Location                                       */
     @16719    f0969103    03.  /*# HMO's by Headquarter Location                                       */
     @16722    f0969102    03.  /*# HMO's by Headquarter Location                                       */
     @16725    f0969101    03.  /*# HMO's by Headquarter Location                                       */
     @16728    f0969100    03.  /*# HMO's by Headquarter Location                                       */
     @16731    f0969199    03.  /*# HMO's by Headquarter Location                                       */
     @16734    f0969198    03.  /*# HMO's by Headquarter Location                                       */
     @16737    f0969197    03.  /*# HMO's by Headquarter Location                                       */
     @16740    f0969196    03.  /*# HMO's by Headquarter Location                                       */
     @16743    f0969195    03.  /*# HMO's by Headquarter Location                                       */
     @16746    f0969194    03.  /*# HMO's by Headquarter Location                                       */
     @16749    f0969193    02.  /*# HMO's by Headquarter Location                                       */
     @16751    f0969192    02.  /*# HMO's by Headquarter Location                                       */
     @16753    f0969191    02.  /*# HMO's by Headquarter Location                                       */
     @16755    f0969190    02.  /*# HMO's by Headquarter Location                                       */
     @16757    f0969189    02.  /*# HMO's by Headquarter Location                                       */
     @16759    f0969188    02.  /*# HMO's by Headquarter Location                                       */
     @16761    f0969187    02.  /*# HMO's by Headquarter Location                                       */
     @16763    f0969186    02.  /*# HMO's by Headquarter Location                                       */
     @16765    f0969185    02.  /*# HMO's by Headquarter Location                                       */
     @16767    f0969184    02.  /*# HMO's by Headquarter Location                                       */
     @16769    f0969183    02.  /*# HMO's by Headquarter Location                                       */
     @16771    f0969182    02.  /*# HMO's by Headquarter Location                                       */
     @16773    f0969181    02.  /*# HMO's by Headquarter Location                                       */
     @16775    f0969180    02.  /*# HMO's by Headquarter Location                                       */
     @16777    f0969179    02.  /*# HMO's by Headquarter Location                                       */
     @16779    f0969178    02.  /*# HMO's by Headquarter Location                                       */
     @16781    f0969177    02.  /*# HMO's by Headquarter Location                                       */
     @16783    f0969176    02.  /*# HMO's by Headquarter Location                                       */
     @16785    f0954507    08.  /*Inpatient Days                   Incl Nurs Home;Total Hosp            */
     @16793    f0954506    08.  /*Inpatient Days                   Incl Nurs Home;Total Hosp            */
     @16801    f0954505    08.  /*Inpatient Days                   Incl Nurs Home;Total Hosp            */
     @16809    f0954504    08.  /*Inpatient Days                   Incl Nurs Home;Total Hosp            */
     @16817    f0954503    08.  /*Inpatient Days                   Incl Nurs Home;Total Hosp            */
     @16825    f0954607    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16832    f0954606    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16839    f0954605    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16846    f0954604    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16853    f0954603    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16860    f0954602    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16867    f0954601    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16874    f0954600    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16881    f0954695    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16888    f0954707    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16895    f0954706    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16902    f0954705    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16909    f0954704    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16916    f0954703    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16923    f0954702    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16930    f0954701    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16937    f0954700    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16944    f0954795    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16951    f1318807    06.  /*Inptn Days in ST Psychiatric     Short Term Hospitals                 */
     @16957    f1318907    06.  /*Inptn Days in ST Rehabilitation  Short Term Hospitals                 */
     @16963    f1319007    06.  /*Inptn Days in ST Chldrn's Psych  Short Term Hospitals                 */
     @16969    f1412007    06.  /*Inptn Days in ST Acute LT Care   Short Term Hospitals                 */
     @16975    f1068407    07.  /*Inptn Days in LT Gen Med/Surg    Long Term Hospitals                  */
     @16982    f1068507    07.  /*Inptn Days in LT Psychiatric     Long Term Hospitals                  */
     @16989    f1068607    07.  /*Inptn Days in LT Rehabilitation  Long Term Hospitals                  */
     @16996    f1068707    07.  /*Inptn Day in LT Chronic Disease  Long Term Hospitals                  */
     @17003    f1068907    07.  /*Inptn Day in LT Inst/Ment Retrd  Long Term Hospitals                  */
     @17010    f1069007    07.  /*Inptn Days in LT Chldrn's Psych  Long Term Hospitals                  */
     @17017    f1412107    06.  /*Inptn Days in LT Acute LT Care   Long Term Hospitals                  */
     @17023    f0954807    07.  /*Inptn Days in Short Term Comm                                         */
     @17030    f0954805    07.  /*Inptn Days in Short Term Comm                                         */
     @17037    f0954800    07.  /*Inptn Days in Short Term Comm                                         */
     @17044    f0954895    07.  /*Inptn Days in Short Term Comm                                         */
     @17051    f0955207    07.  /*Inpatient Days in VA Hosps       Veterans Hospitals                   */
     @17058    f1405607    07.  /*Nurs Home Inpatient Days         Total Hospitals                      */
     @17065    f1405606    07.  /*Nurs Home Inpatient Days         Total Hospitals                      */
     @17072    f1405605    07.  /*Nurs Home Inpatient Days         Total Hospitals                      */
     @17079    f1405604    07.  /*Nurs Home Inpatient Days         Total Hospitals                      */
     @17086    f1405603    07.  /*Nurs Home Inpatient Days         Total Hospitals                      */
     @17093    f1405707    07.  /*Nurs Home Inpatient Days, STGEN  Short Term General Hospitals         */
     @17100    f1405706    07.  /*Nurs Home Inpatient Days, STGEN  Short Term General Hospitals         */
     @17107    f1405705    07.  /*Nurs Home Inpatient Days, STGEN  Short Term General Hospitals         */
     @17114    f1405704    07.  /*Nurs Home Inpatient Days, STGEN  Short Term General Hospitals         */
     @17121    f1405703    07.  /*Nurs Home Inpatient Days, STGEN  Short Term General Hospitals         */
     @17128    f1405807    07.  /*Nurs Home Inptn Days, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @17135    f1405806    07.  /*Nurs Home Inptn Days, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @17142    f1405805    07.  /*Nurs Home Inptn Days, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @17149    f1405804    07.  /*Nurs Home Inptn Days, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @17156    f1405803    07.  /*Nurs Home Inptn Days, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @17163    f1031307    06.  /*# Tot Fac Medicare Inpat Dchrg   Short Term General Hospitals         */
     @17169    f1031305    06.  /*# Tot Fac Medicare Inpat Dchrg   Short Term General Hospitals         */
     @17175    f1031300    06.  /*# Tot Fac Medicare Inpat Dchrg   Short Term General Hospitals         */
     @17181    f1031395    06.  /*# Tot Fac Medicare Inpat Dchrg   Short Term General Hospitals         */
     @17187    f1031407    06.  /*# Tot Fac Medicare Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @17193    f1031405    06.  /*# Tot Fac Medicare Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @17199    f1031400    06.  /*# Tot Fac Medicare Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @17205    f1031495    06.  /*# Tot Fac Medicare Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @17211    f1031507    06.  /*# Tot Fac Medicaid Inpat Dchrg   Short Term General Hospitals         */
     @17217    f1031505    06.  /*# Tot Fac Medicaid Inpat Dchrg   Short Term General Hospitals         */
     @17223    f1031500    06.  /*# Tot Fac Medicaid Inpat Dchrg   Short Term General Hospitals         */
     @17229    f1031595    06.  /*# Tot Fac Medicaid Inpat Dchrg   Short Term General Hospitals         */
     @17235    f1031607    06.  /*# Tot Fac Medicaid Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @17241    f1031605    06.  /*# Tot Fac Medicaid Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @17247    f1031600    06.  /*# Tot Fac Medicaid Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @17253    f1031695    06.  /*# Tot Fac Medicaid Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @17259    f1139107    03.  /*Dist Hosp By 00 - 39% Util Rate  Short Term General Hospitals         */
     @17262    f1139105    03.  /*Dist Hosp By 00 - 39% Util Rate  Short Term General Hospitals         */
     @17265    f1139100    03.  /*Dist Hosp By 00 - 39% Util Rate  Short Term General Hospitals         */
     @17268    f1139195    03.  /*Dist Hosp By 00 - 39% Util Rate  Short Term General Hospitals         */
     @17271    f1139207    03.  /*Dist Hosp By 40 - 59% Util Rate  Short Term General Hospitals         */
     @17274    f1139205    03.  /*Dist Hosp By 40 - 59% Util Rate  Short Term General Hospitals         */
     @17277    f1139200    03.  /*Dist Hosp By 40 - 59% Util Rate  Short Term General Hospitals         */
     @17280    f1139295    03.  /*Dist Hosp By 40 - 59% Util Rate  Short Term General Hospitals         */
     @17283    f1139307    03.  /*Dist Hosp By 60 - 79% Util Rate  Short Term General Hospitals         */
     @17286    f1139305    03.  /*Dist Hosp By 60 - 79% Util Rate  Short Term General Hospitals         */
     @17289    f1139300    03.  /*Dist Hosp By 60 - 79% Util Rate  Short Term General Hospitals         */
     @17292    f1139395    03.  /*Dist Hosp By 60 - 79% Util Rate  Short Term General Hospitals         */
     @17295    f1139407    03.  /*Dist Hosp By 80+% Util Rate      Short Term General Hospitals         */
     @17298    f1139405    03.  /*Dist Hosp By 80+% Util Rate      Short Term General Hospitals         */
     @17301    f1139400    03.  /*Dist Hosp By 80+% Util Rate      Short Term General Hospitals         */
     @17304    f1139495    03.  /*Dist Hosp By 80+% Util Rate      Short Term General Hospitals         */
     @17307    f0956607    08.  /*Outpat Visits in ST Gen Hosp     Emer Dept + Other OP Visits          */
     @17315    f0956606    08.  /*Outpat Visits in ST Gen Hosp     Emer Room + Other OP Visits          */
     @17323    f0956605    08.  /*Outpat Visits in ST Gen Hosp     Emer Room + Other OP Visits          */
     @17331    f0956604    08.  /*Outpat Visits in ST Gen Hosp     Emer Room + Other OP Visits          */
     @17339    f0956603    08.  /*Outpat Visits in ST Gen Hosp     Emer Room + Other OP Visits          */
     @17347    f0956602    08.  /*Outpat Visits in ST Gen Hosp     Emer Room + Other OP Visits          */
     @17355    f0956601    08.  /*Outpat Visits in ST Gen Hosp     Emer Room + Other OP Visits          */
     @17363    f0956600    08.  /*Outpat Visits in ST Gen Hosp     Emer Room + Other OP Visits          */
     @17371    f0956695    08.  /*Outpat Visits in ST Gen Hosp                                          */
     @17379    f0956707    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Dept + Other OP Visits          */
     @17387    f0956706    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Dept + Other OP Visits          */
     @17395    f0956705    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Room + Other OP Visits          */
     @17403    f0956704    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Room + Other OP Visits          */
     @17411    f0956703    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Room + Other OP Visits          */
     @17419    f0956702    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Room + Other OP Visits          */
     @17427    f0956701    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Room + Other OP Visits          */
     @17435    f0956700    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Room + Other OP Visits          */
     @17443    f0956795    08.  /*Outpat Visits in ST Non-Gen Hsp                                       */
     @17451    f0956807    08.  /*Outpat Visits in Long Term Hosp  Emer Dept + Other OP Visits          */
     @17459    f0956806    08.  /*Outpat Visits in Long Term Hosp  Emer Dept + Other OP Visits          */
     @17467    f0956805    08.  /*Outpat Visits in Long Term Hosp  Emer Room + Other OP Visits          */
     @17475    f0956804    08.  /*Outpat Visits in Long Term Hosp  Emer Room + Other OP Visits          */
     @17483    f0956803    08.  /*Outpat Visits in Long Term Hosp  Emer Room + Other OP Visits          */
     @17491    f0956802    08.  /*Outpat Visits in Long Term Hosp  Emer Room + Other OP Visits          */
     @17499    f0956801    08.  /*Outpat Visits in Long Term Hosp  Emer Room + Other OP Visits          */
     @17507    f0956800    08.  /*Outpat Visits in Long Term Hosp  Emer Room + Other OP Visits          */
     @17515    f0956895    08.  /*Outpat Visits in Long Term Hosp                                       */
     @17523    f0957107    08.  /*Outpatient Visits in VA Hosp     Emer Dept + Other OP Visits          */
     @17531    f0957207    08.  /*Emergency Department Visits      Short Term General Hospitals         */
     @17539    f0957206    08.  /*Emergency Department Visits      Short Term General Hospitals         */
     @17547    f0957205    08.  /*Emergency Room Visits            Short Term General Hospitals         */
     @17555    f0957204    08.  /*Emergency Room Visits            Short Term General Hospitals         */
     @17563    f0957203    08.  /*Emergency Room Visits            Short Term General Hospitals         */
     @17571    f0957202    08.  /*Emergency Room Visits            Short Term General Hospitals         */
     @17579    f0957201    08.  /*Emergency Room Visits            Short Term General Hospitals         */
     @17587    f0957200    08.  /*Emergency Room Visits            Short Term General Hospitals         */
     @17595    f0957295    08.  /*Emergency Outpatient Visits      Short Term General Hospitals         */
     @17603    f0957407    08.  /*Emergency Department Visits      ST Non-Gen + Long Term Hosps         */
     @17611    f0957406    08.  /*Emergency Department Visits      ST Non-Gen + Long Term Hosps         */
     @17619    f0957405    08.  /*Emergency Room Visits            ST Non-Gen + Long Term Hosps         */
     @17627    f0957404    08.  /*Emergency Room Visits            ST Non-Gen + Long Term Hosps         */
     @17635    f0957403    08.  /*Emergency Room Visits            ST Non-Gen + Long Term Hosps         */
     @17643    f0957402    08.  /*Emergency Room Visits            ST Non-Gen + Long Term Hosps         */
     @17651    f0957401    08.  /*Emergency Room Visits            ST Non-Gen + Long Term Hosps         */
     @17659    f0957400    08.  /*Emergency Room Visits            ST Non-Gen + Long Term Hosps         */
     @17667    f0957495    08.  /*Emergency Outpatient Visits      ST Non-Gen + Long Term Hosps         */
     @17675    f0957507    08.  /*Outpatient Visits - Other        Short Term General Hospitals         */
     @17683    f0957505    08.  /*Outpatient Visits - Other        Short Term General Hospitals         */
     @17691    f0957500    08.  /*Outpatient Visits - Other        Short Term General Hospitals         */
     @17699    f0957595    08.  /*Outpatient Visits - Other        Short Term General Hospitals         */
     @17707    f0957607    08.  /*Outpatient Visits - Other        ST Non-Gen + Long Term Hosps         */
     @17715    f0957605    08.  /*Outpatient Visits - Other        ST Non-Gen + Long Term Hosps         */
     @17723    f0957600    08.  /*Outpatient Visits - Other        ST Non-Gen + Long Term Hosps         */
     @17731    f0957695    08.  /*Outpatient Visits - Other        ST Non-Gen + Long Term Hosps         */
     @17739    f0957707    09.  /*Total Medicare Inpatient Days    Short Term General Hospitals         */
     @17748    f0957705    09.  /*Total Medicare Inpatient Days    Short Term General Hospitals         */
     @17757    f0957700    09.  /*Total Medicare Inpatient Days    Short Term General Hospitals         */
     @17766    f0957795    09.  /*Total Medicare Inpatient Days    Short Term General Hospitals         */
     @17775    f0957807    09.  /*Total Medicare Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17784    f0957805    09.  /*Total Medicare Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17793    f0957800    09.  /*Total Medicare Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17802    f0957895    09.  /*Total Medicare Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17811    f0970607    08.  /*Total Medicaid Inpatient Days    Short Term General Hospitals         */
     @17819    f0970605    08.  /*Total Medicaid Inpatient Days    Short Term General Hospitals         */
     @17827    f0970600    08.  /*Total Medicaid Inpatient Days    Short Term General Hospitals         */
     @17835    f0970695    08.  /*Total Medicaid Inpatient Days    Short Term General Hospitals         */
     @17843    f0958007    08.  /*Total Medicaid Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17851    f0958005    08.  /*Total Medicaid Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17859    f0958000    08.  /*Total Medicaid Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17867    f0958095    08.  /*Total Medicaid Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17875    f0958307    06.  /*# Surgical Operations, Inpatnt   Short Term General Hospitals         */
     @17881    f0958305    06.  /*# Surgical Operations, Inpatnt   Short Term General Hospitals         */
     @17887    f0958300    06.  /*# Surgical Operations, Inpatnt   Short Term General Hospitals         */
     @17893    f0958395    06.  /*# Surgical Operations, Inpatnt   Short Term General Hospitals         */
     @17899    f0958407    06.  /*# Surgical Operations, Inpatnt   ST Non-Gen + Long Term Hosps         */
     @17905    f0958405    06.  /*# Surgical Operations, Inpatnt   ST Non-Gen + Long Term Hosps         */
     @17911    f0958400    06.  /*# Surgical Operations, Inpatnt   ST Non-Gen + Long Term Hosps         */
     @17917    f0958495    06.  /*# Surgical Operations, Inpatnt   ST Non-Gen + Long Term Hosps         */
     @17923    f0970707    06.  /*# Surgical Operations, Outpatnt  Short Term General Hospitals         */
     @17929    f0970705    06.  /*# Surgical Operations, Outpatnt  Short Term General Hospitals         */
     @17935    f0970700    06.  /*# Surgical Operations, Outpatnt  Short Term General Hospitals         */
     @17941    f0970795    06.  /*# Surgical Operations, Outpatnt  Short Term General Hospitals         */
     @17947    f0958607    06.  /*# Surgical Operations, Outpatnt  ST Non-Gen + Long Term Hosps         */
     @17953    f0958605    06.  /*# Surgical Operations, Outpatnt  ST Non-Gen + Long Term Hosps         */
     @17959    f0958600    06.  /*# Surgical Operations, Outpatnt  ST Non-Gen + Long Term Hosps         */
     @17965    f0958695    06.  /*# Surgical Operations, Outpatnt  ST Non-Gen + Long Term Hosps         */
     @17971    f0958707    06.  /*# Surgical Operations, Total     Short Term General Hospitals         */
     @17977    f0958705    06.  /*# Surgical Operations, Total     Short Term General Hospitals         */
     @17983    f0958700    06.  /*# Surgical Operations, Total     Short Term General Hospitals         */
     @17989    f0958795    06.  /*# Surgical Operations, Total     Short Term General Hospitals         */
     @17995    f0958907    06.  /*# Surgical Operations, Total     ST Non-Gen + Long Term Hosps         */
     @18001    f0958905    06.  /*# Surgical Operations, Total     ST Non-Gen + Long Term Hosps         */
     @18007    f0958900    06.  /*# Surgical Operations, Total     ST Non-Gen + Long Term Hosps         */
     @18013    f0958995    06.  /*# Surgical Operations, Total     ST Non-Gen + Long Term Hosps         */
     @18019    f0959207    06.  /*# Surgical Operations, Total     Veterans Hospitals                   */
     @18025    f1331807    03.  /*# Operating Rooms                Short Term General Hospitals         */
     @18028    f1331805    03.  /*# Operating Rooms                Short Term General Hospitals         */
     @18031    f1331800    03.  /*# Operating Rooms                Short Term General Hospitals         */
     @18034    f1331907    03.  /*# Operating Rooms                ST Non-Gen + Long Term Hosps         */
     @18037    f1331905    03.  /*# Operating Rooms                ST Non-Gen + Long Term Hosps         */
     @18040    f1331900    03.  /*# Operating Rooms                ST Non-Gen + Long Term Hosps         */
     @18043    f1392907    04.  /*# Airborne Infection Isol Rooms  Short Term General Hospitals         */
     @18047    f1392905    04.  /*# Airborne Infection Isol Rooms  Short Term General Hospitals         */
     @18051    f1393707    04.  /*# Airborne Infection Isol Rooms  ST Non-Gen + Long Term Hosps         */
     @18055    f1393705    04.  /*# Airborne Infection Isol Rooms  ST Non-Gen + Long Term Hosps         */
     @18059    f0959307    03.  /*# Facilities Reporting Expenses  Short Term General Hospitals         */
     @18062    f0959305    03.  /*# Facilities Reporting Expenses  Short Term General Hospitals         */
     @18065    f0959300    03.  /*# Facilities Reporting Expenses  Short Term General Hospitals         */
     @18068    f0959395    03.  /*# Facilities Reporting Expenses  Short Term General Hospitals         */
     @18071    f0959407    03.  /*# Facilities Reporting Expenses  ST Non-Gen + Long Term Hosps         */
     @18074    f0959405    03.  /*# Facilities Reporting Expenses  ST Non-Gen + Long Term Hosps         */
     @18077    f0959400    03.  /*# Facilities Reporting Expenses  ST Non-Gen + Long Term Hosps         */
     @18080    f0959495    03.  /*# Facilities Reporting Expenses  ST Non-Gen + Long Term Hosps         */
     @18083    f0959507    03.  /*# Facilities Reporting Expenses  Veterans Hospitals                   */
     @18086    f0959607    09.  /*Total Rep Facility Exp (1000's)  In Thousands, ST Gen Hosps           */
     @18095    f0959605    09.  /*Total Rep Facility Exp (1000's)  In Thousands, ST Gen Hosps           */
     @18104    f0959600    09.  /*Total Rep Facility Exp (1000's)  In Thousands, ST Gen Hosps           */
     @18113    f0959695    09.  /*Total Rep Facility Exp (1000's)  In Thousands, ST Gen Hosps           */
     @18122    f0959707    09.  /*Total Rep Facility Exp (1000's)  In Thousands, STNG/LT Hosps          */
     @18131    f0959705    09.  /*Total Rep Facility Exp (1000's)  In Thousands, STNG/LT Hosps          */
     @18140    f0959700    09.  /*Total Rep Facility Exp (1000's)  In Thousands, STNG/LT Hosps          */
     @18149    f0959795    09.  /*Total Rep Facility Exp (1000's)  In Thousands, STNG/LT Hosps          */
     @18158    f0959807    09.  /*Total Rep Facility Exp (1000's)  In Thousands, Veterans Hosps         */
     @18167    f0960707    03.  /*# Facs Reporting Payroll Expens  Short Term General Hospitals         */
     @18170    f0960705    03.  /*# Facs Reporting Payroll Expens  Short Term General Hospitals         */
     @18173    f0960700    03.  /*# Facs Reporting Payroll Expens  Short Term General Hospitals         */
     @18176    f0960795    03.  /*# Facs Reporting Payroll Expens  Short Term General Hospitals         */
     @18179    f0960807    03.  /*# Facs Reporting Payroll Expens  ST Non-Gen + Long Term Hosps         */
     @18182    f0960805    03.  /*# Facs Reporting Payroll Expens  ST Non-Gen + Long Term Hosps         */
     @18185    f0960800    03.  /*# Facs Reporting Payroll Expens  ST Non-Gen + Long Term Hosps         */
     @18188    f0960895    03.  /*# Facs Reporting Payroll Expens  ST Non-Gen + Long Term Hosps         */
     @18191    f0960907    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, ST Gen Hosps           */
     @18200    f0960905    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, ST Gen Hosps           */
     @18209    f0960900    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, ST Gen Hosps           */
     @18218    f0960995    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, ST Gen Hosps           */
     @18227    f0961007    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, STNG/LT Hosps          */
     @18236    f0961005    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, STNG/LT Hosps          */
     @18245    f0961000    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, STNG/LT Hosps          */
     @18254    f0961095    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, STNG/LT Hosps          */
     @18263    f1319409    06.2 /*Medicare Adv PtA Aged Pymt Rate  (.01)                                */
     @18269    f1319408    06.2 /*Medicare Adv PtA Aged Pymt Rate  (.01)                                */
     @18275    f1319407    06.2 /*Medicare Adv PtA Aged Pymt Rate  (.01)                                */
     @18281    f1319406    06.2 /*Medicare Adv PtA Aged Pymt Rate  (.01)                                */
     @18287    f1319405    06.2 /*Medicare Adv PtA Aged Pymt Rate  (.01)                                */
     @18293    f1319404    06.2 /*Medcre+Choice PtA Aged Pmt Rate  (.01)                                */
     @18299    f1319403    06.2 /*Medcre+Choice PtA Aged Pmt Rate  (.01)                                */
     @18305    f1319402    06.2 /*Medcre+Choice PtA Aged Pmt Rate  (.01)                                */
     @18311    f1319401    06.2 /*Medcre+Choice PtA Aged Pmt Rate  (.01)                                */
     @18317    f1319400    06.2 /*Medcre+Choice PtA Aged Pmt Rate  (.01)                                */
     @18323    f1319499    06.2 /*Medcre+Choice PtA Aged Pmt Rate  (.01)                                */
     @18329    f1319498    06.2 /*Medcre+Choice PtA Aged Pmt Rate  (.01)                                */
     @18335    f1319497    06.2 /*Medcre+Choice PtA Aged Pmt Rate  (.01)                                */
     @18341    f1319509    06.2 /*Medicare Adv PtB Aged Pymt Rate  (.01)                                */
     @18347    f1319508    06.2 /*Medicare Adv PtB Aged Pymt Rate  (.01)                                */
     @18353    f1319507    06.2 /*Medicare Adv PtB Aged Pymt Rate  (.01)                                */
     @18359    f1319506    06.2 /*Medicare Adv PtB Aged Pymt Rate  (.01)                                */
     @18365    f1319505    06.2 /*Medicare Adv PtB Aged Pymt Rate  (.01)                                */
     @18371    f1319504    06.2 /*Medcre+Choice PtB Aged Pmt Rate  (.01)                                */
     @18377    f1319503    06.2 /*Medcre+Choice PtB Aged Pmt Rate  (.01)                                */
     @18383    f1319502    06.2 /*Medcre+Choice PtB Aged Pmt Rate  (.01)                                */
     @18389    f1319501    06.2 /*Medcre+Choice PtB Aged Pmt Rate  (.01)                                */
     @18395    f1319500    06.2 /*Medcre+Choice PtB Aged Pmt Rate  (.01)                                */
     @18401    f1319599    06.2 /*Medcre+Choice PtB Aged Pmt Rate  (.01)                                */
     @18407    f1319598    06.2 /*Medcre+Choice PtB Aged Pmt Rate  (.01)                                */
     @18413    f1319597    06.2 /*Medcre+Choice PtB Aged Pmt Rate  (.01)                                */
     @18419    f1319605    07.2 /*Medcre Adv PtA&B Aged Pymt Rate  (.01)                                */
     @18426    f1319604    07.2 /*Medcre+Chce PtA&B Aged Pmt Rate  (.01) Medicare+Choice                */
     @18433    f1319603    06.2 /*Medcre+Chce PtA&B Aged Pmt Rate  (.01) Medicare+Choice                */
     @18439    f1319602    06.2 /*Medcre+Chce PtA&B Aged Pmt Rate  (.01) Medicare+Choice                */
     @18445    f1319601    06.2 /*Medcre+Chce PtA&B Aged Pmt Rate  (.01) Medicare+Choice                */
     @18451    f1319600    06.2 /*Medcre+Chce PtA&B Aged Pmt Rate  (.01) Medicare+Choice                */
     @18457    f1319699    06.2 /*Medcre+Chce PtA&B Aged Pmt Rate  (.01) Medicare+Choice                */
     @18463    f1319698    06.2 /*Medcre+Chce PtA&B Aged Pmt Rate  (.01) Medicare+Choice                */
     @18469    f1319697    06.2 /*Medcre+Chce PtA&B Aged Pmt Rate  (.01) Medicare+Choice                */
     @18475    f1198409    08.  /*Population Estimate              Whole Numbers                        */
     @18483    f1198408    08.  /*Population Estimate              Whole Numbers                        */
     @18491    f1198407    08.  /*Population Estimate              Whole Numbers                        */
     @18499    f1198406    08.  /*Population Estimate              Whole Numbers                        */
     @18507    f1198405    08.  /*Population Estimate              Whole Numbers                        */
     @18515    f1198404    08.  /*Population Estimate              Whole Numbers                        */
     @18523    f1198403    08.  /*Population Estimate              Whole Numbers                        */
     @18531    f1198402    08.  /*Population Estimate              Whole Numbers                        */
     @18539    f1198401    08.  /*Population Estimate              Whole Numbers                        */
     @18547    f0453000    08.  /*Census Population                Whole Numbers                        */
     @18555    f1198499    08.  /*Population Estimate              Whole Numbers                        */
     @18563    f1198498    08.  /*Population Estimate              Whole Numbers                        */
     @18571    f1198497    08.  /*Population Estimate              Whole Numbers                        */
     @18579    f1198496    08.  /*Population Estimate              Whole Numbers                        */
     @18587    f1198495    08.  /*Population Estimate              Whole Numbers                        */
     @18595    f1198494    08.  /*Population Estimate              Whole Numbers                        */
     @18603    f1198493    08.  /*Population Estimate              Whole Numbers                        */
     @18611    f1198492    08.  /*Population Estimate              Whole Numbers                        */
     @18619    f1198491    08.  /*Population Estimate              Whole Numbers                        */
     @18627    f1139790    05.  /*Census Population (100's)        In Hundreds                          */
     @18632    f0403988    05.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @18637    f0403987    05.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @18642    f0403986    05.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @18647    f0403985    06.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @18653    f0403984    06.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @18659    f0403983    06.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @18665    f0403982    06.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @18671    f1139780    05.  /*Census Population (100's)        In Hundreds                          */
     @18676    f0017970    07.  /*Census Population (100's)        In Hundreds (Total Resident)         */
     @18683    f1139860    05.  /*Census Population (100's)        In Hundreds                          */
     @18688    f1139850    05.  /*Census Population (100's)        In Hundreds                          */
     @18693    f1139840    05.  /*Census Population (100's)        In Hundreds                          */
     @18698    f1318207    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @18707    f1318206    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @18716    f1318205    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @18725    f1318204    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @18734    f1318203    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @18743    f1318202    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @18752    f1318201    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @18761    f1318200    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @18770    f1318295    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @18779    f1390608    07.  /*Pop Total Male                   Whole Numbers, Estimates             */
     @18786    f1390607    07.  /*Pop Total Male                   Whole Numbers, Estimates             */
     @18793    f1390606    07.  /*Pop Total Male                   Whole Numbers, Estimates             */
     @18800    f1390605    07.  /*Pop Total Male                   Whole Numbers, Estimates             */
     @18807    f1390600    07.  /*Pop Total Male                   Whole Numbers, Estimates             */
     @18814    f1390708    07.  /*Pop Total Female                 Whole Numbers, Estimates             */
     @18821    f1390707    07.  /*Pop Total Female                 Whole Numbers, Estimates             */
     @18828    f1390706    07.  /*Pop Total Female                 Whole Numbers, Estimates             */
     @18835    f1390705    07.  /*Pop Total Female                 Whole Numbers, Estimates             */
     @18842    f1390700    07.  /*Pop Total Female                 Whole Numbers, Estimates             */
     @18849    f1390808    07.  /*Pop White Male                   Whole Numbers, Estimates             */
     @18856    f1390807    07.  /*Pop White Male                   Whole Numbers, Estimates             */
     @18863    f1390806    07.  /*Pop White Male                   Whole Numbers, Estimates             */
     @18870    f1390805    07.  /*Pop White Male                   Whole Numbers, Estimates             */
     @18877    f1390800    07.  /*Pop White Male                   Whole Numbers, Estimates             */
     @18884    f1390908    07.  /*Pop White Female                 Whole Numbers, Estimates             */
     @18891    f1390907    07.  /*Pop White Female                 Whole Numbers, Estimates             */
     @18898    f1390906    07.  /*Pop White Female                 Whole Numbers, Estimates             */
     @18905    f1390905    07.  /*Pop White Female                 Whole Numbers, Estimates             */
     @18912    f1390900    07.  /*Pop White Female                 Whole Numbers, Estimates             */
     @18919    f1392608    07.  /*Pop White Non-Hisp/Latino Male   Whole Numbers, Estimates             */
     @18926    f1392607    07.  /*Pop White Non-Hisp/Latino Male   Whole Numbers, Estimates             */
     @18933    f1392606    07.  /*Pop White Non-Hisp/Latino Male   Whole Numbers, Estimates             */
     @18940    f1392605    07.  /*Pop White Non-Hisp/Latino Male   Whole Numbers, Estimates             */
     @18947    f1392600    07.  /*Pop White Non-Hisp/Latino Male   Whole Numbers, Estimates             */
     @18954    f1392708    07.  /*Pop White Non-Hisp/Latino Femle  Whole Numbers, Estimates             */
     @18961    f1392707    07.  /*Pop White Non-Hisp/Latino Femle  Whole Numbers, Estimates             */
     @18968    f1392706    07.  /*Pop White Non-Hisp/Latino Femle  Whole Numbers, Estimates             */
     @18975    f1392705    07.  /*Pop White Non-Hisp/Latino Femle  Whole Numbers, Estimates             */
     @18982    f1392700    07.  /*Pop White Non-Hisp/Latino Femle  Whole Numbers, Estimates             */
     @18989    f1392408    07.  /*Pop White Hispanic/Latino Male   Whole Numbers, Estimates             */
     @18996    f1392407    07.  /*Pop White Hispanic/Latino Male   Whole Numbers, Estimates             */
     @19003    f1392406    07.  /*Pop White Hispanic/Latino Male   Whole Numbers, Estimates             */
     @19010    f1392405    07.  /*Pop White Hispanic/Latino Male   Whole Numbers, Estimates             */
     @19017    f1392400    07.  /*Pop White Hispanic/Latino Male   Whole Numbers, Estimates             */
     @19024    f1392508    07.  /*Pop White Hispanic/Latino Femle  Whole Numbers, Estimates             */
     @19031    f1392507    07.  /*Pop White Hispanic/Latino Femle  Whole Numbers, Estimates             */
     @19038    f1392506    07.  /*Pop White Hispanic/Latino Femle  Whole Numbers, Estimates             */
     @19045    f1392505    07.  /*Pop White Hispanic/Latino Femle  Whole Numbers, Estimates             */
     @19052    f1392500    07.  /*Pop White Hispanic/Latino Femle  Whole Numbers, Estimates             */
     @19059    f1391008    06.  /*Pop Black/African Amer Male      Whole Numbers, Estimates             */
     @19065    f1391007    06.  /*Pop Black/African Amer Male      Whole Numbers, Estimates             */
     @19071    f1391006    06.  /*Pop Black/African Amer Male      Whole Numbers, Estimates             */
     @19077    f1391005    06.  /*Pop Black/African Amer Male      Whole Numbers, Estimates             */
     @19083    f1391000    06.  /*Pop Black/African Amer Male      Whole Numbers, Estimates             */
     @19089    f1391108    06.  /*Pop Black/African Amer Female    Whole Numbers, Estimates             */
     @19095    f1391107    06.  /*Pop Black/African Amer Female    Whole Numbers, Estimates             */
     @19101    f1391106    06.  /*Pop Black/African Amer Female    Whole Numbers, Estimates             */
     @19107    f1391105    06.  /*Pop Black/African Amer Female    Whole Numbers, Estimates             */
     @19113    f1391100    06.  /*Pop Black/African Amer Female    Whole Numbers, Estimates             */
     @19119    f1397908    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Male  Whole Numbers, Estimates             */
     @19125    f1397907    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Male  Whole Numbers, Estimates             */
     @19131    f1397906    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Male  Whole Numbers, Estimates             */
     @19137    f1397905    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Male  Whole Numbers, Estimates             */
     @19143    f1398008    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Fmle  Whole Numbers, Estimates             */
     @19149    f1398007    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Fmle  Whole Numbers, Estimates             */
     @19155    f1398006    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Fmle  Whole Numbers, Estimates             */
     @19161    f1398005    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Fmle  Whole Numbers, Estimates             */
     @19167    f1398108    06.  /*Pop Bl/Afr Hispanic/Latino Male  Whole Numbers, Estimates             */
     @19173    f1398107    06.  /*Pop Bl/Afr Hispanic/Latino Male  Whole Numbers, Estimates             */
     @19179    f1398106    06.  /*Pop Bl/Afr Hispanic/Latino Male  Whole Numbers, Estimates             */
     @19185    f1398105    06.  /*Pop Bl/Afr Hispanic/Latino Male  Whole Numbers, Estimates             */
     @19191    f1398208    06.  /*Pop Bl/Afr Hispanic/Latino Fmle  Whole Numbers, Estimates             */
     @19197    f1398207    06.  /*Pop Bl/Afr Hispanic/Latino Fmle  Whole Numbers, Estimates             */
     @19203    f1398206    06.  /*Pop Bl/Afr Hispanic/Latino Fmle  Whole Numbers, Estimates             */
     @19209    f1398205    06.  /*Pop Bl/Afr Hispanic/Latino Fmle  Whole Numbers, Estimates             */
     @19215    f1391208    06.  /*Pop Am Ind/Alaska Native Male    Whole Numbers, Estimates             */
     @19221    f1391207    06.  /*Pop Am Ind/Alaska Native Male    Whole Numbers, Estimates             */
     @19227    f1391206    06.  /*Pop Am Ind/Alaska Native Male    Whole Numbers, Estimates             */
     @19233    f1391205    06.  /*Pop Am Ind/Alaska Native Male    Whole Numbers, Estimates             */
     @19239    f1391200    06.  /*Pop Am Ind/Alaska Native Male    Whole Numbers, Estimates             */
     @19245    f1391308    06.  /*Pop Am Ind/Alaska Native Female  Whole Numbers, Estimates             */
     @19251    f1391307    06.  /*Pop Am Ind/Alaska Native Female  Whole Numbers, Estimates             */
     @19257    f1391306    06.  /*Pop Am Ind/Alaska Native Female  Whole Numbers, Estimates             */
     @19263    f1391305    06.  /*Pop Am Ind/Alaska Native Female  Whole Numbers, Estimates             */
     @19269    f1391300    06.  /*Pop Am Ind/Alaska Native Female  Whole Numbers, Estimates             */
     @19275    f1391408    06.  /*Pop Asian Male                   Whole Numbers, Estimates             */
     @19281    f1391407    06.  /*Pop Asian Male                   Whole Numbers, Estimates             */
     @19287    f1391406    06.  /*Pop Asian Male                   Whole Numbers, Estimates             */
     @19293    f1391405    06.  /*Pop Asian Male                   Whole Numbers, Estimates             */
     @19299    f1391400    06.  /*Pop Asian Male                   Whole Numbers, Estimates             */
     @19305    f1391608    06.  /*Pop Nat Hawi/Oth Pac Isl Male    Whole Numbers, Estimates             */
     @19311    f1391607    06.  /*Pop Nat Hawi/Oth Pac Isl Male    Whole Numbers, Estimates             */
     @19317    f1391606    06.  /*Pop Nat Hawi/Oth Pac Isl Male    Whole Numbers, Estimates             */
     @19323    f1391605    06.  /*Pop Nat Hawi/Oth Pac Isl Male    Whole Numbers, Estimates             */
     @19329    f1391600    06.  /*Pop Nat Hawi/Oth Pac Isl Male    Whole Numbers, Estimates             */
     @19335    f1391508    06.  /*Pop Asian Female                 Whole Numbers, Estimates             */
     @19341    f1391507    06.  /*Pop Asian Female                 Whole Numbers, Estimates             */
     @19347    f1391506    06.  /*Pop Asian Female                 Whole Numbers, Estimates             */
     @19353    f1391505    06.  /*Pop Asian Female                 Whole Numbers, Estimates             */
     @19359    f1391500    06.  /*Pop Asian Female                 Whole Numbers, Estimates             */
     @19365    f1391708    06.  /*Pop Nat Hawi/Oth Pac Isl Female  Whole Numbers, Estimates             */
     @19371    f1391707    06.  /*Pop Nat Hawi/Oth Pac Isl Female  Whole Numbers, Estimates             */
     @19377    f1391706    06.  /*Pop Nat Hawi/Oth Pac Isl Female  Whole Numbers, Estimates             */
     @19383    f1391705    06.  /*Pop Nat Hawi/Oth Pac Isl Female  Whole Numbers, Estimates             */
     @19389    f1391700    06.  /*Pop Nat Hawi/Oth Pac Isl Female  Whole Numbers, Estimates             */
     @19395    f1391808    06.  /*Pop Two or more Races Male       Whole Numbers, Estimates             */
     @19401    f1391807    06.  /*Pop Two or more Races Male       Whole Numbers, Estimates             */
     @19407    f1391806    06.  /*Pop Two or more Races Male       Whole Numbers, Estimates             */
     @19413    f1391805    06.  /*Pop Two or more Races Male       Whole Numbers, Estimates             */
     @19419    f1391800    06.  /*Pop Two or more Races Male       Whole Numbers, Estimates             */
     @19425    f1391908    06.  /*Pop Two or more Races Female     Whole Numbers, Estimates             */
     @19431    f1391907    06.  /*Pop Two or more Races Female     Whole Numbers, Estimates             */
     @19437    f1391906    06.  /*Pop Two or more Races Female     Whole Numbers, Estimates             */
     @19443    f1391905    06.  /*Pop Two or more Races Female     Whole Numbers, Estimates             */
     @19449    f1391900    06.  /*Pop Two or more Races Female     Whole Numbers, Estimates             */
     @19455    f1392008    07.  /*Pop Tot Hispanic/Latino Male     Whole Numbers, Estimates             */
     @19462    f1392007    07.  /*Pop Tot Hispanic/Latino Male     Whole Numbers, Estimates             */
     @19469    f1392006    07.  /*Pop Tot Hispanic/Latino Male     Whole Numbers, Estimates             */
     @19476    f1392005    07.  /*Pop Tot Hispanic/Latino Male     Whole Numbers, Estimates             */
     @19483    f1392000    07.  /*Pop Tot Hispanic/Latino Male     Whole Numbers, Estimates             */
     @19490    f1392108    07.  /*Pop Tot Hispanic/Latino Female   Whole Numbers, Estimates             */
     @19497    f1392107    07.  /*Pop Tot Hispanic/Latino Female   Whole Numbers, Estimates             */
     @19504    f1392106    07.  /*Pop Tot Hispanic/Latino Female   Whole Numbers, Estimates             */
     @19511    f1392105    07.  /*Pop Tot Hispanic/Latino Female   Whole Numbers, Estimates             */
     @19518    f1392100    07.  /*Pop Tot Hispanic/Latino Female   Whole Numbers, Estimates             */
     @19525    f1392208    07.  /*Pop Tot Non-Hisp/Latino Male     Whole Numbers, Estimates             */
     @19532    f1392207    07.  /*Pop Tot Non-Hisp/Latino Male     Whole Numbers, Estimates             */
     @19539    f1392206    07.  /*Pop Tot Non-Hisp/Latino Male     Whole Numbers, Estimates             */
     @19546    f1392205    07.  /*Pop Tot Non-Hisp/Latino Male     Whole Numbers, Estimates             */
     @19553    f1392200    07.  /*Pop Tot Non-Hisp/Latino Male     Whole Numbers, Estimates             */
     @19560    f1392308    07.  /*Pop Tot Non-Hisp/Latino Female   Whole Numbers, Estimates             */
     @19567    f1392307    07.  /*Pop Tot Non-Hisp/Latino Female   Whole Numbers, Estimates             */
     @19574    f1392306    07.  /*Pop Tot Non-Hisp/Latino Female   Whole Numbers, Estimates             */
     @19581    f1392305    07.  /*Pop Tot Non-Hisp/Latino Female   Whole Numbers, Estimates             */
     @19588    f1392300    07.  /*Pop Tot Non-Hisp/Latino Female   Whole Numbers, Estimates             */
     @19595    f0670400    06.  /*Pop Male  < 5                    Table P12, Whole Numbers             */
     @19601    f0670490    06.  /*Pop Male  < 5                    Whole Numbers                        */
     @19607    f0670500    06.  /*Pop Fmle  < 5                    Table P12, Whole Numbers             */
     @19613    f0670590    06.  /*Pop Fmle  < 5                    Whole Numbers                        */
     @19619    f0670600    06.  /*Pop Male  5-9                    Table P12, Whole Numbers             */
     @19625    f0670690    06.  /*Pop Male  5-9                    Whole Numbers                        */
     @19631    f0670700    06.  /*Pop Fmle  5-9                    Table P12, Whole Numbers             */
     @19637    f0670790    06.  /*Pop Fmle  5-9                    Whole Numbers                        */
     @19643    f0670800    06.  /*Pop Male 10-14                   Table P12, Whole Numbers             */
     @19649    f0670890    06.  /*Pop Male 10-14                   Whole Numbers                        */
     @19655    f0670900    06.  /*Pop Fmle 10-14                   Table P12, Whole Numbers             */
     @19661    f0670990    06.  /*Pop Fmle 10-14                   Whole Numbers                        */
     @19667    f0671000    06.  /*Pop Male 15-19                   Table P12, Whole Numbers             */
     @19673    f0671090    06.  /*Pop Male 15-19                   Whole Numbers                        */
     @19679    f0671100    06.  /*Pop Fmle 15-19                   Table P12, Whole Numbers             */
     @19685    f0671190    06.  /*Pop Fmle 15-19                   Whole Numbers                        */
     @19691    f0671200    06.  /*Pop Male 20-24                   Table P12, Whole Numbers             */
     @19697    f0671290    06.  /*Pop Male 20-24                   Whole Numbers                        */
     @19703    f0671300    06.  /*Pop Fmle 20-24                   Table P12, Whole Numbers             */
     @19709    f0671390    06.  /*Pop Fmle 20-24                   Whole Numbers                        */
     @19715    f0671400    06.  /*Pop Male 25-29                   Table P12, Whole Numbers             */
     @19721    f0671490    06.  /*Pop Male 25-29                   Whole Numbers                        */
     @19727    f0671500    06.  /*Pop Fmle 25-29                   Table P12, Whole Numbers             */
     @19733    f0671590    06.  /*Pop Fmle 25-29                   Whole Numbers                        */
     @19739    f0671600    06.  /*Pop Male 30-34                   Table P12, Whole Numbers             */
     @19745    f0671690    06.  /*Pop Male 30-34                   Whole Numbers                        */
     @19751    f0671700    06.  /*Pop Fmle 30-34                   Table P12, Whole Numbers             */
     @19757    f0671790    06.  /*Pop Fmle 30-34                   Whole Numbers                        */
     @19763    f0671800    06.  /*Pop Male 35-44                   Table P12, Whole Numbers             */
     @19769    f0671890    06.  /*Pop Male 35-44                   Whole Numbers                        */
     @19775    f0671900    06.  /*Pop Fmle 35-44                   Table P12, Whole Numbers             */
     @19781    f0671990    06.  /*Pop Fmle 35-44                   Whole Numbers                        */
     @19787    f0672000    06.  /*Pop Male 45-54                   Table P12, Whole Numbers             */
     @19793    f0672090    06.  /*Pop Male 45-54                   Whole Numbers                        */
     @19799    f0672100    06.  /*Pop Fmle 45-54                   Table P12, Whole Numbers             */
     @19805    f0672190    06.  /*Pop Fmle 45-54                   Whole Numbers                        */
     @19811    f0672200    06.  /*Pop Male 55-59                   Table P12, Whole Numbers             */
     @19817    f0672290    06.  /*Pop Male 55-59                   Whole Numbers                        */
     @19823    f0672300    06.  /*Pop Fmle 55-59                   Table P12, Whole Numbers             */
     @19829    f0672390    06.  /*Pop Fmle 55-59                   Whole Numbers                        */
     @19835    f0672400    06.  /*Pop Male 60-64                   Table P12, Whole Numbers             */
     @19841    f0672490    06.  /*Pop Male 60-64                   Whole Numbers                        */
     @19847    f0672500    06.  /*Pop Fmle 60-64                   Table P12, Whole Numbers             */
     @19853    f0672590    06.  /*Pop Fmle 60-64                   Whole Numbers                        */
     @19859    f0672600    06.  /*Pop Male 65-74                   Table P12, Whole Numbers             */
     @19865    f0672690    06.  /*Pop Male 65-74                   Whole Numbers                        */
     @19871    f0672700    06.  /*Pop Fmle 65-74                   Table P12, Whole Numbers             */
     @19877    f0672790    06.  /*Pop Fmle 65-74                   Whole Numbers                        */
     @19883    f1164000    06.  /*Pop Male 75-84                   Table P12, Whole Numbers             */
     @19889    f1164090    06.  /*Pop Male 75-84                   Whole Numbers                        */
     @19895    f1164100    06.  /*Pop Fmle 75-84                   Table P12, Whole Numbers             */
     @19901    f1164190    06.  /*Pop Fmle 75-84                   Whole Numbers                        */
     @19907    f1164200    06.  /*Pop Male > 84                    Table P12, Whole Numbers             */
     @19913    f1164290    06.  /*Pop Male > 84                    Whole Numbers                        */
     @19919    f1164300    06.  /*Pop Fmle > 84                    Table P12, Whole Numbers             */
     @19925    f1164390    06.  /*Pop Fmle > 84                    Whole Numbers                        */
     @19931    f0852200    06.  /*Pop White Male  < 5              Table P12A, Whole Numbers            */
     @19937    f0852290    06.  /*Pop White Male  < 5              Whole Numbers                        */
     @19943    f0851700    06.  /*Pop White Fmle  < 5              Table P12A, Whole Numbers            */
     @19949    f0851790    06.  /*Pop White Fmle  < 5              Whole Numbers                        */
     @19955    f1144300    06.  /*Pop White Male  5-9              Table P12A, Whole Numbers            */
     @19961    f1144390    06.  /*Pop White Male  5-9              Whole Numbers                        */
     @19967    f1144500    06.  /*Pop White Male 10-14             Table P12A, Whole Numbers            */
     @19973    f1144590    06.  /*Pop White Male 10-14             Whole Numbers                        */
     @19979    f1144400    06.  /*Pop White Fmle  5-9              Table P12A, Whole Numbers            */
     @19985    f1144490    06.  /*Pop White Fmle  5-9              Whole Numbers                        */
     @19991    f1144600    06.  /*Pop White Fmle 10-14             Table P12A, Whole Numbers            */
     @19997    f1144690    06.  /*Pop White Fmle 10-14             Whole Numbers                        */
     @20003    f1144700    06.  /*Pop White Male 15-19             Table P12A, Whole Numbers            */
     @20009    f1144790    06.  /*Pop White Male 15-19             Whole Numbers                        */
     @20015    f1144900    06.  /*Pop White Male 20-24             Table P12A, Whole Numbers            */
     @20021    f1144990    06.  /*Pop White Male 20-24             Whole Numbers                        */
     @20027    f1145100    06.  /*Pop White Male 25-29             Table P12A, Whole Numbers            */
     @20033    f1145190    06.  /*Pop White Male 25-29             Whole Numbers                        */
     @20039    f1145300    06.  /*Pop White Male 30-34             Table P12A, Whole Numbers            */
     @20045    f1145390    06.  /*Pop White Male 30-34             Whole Numbers                        */
     @20051    f1145500    06.  /*Pop White Male 35-44             Table P12A, Whole Numbers            */
     @20057    f1145590    06.  /*Pop White Male 35-44             Whole Numbers                        */
     @20063    f1145700    06.  /*Pop White Male 45-54             Table P12A, Whole Numbers            */
     @20069    f1145790    06.  /*Pop White Male 45-54             Whole Numbers                        */
     @20075    f1145900    06.  /*Pop White Male 55-59             Table P12A, Whole Numbers            */
     @20081    f1145990    06.  /*Pop White Male 55-59             Whole Numbers                        */
     @20087    f1144800    06.  /*Pop White Fmle 15-19             Table P12A, Whole Numbers            */
     @20093    f1144890    06.  /*Pop White Fmle 15-19             Whole Numbers                        */
     @20099    f1145000    06.  /*Pop White Fmle 20-24             Table P12A, Whole Numbers            */
     @20105    f1145090    06.  /*Pop White Fmle 20-24             Whole Numbers                        */
     @20111    f1145200    06.  /*Pop White Fmle 25-29             Table P12A, Whole Numbers            */
     @20117    f1145290    06.  /*Pop White Fmle 25-29             Whole Numbers                        */
     @20123    f1145400    06.  /*Pop White Fmle 30-34             Table P12A, Whole Numbers            */
     @20129    f1145490    06.  /*Pop White Fmle 30-34             Whole Numbers                        */
     @20135    f1145600    06.  /*Pop White Fmle 35-44             Table P12A, Whole Numbers            */
     @20141    f1145690    06.  /*Pop White Fmle 35-44             Whole Numbers                        */
     @20147    f1145800    06.  /*Pop White Fmle 45-54             Table P12A, Whole Numbers            */
     @20153    f1145890    06.  /*Pop White Fmle 45-54             Whole Numbers                        */
     @20159    f1146000    06.  /*Pop White Fmle 55-59             Table P12A, Whole Numbers            */
     @20165    f1146090    06.  /*Pop White Fmle 55-59             Whole Numbers                        */
     @20171    f0852500    06.  /*Pop White Male 60-64             Table P12A, Whole Numbers            */
     @20177    f0852590    06.  /*Pop White Male 60-64             Whole Numbers                        */
     @20183    f0852000    06.  /*Pop White Fmle 60-64             Table P12A, Whole Numbers            */
     @20189    f0852090    06.  /*Pop White Fmle 60-64             Whole Numbers                        */
     @20195    f1146300    06.  /*Pop White Male 65-74             Table P12A, Whole Numbers            */
     @20201    f1146390    06.  /*Pop White Male 65-74             Whole Numbers                        */
     @20207    f1146500    06.  /*Pop White Male 75-84             Table P12A, Whole Numbers            */
     @20213    f1146590    06.  /*Pop White Male 75-84             Whole Numbers                        */
     @20219    f1164400    06.  /*Pop White Male > 84              Table P12A, Whole Numbers            */
     @20225    f1164490    06.  /*Pop White Male > 84              Whole Numbers                        */
     @20231    f1146400    06.  /*Pop White Fmle 65-74             Table P12A, Whole Numbers            */
     @20237    f1146490    06.  /*Pop White Fmle 65-74             Whole Numbers                        */
     @20243    f1146600    06.  /*Pop White Fmle 75-84             Table P12A, Whole Numbers            */
     @20249    f1146690    06.  /*Pop White Fmle 75-84             Whole Numbers                        */
     @20255    f1164500    06.  /*Pop White Fmle > 84              Table P12A, Whole Numbers            */
     @20261    f1164590    06.  /*Pop White Fmle > 84              Whole Numbers                        */
     @20267    f0853200    06.  /*Pop Black/African Am Male  < 5   Table P12B, Whole Numbers            */
     @20273    f0853290    06.  /*Pop Black Male  < 5              Whole Numbers                        */
     @20279    f0852700    06.  /*Pop Black/African Am Fmle  < 5   Table P12B, Whole Numbers            */
     @20285    f0852790    06.  /*Pop Black Fmle  < 5              Whole Numbers                        */
     @20291    f1146900    06.  /*Pop Black/African Am Male  5-9   Table P12B, Whole Numbers            */
     @20297    f1146990    06.  /*Pop Black Male  5-9              Whole Numbers                        */
     @20303    f1147100    06.  /*Pop Black/African Am Male 10-14  Table P12B, Whole Numbers            */
     @20309    f1147190    06.  /*Pop Black Male 10-14             Whole Numbers                        */
     @20315    f1147000    06.  /*Pop Black/African Am Fmle  5-9   Table P12B, Whole Numbers            */
     @20321    f1147090    06.  /*Pop Black Fmle  5-9              Whole Numbers                        */
     @20327    f1147200    06.  /*Pop Black/African Am Fmle 10-14  Table P12B, Whole Numbers            */
     @20333    f1147290    06.  /*Pop Black Fmle 10-14             Whole Numbers                        */
     @20339    f1147300    06.  /*Pop Black/African Am Male 15-19  Table P12B, Whole Numbers            */
     @20345    f1147390    06.  /*Pop Black Male 15-19             Whole Numbers                        */
     @20351    f1147500    06.  /*Pop Black/African Am Male 20-24  Table P12B, Whole Numbers            */
     @20357    f1147590    06.  /*Pop Black Male 20-24             Whole Numbers                        */
     @20363    f1147700    06.  /*Pop Black/African Am Male 25-29  Table P12B, Whole Numbers            */
     @20369    f1147790    06.  /*Pop Black Male 25-29             Whole Numbers                        */
     @20375    f1147900    06.  /*Pop Black/African Am Male 30-34  Table P12B, Whole Numbers            */
     @20381    f1147990    06.  /*Pop Black Male 30-34             Whole Numbers                        */
     @20387    f1148100    06.  /*Pop Black/African Am Male 35-44  Table P12B, Whole Numbers            */
     @20393    f1148190    06.  /*Pop Black Male 35-44             Whole Numbers                        */
     @20399    f1148300    06.  /*Pop Black/African Am Male 45-54  Table P12B, Whole Numbers            */
     @20405    f1148390    06.  /*Pop Black Male 45-54             Whole Numbers                        */
     @20411    f1148500    06.  /*Pop Black/African Am Male 55-59  Table P12B, Whole Numbers            */
     @20417    f1148590    06.  /*Pop Black Male 55-59             Whole Numbers                        */
     @20423    f1147400    06.  /*Pop Black/African Am Fmle 15-19  Table P12B, Whole Numbers            */
     @20429    f1147490    06.  /*Pop Black Fmle 15-19             Whole Numbers                        */
     @20435    f1147600    06.  /*Pop Black/African Am Fmle 20-24  Table P12B, Whole Numbers            */
     @20441    f1147690    06.  /*Pop Black Fmle 20-24             Whole Numbers                        */
     @20447    f1147800    06.  /*Pop Black/African Am Fmle 25-29  Table P12B, Whole Numbers            */
     @20453    f1147890    06.  /*Pop Black Fmle 25-29             Whole Numbers                        */
     @20459    f1148000    06.  /*Pop Black/African Am Fmle 30-34  Table P12B, Whole Numbers            */
     @20465    f1148090    06.  /*Pop Black Fmle 30-34             Whole Numbers                        */
     @20471    f1148200    06.  /*Pop Black/African Am Fmle 35-44  Table P12B, Whole Numbers            */
     @20477    f1148290    06.  /*Pop Black Fmle 35-44             Whole Numbers                        */
     @20483    f1148400    06.  /*Pop Black/African Am Fmle 45-54  Table P12B, Whole Numbers            */
     @20489    f1148490    06.  /*Pop Black Fmle 45-54             Whole Numbers                        */
     @20495    f1148600    06.  /*Pop Black/African Am Fmle 55-59  Table P12B, Whole Numbers            */
     @20501    f1148690    06.  /*Pop Black Fmle 55-59             Whole Numbers                        */
     @20507    f0853500    06.  /*Pop Black/African Am Male 60-64  Table P12B, Whole Numbers            */
     @20513    f0853590    06.  /*Pop Black Male 60-64             Whole Numbers                        */
     @20519    f0853000    06.  /*Pop Black/African Am Fmle 60-64  Table P12B, Whole Numbers            */
     @20525    f0853090    06.  /*Pop Black Fmle 60-64             Whole Numbers                        */
     @20531    f1148900    06.  /*Pop Black/African Am Male 65-74  Table P12B, Whole Numbers            */
     @20537    f1148990    06.  /*Pop Black Male 65-74             Whole Numbers                        */
     @20543    f1149100    06.  /*Pop Black/African Am Male 75-84  Table P12B, Whole Numbers            */
     @20549    f1149190    06.  /*Pop Black Male 75-84             Whole Numbers                        */
     @20555    f1164600    06.  /*Pop Black/African Am Male > 84   Table P12B, Whole Numbers            */
     @20561    f1164690    06.  /*Pop Black Male > 84              Whole Numbers                        */
     @20567    f1149000    06.  /*Pop Black/African Am Fmle 65-74  Table P12B, Whole Numbers            */
     @20573    f1149090    06.  /*Pop Black Fmle 65-74             Whole Numbers                        */
     @20579    f1149200    06.  /*Pop Black/African Am Fmle 75-84  Table P12B, Whole Numbers            */
     @20585    f1149290    06.  /*Pop Black Fmle 75-84             Whole Numbers                        */
     @20591    f1164700    06.  /*Pop Black/African Am Fmle > 84   Table P12B, Whole Numbers            */
     @20597    f1164790    06.  /*Pop Black Fmle > 84              Whole Numbers                        */
     @20603    f1149300    06.  /*Pop Am Ind/Alaska Nat Male  < 5  Table P12C, Whole Numbers            */
     @20609    f1149390    06.  /*Pop Am Ind/Esk/Aleut Male  < 5   Whole Numbers                        */
     @20615    f1149400    06.  /*Pop Am Ind/Alaska Nat Fmle  < 5  Table P12C, Whole Numbers            */
     @20621    f1149490    06.  /*Pop Am Ind/Esk/Aleut Fmle  < 5   Whole Numbers                        */
     @20627    f1149500    06.  /*Pop Am Ind/Alaska Nat Male  5-9  Table P12C, Whole Numbers            */
     @20633    f1149590    06.  /*Pop Am Ind/Esk/Aleut Male  5-9   Whole Numbers                        */
     @20639    f1149600    06.  /*Pop Am Ind/Alaska Nat Fmle  5-9  Table P12C, Whole Numbers            */
     @20645    f1149690    06.  /*Pop Am Ind/Esk/Aleut Fmle  5-9   Whole Numbers                        */
     @20651    f1149700    06.  /*Pop Am Ind/Alska Nat Male 10-14  Table P12C, Whole Numbers            */
     @20657    f1149790    06.  /*Pop Am Ind/Esk/Aleut Male 10-14  Whole Numbers                        */
     @20663    f1149800    06.  /*Pop Am Ind/Alska Nat Fmle 10-14  Table P12C, Whole Numbers            */
     @20669    f1149890    06.  /*Pop Am Ind/Esk/Aleut Fmle 10-14  Whole Numbers                        */
     @20675    f1149900    06.  /*Pop Am Ind/Alska Nat Male 15-19  Table P12C, Whole Numbers            */
     @20681    f1149990    06.  /*Pop Am Ind/Esk/Aleut Male 15-19  Whole Numbers                        */
     @20687    f1150000    06.  /*Pop Am Ind/Alska Nat Fmle 15-19  Table P12C, Whole Numbers            */
     @20693    f1150090    06.  /*Pop Am Ind/Esk/Aleut Fmle 15-19  Whole Numbers                        */
     @20699    f1150100    06.  /*Pop Am Ind/Alska Nat Male 20-24  Table P12C, Whole Numbers            */
     @20705    f1150190    06.  /*Pop Am Ind/Esk/Aleut Male 20-24  Whole Numbers                        */
     @20711    f1150200    06.  /*Pop Am Ind/Alska Nat Fmle 20-24  Table P12C, Whole Numbers            */
     @20717    f1150290    06.  /*Pop Am Ind/Esk/Aleut Fmle 20-24  Whole Numbers                        */
     @20723    f1150300    06.  /*Pop Am Ind/Alska Nat Male 25-29  Table P12C, Whole Numbers            */
     @20729    f1150390    06.  /*Pop Am Ind/Esk/Aleut Male 25-29  Whole Numbers                        */
     @20735    f1150400    06.  /*Pop Am Ind/Alska Nat Fmle 25-29  Table P12C, Whole Numbers            */
     @20741    f1150490    06.  /*Pop Am Ind/Esk/Aleut Fmle 25-29  Whole Numbers                        */
     @20747    f1150500    06.  /*Pop Am Ind/Alska Nat Male 30-34  Table P12C, Whole Numbers            */
     @20753    f1150590    06.  /*Pop Am Ind/Esk/Aleut Male 30-34  Whole Numbers                        */
     @20759    f1150600    06.  /*Pop Am Ind/Alska Nat Fmle 30-34  Table P12C, Whole Numbers            */
     @20765    f1150690    06.  /*Pop Am Ind/Esk/Aleut Fmle 30-34  Whole Numbers                        */
     @20771    f1150700    06.  /*Pop Am Ind/Alska Nat Male 35-44  Table P12C, Whole Numbers            */
     @20777    f1150790    06.  /*Pop Am Ind/Esk/Aleut Male 35-44  Whole Numbers                        */
     @20783    f1150800    06.  /*Pop Am Ind/Alska Nat Fmle 35-44  Table P12C, Whole Numbers            */
     @20789    f1150890    06.  /*Pop Am Ind/Esk/Aleut Fmle 35-44  Whole Numbers                        */
     @20795    f1150900    06.  /*Pop Am Ind/Alska Nat Male 45-54  Table P12C, Whole Numbers            */
     @20801    f1150990    06.  /*Pop Am Ind/Esk/Aleut Male 45-54  Whole Numbers                        */
     @20807    f1151000    06.  /*Pop Am Ind/Alska Nat Fmle 45-54  Table P12C, Whole Numbers            */
     @20813    f1151090    06.  /*Pop Am Ind/Esk/Aleut Fmle 45-54  Whole Numbers                        */
     @20819    f1151100    06.  /*Pop Am Ind/Alska Nat Male 55-59  Table P12C, Whole Numbers            */
     @20825    f1151190    06.  /*Pop Am Ind/Esk/Aleut Male 55-59  Whole Numbers                        */
     @20831    f1151200    06.  /*Pop Am Ind/Alska Nat Fmle 55-59  Table P12C, Whole Numbers            */
     @20837    f1151290    06.  /*Pop Am Ind/Esk/Aleut Fmle 55-59  Whole Numbers                        */
     @20843    f1151300    06.  /*Pop Am Ind/Alska Nat Male 60-64  Table P12C, Whole Numbers            */
     @20849    f1151390    06.  /*Pop Am Ind/Esk/Aleut Male 60-64  Whole Numbers                        */
     @20855    f1151400    06.  /*Pop Am Ind/Alska Nat Fmle 60-64  Table P12C, Whole Numbers            */
     @20861    f1151490    06.  /*Pop Am Ind/Esk/Aleut Fmle 60-64  Whole Numbers                        */
     @20867    f1151500    06.  /*Pop Am Ind/Alska Nat Male 65-74  Table P12C, Whole Numbers            */
     @20873    f1151590    06.  /*Pop Am Ind/Esk/Aleut Male 65-74  Whole Numbers                        */
     @20879    f1151600    06.  /*Pop Am Ind/Alska Nat Fmle 65-74  Table P12C, Whole Numbers            */
     @20885    f1151690    06.  /*Pop Am Ind/Esk/Aleut Fmle 65-74  Whole Numbers                        */
     @20891    f1151700    06.  /*Pop Am Ind/Alska Nat Male 75-84  Table P12C, Whole Numbers            */
     @20897    f1151790    06.  /*Pop Am Ind/Esk/Aleut Male 75-84  Whole Numbers                        */
     @20903    f1151800    06.  /*Pop Am Ind/Alska Nat Fmle 75-84  Table P12C, Whole Numbers            */
     @20909    f1151890    06.  /*Pop Am Ind/Esk/Aleut Fmle 75-84  Whole Numbers                        */
     @20915    f1164800    06.  /*Pop Am Ind/Alaska Nat Male > 84  Table P12C, Whole Numbers            */
     @20921    f1164890    06.  /*Pop Am Ind/Esk/Aleut Male > 84   Whole Numbers                        */
     @20927    f1164900    06.  /*Pop Am Ind/Alaska Nat Fmle > 84  Table P12C, Whole Numbers            */
     @20933    f1164990    06.  /*Pop Am Ind/Esk/Aleut Fmle > 84   Whole Numbers                        */
     @20939    f1334400    06.  /*Pop Asian Male  < 5              Table P12D, Whole Numbers            */
     @20945    f1334500    06.  /*Pop Asian Fmle  < 5              Table P12D, Whole Numbers            */
     @20951    f1334600    06.  /*Pop Asian Male  5-9              Table P12D, Whole Numbers            */
     @20957    f1334700    06.  /*Pop Asian Fmle  5-9              Table P12D, Whole Numbers            */
     @20963    f1334800    06.  /*Pop Asian Male 10-14             Table P12D, Whole Numbers            */
     @20969    f1334900    06.  /*Pop Asian Fmle 10-14             Table P12D, Whole Numbers            */
     @20975    f1335000    06.  /*Pop Asian Male 15-19             Table P12D, Whole Numbers            */
     @20981    f1335100    06.  /*Pop Asian Fmle 15-19             Table P12D, Whole Numbers            */
     @20987    f1335200    06.  /*Pop Asian Male 20-24             Table P12D, Whole Numbers            */
     @20993    f1335300    06.  /*Pop Asian Fmle 20-24             Table P12D, Whole Numbers            */
     @20999    f1335400    06.  /*Pop Asian Male 25-29             Table P12D, Whole Numbers            */
     @21005    f1335500    06.  /*Pop Asian Fmle 25-29             Table P12D, Whole Numbers            */
     @21011    f1335600    06.  /*Pop Asian Male 30-34             Table P12D, Whole Numbers            */
     @21017    f1335700    06.  /*Pop Asian Fmle 30-34             Table P12D, Whole Numbers            */
     @21023    f1335800    06.  /*Pop Asian Male 35-44             Table P12D, Whole Numbers            */
     @21029    f1335900    06.  /*Pop Asian Fmle 35-44             Table P12D, Whole Numbers            */
     @21035    f1336000    06.  /*Pop Asian Male 45-54             Table P12D, Whole Numbers            */
     @21041    f1336100    06.  /*Pop Asian Fmle 45-54             Table P12D, Whole Numbers            */
     @21047    f1336200    06.  /*Pop Asian Male 55-59             Table P12D, Whole Numbers            */
     @21053    f1336300    06.  /*Pop Asian Fmle 55-59             Table P12D, Whole Numbers            */
     @21059    f1336400    06.  /*Pop Asian Male 60-64             Table P12D, Whole Numbers            */
     @21065    f1336500    06.  /*Pop Asian Fmle 60-64             Table P12D, Whole Numbers            */
     @21071    f1336600    06.  /*Pop Asian Male 65-74             Table P12D, Whole Numbers            */
     @21077    f1336700    06.  /*Pop Asian Fmle 65-74             Table P12D, Whole Numbers            */
     @21083    f1336800    06.  /*Pop Asian Male 75-84             Table P12D, Whole Numbers            */
     @21089    f1336900    06.  /*Pop Asian Fmle 75-84             Table P12D, Whole Numbers            */
     @21095    f1337000    06.  /*Pop Asian Male > 84              Table P12D, Whole Numbers            */
     @21101    f1337100    06.  /*Pop Asian Fmle > 84              Table P12D, Whole Numbers            */
     @21107    f1337200    06.  /*Pop Nat Hawaii/Oth PI Male  < 5  Table P12E, Whole Numbers            */
     @21113    f1337300    06.  /*Pop Nat Hawaii/Oth PI Fmle  < 5  Table P12E, Whole Numbers            */
     @21119    f1337400    06.  /*Pop Nat Hawaii/Oth PI Male  5-9  Table P12E, Whole Numbers            */
     @21125    f1337500    06.  /*Pop Nat Hawaii/Oth PI Fmle  5-9  Table P12E, Whole Numbers            */
     @21131    f1337600    06.  /*Pop Nat Hawai/Oth PI Male 10-14  Table P12E, Whole Numbers            */
     @21137    f1337700    06.  /*Pop Nat Hawai/Oth PI Fmle 10-14  Table P12E, Whole Numbers            */
     @21143    f1337800    06.  /*Pop Nat Hawai/Oth PI Male 15-19  Table P12E, Whole Numbers            */
     @21149    f1337900    06.  /*Pop Nat Hawai/Oth PI Fmle 15-19  Table P12E, Whole Numbers            */
     @21155    f1338000    06.  /*Pop Nat Hawai/Oth PI Male 20-24  Table P12E, Whole Numbers            */
     @21161    f1338100    06.  /*Pop Nat Hawai/Oth PI Fmle 20-24  Table P12E, Whole Numbers            */
     @21167    f1338200    06.  /*Pop Nat Hawai/Oth PI Male 25-29  Table P12E, Whole Numbers            */
     @21173    f1338300    06.  /*Pop Nat Hawai/Oth PI Fmle 25-29  Table P12E, Whole Numbers            */
     @21179    f1338400    06.  /*Pop Nat Hawai/Oth PI Male 30-34  Table P12E, Whole Numbers            */
     @21185    f1338500    06.  /*Pop Nat Hawai/Oth PI Fmle 30-34  Table P12E, Whole Numbers            */
     @21191    f1338600    06.  /*Pop Nat Hawai/Oth PI Male 35-44  Table P12E, Whole Numbers            */
     @21197    f1338700    06.  /*Pop Nat Hawai/Oth PI Fmle 35-44  Table P12E, Whole Numbers            */
     @21203    f1338800    06.  /*Pop Nat Hawai/Oth PI Male 45-54  Table P12E, Whole Numbers            */
     @21209    f1338900    06.  /*Pop Nat Hawai/Oth PI Fmle 45-54  Table P12E, Whole Numbers            */
     @21215    f1339000    06.  /*Pop Nat Hawai/Oth PI Male 55-59  Table P12E, Whole Numbers            */
     @21221    f1339100    06.  /*Pop Nat Hawai/Oth PI Fmle 55-59  Table P12E, Whole Numbers            */
     @21227    f1339200    06.  /*Pop Nat Hawai/Oth PI Male 60-64  Table P12E, Whole Numbers            */
     @21233    f1339300    06.  /*Pop Nat Hawai/Oth PI Fmle 60-64  Table P12E, Whole Numbers            */
     @21239    f1339400    06.  /*Pop Nat Hawai/Oth PI Male 65-74  Table P12E, Whole Numbers            */
     @21245    f1339500    06.  /*Pop Nat Hawai/Oth PI Fmle 65-74  Table P12E, Whole Numbers            */
     @21251    f1339600    06.  /*Pop Nat Hawai/Oth PI Male 75-84  Table P12E, Whole Numbers            */
     @21257    f1339700    06.  /*Pop Nat Hawai/Oth PI Fmle 75-84  Table P12E, Whole Numbers            */
     @21263    f1339800    06.  /*Pop Nat Hawaii/Oth PI Male > 84  Table P12E, Whole Numbers            */
     @21269    f1339900    06.  /*Pop Nat Hawaii/Oth PI Fmle > 84  Table P12E, Whole Numbers            */
     @21275    f1151990    06.  /*Pop Asian/Pac Islndr Male  < 5   Whole Numbers                        */
     @21281    f1152090    06.  /*Pop Asian/Pac Islndr Fmle  < 5   Whole Numbers                        */
     @21287    f1152190    06.  /*Pop Asian/Pac Islndr Male  5-9   Whole Numbers                        */
     @21293    f1152290    06.  /*Pop Asian/Pac Islndr Fmle  5-9   Whole Numbers                        */
     @21299    f1152390    06.  /*Pop Asian/Pac Islndr Male 10-14  Whole Numbers                        */
     @21305    f1152490    06.  /*Pop Asian/Pac Islndr Fmle 10-14  Whole Numbers                        */
     @21311    f1152590    06.  /*Pop Asian/Pac Islndr Male 15-19  Whole Numbers                        */
     @21317    f1152690    06.  /*Pop Asian/Pac Islndr Fmle 15-19  Whole Numbers                        */
     @21323    f1152790    06.  /*Pop Asian/Pac Islndr Male 20-24  Whole Numbers                        */
     @21329    f1152890    06.  /*Pop Asian/Pac Islndr Fmle 20-24  Whole Numbers                        */
     @21335    f1152990    06.  /*Pop Asian/Pac Islndr Male 25-29  Whole Numbers                        */
     @21341    f1153090    06.  /*Pop Asian/Pac Islndr Fmle 25-29  Whole Numbers                        */
     @21347    f1153190    06.  /*Pop Asian/Pac Islndr Male 30-34  Whole Numbers                        */
     @21353    f1153290    06.  /*Pop Asian/Pac Islndr Fmle 30-34  Whole Numbers                        */
     @21359    f1153390    06.  /*Pop Asian/Pac Islndr Male 35-44  Whole Numbers                        */
     @21365    f1153490    06.  /*Pop Asian/Pac Islndr Fmle 35-44  Whole Numbers                        */
     @21371    f1153590    06.  /*Pop Asian/Pac Islndr Male 45-54  Whole Numbers                        */
     @21377    f1153690    06.  /*Pop Asian/Pac Islndr Fmle 45-54  Whole Numbers                        */
     @21383    f1153790    06.  /*Pop Asian/Pac Islndr Male 55-59  Whole Numbers                        */
     @21389    f1153890    06.  /*Pop Asian/Pac Islndr Fmle 55-59  Whole Numbers                        */
     @21395    f1153990    06.  /*Pop Asian/Pac Islndr Male 60-64  Whole Numbers                        */
     @21401    f1154090    06.  /*Pop Asian/Pac Islndr Fmle 60-64  Whole Numbers                        */
     @21407    f1154190    06.  /*Pop Asian/Pac Islndr Male 65-74  Whole Numbers                        */
     @21413    f1154290    06.  /*Pop Asian/Pac Islndr Fmle 65-74  Whole Numbers                        */
     @21419    f1154390    06.  /*Pop Asian/Pac Islndr Male 75-84  Whole Numbers                        */
     @21425    f1154490    06.  /*Pop Asian/Pac Islndr Fmle 75-84  Whole Numbers                        */
     @21431    f1165090    06.  /*Pop Asian/Pac Islndr Male > 84   Whole Numbers                        */
     @21437    f1165190    06.  /*Pop Asian/Pac Islndr Fmle > 84   Whole Numbers                        */
     @21443    f1154500    06.  /*Pop Some Other Race Male  < 5    Table P12F, Whole Numbers            */
     @21449    f1154590    06.  /*Pop Other Male  < 5              Whole Numbers                        */
     @21455    f1154600    06.  /*Pop Some Other Race Fmle  < 5    Table P12F, Whole Numbers            */
     @21461    f1154690    06.  /*Pop Other Fmle  < 5              Whole Numbers                        */
     @21467    f1154700    06.  /*Pop Some Other Race Male  5-9    Table P12F, Whole Numbers            */
     @21473    f1154790    06.  /*Pop Other Male  5-9              Whole Numbers                        */
     @21479    f1154800    06.  /*Pop Some Other Race Fmle  5-9    Table P12F, Whole Numbers            */
     @21485    f1154890    06.  /*Pop Other Fmle  5-9              Whole Numbers                        */
     @21491    f1154900    06.  /*Pop Some Other Race Male 10-14   Table P12F, Whole Numbers            */
     @21497    f1154990    06.  /*Pop Other Male 10-14             Whole Numbers                        */
     @21503    f1155000    06.  /*Pop Some Other Race Fmle 10-14   Table P12F, Whole Numbers            */
     @21509    f1155090    06.  /*Pop Other Fmle 10-14             Whole Numbers                        */
     @21515    f1155100    06.  /*Pop Some Other Race Male 15-19   Table P12F, Whole Numbers            */
     @21521    f1155190    06.  /*Pop Other Male 15-19             Whole Numbers                        */
     @21527    f1155200    06.  /*Pop Some Other Race Fmle 15-19   Table P12F, Whole Numbers            */
     @21533    f1155290    06.  /*Pop Other Fmle 15-19             Whole Numbers                        */
     @21539    f1155300    06.  /*Pop Some Other Race Male 20-24   Table P12F, Whole Numbers            */
     @21545    f1155390    06.  /*Pop Other Male 20-24             Whole Numbers                        */
     @21551    f1155400    06.  /*Pop Some Other Race Fmle 20-24   Table P12F, Whole Numbers            */
     @21557    f1155490    06.  /*Pop Other Fmle 20-24             Whole Numbers                        */
     @21563    f1155500    06.  /*Pop Some Other Race Male 25-29   Table P12F, Whole Numbers            */
     @21569    f1155590    06.  /*Pop Other Male 25-29             Whole Numbers                        */
     @21575    f1155600    06.  /*Pop Some Other Race Fmle 25-29   Table P12F, Whole Numbers            */
     @21581    f1155690    06.  /*Pop Other Fmle 25-29             Whole Numbers                        */
     @21587    f1155700    06.  /*Pop Some Other Race Male 30-34   Table P12F, Whole Numbers            */
     @21593    f1155790    06.  /*Pop Other Male 30-34             Whole Numbers                        */
     @21599    f1155800    06.  /*Pop Some Other Race Fmle 30-34   Table P12F, Whole Numbers            */
     @21605    f1155890    06.  /*Pop Other Fmle 30-34             Whole Numbers                        */
     @21611    f1155900    06.  /*Pop Some Other Race Male 35-44   Table P12F, Whole Numbers            */
     @21617    f1155990    06.  /*Pop Other Male 35-44             Whole Numbers                        */
     @21623    f1156000    06.  /*Pop Some Other Race Fmle 35-44   Table P12F, Whole Numbers            */
     @21629    f1156090    06.  /*Pop Other Fmle 35-44             Whole Numbers                        */
     @21635    f1156100    06.  /*Pop Some Other Race Male 45-54   Table P12F, Whole Numbers            */
     @21641    f1156190    06.  /*Pop Other Male 45-54             Whole Numbers                        */
     @21647    f1156200    06.  /*Pop Some Other Race Fmle 45-54   Table P12F, Whole Numbers            */
     @21653    f1156290    06.  /*Pop Other Fmle 45-54             Whole Numbers                        */
     @21659    f1156300    06.  /*Pop Some Other Race Male 55-59   Table P12F, Whole Numbers            */
     @21665    f1156390    06.  /*Pop Other Male 55-59             Whole Numbers                        */
     @21671    f1156400    06.  /*Pop Some Other Race Fmle 55-59   Table P12F, Whole Numbers            */
     @21677    f1156490    06.  /*Pop Other Fmle 55-59             Whole Numbers                        */
     @21683    f1156500    06.  /*Pop Some Other Race Male 60-64   Table P12F, Whole Numbers            */
     @21689    f1156590    06.  /*Pop Other Male 60-64             Whole Numbers                        */
     @21695    f1156600    06.  /*Pop Some Other Race Fmle 60-64   Table P12F, Whole Numbers            */
     @21701    f1156690    06.  /*Pop Other Fmle 60-64             Whole Numbers                        */
     @21707    f1156700    06.  /*Pop Some Other Race Male 65-74   Table P12F, Whole Numbers            */
     @21713    f1156790    06.  /*Pop Other Male 65-74             Whole Numbers                        */
     @21719    f1156800    06.  /*Pop Some Other Race Fmle 65-74   Table P12F, Whole Numbers            */
     @21725    f1156890    06.  /*Pop Other Fmle 65-74             Whole Numbers                        */
     @21731    f1156900    06.  /*Pop Some Other Race Male 75-84   Table P12F, Whole Numbers            */
     @21737    f1156990    06.  /*Pop Other Male 75-84             Whole Numbers                        */
     @21743    f1157000    06.  /*Pop Some Other Race Fmle 75-84   Table P12F, Whole Numbers            */
     @21749    f1157090    06.  /*Pop Other Fmle 75-84             Whole Numbers                        */
     @21755    f1165200    06.  /*Pop Some Other Race Male > 84    Table P12F, Whole Numbers            */
     @21761    f1165290    06.  /*Pop Other Male > 84              Whole Numbers                        */
     @21767    f1165300    06.  /*Pop Some Other Race Fmle > 84    Table P12F, Whole Numbers            */
     @21773    f1165390    06.  /*Pop Other Fmle > 84              Whole Numbers                        */
     @21779    f1340000    06.  /*Pop Two or more Races Male  < 5  Table P12G, Whole Numbers            */
     @21785    f1340100    06.  /*Pop Two or more Races Fmle  < 5  Table P12G, Whole Numbers            */
     @21791    f1340200    06.  /*Pop Two or more Races Male  5-9  Table P12G, Whole Numbers            */
     @21797    f1340300    06.  /*Pop Two or more Races Fmle  5-9  Table P12G, Whole Numbers            */
     @21803    f1340400    06.  /*Pop Two or more Race Male 10-14  Table P12G, Whole Numbers            */
     @21809    f1340500    06.  /*Pop Two or more Race Fmle 10-14  Table P12G, Whole Numbers            */
     @21815    f1340600    06.  /*Pop Two or more Race Male 15-19  Table P12G, Whole Numbers            */
     @21821    f1340700    06.  /*Pop Two or more Race Fmle 15-19  Table P12G, Whole Numbers            */
     @21827    f1340800    06.  /*Pop Two or more Race Male 20-24  Table P12G, Whole Numbers            */
     @21833    f1340900    06.  /*Pop Two or more Race Fmle 20-24  Table P12G, Whole Numbers            */
     @21839    f1341000    06.  /*Pop Two or more Race Male 25-29  Table P12G, Whole Numbers            */
     @21845    f1341100    06.  /*Pop Two or more Race Fmle 25-29  Table P12G, Whole Numbers            */
     @21851    f1341200    06.  /*Pop Two or more Race Male 30-34  Table P12G, Whole Numbers            */
     @21857    f1341300    06.  /*Pop Two or more Race Fmle 30-34  Table P12G, Whole Numbers            */
     @21863    f1341400    06.  /*Pop Two or more Race Male 35-44  Table P12G, Whole Numbers            */
     @21869    f1341500    06.  /*Pop Two or more Race Fmle 35-44  Table P12G, Whole Numbers            */
     @21875    f1341600    06.  /*Pop Two or more Race Male 45-54  Table P12G, Whole Numbers            */
     @21881    f1341700    06.  /*Pop Two or more Race Fmle 45-54  Table P12G, Whole Numbers            */
     @21887    f1341800    06.  /*Pop Two or more Race Male 55-59  Table P12G, Whole Numbers            */
     @21893    f1341900    06.  /*Pop Two or more Race Fmle 55-59  Table P12G, Whole Numbers            */
     @21899    f1342000    06.  /*Pop Two or more Race Male 60-64  Table P12G, Whole Numbers            */
     @21905    f1342100    06.  /*Pop Two or more Race Fmle 60-64  Table P12G, Whole Numbers            */
     @21911    f1342200    06.  /*Pop Two or more Race Male 65-74  Table P12G, Whole Numbers            */
     @21917    f1342300    06.  /*Pop Two or more Race Fmle 65-74  Table P12G, Whole Numbers            */
     @21923    f1342400    06.  /*Pop Two or more Race Male 75-84  Table P12G, Whole Numbers            */
     @21929    f1342500    06.  /*Pop Two or more Race Fmle 75-84  Table P12G, Whole Numbers            */
     @21935    f1342600    06.  /*Pop Two or more Races Male > 84  Table P12G, Whole Numbers            */
     @21941    f1342700    06.  /*Pop Two or more Races Fmle > 84  Table P12G, Whole Numbers            */
     @21947    f1342800    06.  /*Pop White Non-Hisp Male  < 5     Table P12I, Whole Numbers            */
     @21953    f1342900    06.  /*Pop White Non-Hisp Fmle  < 5     Table P12I, Whole Numbers            */
     @21959    f1343000    06.  /*Pop White Non-Hisp Male  5-9     Table P12I, Whole Numbers            */
     @21965    f1343100    06.  /*Pop White Non-Hisp Fmle  5-9     Table P12I, Whole Numbers            */
     @21971    f1343200    06.  /*Pop White Non-Hisp Male 10-14    Table P12I, Whole Numbers            */
     @21977    f1343300    06.  /*Pop White Non-Hisp Fmle 10-14    Table P12I, Whole Numbers            */
     @21983    f1343400    06.  /*Pop White Non-Hisp Male 15-19    Table P12I, Whole Numbers            */
     @21989    f1343500    06.  /*Pop White Non-Hisp Fmle 15-19    Table P12I, Whole Numbers            */
     @21995    f1343600    06.  /*Pop White Non-Hisp Male 20-24    Table P12I, Whole Numbers            */
     @22001    f1343700    06.  /*Pop White Non-Hisp Fmle 20-24    Table P12I, Whole Numbers            */
     @22007    f1343800    06.  /*Pop White Non-Hisp Male 25-29    Table P12I, Whole Numbers            */
     @22013    f1343900    06.  /*Pop White Non-Hisp Fmle 25-29    Table P12I, Whole Numbers            */
     @22019    f1344000    06.  /*Pop White Non-Hisp Male 30-34    Table P12I, Whole Numbers            */
     @22025    f1344100    06.  /*Pop White Non-Hisp Fmle 30-34    Table P12I, Whole Numbers            */
     @22031    f1344200    06.  /*Pop White Non-Hisp Male 35-44    Table P12I, Whole Numbers            */
     @22037    f1344300    06.  /*Pop White Non-Hisp Fmle 35-44    Table P12I, Whole Numbers            */
     @22043    f1344400    06.  /*Pop White Non-Hisp Male 45-54    Table P12I, Whole Numbers            */
     @22049    f1344500    06.  /*Pop White Non-Hisp Fmle 45-54    Table P12I, Whole Numbers            */
     @22055    f1344600    06.  /*Pop White Non-Hisp Male 55-59    Table P12I, Whole Numbers            */
     @22061    f1344700    06.  /*Pop White Non-Hisp Fmle 55-59    Table P12I, Whole Numbers            */
     @22067    f1344800    06.  /*Pop White Non-Hisp Male 60-64    Table P12I, Whole Numbers            */
     @22073    f1344900    06.  /*Pop White Non-Hisp Fmle 60-64    Table P12I, Whole Numbers            */
     @22079    f1345000    06.  /*Pop White Non-Hisp Male 65-74    Table P12I, Whole Numbers            */
     @22085    f1345100    06.  /*Pop White Non-Hisp Fmle 65-74    Table P12I, Whole Numbers            */
     @22091    f1345200    06.  /*Pop White Non-Hisp Male 75-84    Table P12I, Whole Numbers            */
     @22097    f1345300    06.  /*Pop White Non-Hisp Fmle 75-84    Table P12I, Whole Numbers            */
     @22103    f1345400    06.  /*Pop White Non-Hisp Male > 84     Table P12I, Whole Numbers            */
     @22109    f1345500    06.  /*Pop White Non-Hisp Fmle > 84     Table P12I, Whole Numbers            */
     @22115    f1157100    06.  /*Pop Hispanic/Latino Male  < 5    Table P12H, Whole Numbers            */
     @22121    f1157190    06.  /*Pop Hispanic Origin Male  < 5    Whole Numbers                        */
     @22127    f1157200    06.  /*Pop Hispanic/Latino Fmle  < 5    Table P12H, Whole Numbers            */
     @22133    f1157290    06.  /*Pop Hispanic Origin Fmle  < 5    Whole Numbers                        */
     @22139    f1157300    06.  /*Pop Hispanic/Latino Male  5-9    Table P12H, Whole Numbers            */
     @22145    f1157390    06.  /*Pop Hispanic Origin Male  5-9    Whole Numbers                        */
     @22151    f1157400    06.  /*Pop Hispanic/Latino Fmle  5-9    Table P12H, Whole Numbers            */
     @22157    f1157490    06.  /*Pop Hispanic Origin Fmle  5-9    Whole Numbers                        */
     @22163    f1157500    06.  /*Pop Hispanic/Latino Male 10-14   Table P12H, Whole Numbers            */
     @22169    f1157590    06.  /*Pop Hispanic Origin Male 10-14   Whole Numbers                        */
     @22175    f1157600    06.  /*Pop Hispanic/Latino Fmle 10-14   Table P12H, Whole Numbers            */
     @22181    f1157690    06.  /*Pop Hispanic Origin Fmle 10-14   Whole Numbers                        */
     @22187    f1157700    06.  /*Pop Hispanic/Latino Male 15-19   Table P12H, Whole Numbers            */
     @22193    f1157790    06.  /*Pop Hispanic Origin Male 15-19   Whole Numbers                        */
     @22199    f1157800    06.  /*Pop Hispanic/Latino Fmle 15-19   Table P12H, Whole Numbers            */
     @22205    f1157890    06.  /*Pop Hispanic Origin Fmle 15-19   Whole Numbers                        */
     @22211    f1157900    06.  /*Pop Hispanic/Latino Male 20-24   Table P12H, Whole Numbers            */
     @22217    f1157990    06.  /*Pop Hispanic Origin Male 20-24   Whole Numbers                        */
     @22223    f1158000    06.  /*Pop Hispanic/Latino Fmle 20-24   Table P12H, Whole Numbers            */
     @22229    f1158090    06.  /*Pop Hispanic Origin Fmle 20-24   Whole Numbers                        */
     @22235    f1158100    06.  /*Pop Hispanic/Latino Male 25-29   Table P12H, Whole Numbers            */
     @22241    f1158190    06.  /*Pop Hispanic Origin Male 25-29   Whole Numbers                        */
     @22247    f1158200    06.  /*Pop Hispanic/Latino Fmle 25-29   Table P12H, Whole Numbers            */
     @22253    f1158290    06.  /*Pop Hispanic Origin Fmle 25-29   Whole Numbers                        */
     @22259    f1158300    06.  /*Pop Hispanic/Latino Male 30-34   Table P12H, Whole Numbers            */
     @22265    f1158390    06.  /*Pop Hispanic Origin Male 30-34   Whole Numbers                        */
     @22271    f1158400    06.  /*Pop Hispanic/Latino Fmle 30-34   Table P12H, Whole Numbers            */
     @22277    f1158490    06.  /*Pop Hispanic Origin Fmle 30-34   Whole Numbers                        */
     @22283    f1158500    06.  /*Pop Hispanic/Latino Male 35-44   Table P12H, Whole Numbers            */
     @22289    f1158590    06.  /*Pop Hispanic Origin Male 35-44   Whole Numbers                        */
     @22295    f1158600    06.  /*Pop Hispanic/Latino Fmle 35-44   Table P12H, Whole Numbers            */
     @22301    f1158690    06.  /*Pop Hispanic Origin Fmle 35-44   Whole Numbers                        */
     @22307    f1158700    06.  /*Pop Hispanic/Latino Male 45-54   Table P12H, Whole Numbers            */
     @22313    f1158790    06.  /*Pop Hispanic Origin Male 45-54   Whole Numbers                        */
     @22319    f1158800    06.  /*Pop Hispanic/Latino Fmle 45-54   Table P12H, Whole Numbers            */
     @22325    f1158890    06.  /*Pop Hispanic Origin Fmle 45-54   Whole Numbers                        */
     @22331    f1158900    06.  /*Pop Hispanic/Latino Male 55-59   Table P12H, Whole Numbers            */
     @22337    f1158990    06.  /*Pop Hispanic Origin Male 55-59   Whole Numbers                        */
     @22343    f1159000    06.  /*Pop Hispanic/Latino Fmle 55-59   Table P12H, Whole Numbers            */
     @22349    f1159090    06.  /*Pop Hispanic Origin Fmle 55-59   Whole Numbers                        */
     @22355    f1159100    06.  /*Pop Hispanic/Latino Male 60-64   Table P12H, Whole Numbers            */
     @22361    f1159190    06.  /*Pop Hispanic Origin Male 60-64   Whole Numbers                        */
     @22367    f1159200    06.  /*Pop Hispanic/Latino Fmle 60-64   Table P12H, Whole Numbers            */
     @22373    f1159290    06.  /*Pop Hispanic Origin Fmle 60-64   Whole Numbers                        */
     @22379    f1159300    06.  /*Pop Hispanic/Latino Male 65-74   Table P12H, Whole Numbers            */
     @22385    f1159390    06.  /*Pop Hispanic Origin Male 65-74   Whole Numbers                        */
     @22391    f1159400    06.  /*Pop Hispanic/Latino Fmle 65-74   Table P12H, Whole Numbers            */
     @22397    f1159490    06.  /*Pop Hispanic Origin Fmle 65-74   Whole Numbers                        */
     @22403    f1159500    06.  /*Pop Hispanic/Latino Male 75-84   Table P12H, Whole Numbers            */
     @22409    f1159590    06.  /*Pop Hispanic Origin Male 75-84   Whole Numbers                        */
     @22415    f1159600    06.  /*Pop Hispanic/Latino Fmle 75-84   Table P12H, Whole Numbers            */
     @22421    f1159690    06.  /*Pop Hispanic Origin Fmle 75-84   Whole Numbers                        */
     @22427    f1165400    06.  /*Pop Hispanic/Latino Male > 84    Table P12H, Whole Numbers            */
     @22433    f1165490    06.  /*Pop Hispanic Origin Male > 84    Whole Numbers                        */
     @22439    f1165500    06.  /*Pop Hispanic/Latino Fmle > 84    Table P12H, Whole Numbers            */
     @22445    f1165590    06.  /*Pop Hispanic Origin Fmle > 84    Whole Numbers                        */
     @22451    f0874700    07.  /*# Females Over 15 Yrs            Table P8                             */
     @22458    f0874790    07.  /*# Females Over 15 Yrs            Table P14                            */
     @22465    f0874780    07.  /*# Females Over 15 Yrs            Table 26                             */
     @22472    f1408308    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @22479    f1408307    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @22486    f1408306    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @22493    f1408305    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @22500    f1408304    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @22507    f1408303    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @22514    f1214302    06.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @22520    f1214301    06.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @22526    f1214395    06.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @22532    f1348300    03.1 /*Median Age                       Table P13, (.1)                      */
     @22535    f1348400    03.1 /*Median Age, Male                 Table P13, (.1)                      */
     @22538    f1348500    03.1 /*Median Age, Female               Table P13, (.1)                      */
     @22541    f1348600    03.1 /*Median Age, White                Table P13A, (.1)                     */
     @22544    f1348700    03.1 /*Median Age, White Male           Table P13A, (.1)                     */
     @22547    f1348800    03.1 /*Median Age, White Female         Table P13A, (.1)                     */
     @22550    f1348900    03.1 /*Median Age, Black/African Amer   Table P13B, (.1)                     */
     @22553    f1349000    03.1 /*Median Age, Black/Afr Am Male    Table P13B, (.1)                     */
     @22556    f1349100    03.1 /*Median Age, Black/Afr Am Female  Table P13B, (.1)                     */
     @22559    f1349200    03.1 /*Median Age, Am Ind/Alaska Natve  Table P13C, (.1)                     */
     @22562    f1349300    03.1 /*Median Age, Am Ind/Alaska Male   Table P13C, (.1)                     */
     @22565    f1349400    03.1 /*Median Age, Am Ind/Alaska Fmale  Table P13C, (.1)                     */
     @22568    f1349500    03.1 /*Median Age, Asian                Table P13D, (.1)                     */
     @22571    f1349600    03.1 /*Median Age, Asian Male           Table P13D, (.1)                     */
     @22574    f1349700    03.1 /*Median Age, Asian Female         Table P13D, (.1)                     */
     @22577    f1349800    03.1 /*Median Age, Nat Hawaii/Oth PI    Table P13E, (.1)                     */
     @22580    f1349900    04.1 /*Median Age, Nat Haw/Oth PI Male  Table P13E, (.1)                     */
     @22584    f1350000    03.1 /*Median Age, Nat Haw/Oth PI Fmle  Table P13E, (.1)                     */
     @22587    f1350100    03.1 /*Median Age, Other Race           Table P13F, (.1)                     */
     @22590    f1350200    03.1 /*Median Age, Other Race Male      Table P13F, (.1)                     */
     @22593    f1350300    03.1 /*Median Age, Other Race Fmle      Table P13F, (.1)                     */
     @22596    f1350400    03.1 /*Median Age, Two or More Races    Table P13G, (.1)                     */
     @22599    f1350500    03.1 /*Median Age, Two+ Races Male      Table P13G, (.1)                     */
     @22602    f1350600    03.1 /*Median Age, Two+ Races Female    Table P13G, (.1)                     */
     @22605    f1350700    03.1 /*Median Age, Hispanic/Latino      Table P13H, (.1)                     */
     @22608    f1350800    03.1 /*Median Age, Hispanic/Lat Male    Table P13H, (.1)                     */
     @22611    f1350900    03.1 /*Median Age, Hispanic/Lat Female  Table P13H, (.1)                     */
     @22614    f1351000    03.1 /*Median Age, White Non-Hispanic   Table P13I, (.1)                     */
     @22617    f1351100    03.1 /*Median Age, White Non-Hisp Male  Table P13I, (.1)                     */
     @22620    f1351200    03.1 /*Median Age, White Non-Hisp Fmle  Table P13I, (.1)                     */
     @22623    f1345600    04.1 /*Percent Tot Population,One Race  Table P7, (.1)                       */
     @22627    f0453700    04.1 /*Percent White Population         Table P7, (.1), One Race Alone       */
     @22631    f0453790    04.1 /*Percent White Population         (.1)                                 */
     @22635    f0453780    04.1 /*Percent White Population         (.1)                                 */
     @22639    f0453800    04.1 /*Percent Black/African Am Pop     Table P7, (.1), One Race Alone       */
     @22643    f0453890    04.1 /*Percent Black Population         (.1)                                 */
     @22647    f0453880    04.1 /*Percent Black Population         (.1)                                 */
     @22651    f0453900    04.1 /*Percent Am Ind/Alaska Natve Pop  Table P7, (.1), One Race Alone       */
     @22655    f0453990    04.1 /*Percent Am Ind/Esk/Aleut Pop     (.1)                                 */
     @22659    f0453980    04.1 /*Percent Am Ind/Esk/Aleut Pop     (.1)                                 */
     @22663    f1345700    04.1 /*Percent Asian Population         Table P7, (.1), One Race Alone       */
     @22667    f1345800    04.1 /*Percent Nat Hawaii/Other PI Pop  Table P7, (.1), One Race Alone       */
     @22671    f0454090    04.1 /*Percent Asian/Pac Islnder Pop    (.1)                                 */
     @22675    f0454080    04.1 /*Percent Asian/Pac Islnder Pop    (.1)                                 */
     @22679    f0454100    04.1 /*Percent Some Other Population    Table P7, (.1), One Race Alone       */
     @22683    f0454190    04.1 /*Percent Other Population         (.1)                                 */
     @22687    f0454180    04.1 /*Percent Other Population         (.1)                                 */
     @22691    f1345900    04.1 /*Percent Two or more Race Pop     Table P7, (.1)                       */
     @22695    f0454200    04.1 /*Percent Hispanic/Latino Pop      Table P8, (.1)                       */
     @22699    f0454290    04.1 /*Percent Hispanic Origin Pop      (.1)                                 */
     @22703    f0454280    04.1 /*Percent Spanish Descent Pop      (.1)                                 */
     @22707    f1244300    04.1 /*Percent Foreign Born Pop         (.1) Table P21                       */
     @22711    f1244390    04.1 /*Percent Foreign Born Pop         (.1)                                 */
     @22715    f1332500    08.  /*Total Population, One Race       Whole Numbers                        */
     @22723    f0453100    08.  /*White Population                 Whole Numbers; One Race Alone        */
     @22731    f0453190    08.  /*White Population                 Whole Numbers                        */
     @22739    f0453180    08.  /*White Population                 Whole Numbers                        */
     @22747    f0453200    08.  /*Black/African American Pop       Whole Numbers; One Race Alone        */
     @22755    f0453290    08.  /*Black Population                 Whole Numbers                        */
     @22763    f0453280    08.  /*Black Population                 Whole Numbers                        */
     @22771    f0453300    08.  /*Am Indian/Alaska Native Pop      Whole Numbers; One Race Alone        */
     @22779    f0453390    08.  /*Am Ind/Esk/Aleut Population      Whole Numbers                        */
     @22787    f0453380    08.  /*Am Ind/Esk/Aleut Population      Whole Numbers                        */
     @22795    f1351600    05.  /*American Indian, Apache Pop      Table PCT1                           */
     @22800    f1351700    05.  /*American Indian, Blackfeet Pop   Table PCT1                           */
     @22805    f1351800    05.  /*American Indian, Cherokee Pop    Table PCT1                           */
     @22810    f1351900    05.  /*American Indian, Cheyenne Pop    Table PCT1                           */
     @22815    f1352000    05.  /*American Indian, Chickasaw Pop   Table PCT1                           */
     @22820    f1352100    05.  /*American Indian, Chippewa Pop    Table PCT1                           */
     @22825    f1352200    05.  /*American Indian, Choctaw Pop     Table PCT1                           */
     @22830    f1352300    05.  /*American Indian, Colville Pop    Table PCT1                           */
     @22835    f1352400    05.  /*American Indian, Comanche Pop    Table PCT1                           */
     @22840    f1352500    05.  /*American Indian, Cree Pop        Table PCT1                           */
     @22845    f1352600    05.  /*American Indian, Creek Pop       Table PCT1                           */
     @22850    f1352700    05.  /*American Indian, Crow Pop        Table PCT1                           */
     @22855    f1352800    05.  /*American Indian, Delaware Pop    Table PCT1                           */
     @22860    f1352900    05.  /*American Indian, Houma Pop       Table PCT1                           */
     @22865    f1353000    05.  /*American Indian, Iroquois Pop    Table PCT1                           */
     @22870    f1353100    05.  /*American Indian, Kiowa Pop       Table PCT1                           */
     @22875    f1353200    05.  /*American Ind,Latin Amer Ind Pop  Table PCT1                           */
     @22880    f1353300    05.  /*American Indian, Lumbee Pop      Table PCT1                           */
     @22885    f1353400    05.  /*American Indian, Menominee Pop   Table PCT1                           */
     @22890    f1353500    05.  /*American Indian, Navajo Pop      Table PCT1                           */
     @22895    f1353600    05.  /*American Indian, Osage Pop       Table PCT1                           */
     @22900    f1353700    05.  /*American Indian, Ottawa Pop      Table PCT1                           */
     @22905    f1353800    05.  /*American Indian, Paiute Pop      Table PCT1                           */
     @22910    f1353900    05.  /*American Indian, Pima Pop        Table PCT1                           */
     @22915    f1354000    05.  /*American Indian, Potawatomi Pop  Table PCT1                           */
     @22920    f1354100    05.  /*American Indian, Pueblo Pop      Table PCT1                           */
     @22925    f1354200    05.  /*Amer Ind,Puget Sound Salish Pop  Table PCT1                           */
     @22930    f1354300    05.  /*American Indian, Seminole Pop    Table PCT1                           */
     @22935    f1354400    05.  /*American Indian, Shoshone Pop    Table PCT1                           */
     @22940    f1354500    05.  /*American Indian, Sioux Pop       Table PCT1                           */
     @22945    f1354600    05.  /*American Ind,Tohono O'Odham Pop  Table PCT1                           */
     @22950    f1354700    05.  /*American Indian, Ute Pop         Table PCT1                           */
     @22955    f1354800    05.  /*American Indian, Yakama Pop      Table PCT1                           */
     @22960    f1354900    05.  /*American Indian, Yaqui Pop       Table PCT1                           */
     @22965    f1355000    05.  /*American Indian, Yuman Pop       Table PCT1                           */
     @22970    f1355100    05.  /*American Ind,All Oth Tribes Pop  Table PCT1                           */
     @22975    f1355200    05.  /*Amer Ind, Tribe Unspecified Pop  Table PCT1                           */
     @22980    f1355300    05.  /*Alska Nat,Alaska Athabascan Pop  Table PCT1                           */
     @22985    f1355400    05.  /*Alaska Native, Aleut Population  Table PCT1                           */
     @22990    f1355500    05.  /*Alaska Native,Eskimo Population  Table PCT1                           */
     @22995    f1355600    05.  /*Alaska Native,Tlingit-Haida Pop  Table PCT1                           */
     @23000    f1355700    05.  /*Alaska Native,All Oth Tribe Pop  Table PCT1                           */
     @23005    f1355800    05.  /*Alaska Nat,Tribe Unspecifd Pop   Table PCT1                           */
     @23010    f1355900    05.  /*AmInd/Alska Tribe Unspecifd Pop  Table PCT1                           */
     @23015    f1160990    07.  /*American Indian Population       Whole Numbers                        */
     @23022    f1161090    07.  /*Eskimo Population                Whole Numbers                        */
     @23029    f1161190    07.  /*Aleut Population                 Whole Numbers                        */
     @23036    f1332600    08.  /*Asian Population                 Whole Numbers; One Race Alone        */
     @23044    f1332700    08.  /*Native Hawaii/Oth Pac Isl Pop    Whole Numbers; One Race Alone        */
     @23052    f0453490    08.  /*Asian/Pac Islander Population    Whole Numbers                        */
     @23060    f0453480    08.  /*Asian/Pac Islander Population    Whole Numbers                        */
     @23068    f1356000    06.  /*Asian, Asian Indian Population   Table PCT5                           */
     @23074    f1356100    06.  /*Asian, Bangladeshi Population    Table PCT5                           */
     @23080    f1356200    06.  /*Asian, Cambodian Population      Table PCT5                           */
     @23086    f1356300    06.  /*Asian,Chinese Pop,exc Taiwanese  Table PCT5                           */
     @23092    f1356400    06.  /*Asian, Filipino Population       Table PCT5                           */
     @23098    f1356500    06.  /*Asian, Hmong Population          Table PCT5                           */
     @23104    f1356600    06.  /*Asian, Indonesian Population     Table PCT5                           */
     @23110    f1356700    06.  /*Asian, Japanese Population       Table PCT5                           */
     @23116    f1356800    06.  /*Asian, Korean Population         Table PCT5                           */
     @23122    f1356900    06.  /*Asian, Laotian Population        Table PCT5                           */
     @23128    f1357000    06.  /*Asian, Malaysian Population      Table PCT5                           */
     @23134    f1357100    06.  /*Asian, Pakistani Population      Table PCT5                           */
     @23140    f1357200    06.  /*Asian, Sri Lankan Population     Table PCT5                           */
     @23146    f1357300    06.  /*Asian, Taiwanese Population      Table PCT5                           */
     @23152    f1357400    06.  /*Asian, Thai Population           Table PCT5                           */
     @23158    f1357500    06.  /*Asian, Vietnamese Population     Table PCT5                           */
     @23164    f1357600    06.  /*Asian, Other Population          Table PCT5                           */
     @23170    f1357700    06.  /*Asian, Other Unspecified Pop     Table PCT5                           */
     @23176    f1357800    05.  /*Polynesian-Native Hawaiian Pop   Table PCT8,Nat Hawaii/Other PI       */
     @23181    f1357900    05.  /*Polynesian-Samoan Population     Table PCT8,Nat Hawaii/Other PI       */
     @23186    f1358000    05.  /*Polynesian-Tongan Population     Table PCT8,Nat Hawaii/Other PI       */
     @23191    f1358100    05.  /*Polynesian-Other Population      Table PCT8,Nat Hawaii/Other PI       */
     @23196    f1358200    05.  /*Micronsn-Guamanian/Chamorro Pop  Table PCT8,Nat Hawaii/Other PI       */
     @23201    f1358300    05.  /*Micronesian-Other Population     Table PCT8,Nat Hawaii/Other PI       */
     @23206    f1358400    05.  /*Melanesian-Fijian Population     Table PCT8,Nat Hawaii/Other PI       */
     @23211    f1358500    05.  /*Melanesian-Other Population      Table PCT8,Nat Hawaii/Other PI       */
     @23216    f1358600    05.  /*Oth Pacifc Islandr Unspecfd Pop  Table PCT8,Nat Hawaii/Other PI       */
     @23221    f1161290    07.  /*Chinese Population               Whole Numbers                        */
     @23228    f1161390    07.  /*Filipino Population              Whole Numbers                        */
     @23235    f1161490    07.  /*Japenese Population              Whole Numbers                        */
     @23242    f1161590    07.  /*Asian Indian Population          Whole Numbers                        */
     @23249    f1161690    07.  /*Korean Population                Whole Numbers                        */
     @23256    f1161790    07.  /*Vietnamese Population            Whole Numbers                        */
     @23263    f1161890    07.  /*Cambodian Population             Whole Numbers                        */
     @23270    f1161990    07.  /*Hmong Population                 Whole Numbers                        */
     @23277    f1162090    07.  /*Laotian Population               Whole Numbers                        */
     @23284    f1162190    07.  /*Thai Population                  Whole Numbers                        */
     @23291    f1162290    07.  /*Other Asian Population           Whole Numbers                        */
     @23298    f1162390    07.  /*Polynesian-Hawaiian Pop          Whole Numbers                        */
     @23305    f1162490    07.  /*Polynesian-Samoan Pop            Whole Numbers                        */
     @23312    f1162590    07.  /*Polynesian-Tongan Pop            Whole Numbers                        */
     @23319    f1162690    07.  /*Polynesian-Other Pop             Whole Numbers                        */
     @23326    f1162790    07.  /*Micronesian-Guamanian Pop        Whole Numbers                        */
     @23333    f1162890    07.  /*Micronesian-Other Pop            Whole Numbers                        */
     @23340    f1162990    07.  /*Melanesian Pop                   Whole Numbers                        */
     @23347    f1163090    07.  /*Other Pacific Islander Pop       Whole Numbers                        */
     @23354    f0453500    08.  /*Some Other Race Population       Whole Numbers; One Race Alone        */
     @23362    f0453590    08.  /*Other Population                 Whole Numbers                        */
     @23370    f0453580    08.  /*Other Population                 Whole Numbers                        */
     @23378    f1332800    08.  /*Two or more Races Population     Whole Numbers                        */
     @23386    f0453600    08.  /*Hispanic/Latino Population       Whole Numbers, Ethnic Designat       */
     @23394    f0453690    08.  /*Hispanic Origin Population       Whole Numbers, Ethnic Designat       */
     @23402    f0453680    08.  /*Spanish Descent Population       Whole Numbers, Ethnic Designat       */
     @23410    f1358700    07.  /*Hisp/Latin Origin-Mexican Pop    Table PCT11                          */
     @23417    f1358800    06.  /*Hisp/Latin Orig-Puerto Ricn Pop  Table PCT11                          */
     @23423    f1358900    06.  /*Hisp/Latino Origin-Cuban Pop     Table PCT11                          */
     @23429    f1359000    06.  /*Hisp/Latin Orig-Domincn Rep Pop  Table PCT11                          */
     @23435    f1359100    06.  /*Hisp/Latin Orig-Centrl Amer Pop  Table PCT11                          */
     @23441    f1359200    06.  /*Hisp/Latin Orig-South Amer Pop   Table PCT11                          */
     @23447    f1359300    06.  /*Hisp/Latin Orig-Oth Hispanc Pop  Table PCT11                          */
     @23453    f1244400    08.  /*Foreign Born Population          Table DP-2                           */
     @23461    f1244490    08.  /*Foreign Born Population                                               */
     @23469    f1163190    07.  /*White-Hispanic Origin            Whole Numbers                        */
     @23476    f1163290    07.  /*Black-Hispanic Origin            Whole Numbers                        */
     @23483    f1163390    07.  /*Am Ind/Esk/Aleut-Hispanic Orign  Whole Numbers                        */
     @23490    f1163490    07.  /*Asian/Pac Islndr-Hispanic Orign  Whole Numbers                        */
     @23497    f1163590    07.  /*Other Races-Hispanic Origin      Whole Numbers                        */
     @23504    f1163690    07.  /*Hispanic Origin-Mexican          Whole Numbers                        */
     @23511    f1163790    07.  /*Hispanic Origin-Puerto Rican     Whole Numbers                        */
     @23518    f1163890    07.  /*Hispanic Origin-Cuban            Whole Numbers                        */
     @23525    f1163990    07.  /*Hispanic Origin-Other Hispanic   Whole Numbers                        */
     @23532    f1181000    07.  /*# Non-Eng Speaking Persons 5-17  Table P19                            */
     @23539    f1181090    07.  /*# Non-Eng Speaking Persons 5-17  Table P28                            */
     @23546    f0874900    07.  /*# Non-Eng Speaking Persons 18+   Table P19                            */
     @23553    f0874990    07.  /*# Non-Eng Speaking Persons 18+   Table P28                            */
     @23560    f0851600    04.1 /*Percent Urban Population         (.1) Table P5                        */
     @23564    f0851690    04.1 /*Percent Urban Population         (.1) Table P6                        */
     @23568    f0851680    04.1 /*Percent Urban Population         (.1)                                 */
     @23572    f1367600    08.  /*Census Urban Population          Table P5; Whole Numbers              */
     @23580    f0851590    06.  /*Census Urban Population (100's)  Table P6; In Hundreds                */
     @23586    f0851580    06.  /*Census Urban Population (100's)  In Hundreds                          */
     @23592    f1367700    08.  /*Census Urbanized Areas Pop       Table P5                             */
     @23600    f1367800    08.  /*Census Urban Clusters Pop        Table P5                             */
     @23608    f1244290    05.  /*Farm Population                                                       */
     @23613    f1367900    08.  /*Census Rural Population          Table P5; Farm & Nonfarm rural       */
     @23621    f1244200    06.  /*Rural Farm Population            Table P5                             */
     @23627    f0975580    05.  /*Rural Farm Population                                                 */
     @23632    f1368000    06.  /*Rural Nonfarm Population         Table P5                             */
     @23638    f1139608    06.  /*Veteran Population Estimate                                           */
     @23644    f1139607    06.  /*Veteran Population Estimate                                           */
     @23650    f1139606    07.  /*Veteran Population Estimate                                           */
     @23657    f1139605    07.  /*Veteran Population Estimate                                           */
     @23664    f1139604    07.  /*Veteran Population Estimate                                           */
     @23671    f1139603    07.  /*Veteran Population Estimate                                           */
     @23678    f1139602    07.  /*Veteran Population Estimate                                           */
     @23685    f1139601    09.  /*Veteran Population Estimate                                           */
     @23694    f1139600    09.  /*Veteran Population Estimate                                           */
     @23703    f1139695    09.  /*Veteran Population Estimate                                           */
     @23712    f1139690    06.  /*Veteran Population                                                    */
     @23718    f1359408    06.  /*Veteran Pop Estimate, Male                                            */
     @23724    f1359407    06.  /*Veteran Pop Estimate, Male                                            */
     @23730    f1359401    07.  /*Veteran Pop Estimate, Male                                            */
     @23737    f1359400    07.  /*Veteran Pop Estimate, Male                                            */
     @23744    f1359508    06.  /*Veteran Pop Estimate, Female                                          */
     @23750    f1359507    06.  /*Veteran Pop Estimate, Female                                          */
     @23756    f1359501    07.  /*Veteran Pop Estimate, Female                                          */
     @23763    f1359500    07.  /*Veteran Pop Estimate, Female                                          */
     @23770    f1319109    08.  /*# Eligible for Medicare                                               */
     @23778    f1319108    08.  /*# Eligible for Medicare                                               */
     @23786    f1319105    08.  /*# Eligible for Medicare                                               */
     @23794    f1319104    08.  /*# Eligible for Medicare                                               */
     @23802    f1319103    08.  /*# Eligible for Medicare                                               */
     @23810    f1319102    08.  /*# Eligible for Medicare                                               */
     @23818    f1319101    08.  /*# Eligible for Medicare                                               */
     @23826    f1319100    08.  /*# Eligible for Medicare                                               */
     @23834    f1319199    08.  /*# Eligible for Medicare                                               */
     @23842    f1319198    08.  /*# Eligible for Medicare                                               */
     @23850    f1319197    08.  /*# Eligible for Medicare                                               */
     @23858    f1319209    07.  /*# Medicare Advantage Enrollees                                        */
     @23865    f1319208    07.  /*# Medicare Advantage Enrollees                                        */
     @23872    f1319205    08.  /*# Medicare Advantage Enrollees                                        */
     @23880    f1319204    08.  /*# Medicare Mangd Care Enrollees                                       */
     @23888    f1319203    08.  /*# Medicare Mangd Care Enrollees                                       */
     @23896    f1319202    08.  /*# Medicare Mangd Care Enrollees                                       */
     @23904    f1319201    08.  /*# Medicare Mangd Care Enrollees                                       */
     @23912    f1319200    08.  /*# Medicare Mangd Care Enrollees                                       */
     @23920    f1319299    08.  /*# Medicare Mangd Care Enrollees                                       */
     @23928    f1319298    08.  /*# Medicare Mangd Care Enrollees                                       */
     @23936    f1319297    08.  /*# Medicare Mangd Care Enrollees                                       */
     @23944    f1319309    05.2 /*% Medcre Advantage Penetration   (.01) Enrollees/Eligibles            */
     @23949    f1319308    05.2 /*% Medcre Advantage Penetration   (.01) Enrollees/Eligibles            */
     @23954    f1319305    05.2 /*% Medcre Advantage Penetration   (.01) Enrollees/Eligibles            */
     @23959    f1319304    05.2 /*% Medcre Mangd Care Penetration  (.01) Enrollees/Eligibles            */
     @23964    f1319303    05.2 /*% Medcre Mangd Care Penetration  (.01) Enrollees/Eligibles            */
     @23969    f1319302    05.2 /*% Medcre Mangd Care Penetration  (.01) Enrollees/Eligibles            */
     @23974    f1319301    05.2 /*% Medcre Mangd Care Penetration  (.01) Enrollees/Eligibles            */
     @23979    f1319300    05.2 /*% Medcre Mangd Care Penetration  (.01) Enrollees/Eligibles            */
     @23984    f1319399    05.2 /*% Medcre Mangd Care Penetration  (.01) Enrollees/Eligibles            */
     @23989    f1319398    05.2 /*% Medcre Mangd Care Penetration  (.01) Enrollees/Eligibles            */
     @23994    f1319397    05.2 /*% Medcre Mangd Care Penetration  (.01) Enrollees/Eligibles            */
     @23999    f1420709    07.  /*# Medicare Presc Drug Plan Enr                                        */
     @24006    f1420708    07.  /*# Medicare Presc Drug Plan Enr                                        */
     @24013    f1420809    05.2 /*% Medcre Presc Drug Plan Penetr  (.01) Enrollees/Eligibles            */
     @24018    f1420808    05.2 /*% Medcre Presc Drug Plan Penetr  (.01) Enrollees/Eligibles            */
     @24023    f1324907    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @24033    f1324906    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @24043    f1324905    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @24053    f1324904    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @24063    f1324903    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @24073    f1324902    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @24083    f1324901    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @24093    f1324900    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @24103    f1324999    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @24113    f1324998    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @24123    f1325007    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @24133    f1325006    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @24143    f1325005    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @24153    f1325004    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @24163    f1325003    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @24173    f1325002    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @24183    f1325001    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @24193    f1325000    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @24203    f1325099    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @24213    f1325098    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @24223    f1325107    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @24233    f1325106    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @24243    f1325105    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @24253    f1325104    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @24263    f1325103    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @24273    f1325102    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @24283    f1325101    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @24293    f1325100    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @24303    f1325199    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @24313    f1325198    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @24323    f1332407    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @24333    f1332406    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @24343    f1332405    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @24353    f1332404    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @24363    f1332403    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @24373    f1332402    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @24383    f1332401    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @24393    f1332400    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @24403    f1332499    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @24413    f1325207    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @24423    f1325206    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @24433    f1325205    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @24443    f1325204    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @24453    f1325203    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @24463    f1325202    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @24473    f1325201    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @24483    f1325200    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @24493    f1325299    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @24503    f1325298    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @24513    f1325307    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @24523    f1325306    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @24533    f1325305    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @24543    f1325304    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @24553    f1325303    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @24563    f1325302    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @24573    f1325301    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @24583    f1325300    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @24593    f1325399    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @24603    f1325398    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @24613    f1325407    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @24623    f1325406    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @24633    f1325405    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @24643    f1325404    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @24653    f1325403    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @24663    f1325402    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @24673    f1325401    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @24683    f1325400    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @24693    f1325499    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @24703    f1325498    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @24713    f1325507    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @24723    f1325506    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @24733    f1325505    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @24743    f1325504    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @24753    f1325503    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @24763    f1325502    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @24773    f1325501    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @24783    f1325500    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @24793    f1325599    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @24803    f1325598    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @24813    f1325607    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @24823    f1325606    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @24833    f1325605    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @24843    f1325604    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @24853    f1325603    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @24863    f1325602    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @24873    f1325601    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @24883    f1325600    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @24893    f1325699    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @24903    f1325698    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @24913    f1419605    08.  /*Medicaid Eligibles, Total                                             */
     @24921    f1419604    08.  /*Medicaid Eligibles, Total                                             */
     @24929    f1419705    08.  /*Medicaid Eligibles, Male                                              */
     @24937    f1419704    08.  /*Medicaid Eligibles, Male                                              */
     @24945    f1419805    08.  /*Medicaid Eligibles, Females                                           */
     @24953    f1419804    08.  /*Medicaid Eligibles, Females                                           */
     @24961    f1419905    08.  /*Medicaid Eligibles < 21                                               */
     @24969    f1419904    08.  /*Medicaid Eligibles < 21                                               */
     @24977    f1420005    08.  /*Medicaid Eligibles 21-64                                              */
     @24985    f1420004    08.  /*Medicaid Eligibles 21-64                                              */
     @24993    f1420105    08.  /*Medicaid Eligibles 65+                                                */
     @25001    f1420104    08.  /*Medicaid Eligibles 65+                                                */
     @25009    f1420205    08.  /*Medicaid Eligibles, Children                                          */
     @25017    f1420204    08.  /*Medicaid Eligibles, Children                                          */
     @25025    f1420305    08.  /*Medicaid Eligibles, Adults                                            */
     @25033    f1420304    08.  /*Medicaid Eligibles, Adults                                            */
     @25041    f1420405    08.  /*Medicaid Eligibles, Aged                                              */
     @25049    f1420404    08.  /*Medicaid Eligibles, Aged                                              */
     @25057    f1420505    08.  /*Medicaid Elig, Blind/Disabled                                         */
     @25065    f1420504    08.  /*Medicaid Elig, Blind/Disabled                                         */
     @25073    f1420605    08.  /*Medicare/Medicaid Dually Elig                                         */
     @25081    f1420604    08.  /*Medicare/Medicaid Dually Elig                                         */
     @25089    f0874500    07.  /*Number Households                Table P15                            */
     @25096    f0874590    07.  /*Number Households                                                     */
     @25103    f0874580    07.  /*Number Households                Table 20                             */
     @25110    f1351300    03.2 /*Average Household Size           Table P17, (.01)                     */
     @25113    f0873800    06.  /*# Households w/1 Persons         Table H13                            */
     @25119    f0873890    06.  /*# Households w/1 Persons                                              */
     @25125    f0873900    06.  /*# Households w/2 Persons         Table H13                            */
     @25131    f0873990    06.  /*# Households w/2 Persons                                              */
     @25137    f0874000    06.  /*# Households w/3 Persons         Table H13                            */
     @25143    f0874090    06.  /*# Households w/3 Persons                                              */
     @25149    f0874100    06.  /*# Households w/4 Persons         Table H13                            */
     @25155    f0874190    06.  /*# Households w/4 Persons                                              */
     @25161    f0874200    06.  /*# Households w/5 Persons         Table H13                            */
     @25167    f0874290    06.  /*# Households w/5 Persons                                              */
     @25173    f0874300    06.  /*# Households w/6 or more Person  Table H13                            */
     @25179    f0874390    06.  /*# Households w/6 or more Person                                       */
     @25185    f1166100    07.  /*# White Households               Table H6                             */
     @25192    f1166190    07.  /*# White Households                                                    */
     @25199    f1166200    07.  /*# Black/Afican American Hsehlds  Table H6                             */
     @25206    f1166290    07.  /*# Black Households                                                    */
     @25213    f1166300    07.  /*# Am Ind/Alaska Native Hsehlds   Table H6                             */
     @25220    f1166390    07.  /*# Am Ind/Eskimo/Aleut Hsehlds                                         */
     @25227    f1346000    07.  /*# Asian Households               Table H6                             */
     @25234    f1346100    07.  /*# Nat Hawaii/Oth Pac Isl HHlds   Table H6                             */
     @25241    f1166490    07.  /*# Asian/Pac Islander Hsehlds                                          */
     @25248    f1166500    07.  /*# Some Other Race Households     Table H6                             */
     @25255    f1166590    07.  /*# Other Race Households                                               */
     @25262    f1346200    07.  /*# Two or more Races Households   Table H6                             */
     @25269    f1166600    07.  /*# Hispanic/Latino Households     Table H7                             */
     @25276    f1166690    07.  /*# Hispanic Origin Households                                          */
     @25283    f1346300    06.  /*# White HHld w/Married-Cple Fam  Tab P35A,Married-Couple Family       */
     @25289    f1346400    06.  /*# Bl/AA HHld w/Married-Cple Fam  Tab P35B,Married-Couple Family       */
     @25295    f1346500    06.  /*#AmInd/Al Nat w/Married-Cpl Fam  Tab P35C,Married-Couple Family       */
     @25301    f1346600    06.  /*# Asian w/Married-Couple Fam     Tab P35D,Married-Couple Family       */
     @25307    f1346700    06.  /*#Nat Haw/Oth PI w/Marrd-Cpl Fam  Tab P35E,Married-Couple Family       */
     @25313    f1346800    06.  /*#Some Oth Rc HHlds w/Mar-Cp Fam  Tab P35F,Married-Couple Family       */
     @25319    f1346900    06.  /*#Two + Races HHlds w/Mar-Cp Fam  Tab P35G,Married-Couple Family       */
     @25325    f1347000    06.  /*# Hisp/Lat HHld w/Marrd-Cpl Fam  Tab P35H,Married-Couple Family       */
     @25331    f1166790    07.  /*# White HHlds w/Trad'l Families                                       */
     @25338    f1166890    07.  /*# Black HHlds w/Trad'l Families                                       */
     @25345    f1166990    07.  /*# AmInd/Esk/Alt w/Trad Families                                       */
     @25352    f1167090    07.  /*# Asian/PacIslr w/Trad Families                                       */
     @25359    f1167190    07.  /*# Other HHlds w/Trad'l Families                                       */
     @25366    f1167290    07.  /*# Hisp Org HHlds w/Trad Famlies                                       */
     @25373    f1160300    06.  /*# Single Parent Households       Table P35                            */
     @25379    f1160390    07.  /*# Single Parent Households                                            */
     @25386    f1160400    06.  /*# Single Parent Hseholds-White   Table P35A                           */
     @25392    f1160490    07.  /*# Single Parent Hseholds-White                                        */
     @25399    f1160500    06.  /*# Single Parent Hseholds-Bl/AA   Table P35B                           */
     @25405    f1160590    07.  /*# Single Parent Hseholds-Black                                        */
     @25412    f1160600    06.  /*# Single Parent HHlds-AmInd/Al   Table P35C                           */
     @25418    f1160690    07.  /*# Single Parent Hseholds-AmInd                                        */
     @25425    f1347100    06.  /*# Single Parent Hseholds-Asian   Table P35D                           */
     @25431    f1347200    06.  /*# Single Parent HHld-Haw/Oth PI  Table P35E                           */
     @25437    f1160790    07.  /*# Single Parent HHld-Asian/PI    Asian/Pacific Islander               */
     @25444    f1347300    06.  /*# Single Parent HHld-Other Race  Table P35F                           */
     @25450    f1347400    06.  /*# Single Parent HHld-Two+ Races  Table P35G                           */
     @25456    f1160800    06.  /*# Single Parent HHld-Hisp/Latin  Table P35H                           */
     @25462    f1160890    07.  /*# Single Parent Hseholds-Hisp                                         */
     @25469    f1348000    06.  /*Unmarried-Partner HHld,Diff Sex  Table PCT14                          */
     @25475    f1348100    05.  /*Unmarried-Partner HHlds, Male    Table PCT14                          */
     @25480    f1348200    05.  /*Unmarried-Partner HHlds, Female  Table PCT14                          */
     @25485    f0524100    08.  /*Population in Households         Table H10                            */
     @25493    f0524190    08.  /*# Persons In Households                                               */
     @25501    f0524180    08.  /*# Persons In Households                                               */
     @25509    f1399909    06.  /*Pop Estimate in Group Quarters                                        */
     @25515    f1399908    06.  /*Pop Estimate in Group Quarters                                        */
     @25521    f1399907    06.  /*Pop Estimate in Group Quarters                                        */
     @25527    f1399906    06.  /*Pop Estimate in Group Quarters                                        */
     @25533    f1399905    06.  /*Pop Estimate in Group Quarters                                        */
     @25539    f1399904    06.  /*Pop Estimate in Group Quarters                                        */
     @25545    f1399903    06.  /*Pop Estimate in Group Quarters                                        */
     @25551    f1399902    06.  /*Pop Estimate in Group Quarters                                        */
     @25557    f1399901    06.  /*Pop Estimate in Group Quarters                                        */
     @25563    f0524200    06.  /*Population in Group Quarters     Table PCT16                          */
     @25569    f0524290    06.  /*# Persons In Group Quarters                                           */
     @25575    f0524280    06.  /*# Persons In Group Quarters                                           */
     @25581    f1165600    05.  /*Pop in Correctional Institutns   Table PCT16                          */
     @25586    f1165690    06.  /*Pop in Correctional Institutns                                        */
     @25592    f1165700    05.  /*Pop in Nursing Homes             Table PCT16                          */
     @25597    f1165790    06.  /*Pop in Nursing Homes                                                  */
     @25603    f1347500    04.  /*Pop in Hsp/Ward,Hspce,Hndcp Sch  Table PCT16,Exc Mental Hosps         */
     @25607    f1347600    04.  /*Pop in Mental(Psych) Hosp/Wards  Table PCT16                          */
     @25611    f1165890    06.  /*Pop in Mental Institutions                                            */
     @25617    f1347700    04.  /*Pop in Juvenile Institutions     Table PCT16                          */
     @25621    f1165990    06.  /*Pop in Juvenile Institutions                                          */
     @25627    f1347800    05.  /*Pop in Noninstitional Group Qtr  Table PCT16,Exc Group Homes          */
     @25632    f1347900    05.  /*Pop in Group Homes               Table PCT16                          */
     @25637    f1166090    06.  /*Pop in Other Institutions                                             */
     @25643    f1148890    07.  /*Pop-Homeless Shltrs/Street Locs                                       */
     @25650    f0873700    07.  /*Number Families                  Table P31                            */
     @25657    f0873790    07.  /*Number Families                                                       */
     @25664    f0873780    07.  /*Number Families                                                       */
     @25671    f1351400    03.2 /*Average Family Size              Table P33, (.01)                     */
     @25674    f0972600    08.  /*Married-Couple Families          Table P18                            */
     @25682    f0972690    08.  /*Married-Couple Families                                               */
     @25690    f0972680    08.  /*Married-Couple Families                                               */
     @25698    f0874600    04.1 /*% Families w/Female Head         Table P18, (.1)                      */
     @25702    f0874690    04.1 /*% Families w/Female Head         (.1)                                 */
     @25706    f0874680    04.1 /*% Families w/Female Head         (.1)                                 */
     @25710    f0874400    06.  /*Number Families w/Female Head    Table P18                            */
     @25716    f0874490    06.  /*Number Families w/Female Head                                         */
     @25722    f0874480    06.  /*Number Families w/Female Head                                         */
     @25728    f1255708    06.  /*Total Births                     July 1, 2008-July 1, 2009            */
     @25734    f1255707    06.  /*Total Births                     July 1, 2007-July 1, 2008            */
     @25740    f1255706    06.  /*Total Births                     July 1, 2006-July 1, 2007            */
     @25746    f1255705    06.  /*Total Births                     July 1, 2005-July 1, 2006            */
     @25752    f1255704    06.  /*Total Births                     July 1, 2004-July 1, 2005            */
     @25758    f1255703    06.  /*Total Births                     July 1, 2003-July 1, 2004            */
     @25764    f1255702    06.  /*Total Births                     July 1, 2002-July 1, 2003            */
     @25770    f1255701    06.  /*Total Births                     July 1, 2001-July 1, 2002            */
     @25776    f1255700    06.  /*Total Births                     July 1, 2000-July 1, 2001            */
     @25782    f1255795    06.  /*Total Births                     July 1, 1995-July 1, 1996            */
     @25788    f1254604    06.  /*3-Yr Total Births                3 Year Average                       */
     @25794    f1254603    06.  /*3-Yr Total Births                3 Year Average                       */
     @25800    f1254698    06.  /*3-Yr Total Births                3 Year Average                       */
     @25806    f1360104    06.  /*3-Yr White Births                3 Year Average                       */
     @25812    f1360103    06.  /*3-Yr White Births                3 Year Average                       */
     @25818    f1360198    06.  /*3-Yr White Births                3 Year Average                       */
     @25824    f1360204    06.  /*3-Yr Black Births                3 Year Average                       */
     @25830    f1360203    06.  /*3-Yr Black Births                3 Year Average                       */
     @25836    f1360298    06.  /*3-Yr Black Births                3 Year Average                       */
     @25842    f1360304    06.  /*3-Yr Other Births                3 Year Average                       */
     @25848    f1360303    06.  /*3-Yr Other Births                3 Year Average                       */
     @25854    f1360398    06.  /*3-Yr Other Births                3 Year Average                       */
     @25860    f1360404    06.  /*3-Yr Hispanic Births             3 Year Average; incl any race        */
     @25866    f1360403    06.  /*3-Yr Hispanic Births             3 Year Average; incl any race        */
     @25872    f1360498    06.  /*3-Yr Hispanic Births             3 Year Average; incl any race        */
     @25878    f1254704    06.  /*3-Yr White Male Births           3 Year Average                       */
     @25884    f1254703    06.  /*3-Yr White Male Births           3 Year Average                       */
     @25890    f1254798    06.  /*3-Yr White Male Births           3 Year Average                       */
     @25896    f1254804    06.  /*3-Yr White Female Births         3 Year Average                       */
     @25902    f1254803    06.  /*3-Yr White Female Births         3 Year Average                       */
     @25908    f1254898    06.  /*3-Yr White Female Births         3 Year Average                       */
     @25914    f1254904    06.  /*3-Yr Black Male Births           3 Year Average                       */
     @25920    f1254903    06.  /*3-Yr Black Male Births           3 Year Average                       */
     @25926    f1254998    06.  /*3-Yr Black Male Births           3 Year Average                       */
     @25932    f1255004    06.  /*3-Yr Black Female Births         3 Year Average                       */
     @25938    f1255003    06.  /*3-Yr Black Female Births         3 Year Average                       */
     @25944    f1255098    06.  /*3-Yr Black Female Births         3 Year Average                       */
     @25950    f1255104    06.  /*3-Yr Other Male Births           3 Year Average                       */
     @25956    f1255103    06.  /*3-Yr Other Male Births           3 Year Average                       */
     @25962    f1255198    06.  /*3-Yr Other Male Births           3 Year Average                       */
     @25968    f1255204    06.  /*3-Yr Other Female Births         3 Year Average                       */
     @25974    f1255203    06.  /*3-Yr Other Female Births         3 Year Average                       */
     @25980    f1255298    06.  /*3-Yr Other Female Births         3 Year Average                       */
     @25986    f0961907    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @25992    f0961906    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @25998    f0961905    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @26004    f0961904    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @26010    f0961903    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @26016    f0961902    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @26022    f0961901    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @26028    f0961900    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @26034    f0961995    06.  /*Total Births In Hospitals        Short Term General Hospitals         */
     @26040    f1255304    06.  /*3-Yr Tot Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @26046    f1255303    06.  /*3-Yr Tot Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @26052    f1255398    06.  /*3-Yr Tot Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @26058    f1360504    06.  /*3-Yr Very Low Birth Wt Births    < 1500 grams; 3 Year Average         */
     @26064    f1360503    06.  /*3-Yr Very Low Birth Wt Births    < 1500 grams; 3 Year Average         */
     @26070    f1360598    06.  /*3-Yr Very Low Birth Wt Births    < 1500 grams; 3 Year Average         */
     @26076    f1255404    06.  /*3-Yr Wht Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @26082    f1255403    06.  /*3-Yr Wht Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @26088    f1255498    06.  /*3-Yr Wht Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @26094    f1255504    06.  /*3-Yr Blk Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @26100    f1255503    06.  /*3-Yr Blk Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @26106    f1255598    06.  /*3-Yr Blk Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @26112    f1255604    06.  /*3-Yr Oth Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @26118    f1255603    06.  /*3-Yr Oth Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @26124    f1255698    06.  /*3-Yr Oth Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @26130    f1360604    06.  /*3-Yr Births to Teens < 18 yrs    3 Year Average; under 18 years       */
     @26136    f1360603    06.  /*3-Yr Births to Teens < 18 yrs    3 Year Average; under 18 years       */
     @26142    f1360698    06.  /*3-Yr Births to Teens < 18 yrs    3 Year Average; under 18 years       */
     @26148    f1387004    06.  /*3-Yr Births to Unmarried Mother  3 Year Average                       */
     @26154    f1387003    06.  /*3-Yr Births to Unmarried Mother  3 Year Average                       */
     @26160    f1387098    06.  /*3-Yr Births to Unmarried Mother  3 Year Average                       */
     @26166    f1360804    06.  /*3-Yr Births - Preterm            3 Yr Ave; Gestation < 37 wks         */
     @26172    f1360803    06.  /*3-Yr Births - Preterm            3 Yr Ave; Gestation < 37 wks         */
     @26178    f1360898    06.  /*3-Yr Births - Preterm            3 Yr Ave; Gestation < 37 wks         */
     @26184    f1361104    06.  /*3-Yr Births - Vaginal Delivery   3 Year Average                       */
     @26190    f1361103    06.  /*3-Yr Births - Vaginal Delivery   3 Year Average                       */
     @26196    f1361198    06.  /*3-Yr Births - Vaginal Delivery   3 Year Average                       */
     @26202    f1361204    06.  /*3-Yr Births - C-Sect Delivery    3 Year Average                       */
     @26208    f1361203    06.  /*3-Yr Births - C-Sect Delivery    3 Year Average                       */
     @26214    f1361298    06.  /*3-Yr Births - C-Sect Delivery    3 Year Average                       */
     @26220    f1266902    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26226    f1266901    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26232    f1266900    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26238    f1266999    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26244    f1266998    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26250    f1266997    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26256    f1266996    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26262    f1266995    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26268    f1266994    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26274    f1266993    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26280    f1266992    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26286    f1266991    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26292    f1266990    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26298    f1266989    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26304    f0849084    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26310    f0849083    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26316    f0849082    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26322    f0849081    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26328    f1267002    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26334    f1267001    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26340    f1267000    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26346    f1267099    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26352    f1267098    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26358    f1267097    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26364    f1267096    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26370    f1267095    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26376    f1267094    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26382    f1267093    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26388    f1267092    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26394    f1267091    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26400    f1267090    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26406    f1267089    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26412    f0849184    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26418    f0849183    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26424    f0849182    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26430    f0849181    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26436    f1267102    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26442    f1267101    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26448    f1267100    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26454    f1267199    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26460    f1267198    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26466    f1267197    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26472    f1267196    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26478    f1267195    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26484    f1267194    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26490    f1267193    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26496    f1267192    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26502    f1267191    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26508    f1267190    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26514    f1267189    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26520    f0849284    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26526    f0849283    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26532    f0849282    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26538    f0849281    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @26544    f1190004    04.1 /*3-Yr White Male Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26548    f1190003    04.1 /*3-Yr White Male Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26552    f1190098    04.1 /*3-Yr White Male Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26556    f1190104    04.1 /*3-Yr White Fmle Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26560    f1190103    04.1 /*3-Yr White Fmle Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26564    f1190198    04.1 /*3-Yr White Fmle Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26568    f1190204    04.1 /*3-Yr Black Male Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26572    f1190203    04.1 /*3-Yr Black Male Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26576    f1190298    04.1 /*3-Yr Black Male Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26580    f1190304    04.1 /*3-Yr Black Fmle Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26584    f1190303    04.1 /*3-Yr Black Fmle Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26588    f1190398    04.1 /*3-Yr Black Fmle Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26592    f1190404    04.1 /*3-Yr Other Male Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26596    f1190403    04.1 /*3-Yr Other Male Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26600    f1190498    04.1 /*3-Yr Other Male Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26604    f1190504    04.1 /*3-Yr Other Fmle Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26608    f1190503    04.1 /*3-Yr Other Fmle Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26612    f1190598    04.1 /*3-Yr Other Fmle Infant Deaths    (.1) Under 1 Day Old; 3 Yr Avg       */
     @26616    f1190604    04.1 /*3-Yr White Male Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26620    f1190603    04.1 /*3-Yr White Male Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26624    f1190698    04.1 /*3-Yr White Male Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26628    f1190704    04.1 /*3-Yr White Fmle Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26632    f1190703    04.1 /*3-Yr White Fmle Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26636    f1190798    04.1 /*3-Yr White Fmle Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26640    f1190804    04.1 /*3-Yr Black Male Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26644    f1190803    04.1 /*3-Yr Black Male Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26648    f1190898    04.1 /*3-Yr Black Male Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26652    f1190904    04.1 /*3-Yr Black Fmle Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26656    f1190903    04.1 /*3-Yr Black Fmle Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26660    f1190998    04.1 /*3-Yr Black Fmle Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26664    f1191004    04.1 /*3-Yr Other Male Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26668    f1191003    04.1 /*3-Yr Other Male Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26672    f1191098    04.1 /*3-Yr Other Male Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26676    f1191104    04.1 /*3-Yr Other Fmle Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26680    f1191103    04.1 /*3-Yr Other Fmle Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26684    f1191198    04.1 /*3-Yr Other Fmle Infant Deaths    (.1) 1-6 Days Old; 3 Yr Avg          */
     @26688    f1191204    04.1 /*3-Yr White Male Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26692    f1191203    04.1 /*3-Yr White Male Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26696    f1191298    04.1 /*3-Yr White Male Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26700    f1191304    04.1 /*3-Yr White Fmle Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26704    f1191303    04.1 /*3-Yr White Fmle Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26708    f1191398    04.1 /*3-Yr White Fmle Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26712    f1191404    04.1 /*3-Yr Black Male Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26716    f1191403    04.1 /*3-Yr Black Male Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26720    f1191498    04.1 /*3-Yr Black Male Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26724    f1191504    04.1 /*3-Yr Black Fmle Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26728    f1191503    04.1 /*3-Yr Black Fmle Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26732    f1191598    04.1 /*3-Yr Black Fmle Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26736    f1191604    04.1 /*3-Yr Other Male Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26740    f1191603    04.1 /*3-Yr Other Male Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26744    f1191698    04.1 /*3-Yr Other Male Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26748    f1191704    04.1 /*3-Yr Other Fmle Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26752    f1191703    04.1 /*3-Yr Other Fmle Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26756    f1191798    04.1 /*3-Yr Other Fmle Infant Deaths    (.1) 7-27 Days Old; 3 Yr Avg         */
     @26760    f1191804    04.1 /*3-Yr White Male Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26764    f1191803    04.1 /*3-Yr White Male Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26768    f1191898    04.1 /*3-Yr White Male Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26772    f1191904    04.1 /*3-Yr White Fmle Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26776    f1191903    04.1 /*3-Yr White Fmle Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26780    f1191998    04.1 /*3-Yr White Fmle Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26784    f1192004    04.1 /*3-Yr Black Male Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26788    f1192003    04.1 /*3-Yr Black Male Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26792    f1192098    04.1 /*3-Yr Black Male Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26796    f1192104    04.1 /*3-Yr Black Fmle Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26800    f1192103    04.1 /*3-Yr Black Fmle Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26804    f1192198    04.1 /*3-Yr Black Fmle Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26808    f1192204    04.1 /*3-Yr Other Male Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26812    f1192203    04.1 /*3-Yr Other Male Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26816    f1192298    04.1 /*3-Yr Other Male Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26820    f1192304    04.1 /*3-Yr Other Fmle Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26824    f1192303    04.1 /*3-Yr Other Fmle Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26828    f1192398    04.1 /*3-Yr Other Fmle Infant Deaths    (.1) 28-364 Days Old; 3 Yr Avg       */
     @26832    f1192404    05.1 /*3-Yr White Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26837    f1192403    05.1 /*3-Yr White Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26842    f1192498    05.1 /*3-Yr White Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26847    f1192504    05.1 /*3-Yr White Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26852    f1192503    05.1 /*3-Yr White Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26857    f1192598    05.1 /*3-Yr White Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26862    f1192604    05.1 /*3-Yr Black Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26867    f1192603    05.1 /*3-Yr Black Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26872    f1192698    05.1 /*3-Yr Black Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26877    f1192704    05.1 /*3-Yr Black Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26882    f1192703    05.1 /*3-Yr Black Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26887    f1192798    05.1 /*3-Yr Black Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26892    f1192804    05.1 /*3-Yr Other Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26897    f1192803    05.1 /*3-Yr Other Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26902    f1192898    05.1 /*3-Yr Other Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26907    f1192904    05.1 /*3-Yr Other Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26912    f1192903    05.1 /*3-Yr Other Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26917    f1192998    05.1 /*3-Yr Other Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @26922    f1193004    04.  /*3-Yr AIDS Deaths                 3 Yr Avg                             */
     @26926    f1193003    04.  /*3-Yr AIDS Deaths                 3 Yr Avg                             */
     @26930    f1193098    04.  /*3-Yr AIDS Deaths                 3 Yr Avg                             */
     @26934    f1193104    05.  /*3-Yr Infectious & Para. Disease  # Dths by Cause;incl AIDS;Avg        */
     @26939    f1193103    05.  /*3-Yr Infectious & Para. Disease  # Dths by Cause;incl AIDS;Avg        */
     @26944    f1193198    05.  /*3-Yr Infectious & Para. Disease  # Dths by Cause;incl AIDS;Avg        */
     @26949    f1193204    05.  /*3-Yr Malignant Neoplasms         # Of Deaths By Cause; 3 Yr Avg       */
     @26954    f1193203    05.  /*3-Yr Malignant Neoplasms         # Of Deaths By Cause; 3 Yr Avg       */
     @26959    f1193298    05.  /*3-Yr Malignant Neoplasms         # Of Deaths By Cause; 3 Yr Avg       */
     @26964    f1316404    05.  /*3-Yr Cerebrovascular Disease     # Of Deaths By Cause; 3 Yr Avg       */
     @26969    f1316403    05.  /*3-Yr Cerebrovascular Disease     # Of Deaths By Cause; 3 Yr Avg       */
     @26974    f1316498    05.  /*3-Yr Cerebrovascular Disease     # Of Deaths By Cause; 3 Yr Avg       */
     @26979    f1193304    05.  /*3-Yr Ischemic Heart Disease      # Of Deaths By Cause; 3 Yr Avg       */
     @26984    f1193303    05.  /*3-Yr Ischemic Heart Disease      # Of Deaths By Cause; 3 Yr Avg       */
     @26989    f1193398    05.  /*3-Yr Ischemic Heart Disease      # Of Deaths By Cause; 3 Yr Avg       */
     @26994    f1316504    05.  /*3-Yr Other Cardiovas Disease     # Of Deaths By Cause; 3 Yr Avg       */
     @26999    f1316503    05.  /*3-Yr Other Cardiovas Disease     # Of Deaths By Cause; 3 Yr Avg       */
     @27004    f1316598    05.  /*3-Yr Other Cardiovas Disease     # Of Deaths By Cause; 3 Yr Avg       */
     @27009    f1193504    05.  /*3-Yr Influenza & Pneumonia       # Of Deaths By Cause; 3 Yr Avg       */
     @27014    f1193503    05.  /*3-Yr Influenza & Pneumonia       # Of Deaths By Cause; 3 Yr Avg       */
     @27019    f1193598    05.  /*3-Yr Influenza & Pneumonia       # Of Deaths By Cause; 3 Yr Avg       */
     @27024    f1193604    05.  /*3-Yr Chronic Lower Resp Dis      # Of Deaths By Cause; 3 Yr Avg       */
     @27029    f1193603    05.  /*3-Yr Chronic Lower Resp Dis      # Of Deaths By Cause; 3 Yr Avg       */
     @27034    f1193698    05.  /*3-Yr Chronic Lower Resp Dis      # Of Deaths By Cause; 3 Yr Avg       */
     @27039    f1193704    05.  /*3-Yr Chrnic Liver Dis&Cirrhosis  # Of Deaths By Cause; 3 Yr Avg       */
     @27044    f1193703    05.  /*3-Yr Chrnic Liver Dis&Cirrhosis  # Of Deaths By Cause; 3 Yr Avg       */
     @27049    f1193798    05.  /*3-Yr Chrnic Liver Dis&Cirrhosis  # Of Deaths By Cause; 3 Yr Avg       */
     @27054    f1193804    05.  /*3-Yr Motor Vehicle Accidents     # Of Deaths By Cause; 3 Yr Avg       */
     @27059    f1193803    05.  /*3-Yr Motor Vehicle Accidents     # Of Deaths By Cause; 3 Yr Avg       */
     @27064    f1193898    05.  /*3-Yr Motor Vehicle Accidents     # Of Deaths By Cause; 3 Yr Avg       */
     @27069    f1316604    05.  /*3-Yr Suicides                    # Of Deaths By Cause; 3 Yr Avg       */
     @27074    f1316603    05.  /*3-Yr Suicides                    # Of Deaths By Cause; 3 Yr Avg       */
     @27079    f1316698    05.  /*3-Yr Suicides                    # Of Deaths By Cause; 3 Yr Avg       */
     @27084    f1316704    05.  /*3-Yr Homicides&Legal Interventn  # Of Deaths By Cause; 3 Yr Avg       */
     @27089    f1316703    05.  /*3-Yr Homicides&Legal Interventn  # Of Deaths By Cause; 3 Yr Avg       */
     @27094    f1316798    05.  /*3-Yr Homicides&Legal Interventn  # Of Deaths By Cause; 3 Yr Avg       */
     @27099    f1316804    05.  /*3-Yr Other External Causes       # Of Deaths By Cause; 3 Yr Avg       */
     @27104    f1316803    05.  /*3-Yr Other External Causes       # Of Deaths By Cause; 3 Yr Avg       */
     @27109    f1316898    05.  /*3-Yr Other External Causes       # Of Deaths By Cause; 3 Yr Avg       */
     @27114    f1316904    05.  /*3-Yr Diabetes                    # Of Deaths By Cause; 3 Yr Avg       */
     @27119    f1316903    05.  /*3-Yr Diabetes                    # Of Deaths By Cause; 3 Yr Avg       */
     @27124    f1316998    05.  /*3-Yr Diabetes                    # Of Deaths By Cause; 3 Yr Avg       */
     @27129    f1317004    05.  /*3-Yr Deaths From Other Causes    # Of Deaths By Cause; 3 Yr Avg       */
     @27134    f1317003    05.  /*3-Yr Deaths From Other Causes    # Of Deaths By Cause; 3 Yr Avg       */
     @27139    f1317098    05.  /*3-Yr Deaths From Other Causes    # Of Deaths By Cause; 3 Yr Avg       */
     @27144    f1255808    06.  /*Total Deaths                     July 1, 2008-July 1, 2009            */
     @27150    f1255807    06.  /*Total Deaths                     July 1, 2007-July 1, 2008            */
     @27156    f1255806    06.  /*Total Deaths                     July 1, 2006-July 1, 2007            */
     @27162    f1255805    06.  /*Total Deaths                     July 1, 2005-July 1, 2006            */
     @27168    f1255804    06.  /*Total Deaths                     July 1, 2004-July 1, 2005            */
     @27174    f1255803    06.  /*Total Deaths                     July 1, 2003-July 1, 2004            */
     @27180    f1255802    06.  /*Total Deaths                     July 1, 2002-July 1, 2003            */
     @27186    f1255801    06.  /*Total Deaths                     July 1, 2001-July 1, 2002            */
     @27192    f1255800    06.  /*Total Deaths                     July 1, 2000-July 1, 2001            */
     @27198    f1255895    06.  /*Total Deaths                     July 1, 1995-July 1, 1996            */
     @27204    f1194104    06.  /*3-Yr Total Deaths                3 Yr Avg                             */
     @27210    f1194103    06.  /*3-Yr Total Deaths                3 Yr Avg                             */
     @27216    f1194198    06.  /*3-Yr Total Deaths                3 Yr Avg                             */
     @27222    f1194204    05.  /*3-Yr White Male Deaths           3 Yr Avg                             */
     @27227    f1194203    05.  /*3-Yr White Male Deaths           3 Yr Avg                             */
     @27232    f1194298    05.  /*3-Yr White Male Deaths           3 Yr Avg                             */
     @27237    f1194304    05.  /*3-Yr Black Male Deaths           3 Yr Avg                             */
     @27242    f1194303    05.  /*3-Yr Black Male Deaths           3 Yr Avg                             */
     @27247    f1194398    05.  /*3-Yr Black Male Deaths           3 Yr Avg                             */
     @27252    f1194404    05.  /*3-Yr Other Male Deaths           3 Yr Avg                             */
     @27257    f1194403    05.  /*3-Yr Other Male Deaths           3 Yr Avg                             */
     @27262    f1194498    05.  /*3-Yr Other Male Deaths           3 Yr Avg                             */
     @27267    f1194504    05.  /*3-Yr White Female Deaths         3 Yr Avg                             */
     @27272    f1194503    05.  /*3-Yr White Female Deaths         3 Yr Avg                             */
     @27277    f1194598    05.  /*3-Yr White Female Deaths         3 Yr Avg                             */
     @27282    f1194604    05.  /*3-Yr Black Female Deaths         3 Yr Avg                             */
     @27287    f1194603    05.  /*3-Yr Black Female Deaths         3 Yr Avg                             */
     @27292    f1194698    05.  /*3-Yr Black Female Deaths         3 Yr Avg                             */
     @27297    f1194704    05.  /*3-Yr Other Female Deaths         3 Yr Avg                             */
     @27302    f1194703    05.  /*3-Yr Other Female Deaths         3 Yr Avg                             */
     @27307    f1194798    05.  /*3-Yr Other Female Deaths         3 Yr Avg                             */
     @27312    f1194804    05.  /*3-Yr Mortality Age < 1 Year      3 Yr Avg                             */
     @27317    f1194803    05.  /*3-Yr Mortality Age < 1 Year      3 Yr Avg                             */
     @27322    f1194898    05.  /*3-Yr Mortality Age < 1 Year      3 Yr Avg                             */
     @27327    f1194904    05.  /*3-Yr Mortality Age 1-4 Years     3 Yr Avg                             */
     @27332    f1194903    05.  /*3-Yr Mortality Age 1-4 Years     3 Yr Avg                             */
     @27337    f1194998    05.  /*3-Yr Mortality Age 1-4 Years     3 Yr Avg                             */
     @27342    f1195004    05.  /*3-Yr Mortality Age 5-14 Years    3 Yr Avg                             */
     @27347    f1195003    05.  /*3-Yr Mortality Age 5-14 Years    3 Yr Avg                             */
     @27352    f1195098    05.  /*3-Yr Mortality Age 5-14 Years    3 Yr Avg                             */
     @27357    f1195104    05.  /*3-Yr Mortality Age 15-24 Years   3 Yr Avg                             */
     @27362    f1195103    05.  /*3-Yr Mortality Age 15-24 Years   3 Yr Avg                             */
     @27367    f1195198    05.  /*3-Yr Mortality Age 15-24 Years   3 Yr Avg                             */
     @27372    f1195204    05.  /*3-Yr Mortality Age 25-34 Years   3 Yr Avg                             */
     @27377    f1195203    05.  /*3-Yr Mortality Age 25-34 Years   3 Yr Avg                             */
     @27382    f1195298    05.  /*3-Yr Mortality Age 25-34 Years   3 Yr Avg                             */
     @27387    f1195304    05.  /*3-Yr Mortality Age 35-44 Years   3 Yr Avg                             */
     @27392    f1195303    05.  /*3-Yr Mortality Age 35-44 Years   3 Yr Avg                             */
     @27397    f1195398    05.  /*3-Yr Mortality Age 35-44 Years   3 Yr Avg                             */
     @27402    f1195404    05.  /*3-Yr Mortality Age 45-54 Years   3 Yr Avg                             */
     @27407    f1195403    05.  /*3-Yr Mortality Age 45-54 Years   3 Yr Avg                             */
     @27412    f1195498    05.  /*3-Yr Mortality Age 45-54 Years   3 Yr Avg                             */
     @27417    f1195504    05.  /*3-Yr Mortality Age 55-64 Years   3 Yr Avg                             */
     @27422    f1195503    05.  /*3-Yr Mortality Age 55-64 Years   3 Yr Avg                             */
     @27427    f1195598    05.  /*3-Yr Mortality Age 55-64 Years   3 Yr Avg                             */
     @27432    f1195604    05.  /*3-Yr Mortality Age 65-74 Years   3 Yr Avg                             */
     @27437    f1195603    05.  /*3-Yr Mortality Age 65-74 Years   3 Yr Avg                             */
     @27442    f1195698    05.  /*3-Yr Mortality Age 65-74 Years   3 Yr Avg                             */
     @27447    f1195704    05.  /*3-Yr Mortality Age 75-84 Years   3 Yr Avg                             */
     @27452    f1195703    05.  /*3-Yr Mortality Age 75-84 Years   3 Yr Avg                             */
     @27457    f1195798    05.  /*3-Yr Mortality Age 75-84 Years   3 Yr Avg                             */
     @27462    f1195804    05.  /*3-Yr Mortality Age 85+ Years     3 Yr Avg                             */
     @27467    f1195803    05.  /*3-Yr Mortality Age 85+ Years     3 Yr Avg                             */
     @27472    f1195898    05.  /*3-Yr Mortality Age 85+ Years     3 Yr Avg                             */
     @27477    f1195904    03.  /*3-Yr Mortality Age Unknown       3 Yr Avg                             */
     @27480    f1195903    03.  /*3-Yr Mortality Age Unknown       3 Yr Avg                             */
     @27483    f1195998    05.  /*3-Yr Mortality Age Unknown       3 Yr Avg                             */
     @27488    f0978107    06.  /*Per Capita Income                In Dollars                           */
     @27494    f0978106    06.  /*Per Capita Income                In Dollars                           */
     @27500    f0978105    05.  /*Per Capita Income                In Dollars                           */
     @27505    f0978104    05.  /*Per Capita Income                In Dollars                           */
     @27510    f0978103    05.  /*Per Capita Income                In Dollars                           */
     @27515    f0978102    05.  /*Per Capita Income                In Dollars                           */
     @27520    f0978101    05.  /*Per Capita Income                In Dollars                           */
     @27525    f0978100    05.  /*Per Capita Income                In Dollars                           */
     @27530    f0978195    05.  /*Per Capita Income                In Dollars                           */
     @27535    f0978190    05.  /*Per Capita Income                In Dollars                           */
     @27540    f0977807    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @27549    f0977806    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @27558    f0977805    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @27567    f0977804    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @27576    f0977803    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @27585    f0977802    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @27594    f0977801    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @27603    f0977800    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @27612    f0977895    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @27621    f0977890    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @27630    f1366899    06.  /*Household Income, Under $10000   Table DP-3                           */
     @27636    f0859889    06.  /*Household Income, Under $5000    Table P80                            */
     @27642    f0859989    06.  /*Household Income, $5000-9999     Table P80                            */
     @27648    f0860099    06.  /*Household Income, $10,000-14999  Table DP-3                           */
     @27654    f0860089    06.  /*Household Income, $10,000-14999  Table P80                            */
     @27660    f0860199    06.  /*Household Income, $15,000-24999  Table DP-3                           */
     @27666    f0860189    06.  /*Household Income, $15,000-24999  Table P80                            */
     @27672    f0860299    06.  /*Household Income, $25,000-49999  Table DP-3                           */
     @27678    f0860289    06.  /*Household Income, $25,000-49999  Table P80                            */
     @27684    f1180399    06.  /*Household Income, $50,000-99999  Table DP-3                           */
     @27690    f1180389    06.  /*Household Income, $50,000-99999  Table P80                            */
     @27696    f1180499    06.  /*Household Income, $100,000+      Table DP-3                           */
     @27702    f1180489    06.  /*Household Income, $100,000+      Table P80                            */
     @27708    f1245199    06.  /*Median Household Income          Table DP-3                           */
     @27714    f1245189    06.  /*Median Household Income                                               */
     @27720    f1322608    06.  /*Median Household Income          Estimates                            */
     @27726    f1322607    06.  /*Median Household Income          Estimates                            */
     @27732    f1322606    06.  /*Median Household Income          Estimates                            */
     @27738    f1322605    06.  /*Median Household Income          Estimates                            */
     @27744    f1322604    06.  /*Median Household Income          Estimates                            */
     @27750    f1322603    06.  /*Median Household Income          Estimates                            */
     @27756    f1322602    06.  /*Median Household Income          Estimates                            */
     @27762    f1322601    06.  /*Median Household Income          Estimates                            */
     @27768    f1322600    06.  /*Median Household Income          Estimates                            */
     @27774    f1322695    06.  /*Median Household Income          Estimates                            */
     @27780    f0859499    06.  /*Median Family Income             Table DP-3                           */
     @27786    f0859489    06.  /*Median Family Income             Table P107A                          */
     @27792    f0859479    05.  /*Median Family Income                                                  */
     @27797    f1368199    06.  /*# Wh HHlds w/Income < $10,000    Tbl 151A; White Households           */
     @27803    f1181189    07.  /*# Wh HHlds w/ Income < $5000     Table P82; White Households          */
     @27810    f1181289    07.  /*# Wh HHlds w/Income $5000-9999   Table P82; White Households          */
     @27817    f1181399    06.  /*# Wh HHlds Inc $10,000-14,999    Tbl 151A; White Households           */
     @27823    f1181389    07.  /*# Wh HHlds Inc $10,000-14,999    Table P82; White Households          */
     @27830    f1181499    06.  /*# Wh HHlds Inc $15,000-24,999    Tbl 151A; White Households           */
     @27836    f1181489    07.  /*# Wh HHlds Inc $15,000-24,999    Table P82; White Households          */
     @27843    f1181599    06.  /*# Wh HHlds Inc $25,000-49,999    Tbl 151A; White Households           */
     @27849    f1181589    07.  /*# Wh HHlds Inc $25,000-49,999    Table P82; White Households          */
     @27856    f1181699    06.  /*# Wh HHlds Inc $50,000-99,999    Tbl 151A; White Households           */
     @27862    f1181689    07.  /*# Wh HHlds Inc $50,000-99,999    Table P82; White Households          */
     @27869    f1181799    06.  /*# Wh HHlds Inc $100,000+         Tbl 151A; White Households           */
     @27875    f1181789    07.  /*# Wh HHlds Inc $100,000+         Table P82; White Households          */
     @27882    f1368299    06.  /*# Bl/AA HHld Income < $10,000    Tbl 151B; Black/Afr Amer HHlds       */
     @27888    f1181889    07.  /*# Bl HHlds w/Income < $5000      Table P82; Black Households          */
     @27895    f1181989    07.  /*# Bl HHlds w/Income $5000-9999   Table P82; Black Households          */
     @27902    f1182099    06.  /*# Bl/AA HHld Inc $10,000-14,999  Tbl 151B; Black/Afr Amer HHlds       */
     @27908    f1182089    07.  /*# Bl HHlds Inc $10,000-14,999    Table P82; Black Households          */
     @27915    f1182199    06.  /*# Bl/AA HHld Inc $15,000-24,999  Tbl 151B; Black/Afr Amer HHlds       */
     @27921    f1182189    07.  /*# Bl HHlds Inc $15,000-24,999    Table P82; Black Households          */
     @27928    f1182299    06.  /*# Bl/AA HHld Inc $25,000-49,999  Tbl 151B; Black/Afr Amer HHlds       */
     @27934    f1182289    07.  /*# Bl HHlds Inc $25,000-49,999    Table P82; Black Households          */
     @27941    f1182399    06.  /*# Bl/AA HHld Inc $50,000-99,999  Tbl 151B; Black/Afr Amer HHlds       */
     @27947    f1182389    07.  /*# Bl HHlds Inc $50,000-99,999    Table P82; Black Households          */
     @27954    f1182499    06.  /*# Bl/AA HHld Income $100,000+    Tbl 151B; Black/Afr Amer HHlds       */
     @27960    f1182489    07.  /*# Bl HHlds Inc $100,000+         Table P82; Black Households          */
     @27967    f1368399    06.  /*# AIAN HHld Income < $10,000     Tbl 151C;AmInd/Alaska Nat HHlds      */
     @27973    f1368499    06.  /*#AIAN HHld Income$10,000-14,999  Tbl 151C;AmInd/Alaska Nat HHlds      */
     @27979    f1368599    06.  /*#AIAN HHld Income$15,000-24,999  Tbl 151C;AmInd/Alaska Nat HHlds      */
     @27985    f1368699    06.  /*#AIAN HHld Income$25,000-49,999  Tbl 151C;AmInd/Alaska Nat HHlds      */
     @27991    f1368799    06.  /*#AIAN HHld Income$50,000-99,999  Tbl 151C;AmInd/Alaska Nat HHlds      */
     @27997    f1368899    06.  /*# AIAN HHld Income $100,000+     Tbl 151C;AmInd/Alaska Nat HHlds      */
     @28003    f1368999    06.  /*# Asian HHld Income < $10,000    Tbl 151D; Asian Households           */
     @28009    f1369099    06.  /*# Asian HHld Inc $10,000-14,999  Tbl 151D; Asian Households           */
     @28015    f1369199    06.  /*# Asian HHld Inc $15,000-24,999  Tbl 151D; Asian Households           */
     @28021    f1369299    06.  /*# Asian HHld Inc $25,000-49,999  Tbl 151D; Asian Households           */
     @28027    f1369399    06.  /*# Asian HHld Inc $50,000-99,999  Tbl 151D; Asian Households           */
     @28033    f1369499    06.  /*# Asian HHld Income $100,000+    Tbl 151D; Asian Households           */
     @28039    f1369599    06.  /*# NHPI HHld Income < $10,000     Tbl 151E; Nat Haw/Oth PI HHlds       */
     @28045    f1369699    06.  /*# NHPI HHld Inc $10,000-14,999   Tbl 151E; Nat Haw/Oth PI HHlds       */
     @28051    f1369799    06.  /*# NHPI HHld Inc $15,000-24,999   Tbl 151E; Nat Haw/Oth PI HHlds       */
     @28057    f1369899    06.  /*# NHPI HHld Inc $25,000-49,999   Tbl 151E; Nat Haw/Oth PI HHlds       */
     @28063    f1369999    06.  /*# NHPI HHld Inc $50,000-99,999   Tbl 151E; Nat Haw/Oth PI HHlds       */
     @28069    f1370099    06.  /*# NHPI HHld Income $100,000+     Tbl 151E; Nat Haw/Oth PI HHlds       */
     @28075    f1380199    06.  /*# Oth Race HHld Inc < $10,000    Tbl 151F; Some Oth Race HHlds        */
     @28081    f1380299    06.  /*#Oth Rce HHld Inc$10,000-14,999  Tbl 151F; Some Oth Race HHlds        */
     @28087    f1380399    06.  /*#Oth Rce HHld Inc$15,000-24,999  Tbl 151F; Some Oth Race HHlds        */
     @28093    f1380499    06.  /*#Oth Rce HHld Inc$25,000-49,999  Tbl 151F; Some Oth Race HHlds        */
     @28099    f1380599    06.  /*#Oth Rce HHld Inc$50,000-99,999  Tbl 151F; Some Oth Race HHlds        */
     @28105    f1380699    06.  /*#Oth Race HHld Income $100,000+  Tbl 151F; Some Oth Race HHlds        */
     @28111    f1380799    06.  /*#2+ Races HHld Income < $10,000  Tbl 151G;Two/more Races HHlds        */
     @28117    f1380899    06.  /*#2+ Rce HHld Inc $10,000-14,999  Tbl 151G;Two/more Races HHlds        */
     @28123    f1380999    06.  /*#2+ Rce HHld Inc $15,000-24,999  Tbl 151G;Two/more Races HHlds        */
     @28129    f1381099    06.  /*#2+ Rce HHld Inc $25,000-49,999  Tbl 151G;Two/more Races HHlds        */
     @28135    f1381199    06.  /*#2+ Rce HHld Inc $50,000-99,999  Tbl 151G;Two/more Races HHlds        */
     @28141    f1381299    06.  /*#2+ Races HHld Income $100,000+  Tbl 151G;Two/more Races HHlds        */
     @28147    f1370199    06.  /*# Hisp/Latino HHld Inc <$10,000  Tbl 151H; Hispanic/Latino HHld       */
     @28153    f1183289    07.  /*# HO HHlds w/ Income < $5000     Table P83; Hispanic Origin           */
     @28160    f1183389    07.  /*# HO HHlds w/Income $5000-9999   Table P83; Hispanic Origin           */
     @28167    f1183499    06.  /*#Hsp/Lat HHld Inc$10,000-14,999  Tbl 151H; Hispanic/Latino HHld       */
     @28173    f1183489    07.  /*# HO HHlds Inc $10,000-14,999    Table P83; Hispanic Origin           */
     @28180    f1183599    06.  /*#Hsp/Lat HHld Inc$15,000-24,999  Tbl 151H; Hispanic/Latino HHld       */
     @28186    f1183589    07.  /*# HO HHlds Inc $15,000-24,999    Table P83; Hispanic Origin           */
     @28193    f1183699    06.  /*#Hsp/Lat HHld Inc$25,000-49,999  Tbl 151H; Hispanic/Latino HHld       */
     @28199    f1183689    07.  /*# HO HHlds Inc $25,000-49,999    Table P83; Hispanic Origin           */
     @28206    f1183799    06.  /*#Hsp/Lat HHld Inc$50,000-99,999  Tbl 151H; Hispanic/Latino HHld       */
     @28212    f1183789    07.  /*# HO HHlds Inc $50,000-99,999    Table P83; Hispanic Origin           */
     @28219    f1183899    06.  /*#Hisp/Latino HHld Inc $100,000+  Tbl 151H; Hispanic/Latino HHld       */
     @28225    f1183889    07.  /*# HO HHlds Inc $100,000+         Table P83; Hispanic Origin           */
     @28232    f1381399    06.  /*#Wh non/Hisp HHld Inc < $10,000  Tbl 151I;White not/Hisp/Latino       */
     @28238    f1381499    06.  /*#Wh n/His HHd Inc$10,000-14,999  Tbl 151I;White not/Hisp/Latino       */
     @28244    f1381599    06.  /*#Wh n/His HHd Inc$15,000-24,999  Tbl 151I;White not/Hisp/Latino       */
     @28250    f1381699    06.  /*#Wh n/His HHd Inc$25,000-49,999  Tbl 151I;White not/Hisp/Latino       */
     @28256    f1381799    06.  /*#Wh n/His HHd Inc$50,000-99,999  Tbl 151I;White not/Hisp/Latino       */
     @28262    f1381899    06.  /*#Wh non/Hisp HHld Inc $100,000+  Tbl 151I;White not/Hisp/Latino       */
     @28268    f1182589    07.  /*# NW HHlds w/Income < $5000      Table80,82; Non-White(inc Blk)       */
     @28275    f1182689    07.  /*# NW HHlds w/Income $5000-9999   Table80,82; Non-White(inc Blk)       */
     @28282    f1182789    07.  /*# NW HHlds Inc $10,000-14,999    Table80,82; Non-White(inc Blk)       */
     @28289    f1182889    07.  /*# NW HHlds Inc $15,000-24,999    Table80,82; Non-White(inc Blk)       */
     @28296    f1182989    07.  /*# NW HHlds Inc $25,000-49,999    Table80,82; Non-White(inc Blk)       */
     @28303    f1183089    07.  /*# NW HHlds Inc $50,000-99,999    Table80,82; Non-White(inc Blk)       */
     @28310    f1183189    07.  /*# NW HHlds Inc $100,000+         Table80,82; Non-White(inc Blk)       */
     @28317    f1389999    07.  /*Ratio of Inc to Pov level < 0.5  Table P88                            */
     @28324    f1390099    07.  /*Ratio of Inc to Pov Lvl .5-.99   Table P88                            */
     @28331    f1390199    07.  /*Rtio of Inc to Pov Lvl 1.0-1.24  Table P88                            */
     @28338    f1390299    07.  /*Rtio of Inc to Pov Lv 1.25-1.49  Table P88                            */
     @28345    f1390399    07.  /*Rtio of Inc to Pov Lvl 1.5-1.74  Table P88                            */
     @28352    f1390499    07.  /*Rtio of Inc to Pov Lv 1.75-1.99  Table P88                            */
     @28359    f1390599    07.  /*Ratio of Inc to Pov Level 2.0+   Table P88                            */
     @28366    f1322308    08.  /*Persons in Poverty               Estimates                            */
     @28374    f1322307    08.  /*Persons in Poverty               Estimates                            */
     @28382    f1322306    08.  /*Persons in Poverty               Estimates                            */
     @28390    f1322305    08.  /*Persons in Poverty               Estimates                            */
     @28398    f1322304    08.  /*Persons in Poverty               Estimates                            */
     @28406    f1322303    08.  /*Persons in Poverty               Estimates                            */
     @28414    f1322302    08.  /*Persons in Poverty               Estimates                            */
     @28422    f1322301    08.  /*Persons in Poverty               Estimates                            */
     @28430    f1322300    08.  /*Persons in Poverty               Estimates                            */
     @28438    f1322395    08.  /*Persons in Poverty               Estimates                            */
     @28446    f1332108    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @28450    f1332107    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @28454    f1332106    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @28458    f1332105    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @28462    f1332104    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @28466    f1332103    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @28470    f1332102    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @28474    f1332101    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @28478    f1332100    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @28482    f1322408    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @28490    f1322407    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @28498    f1322406    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @28506    f1322405    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @28514    f1322404    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @28522    f1322403    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @28530    f1322402    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @28538    f1322401    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @28546    f1322400    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @28554    f1322495    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @28562    f1332208    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @28566    f1332207    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @28570    f1332206    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @28574    f1332205    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @28578    f1332204    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @28582    f1332203    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @28586    f1332202    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @28590    f1332201    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @28594    f1332200    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @28598    f1322508    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @28606    f1322507    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @28614    f1322506    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @28622    f1322505    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @28630    f1322504    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @28638    f1322503    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @28646    f1322502    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @28654    f1322501    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @28662    f1322500    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @28670    f1322595    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @28678    f1332308    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @28682    f1332307    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @28686    f1332306    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @28690    f1332305    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @28694    f1332304    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @28698    f1332303    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @28702    f1332302    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @28706    f1332301    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @28710    f1332300    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @28714    f0860699    04.1 /*% Persons Below Poverty Level    (.1) Table DP-3                      */
     @28718    f0860689    04.1 /*% Persons Below Poverty Level    (.1) Table P117                      */
     @28722    f0883299    07.  /*# Pers w/Pov Status Determined   Table DP-3                           */
     @28729    f0883289    07.  /*# Pers w/Pov Status Determined   Table P117                           */
     @28736    f0883499    07.  /*White w/Pov Status Determined    P159A; White Persons                 */
     @28743    f1370299    07.  /*Black/Afr Am w/Pov Status Det    P159B; Black/Afr Amer Persons        */
     @28750    f1370399    07.  /*AIAN w/Pov Status Determined     P159C;Am Ind/Alaska Nat Persons      */
     @28757    f1370499    07.  /*Asian w/Pov Status Determined    P159D; Asian Persons                 */
     @28764    f1370599    07.  /*NHPI w/Pov Status Determined     P159E;Nat Haw/Oth PI Persons         */
     @28771    f1381999    07.  /*Some Oth Race w/Pov Status Det   P159F; Some Other Race Persons       */
     @28778    f1382099    07.  /*Two + Races w/Pov Status Det     P159G;Two or more Races Persons      */
     @28785    f1370699    07.  /*Hisp/Latino w/Pov Status Det     P159H; Hispanic/Latino Persons       */
     @28792    f1382199    07.  /*White non/Hisp w/Pov Status Det  P159I; White not/Hisp/Lat Pers       */
     @28799    f0883399    07.  /*# Persons Below Poverty Level    Table DP-3                           */
     @28806    f0883389    07.  /*# Persons Below Poverty Level    Table P117                           */
     @28813    f0883599    07.  /*White Below Poverty Level        P159A; White Persons                 */
     @28820    f1370799    07.  /*Black/Afr Am Below Poverty Lvl   P159B; Black/Afr Amer Persons        */
     @28827    f1370899    07.  /*AIAN Below Poverty Level         P159C;Am Ind/Alaska Nat Persons      */
     @28834    f1370999    07.  /*Asian Below Poverty Level        P159D; Asian Persons                 */
     @28841    f1371099    07.  /*NHPI Below Poverty Level         P159E;Nat Haw/Oth PI Persons         */
     @28848    f1382299    07.  /*Some Oth Race Below Poverty Lvl  P159F; Some Other Race Persons       */
     @28855    f1382399    07.  /*Two + Races Below Poverty Level  P159G;Two or more Races Persons      */
     @28862    f1371199    07.  /*Hisp/Latino Below Poverty Level  P159H; Hispanic/Latino Persons       */
     @28869    f1382499    07.  /*White non/Hisp Below Povrty Lvl  P159I; White not/Hisp/Lat Pers       */
     @28876    f0883899    07.  /*# Pers 65+ Below Poverty Level   Table DP-3                           */
     @28883    f0883889    07.  /*# Pers 65+ Below Poverty Level   Table P117                           */
     @28890    f0975299    06.  /*Related Child Below Poverty Lvl  Table DP-3; < 18 Yrs                 */
     @28896    f0975289    06.  /*Related Child Below Poverty Lvl  Table P126; < 18 Yrs                 */
     @28902    f0975399    07.  /*Relat Child w/Pov Status Determ  Table DP-3; < 18 Yrs                 */
     @28909    f0975389    07.  /*Relat Child w/Pov Status Determ  Table P126; < 18 Yrs                 */
     @28916    f0860599    04.1 /*% Families Below Poverty Level   (.1) Table DP-3                      */
     @28920    f0860589    04.1 /*% Families Below Poverty Level   (.1) Table P123                      */
     @28924    f0884899    07.  /*# Families Below Poverty Level   Table DP-3                           */
     @28931    f0884889    07.  /*# Families Below Poverty Level   Table P123                           */
     @28938    f0884999    07.  /*# Fam w/Poverty Level Reported   Table DP-3                           */
     @28945    f0884989    07.  /*# Fam w/Poverty Level Reported   Table P123                           */
     @28952    f0883489    08.  /*# WH w/Pov Status Determined     White Persons; Table P124            */
     @28960    f0883689    08.  /*# NW w/Pov Status Determined     Non-White Persons; Table P124        */
     @28968    f0883589    08.  /*# WH Below Poverty Level         White Persons; Table P124            */
     @28976    f0883789    08.  /*# NW Below Poverty Level         Non-White Persons; Table P124        */
     @28984    f0856300    04.1 /*% Females Divorced               (.1) Table P18                       */
     @28988    f0856390    04.1 /*% Females Divorced               (.1) Table P27                       */
     @28992    f0856380    04.1 /*% Females Divorced               (.1)                                 */
     @28996    f0874800    07.  /*# Divorced Females               Table P18                            */
     @29003    f0874890    07.  /*# Divorced Females               Table P27                            */
     @29010    f0874880    07.  /*# Divorced Females                                                    */
     @29017    f1408407    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @29024    f1408406    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @29031    f1408405    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @29038    f1408404    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @29045    f1408403    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @29052    f1408402    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @29059    f1408401    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @29066    f1408400    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @29073    f1408495    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @29080    f1415306    08.  /*Persons <65 Yrs                  Estimates                            */
     @29088    f1415305    08.  /*Persons <65 Yrs                  Estimates                            */
     @29096    f1415406    08.  /*Pers <65 with Health Insurance   Estimates                            */
     @29104    f1415405    08.  /*Pers <65 with Health Insurance   Estimates                            */
     @29112    f1415506    08.  /*Pers <65 without Health Ins      Estimates                            */
     @29120    f1415505    08.  /*Pers <65 without Health Ins      Estimates                            */
     @29128    f1415606    04.1 /*% <65 without Health Insurance   (.1) Estimates                       */
     @29132    f1415605    04.1 /*% <65 without Health Insurance   (.1) Estimates                       */
     @29136    f1415706    08.  /*Males <65 Yrs                    Estimates                            */
     @29144    f1415705    08.  /*Males <65 Yrs                    Estimates                            */
     @29152    f1415806    08.  /*Males <65 with Health Insurance  Estimates                            */
     @29160    f1415805    08.  /*Males <65 with Health Insurance  Estimates                            */
     @29168    f1415906    08.  /*Males <65 without Health Ins     Estimates                            */
     @29176    f1415905    08.  /*Males <65 without Health Ins     Estimates                            */
     @29184    f1416006    04.1 /*% Males <65 without Health Ins   (.1) Estimates                       */
     @29188    f1416005    04.1 /*% Males <65 without Health Ins   (.1) Estimates                       */
     @29192    f1416106    08.  /*Females <65 Yrs                  Estimates                            */
     @29200    f1416105    08.  /*Females <65 Yrs                  Estimates                            */
     @29208    f1416206    08.  /*Females <65 with Health Ins      Estimates                            */
     @29216    f1416205    08.  /*Females <65 with Health Ins      Estimates                            */
     @29224    f1416306    08.  /*Females <65 without Health Ins   Estimates                            */
     @29232    f1416305    08.  /*Females <65 without Health Ins   Estimates                            */
     @29240    f1416406    04.1 /*% Females <65 without Hlth Ins   (.1) Estimates                       */
     @29244    f1416405    04.1 /*% Females <65 without Hlth Ins   (.1) Estimates                       */
     @29248    f1416506    07.  /*Persons 18-64 Yrs                Estimates                            */
     @29255    f1416505    07.  /*Persons 18-64 Yrs                Estimates                            */
     @29262    f1416606    07.  /*Pers 18-64 with Health Ins       Estimates                            */
     @29269    f1416605    07.  /*Pers 18-64 with Health Ins       Estimates                            */
     @29276    f1416706    07.  /*Pers 18-64 without Health Ins    Estimates                            */
     @29283    f1416705    07.  /*Pers 18-64 without Health Ins    Estimates                            */
     @29290    f1416806    04.1 /*% 18-64 without Health Ins       (.1) Estimates                       */
     @29294    f1416805    04.1 /*% 18-64 without Health Ins       (.1) Estimates                       */
     @29298    f1416906    07.  /*Males 18-64 Yrs                  Estimates                            */
     @29305    f1416905    07.  /*Males 18-64 Yrs                  Estimates                            */
     @29312    f1417006    07.  /*Males 18-64 with Health Ins      Estimates                            */
     @29319    f1417005    07.  /*Males 18-64 with Health Ins      Estimates                            */
     @29326    f1417106    07.  /*Males 18-64 without Health Ins   Estimates                            */
     @29333    f1417105    07.  /*Males 18-64 without Health Ins   Estimates                            */
     @29340    f1417206    04.1 /*% Males 18-64 without Hlth Ins   (.1) Estimates                       */
     @29344    f1417205    04.1 /*% Males 18-64 without Hlth Ins   (.1) Estimates                       */
     @29348    f1417306    07.  /*Females 18-64 Yrs                Estimates                            */
     @29355    f1417305    07.  /*Females 18-64 Yrs                Estimates                            */
     @29362    f1417406    07.  /*Females 18-64 with Health Ins    Estimates                            */
     @29369    f1417405    07.  /*Females 18-64 with Health Ins    Estimates                            */
     @29376    f1417506    07.  /*Females 18-64 without Hlth Ins   Estimates                            */
     @29383    f1417505    07.  /*Females 18-64 without Hlth Ins   Estimates                            */
     @29390    f1417606    04.1 /*% Fmles 18-64 without Hlth Ins   (.1) Estimates                       */
     @29394    f1417605    04.1 /*% Fmles 18-64 without Hlth Ins   (.1) Estimates                       */
     @29398    f1417706    07.  /*Persons 40-64 Yrs                Estimates                            */
     @29405    f1417705    07.  /*Persons 40-64 Yrs                Estimates                            */
     @29412    f1417806    07.  /*Pers 40-64 with Health Ins       Estimates                            */
     @29419    f1417805    07.  /*Pers 40-64 with Health Ins       Estimates                            */
     @29426    f1417906    07.  /*Pers 40-64 without Health Ins    Estimates                            */
     @29433    f1417905    07.  /*Pers 40-64 without Health Ins    Estimates                            */
     @29440    f1418006    04.1 /*% 40-64 without Health Ins       (.1) Estimates                       */
     @29444    f1418005    04.1 /*% 40-64 without Health Ins       (.1) Estimates                       */
     @29448    f1418106    07.  /*Males 40-64 Yrs                  Estimates                            */
     @29455    f1418105    07.  /*Males 40-64 Yrs                  Estimates                            */
     @29462    f1418206    07.  /*Males 40-64 with Health Ins      Estimates                            */
     @29469    f1418205    07.  /*Males 40-64 with Health Ins      Estimates                            */
     @29476    f1418306    07.  /*Males 40-64 without Health Ins   Estimates                            */
     @29483    f1418305    07.  /*Males 40-64 without Health Ins   Estimates                            */
     @29490    f1418406    04.1 /*% Males 40-64 without Hlth Ins   (.1) Estimates                       */
     @29494    f1418405    04.1 /*% Males 40-64 without Hlth Ins   (.1) Estimates                       */
     @29498    f1418506    07.  /*Females 40-64 Yrs                Estimates                            */
     @29505    f1418505    07.  /*Females 40-64 Yrs                Estimates                            */
     @29512    f1418606    07.  /*Females 40-64 with Health Ins    Estimates                            */
     @29519    f1418605    07.  /*Females 40-64 with Health Ins    Estimates                            */
     @29526    f1418706    07.  /*Females 40-64 without Hlth Ins   Estimates                            */
     @29533    f1418705    07.  /*Females 40-64 without Hlth Ins   Estimates                            */
     @29540    f1418806    04.1 /*% Fmles 40-64 without Hlth Ins   (.1) Estimates                       */
     @29544    f1418805    04.1 /*% Fmles 40-64 without Hlth Ins   (.1) Estimates                       */
     @29548    f1418906    07.  /*Persons <19 Yrs                  Estimates                            */
     @29555    f1423306    07.  /*Pers <19 with Health Insurance   Estimates                            */
     @29562    f1423406    07.  /*Pers <19 without Health Ins      Estimates                            */
     @29569    f1423506    04.1 /*% <19 without Health Insurance   (.1) Estimates                       */
     @29573    f1406000    08.  /*Persons with Health Insurance    Estimates                            */
     @29581    f1406100    08.  /*Person without Health Insurance  Estimates                            */
     @29589    f1406200    04.1 /*% without Health Insurance       (.1) Estimates                       */
     @29593    f1406300    08.  /*Pers <18 with Health Insurance   Estimates                            */
     @29601    f1406400    08.  /*Pers <18 without Hlth Insurance  Estimates                            */
     @29609    f1406500    04.1 /*% <18 without Health Insurance   (.1) Estimates                       */
     @29613    f1389699    07.  /*Hhlds w/Social Security Inc      Table P62                            */
     @29620    f1389799    07.  /*Hhlds w/Suppl Security Inc(SSI)  Table P63                            */
     @29627    f1389899    07.  /*Hhlds w/Public Assistance Inc    Table P64                            */
     @29634    f1244505    07.  /*# Social Security Beneficiaries  December 2005                        */
     @29641    f1244590    07.  /*# Social Security Beneficiaries  December 1990                        */
     @29648    f1433205    06.  /*Social Security Benefic Rate     December 2005; per 100,000           */
     @29654    f1244690    05.1 /*Social Security Benefic Rate     (.1) December 1990                   */
     @29659    f1244705    07.  /*# Suppl Security Inc Recipients  December 2005                        */
     @29666    f1244791    07.  /*# Suppl Security Inc Recipients  December 1991                        */
     @29673    f0856700    08.  /*Persons 25+ Yrs                  Table DP-2                           */
     @29681    f0856790    08.  /*Persons 25+ Yrs                  Table P58                            */
     @29689    f0856800    08.  /*Persons 25+ Yrs-White            Table P148A                          */
     @29697    f0856890    09.  /*Persons 25+ Yrs-White            Table P58                            */
     @29706    f1371200    08.  /*Persons 25+ Yrs-Black/Afr Am     Table P148B                          */
     @29714    f1371300    08.  /*Persons 25+ Yrs-AIAN             Table P148C                          */
     @29722    f1371400    08.  /*Persons 25+ Yrs-Asian            Table P148D                          */
     @29730    f1371500    08.  /*Persons 25+ Yrs-NHPI             Table P148E                          */
     @29738    f1382500    08.  /*Persons 25+ Yrs-Some Other Race  Table P148F                          */
     @29746    f1382600    08.  /*Persons 25+ Yrs-Two + Races      Table P148G                          */
     @29754    f1371600    08.  /*Persons 25+ Yrs-Hispanic/Latino  Table P148H                          */
     @29762    f1382700    08.  /*Persons 25+ Yrs-White non/Hisp   Table P148I                          */
     @29770    f0856990    09.  /*Persons 25+ Yrs-Nonwhite         Table P58                            */
     @29779    f0856400    07.  /*Persons 25+ Yrs w/<9 Yrs School  Table DP-2                           */
     @29786    f0856490    07.  /*Persons 25+ Yrs w/<9 Yrs School  Table P58                            */
     @29793    f0857000    07.  /*Persons 25+ w/HS Dipl or More    Table DP-2                           */
     @29800    f0857090    07.  /*Persons 25+ w/HS Dipl or More    Table P58                            */
     @29807    f0857300    07.  /*Persons 25+ w/4+ Yrs College     Table DP-2                           */
     @29814    f0857390    07.  /*Persons 25+ w/4+ Yrs College     Table P58                            */
     @29821    f0856500    07.  /*Pers 25+ w/<9 Yrs School-White   Table P148A                          */
     @29828    f0856590    08.  /*Pers 25+ w/<9 Yrs School-White   Table P58                            */
     @29836    f1371700    07.  /*Pers 25+ w/<9 Yrs School-Bl/AA   Table P148B                          */
     @29843    f1371800    07.  /*Pers 25+ w/<9 Yrs School-AIAN    Table P148C                          */
     @29850    f1371900    07.  /*Pers 25+ w/<9 Yrs School-Asian   Table P148D                          */
     @29857    f1372000    07.  /*Pers 25+ w/<9 Yrs School-NHPI    Table P148E                          */
     @29864    f1382800    07.  /*Pers 25+ w/<9 Yrs School-Oth Rc  Table P148F                          */
     @29871    f1382900    07.  /*Pers 25+ w/<9 Yrs School-2+ Rce  Table P148G                          */
     @29878    f1372100    07.  /*Pers 25+ w/<9 Yrs School-Hisp/L  Table P148H                          */
     @29885    f1383000    07.  /*Pers 25+ w/<9 Yrs Sch-Wh n/Hisp  Table P148I                          */
     @29892    f0856690    08.  /*Pers 25+ w/<9 Yrs School-Nonwh   Table P58                            */
     @29900    f0857100    07.  /*Pers 25+ w/HS Dipl or more-Wh    Table P148A                          */
     @29907    f0857190    08.  /*Pers 25+ w/HS Dipl or more-Wh    Table P58                            */
     @29915    f1372200    07.  /*Pers 25+ w/HS Dipl/more-Bl/AA    Table P148B                          */
     @29922    f1372300    07.  /*Pers 25+ w/HS Dipl or more-AIAN  Table P148C                          */
     @29929    f1372400    07.  /*Pers 25+ w/HS Dipl or more-Asia  Table P148D                          */
     @29936    f1372500    07.  /*Pers 25+ w/HS Dipl or more-NHPI  Table P148E                          */
     @29943    f1383100    07.  /*Pers 25+ w/HS Dipl/more-Oth Rce  Table P148F                          */
     @29950    f1383200    07.  /*Pers 25+ w/HS Dipl/more-2+ Race  Table P148G                          */
     @29957    f1372600    07.  /*Pers 25+ w/HS Dipl/more-Hisp/L   Table P148H                          */
     @29964    f1383300    07.  /*Per 25+ w/HS Dipl/more Wh n/His  Table P148I                          */
     @29971    f0857290    08.  /*Per 25+ w/HS Dipl or more-Nonwh  Table P58                            */
     @29979    f0857400    07.  /*Pers 25+ w/4+ Yrs College-White  Table P148A                          */
     @29986    f0857490    07.  /*Pers 25+ w/4+ Yrs College-White  Table P58                            */
     @29993    f1372700    07.  /*Pers 25+ w/4+ Yrs College-Bl/AA  Table P148B                          */
     @30000    f1372800    07.  /*Pers 25+ w/4+ Yrs College-AIAN   Table P148C                          */
     @30007    f1372900    07.  /*Pers 25+ w/4+ Yrs College-Asia   Table P148D                          */
     @30014    f1373000    07.  /*Pers 25+ w/4+ Yrs College-NHPI   Table P148E                          */
     @30021    f1383400    07.  /*Per 25+ w/4+ Yrs College-Oth Rc  Table P148F                          */
     @30028    f1383500    07.  /*Per 25+ w/4+ Yrs College-2+ Rce  Table P148G                          */
     @30035    f1373100    07.  /*Per 25+ w/4+ Yrs College-Hisp/L  Table P148H                          */
     @30042    f1383600    07.  /*Per 25+ w/4+ Yr Collge-Wh n/His  Table P148I                          */
     @30049    f0857590    07.  /*Pers 25+ w/4+ Yrs College-Nonwh  Table P58                            */
     @30056    f0857600    04.1 /*% Persons 25+ w/<9 Yrs Sch       (.1) Table DP-2                      */
     @30060    f0857690    04.1 /*% Persons 25+ w/<9 Yrs Sch       (.1) Table P58                       */
     @30064    f0857900    04.1 /*% Persons 25+ w/HS Dipl or more  (.1) Table DP-2                      */
     @30068    f0857990    04.1 /*% Persons 25+ w/HS Dipl or more  (.1) Table P58                       */
     @30072    f0858200    04.1 /*% Persons 25+ w/4+ Yrs College   (.1) Table DP-2                      */
     @30076    f0858290    04.1 /*% Persons 25+ w/4+ Yrs College   (.1) Table P58                       */
     @30080    f0857700    04.1 /*% Pers 25+ w/<9 Yrs Sch-White    (.1) Table P148A                     */
     @30084    f0857790    05.1 /*% Pers 25+ w/<9 Yrs Sch-White    (.1) Table P58                       */
     @30089    f1373200    04.1 /*% Pers 25+ w/<9 Yrs Sch-Bl/AA    (.1) Table P148B                     */
     @30093    f1373300    04.1 /*% Pers 25+ w/<9 Yrs Sch-AIAN     (.1) Table P148C                     */
     @30097    f1373400    04.1 /*% Pers 25+ w/<9 Yrs Sch-Asian    (.1) Table P148D                     */
     @30101    f1373500    04.1 /*% Pers 25+ w/<9 Yrs Sch-NHPI     (.1) Table P148E                     */
     @30105    f1383700    04.1 /*% Per 25+ w/<9 Yrs Sch-Oth Race  (.1) Table P148F                     */
     @30109    f1383800    04.1 /*% Per 25+ w/<9 Yrs Sch-2+ Races  (.1) Table P148G                     */
     @30113    f1373600    04.1 /*% Per 25+ w/<9 Yrs Sch-Hisp/Lat  (.1) Table P148H                     */
     @30117    f1383900    04.1 /*%Per 25+ w/<9 Yrs Sch-Wh n/Hisp  (.1) Table P148I                     */
     @30121    f0857890    05.1 /*% Pers 25+ w/<9 Yrs Sch-Nonwh    (.1) Table P58                       */
     @30126    f0858000    04.1 /*% Pers 25+ w/HS Dipl or more-Wh  (.1) Table P148A                     */
     @30130    f0858090    05.1 /*% Pers 25+ w/HS Dipl or more-Wh  (.1) Table P58                       */
     @30135    f1373700    04.1 /*%Per 25+ w/HS Dip or more-Bl/AA  (.1) Table P148B                     */
     @30139    f1373800    04.1 /*%Per 25+ w/HS Dipl or more-AIAN  (.1) Table P148C                     */
     @30143    f1373900    04.1 /*%Per 25+ w/HS Dip or more-Asian  (.1) Table P148D                     */
     @30147    f1374000    04.1 /*%Per 25+ w/HS Dipl or more-NHPI  (.1) Table P148E                     */
     @30151    f1384000    04.1 /*% Pers 25+ w/HS Dipl+ -Oth Race  (.1) Table P148F                     */
     @30155    f1384100    04.1 /*% Pers 25+ w/HS Dipl+ -2+ Races  (.1) Table P148G                     */
     @30159    f1374100    04.1 /*% Pers 25+ w/HS Dipl+ -Hisp/Lat  (.1) Table P148H                     */
     @30163    f1384200    04.1 /*% Pers 25+ w/HS Dipl+ -Wh n/His  (.1) Table P148I                     */
     @30167    f0858190    05.1 /*% Pers 25+ w/HS Dipl or more-NW  (.1) Table P58                       */
     @30172    f0858300    04.1 /*% Pers 25+ w/4+ Yrs Coll-White   (.1) Table P148A                     */
     @30176    f0858390    05.1 /*% Pers 25+ w/4+ Yrs Coll-White   (.1) Table P58                       */
     @30181    f1374200    04.1 /*% Pers 25+ w/4+ Yrs Coll-Bl/AA   (.1) Table P148B                     */
     @30185    f1374300    04.1 /*% Pers 25+ w/4+ Yrs Coll-AIAN    (.1) Table P148C                     */
     @30189    f1374400    04.1 /*% Pers 25+ w/4+ Yrs Coll-Asian   (.1) Table P148D                     */
     @30193    f1374500    04.1 /*% Pers 25+ w/4+ Yrs Coll-NHPI    (.1) Table P148E                     */
     @30197    f1384300    04.1 /*%Per 25+ w/4+ Yrs Coll-Oth Race  (.1) Table P148F                     */
     @30201    f1384400    04.1 /*%Per 25+ w/4+ Yrs Coll-2+ Races  (.1) Table P148G                     */
     @30205    f1374600    04.1 /*%Per 25+ w/4+ Yrs Coll-Hisp/Lat  (.1) Table P148H                     */
     @30209    f1384500    04.1 /*%Per 25+ w/4+ Yrs Coll-WH n/His  (.1) Table P148I                     */
     @30213    f0858490    05.1 /*% Pers 25+ w/4+ Yrs Coll-Nonwh   (.1) Table P58                       */
     @30218    f1387200    07.  /*Total Civilian Labor Force       16+ Yrs.; Table P43                  */
     @30225    f1374700    07.  /*Employed in Civil Labor Force    16+ Yrs.; Table P43                  */
     @30232    f0878400    07.  /*Unemployed in Civil Labor Force  16+ Yrs.; Table P43                  */
     @30239    f0878490    07.  /*Unemployed in Civil Labor Force  16+ Yrs.; Table P70                  */
     @30246    f1387300    07.  /*Females in Civilian Labor Force  16+ Yrs.; Table P43                  */
     @30253    f1374800    07.  /*Employed Fem in Civ Labor Force  16+ Yrs.; Table P43                  */
     @30260    f1374900    07.  /*Unemplyd Fem in Civ Labor Force  16+ Yrs.; Table P43                  */
     @30267    f1375000    07.  /*White Civilian Labor Force       16+ Yrs.; Table P150A                */
     @30274    f1375100    07.  /*Wh Employed Civilian Lab Force   16+ Yrs.; Table P150A                */
     @30281    f1375200    07.  /*Wh Unemplyd Civilian Lab Force   16+ Yrs.; Table P150A                */
     @30288    f1375300    07.  /*Wh Female Civilian Labor Force   16+ Yrs.; Table P150A                */
     @30295    f1375400    07.  /*Wh Employed Fmle Civ Lab Force   16+ Yrs.; Table P150A                */
     @30302    f1375500    07.  /*Wh Unemplyd Fmle Civ Lab Force   16+ Yrs.; Table P150A                */
     @30309    f1375600    07.  /*Black/AA Civilian Labor Force    16+ Yrs.; Table P150B                */
     @30316    f1375700    07.  /*Bl/AA Employed Civil Lab Force   16+ Yrs.; Table P150B                */
     @30323    f1375800    07.  /*Bl/AA Unemplyd Civil Lab Force   16+ Yrs.; Table P150B                */
     @30330    f1375900    07.  /*Bl/AA Fmle Civilian Lab Force    16+ Yrs.; Table P150B                */
     @30337    f1376000    07.  /*Bl/AA Emplyd Fmle Civ Lab Force  16+ Yrs.; Table P150B                */
     @30344    f1376100    07.  /*Bl/AA Unmplyd Fmle Civ Lab Frce  16+ Yrs.; Table P150B                */
     @30351    f1376200    07.  /*AIAN Civilian Labor Force        16+ Yrs.; Table P150C                */
     @30358    f1376300    07.  /*AIAN Employed Civil Labor Force  16+ Yrs.; Table P150C                */
     @30365    f1376400    07.  /*AIAN Unemplyd Civil Labor Force  16+ Yrs.; Table P150C                */
     @30372    f1376500    07.  /*AIAN Fmle Civilian Labor Force   16+ Yrs.; Table P150C                */
     @30379    f1376600    07.  /*AIAN Employd Fmle Civ Lab Force  16+ Yrs.; Table P150C                */
     @30386    f1376700    07.  /*AIAN Unmplyd Fmle Civ Lab Force  16+ Yrs.; Table P150C                */
     @30393    f1376800    07.  /*Asian Civilian Labor Force       16+ Yrs.; Table P150D                */
     @30400    f1376900    07.  /*Asian Employed Civil Lab Force   16+ Yrs.; Table P150D                */
     @30407    f1377000    07.  /*Asian Unemplyd Civil Lab Force   16+ Yrs.; Table P150D                */
     @30414    f1377100    07.  /*Asian Fmle Civilian Lab Force    16+ Yrs.; Table P150D                */
     @30421    f1377200    07.  /*Asian Emplyd Fmle Civ Lab Force  16+ Yrs.; Table P150D                */
     @30428    f1377300    07.  /*Asian Unmplyd Fmle Civ Lab Frce  16+ Yrs.; Table P150D                */
     @30435    f1377400    07.  /*NHPI Civilian Labor Force        16+ Yrs.; Table P150E                */
     @30442    f1377500    07.  /*NHPI Employed Civil Labor Force  16+ Yrs.; Table P150E                */
     @30449    f1377600    07.  /*NHPI Unemplyd Civil Labor Force  16+ Yrs.; Table P150E                */
     @30456    f1377700    07.  /*NHPI Fmle Civilian Labor Force   16+ Yrs.; Table P150E                */
     @30463    f1377800    07.  /*NHPI Employd Fmle Civ Lab Force  16+ Yrs.; Table P150E                */
     @30470    f1377900    07.  /*NHPI Unmplyd Fmle Civ Lab Force  16+ Yrs.; Table P150E                */
     @30477    f1384600    07.  /*Other Race Civilian Lab Force    16+ Yrs.; Table P150F                */
     @30484    f1384700    07.  /*Oth Race Emplyd Civil Lab Force  16+ Yrs.; Table P150F                */
     @30491    f1384800    07.  /*Oth Race Unmplyd Civil Lab Frce  16+ Yrs.; Table P150F                */
     @30498    f1384900    07.  /*Oth Race Fmle Civil Labor Force  16+ Yrs.; Table P150F                */
     @30505    f1385000    07.  /*Oth Rc Emplyd Fmle Civ Lab Frce  16+ Yrs.; Table P150F                */
     @30512    f1385100    07.  /*Oth Rc Unmplyd Fml Civ Lab Frce  16+ Yrs.; Table P150F                */
     @30519    f1385200    07.  /*2+ Races Civilian Labor Force    16+ Yrs.; Table P150G                */
     @30526    f1385300    07.  /*2+ Race Employd Civil Lab Force  16+ Yrs.; Table P150G                */
     @30533    f1385400    07.  /*2+ Race Unemplyd Civil Lab Frce  16+ Yrs.; Table P150G                */
     @30540    f1385500    07.  /*2+ Race Fmle Civilian Lab Force  16+ Yrs.; Table P150G                */
     @30547    f1385600    07.  /*2+ Race Emplyd Fml Civ Lab Frce  16+ Yrs.; Table P150G                */
     @30554    f1385700    07.  /*2+ Race Unmplyd Fml Civ Lab Frc  16+ Yrs.; Table P150G                */
     @30561    f1378000    07.  /*Hisp/Latino Civil Labor Force    16+ Yrs.; Table P150H                */
     @30568    f1378100    07.  /*Hisp Employed Civil Labor Force  16+ Yrs.; Table P150H                */
     @30575    f1378200    07.  /*Hisp Unemplyd Civil Labor Force  16+ Yrs.; Table P150H                */
     @30582    f1378300    07.  /*Hisp/Lat Fmle Civil Labor Force  16+ Yrs.; Table P150H                */
     @30589    f1378400    07.  /*Hisp Employd Fmle Civ Lab Force  16+ Yrs.; Table P150H                */
     @30596    f1378500    07.  /*Hisp Unmplyd Fmle Civ Lab Force  16+ Yrs.; Table P150H                */
     @30603    f1385800    07.  /*Wh non/Hisp Civil Labor Force    16+ Yrs.; Table P150I                */
     @30610    f1385900    07.  /*Wh n/His Employed Civ Lab Force  16+ Yrs.; Table P150I                */
     @30617    f1386000    07.  /*Wh n/His Unemplyd Civ Lab Force  16+ Yrs.; Table P150I                */
     @30624    f1386100    07.  /*Wh n/Hisp Fmle Civil Lab Force   16+ Yrs.; Table P150I                */
     @30631    f1386200    07.  /*Wh n/His Emplyd Fml Civ Lab Frc  16+ Yrs.; Table P150I                */
     @30638    f1386300    07.  /*Wh n/His Unmplyd Fml Civ Lab Fr  16+ Yrs.; Table P150I                */
     @30645    f1184690    08.  /*# 16+ White Males Unemployed     Table P71                            */
     @30653    f1184790    08.  /*# 16+ White Females Unemployed   Table P71                            */
     @30661    f1184890    08.  /*# 16+ Black Males Unemployed     Table P71                            */
     @30669    f1184990    08.  /*# 16+ Black Females Unemployed   Table P71                            */
     @30677    f1185090    08.  /*# 16+ Nonwhite Males Unemployed  Table P71; Includes Black            */
     @30685    f1185190    08.  /*# 16+ Nonwhite Females Unemplyd  Table P71; Includes Black            */
     @30693    f1185290    08.  /*# 16+ Hisp Orig Males Unemployd  Table P72                            */
     @30701    f1185390    08.  /*# 16+ Hisp Orig Female Unemplyd  Table P72                            */
     @30709    f1378699    07.  /*# 16+ Pop Did Not Work in '99    Table P47                            */
     @30716    f0878899    07.  /*# 16+ Males Did Not Work in '99  Table P47                            */
     @30723    f0878889    07.  /*# 16+ Males Did Not Work in '89  Table P75                            */
     @30730    f0878999    07.  /*#16+ Fmales Did Not Work in '99  Table P47                            */
     @30737    f0878989    07.  /*#16+ Fmales Did Not Work in '89  Table P75                            */
     @30744    f1378799    04.1 /*% 16+ Pop Did Not Work in '99    (.1) Table P47                       */
     @30748    f1378899    04.1 /*% 16+ Males Did Not Work in '99  (.1) Table P47                       */
     @30752    f1378999    04.1 /*%16+ Fmales Did Not Work in '99  (.1) Table P47                       */
     @30756    f1388599    07.  /*White Males Did Not Work in '99  16+ Yrs.; Table PCT71A               */
     @30763    f1388699    07.  /*White Fmles Did Not Work in '99  16+ Yrs.; Table PCT71A               */
     @30770    f1388799    07.  /*BL/AA Males Did Not Work in '99  16+ Yrs.; Table PCT71B               */
     @30777    f1388899    07.  /*BL/AA Fmals Did Not Work in '99  16+ Yrs.; Table PCT71B               */
     @30784    f1379099    07.  /*AIAN Males Did Not Work in '99   16+ Yrs.; Table PCT71C               */
     @30791    f1379199    07.  /*AIAN Fmles Did Not Work in '99   16+ Yrs.; Table PCT71C               */
     @30798    f1379299    07.  /*Asian Males Did Not Work in '99  16+ Yrs.; Table PCT71D               */
     @30805    f1379399    07.  /*Asian Fmles Did Not Work in '99  16+ Yrs.; Table PCT71D               */
     @30812    f1379499    07.  /*NHPI Males Did Not Work in '99   16+ Yrs.; Table PCT71E               */
     @30819    f1379599    07.  /*NHPI Fmles Did Not Work in '99   16+ Yrs.; Table PCT71E               */
     @30826    f1386499    07.  /*Oth Rc Male Did Not Work in '99  16+ Yrs.; Table PCT71F               */
     @30833    f1386599    07.  /*Oth Rc Fmle Did Not Work in '99  16+ Yrs.; Table PCT71F               */
     @30840    f1386699    07.  /*2+ Rc Males Did Not Work in '99  16+ Yrs.; Table PCT71G               */
     @30847    f1386799    07.  /*2+ Rc Fmles Did Not Work in '99  16+ Yrs.; Table PCT71G               */
     @30854    f1388999    07.  /*Hisp Males Did Not Work in '99   16+ Yrs.; Table PCT71H               */
     @30861    f1389099    07.  /*Hisp Fmles Did Not Work in '99   16+ Yrs.; Table PCT71H               */
     @30868    f1386899    07.  /*WH n/His Male Did Not Wrk in'99  16+ Yrs.; Table PCT71I               */
     @30875    f1386999    07.  /*WH n/His Fmle Did Not Wrk in'99  16+ Yrs.; Table PCT71I               */
     @30882    f0875800    07.  /*# Workers 16 and Over            Table DP-3                           */
     @30889    f0875890    07.  /*# Workers 16 and Over            Table P79                            */
     @30896    f0880200    07.  /*# 16+ Workers Priv/Salaried      Table DP-3                           */
     @30903    f0880290    07.  /*# 16+ Workers Priv/Salaried      Table P79                            */
     @30910    f1366900    07.  /*# 16+ Workers Govt.              Table DP-3                           */
     @30917    f0880300    07.  /*# 16+ Workers Federal Govt.      Table P51                            */
     @30924    f0880390    07.  /*# 16+ Workers Federal Govt.      Table P79                            */
     @30931    f0880400    07.  /*# 16+ Workers State Govt.        Table P51                            */
     @30938    f0880490    07.  /*# 16+ Workers State Govt.        Table P79                            */
     @30945    f0880500    07.  /*# 16+ Workers Local Govt.        Table P51                            */
     @30952    f0880590    07.  /*# 16+ Workers Local Govt.        Table P79                            */
     @30959    f0880600    07.  /*# 16+ Workers Self-Employed      Table DP-3                           */
     @30966    f0880690    07.  /*# 16+ Workers Self-Employed      Table P79                            */
     @30973    f0880700    07.  /*# 16+ Unpaid Family Workers      Table DP-3                           */
     @30980    f0880790    07.  /*# 16+ Unpaid Family Workers      Table P79                            */
     @30987    f0679208    07.  /*Civilian Labor Force, 16+                                             */
     @30994    f0679207    07.  /*Civilian Labor Force, 16+                                             */
     @31001    f0679206    07.  /*Civilian Labor Force, 16+                                             */
     @31008    f0679205    07.  /*Civilian Labor Force, 16+                                             */
     @31015    f0679204    07.  /*Civilian Labor Force, 16+                                             */
     @31022    f0679203    07.  /*Civilian Labor Force, 16+                                             */
     @31029    f0679202    07.  /*Civilian Labor Force, 16+                                             */
     @31036    f0679201    07.  /*Civilian Labor Force, 16+                                             */
     @31043    f0679200    07.  /*Civilian Labor Force, 16+                                             */
     @31050    f0679295    07.  /*Civilian Labor Force, 16+                                             */
     @31057    f0679290    07.  /*Civilian Labor Force, 16+                                             */
     @31064    f0679308    07.  /*Number Employed, 16+                                                  */
     @31071    f0679307    07.  /*Number Employed, 16+                                                  */
     @31078    f0679306    07.  /*Number Employed, 16+                                                  */
     @31085    f0679305    07.  /*Number Employed, 16+                                                  */
     @31092    f0679304    07.  /*Number Employed, 16+                                                  */
     @31099    f0679303    07.  /*Number Employed, 16+                                                  */
     @31106    f0679302    07.  /*Number Employed, 16+                                                  */
     @31113    f0679301    07.  /*Number Employed, 16+                                                  */
     @31120    f0679300    07.  /*Number Employed, 16+                                                  */
     @31127    f0679395    07.  /*Number Employed, 16+                                                  */
     @31134    f0679390    07.  /*Number Employed, 16+                                                  */
     @31141    f0679408    07.  /*Number Unemployed, 16+                                                */
     @31148    f0679407    07.  /*Number Unemployed, 16+                                                */
     @31155    f0679406    07.  /*Number Unemployed, 16+                                                */
     @31162    f0679405    07.  /*Number Unemployed, 16+                                                */
     @31169    f0679404    07.  /*Number Unemployed, 16+                                                */
     @31176    f0679403    07.  /*Number Unemployed, 16+                                                */
     @31183    f0679402    07.  /*Number Unemployed, 16+                                                */
     @31190    f0679401    07.  /*Number Unemployed, 16+                                                */
     @31197    f0679400    07.  /*Number Unemployed, 16+                                                */
     @31204    f0679495    07.  /*Number Unemployed, 16+                                                */
     @31211    f0679490    07.  /*Number Unemployed, 16+                                                */
     @31218    f0679508    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @31221    f0679507    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @31224    f0679506    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @31227    f0679505    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @31230    f0679504    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @31233    f0679503    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @31236    f0679502    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @31239    f0679501    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @31242    f0679500    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @31245    f0679595    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @31248    f0679590    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @31251    f1367000    07.  /*# Agr/Frst/Fish/Hunt/Mine Work   16+ Yrs; Table DP-3                  */
     @31258    f1184090    07.  /*# Agric/Forestry/Fishiers Work   16+ Yrs; Table P77                   */
     @31265    f0879800    07.  /*# Construction Workers           16+ Yrs; Table DP-3                  */
     @31272    f0879890    07.  /*# Construction Workers           16+ Yrs; Table P77                   */
     @31279    f1367100    07.  /*# Health/Social Service Workers  16+ Yrs; Table DP-3                  */
     @31286    f0879990    07.  /*# Health Service Workers         16+ Yrs; Table P77                   */
     @31293    f0858900    07.  /*# Manufacturing Workers          16+ Yrs; Table DP-3                  */
     @31300    f0858990    07.  /*# Manufacturing Workers          16+ Yrs; Table P77                   */
     @31307    f0859000    07.  /*# White Collar Workers           16+ Yrs; Table DP-3                  */
     @31314    f0859090    07.  /*# White Collar Workers           16+ Yrs; Table P78                   */
     @31321    f1367200    04.1 /*Percent Agr/Frst/Fish/Hunt/Mine  (.1) 16+ Yrs; Table DP-3             */
     @31325    f1184190    04.1 /*Percent Agric/Forestry/Fishiers  (.1) 16+ Yrs; Table P77              */
     @31329    f0880000    04.1 /*Percent Construction             (.1) 16+ Yrs; Table DP-3             */
     @31333    f0880090    04.1 /*Percent Construction             (.1) 16+ Yrs; Table P77              */
     @31337    f1367300    04.1 /*Percent Health/Social Services   (.1) 16+ Yrs; Table DP-3             */
     @31341    f0880190    04.1 /*Percent Health Services          (.1) 16+ Yrs; Table P77              */
     @31345    f0859200    04.1 /*Percent Manufacturing            (.1) 16+ Yrs; Table DP-3             */
     @31349    f0859290    04.1 /*Percent Manufacturing            (.1) 16+ Yrs; Table P77              */
     @31353    f0859300    04.1 /*Percent White Collar             (.1) 16+ Yrs; Table DP-3             */
     @31357    f0859390    04.1 /*Percent White Collar             (.1) 16+ Yrs; Table P78              */
     @31361    f0876000    07.  /*# 16+ Workers,Drive Alone        Table DP-3                           */
     @31368    f0876090    07.  /*# 16+ Workers,Drive Alone        Table P49                            */
     @31375    f0876100    07.  /*# 16+ Workers,Carpool            Table DP-3                           */
     @31382    f0876190    07.  /*# 16+ Workers,Carpool            Table P49                            */
     @31389    f0876200    07.  /*# 16+ Workers,Public Trans       Table DP-3                           */
     @31396    f0876290    07.  /*# 16+ Workers,Public Trans       Table P49                            */
     @31403    f0876300    07.  /*# 16+ Workers,Walk to Work       Table DP-3                           */
     @31410    f0876390    07.  /*# 16+ Workers,Walk to Work       Table P49                            */
     @31417    f0876400    07.  /*# 16+ Wrkrs,Other Means of Tran  Table DP-3                           */
     @31424    f0876490    07.  /*# 16+ Wrkrs,Other Means of Tran  Table P49                            */
     @31431    f0876500    07.  /*# 16+ Workers,Work at Home       Table DP-3                           */
     @31438    f0876590    07.  /*# 16+ Workers,Work at Home       Table P49                            */
     @31445    f1367400    07.1 /*# 16+ Workers,Mean travel time   (.1) Table DP-3                      */
     @31452    f0876600    07.  /*# 16+ Workers < 5 min to Work    Table P31                            */
     @31459    f0876690    07.  /*# 16+ Workers < 5 min to Work    Table P50                            */
     @31466    f0876700    07.  /*# 16+ Workers 5-9 min to Work    Table P31                            */
     @31473    f0876790    07.  /*# 16+ Workers 5-9 min to Work    Table P50                            */
     @31480    f0876800    07.  /*# 16+ Workers 10-14 min to Work  Table P31                            */
     @31487    f0876890    07.  /*# 16+ Workers 10-14 min to Work  Table P50                            */
     @31494    f0876900    07.  /*# 16+ Workers 15-19 min to Work  Table P31                            */
     @31501    f0876990    07.  /*# 16+ Workers 15-19 min to Work  Table P50                            */
     @31508    f0877000    07.  /*# 16+ Workers 20-29 min to Work  Table P31                            */
     @31515    f0877090    07.  /*# 16+ Workers 20-29 min to Work  Table P50                            */
     @31522    f0877100    07.  /*# 16+ Workers 30-44 min to Work  Table P31                            */
     @31529    f0877190    07.  /*# 16+ Workers 30-44 min to Work  Table P50                            */
     @31536    f0877200    07.  /*# 16+ Workers 45-59 min to Work  Table P31                            */
     @31543    f0877290    07.  /*# 16+ Workers 45-59 min to Work  Table P50                            */
     @31550    f1379600    07.  /*# 16+ Workers 60-89 min to Work  Table P31                            */
     @31557    f1379700    07.  /*# 16+ Workers 90+ min to Work    Table P31                            */
     @31564    f0877390    07.  /*# 16+ Workers 60+ min to Work    Table P50                            */
     @31571    f1379800    07.  /*# 16+ Workers Worked at home     Table P31                            */
     @31578    f0877400    07.  /*# Employed w/Disability          16-64 Yrs. Noninst'l;Table P42       */
     @31585    f0877490    07.  /*# Disabled in Labor Force        16-64 Yrs. Noninst'l;Table P66       */
     @31592    f0877500    07.  /*# Not Employed w/Disability      16-64 Yrs. Noninst'l;Table P42       */
     @31599    f0877590    07.  /*# Disab Prevented from Wrkng     16-64 Yrs. Noninst'l;Table P66       */
     @31606    f0877600    07.  /*# Employed no/disability         16-64 Yrs. Noninst'l;Table P42       */
     @31613    f0877690    07.  /*# Disab Not Wrkng/Not Preventd   16-64 Yrs. Noninst'l;Table P66       */
     @31620    f0877700    07.  /*# Not employed/no disability     16-64 Yrs. Noninst'l;Table P42       */
     @31627    f0877790    07.  /*# w/no Work Disability           16-64 Yrs. Noninst'l;Table P66       */
     @31634    f1389503    03.1 /*%Worker Commuting to Metro Area  (.1) Adjacent Metro Areas            */
     @31637    f0875500    04.1 /*% Working State/County of Res    (.1) 16+ Yrs; Table P26              */
     @31641    f0875590    04.1 /*% Working State/County of Res    (.1) 16+ Yrs; Table P45              */
     @31645    f0875600    04.1 /*% Working State/Not Cnty of Res  (.1) 16+ Yrs; Table P26              */
     @31649    f0875690    04.1 /*% Working State/Not Cnty of Res  (.1) 16+ Yrs; Table P45              */
     @31653    f0875700    04.1 /*% Working Outside State of Res   (.1) 16+ Yrs; Table P26              */
     @31657    f0875790    04.1 /*% Working Outside State of Res   (.1) 16+ Yrs; Table P45              */
     @31661    f0875100    07.  /*# Working State/County of Resid  16+ Yrs; Table P26                   */
     @31668    f0875190    07.  /*# Working State/County of Resid  16+ Yer; Table P45                   */
     @31675    f0875200    07.  /*# Working State/Not Cnty of Res  16+ Yrs; Table P26                   */
     @31682    f0875290    07.  /*# Working State/Not Cnty of Res  16+ Yrs; Table P45                   */
     @31689    f0875300    07.  /*# Working Outside State of Res   16+ Yrs; Table P26                   */
     @31696    f0875390    07.  /*# Working Outside State of Res   16+ Yrs; Table P45                   */
     @31703    f0875400    07.  /*# Reporting Place of Work        16+ Yrs; Table P26                   */
     @31710    f0875490    07.  /*# Reporting Place Of Work        16+ Yrs; Table P45                   */
     @31717    f1185800    07.  /*# Living in Same PMSA 95 & 00    Table PCT22                          */
     @31724    f1185890    07.  /*# Living In Same PMSA 85 & 90    Table P44                            */
     @31731    f0875900    07.  /*# Wrkng In Cent Cty Of PMSA Res  Table P28                            */
     @31738    f0875990    07.  /*# Wrkng In Cent Cty Of PMSA Res  Table P47                            */
     @31745    f0884300    07.  /*# Occupied Housing Units         Table H3                             */
     @31752    f0884390    07.  /*# Occupied Housing Units                                              */
     @31759    f1167300    04.1 /*% Owner-Occupied Housing Units   Table H4, (.1)                       */
     @31763    f1167390    04.1 /*% Owner-Occupied Housing Units   (.1)                                 */
     @31767    f0974000    04.1 /*% Units W/More Than 1 Person/Rm  (.1) Occupied Housing Units          */
     @31771    f0974090    04.1 /*% Units W/More Than 1 Person/Rm  (.1) Occupied Housing Units          */
     @31775    f0973800    07.  /*Median Home Value                Table DP-4                           */
     @31782    f0973890    06.  /*Median Home Value                Table H61A                           */
     @31788    f0884500    04.  /*Median Gross Rent                Table DP-4                           */
     @31792    f0884590    04.  /*Median Gross Rent                Table H43A                           */
     @31796    f1409108    07.  /*Housing Units Estimates                                               */
     @31803    f1409107    07.  /*Housing Units Estimates                                               */
     @31810    f1409106    07.  /*Housing Units Estimates                                               */
     @31817    f1409105    07.  /*Housing Units Estimates                                               */
     @31824    f1409100    07.  /*Housing Units Estimates                                               */
     @31831    f1351500    07.  /*Housing Units                    Table H1                             */
     @31838    f0883990    07.  /*Housing Units                    Table H1                             */
     @31845    f0884000    07.  /*# Housing Units w/no Fuel Used   Table H40                            */
     @31852    f0884090    07.  /*# Housing Units w/no Fuel Used   Table H30                            */
     @31859    f0884400    07.  /*# Occ Hous Unit w/Telephone      Table H43                            */
     @31866    f0884490    07.  /*# Occ Hous Unit w/Telephone      Table H35                            */
     @31873    f1324800    06.  /*# Occ Hous Unit w/out Plumbing   Table H48                            */
     @31879    f1324890    06.  /*# Occ Hous Unit w/out Plumbing   Tables H64, H65                      */
     @31885    f0860900    04.1 /*% Housing Unit w/no Fuel Used    (.1) Table H40                       */
     @31889    f0860990    04.1 /*% Housing Unit w/no Fuel Used    (.1) Table H30                       */
     @31893    f0861100    04.1 /*% Occ Hous Unit w/Telephone      (.1) Table H43                       */
     @31897    f0861190    04.1 /*% Occ Hous Unit w/Telephone      (.1) Table H35                       */
     @31901    f1379900    04.1 /*% Occ Hous Unit w/out Plumbing   (.1) Table H48                       */
     @31905    f1387400    08.2 /*Total Area in Square Miles       (.2) Geo Comp Table                  */
     @31913    f0972100    08.2 /*Land Area in Square Miles        (.2) Geo Comp Table                  */
     @31921    f1387500    06.2 /*Water Area in Square Miles       (.2) Geo Comp Table                  */
     @31927    f1387600    06.1 /*Population Density per Sq Mile   (.1) Geo Comp Table                  */
     @31933    f1387700    06.1 /*Housing Unit Density per Sq Mle  (.1) Geo Comp Table                  */
     @31939    f0975602    05.  /*Farms - Number 2002                                                   */
     @31944    f1433302    05.  /*Land in Farms(Acres)             In thousands                         */
     @31949    f1433402    05.1 /*Farmland as a % of Total Land    (.1)                                 */
     @31954    f0081176    05.  /*Elevation Feet                                                        */
     @31959    f00547   $  01.  /*************                                                          */
;
run;
