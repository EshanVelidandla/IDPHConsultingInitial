  data arf;
  infile 'c:\arf2011.asc' lrecl=31897;
  input

    /*  ARF2011-12 SAS FD */

     @00001    f00001   $  01.  /*Blank                                                                 */
     @00002    f00002      05.  /*Header - FIPS St & Cty Code                                           */
     @00007    f00003   $  05.  /*Entity of File                   Equals 'AARF '                       */
     @00012    f00004   $  20.  /*Secondary Entity Of File         Mod FIPS St & Cty Code               */
     @00032    f00005   $  04.  /*Date of File                     Equals '2012'                        */
     @00036    f00006      05.  /*Date of Creation                 Equals '10213'                       */
     @00041    f00007      05.  /*File Length                      Equals '31852'                       */
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
     @00167    f1389109 $  05.  /*Metro/Micro Stat Area Code                                            */
     @00172    f1389209 $  50.  /*Metro/Micro Stat Area Name                                            */
     @00222    f1406709 $  01.  /*Metro/Micro Indicator Code       0 = Not, 1 = Metro, 2 = Micro        */
     @00223    f1419509 $  08.  /*Metro/Micro County Status        Central or Outlying                  */
     @00231    f1419309 $  05.  /*Metropolitan Division Code                                            */
     @00236    f1419409 $  50.  /*Metropolitan Division Name                                            */
     @00286    f1389309 $  03.  /*Combined Statistical Area Code                                        */
     @00289    f1389409 $  55.  /*Combined Statistical Area Name                                        */
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
     @00524    f0978710 $  01.  /*HPSA Code - Primary Care  12/10  1=Whole, 2=Part County               */
     @00525    f0978709 $  01.  /*HPSA Code - Primary Care  12/09  1=Whole, 2=Part County               */
     @00526    f0978708 $  01.  /*HPSA Code - Primary Care  12/08  1=Whole, 2=Part County               */
     @00527    f0978707 $  01.  /*HPSA Code - Primary Care  12/07  1=Whole, 2=Part County               */
     @00528    f0979210 $  01.  /*HPSA Code - Dentists      12/10  1=Whole, 2=Part County               */
     @00529    f0979209 $  01.  /*HPSA Code - Dentists      12/09  1=Whole, 2=Part County               */
     @00530    f0979208 $  01.  /*HPSA Code - Dentists      12/08  1=Whole, 2=Part County               */
     @00531    f0979207 $  01.  /*HPSA Code - Dentists      12/07  1=Whole, 2=Part County               */
     @00532    f1249210 $  01.  /*HPSA Code - Mental Health 12/10  1=Whole, 2=Part County               */
     @00533    f1249209 $  01.  /*HPSA Code - Mental Health 12/09  1=Whole, 2=Part County               */
     @00534    f1249208 $  01.  /*HPSA Code - Mental Health 12/08  1=Whole, 2=Part County               */
     @00535    f1249207 $  01.  /*HPSA Code - Mental Health 12/07  1=Whole, 2=Part County               */
     @00536    f0410180 $  05.  /*Contiguous County #  1           Zero If No Contig Cnty               */
     @00541    f0410280 $  05.  /*Contiguous County #  2           Zero If No Other Contig Cnty         */
     @00546    f0410380 $  05.  /*Contiguous County #  3           Zero If No Other Contig Cnty         */
     @00551    f0410480 $  05.  /*Contiguous County #  4           Zero If No Other Contig Cnty         */
     @00556    f0410580 $  05.  /*Contiguous County #  5           Zero If No Other Contig Cnty         */
     @00561    f0410680 $  05.  /*Contiguous County #  6           Zero If No Other Contig Cnty         */
     @00566    f0410780 $  05.  /*Contiguous County #  7           Zero If No Other Contig Cnty         */
     @00571    f0410880 $  05.  /*Contiguous County #  8           Zero If No Other Contig Cnty         */
     @00576    f0410980 $  05.  /*Contiguous County #  9           Zero If No Other Contig Cnty         */
     @00581    f0411080 $  05.  /*Contiguous County # 10           Zero If No Other Contig Cnty         */
     @00586    f0411180 $  05.  /*Contiguous County # 11           Zero If No Other Contig Cnty         */
     @00591    f0411280 $  05.  /*Contiguous County # 12           Zero If No Other Contig Cnty         */
     @00596    f0411380 $  05.  /*Contiguous County # 13           Zero If No Other Contig Cnty         */
     @00601    f0411480 $  05.  /*Contiguous County # 14           Zero If No Other Contig Cnty         */
     @00606    f1467510    04.  /*Phys,Primary Care, Patient Care  Non-Fed;Excl Hsp Res & 75+ Yrs       */
     @00610    f1467610    04.  /*Phys,Primary Care, Hsp Resident  Non-Fed                              */
     @00614    f1467710    04.  /*MD's,Primary Care, Patient Care  Non-Fed;Excl Hsp Res & 75+ Yrs       */
     @00618    f1467810    04.  /*MD's,Primary Care, Hsp Resident  Non-Fed                              */
     @00622    f1467910    04.  /*DO's,Primary Care, Patient Care  Non-Fed;Excl Hsp Res & 75+ Yrs       */
     @00626    f1468010    04.  /*DO's,Primary Care, Hsp Resident  Non-Fed                              */
     @00630    f1212910    05.  /*Tot Active M.D.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @00635    f1212908    05.  /*Tot Active M.D.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @00640    f1212905    05.  /*Tot Active M.D.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @00645    f0885710    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00650    f0885708    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00655    f0885707    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00660    f0885706    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00665    f0885705    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00670    f0885704    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00675    f0885703    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00680    f0885702    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00685    f0885701    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00690    f0885700    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00695    f0885799    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00700    f0885798    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00705    f0885797    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00710    f0885796    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00715    f0885795    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00720    f0885794    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00725    f0885793    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00730    f0885792    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00735    f0885790    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00740    f0885789    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00745    f0885788    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00750    f0885786    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00755    f0885785    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00760    f0885783    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00765    f0885782    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00770    f0885781    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00775    f0885780    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00780    f0885775    05.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00785    f0885770    06.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00791    f0885760    06.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00797    f0885750    06.  /*Total Active M.D.s Non-Federal   Non-Fed; Excl Inact                  */
     @00803    f0885740    06.  /*Total Active M.D.s Non-Federal   Act, Non-Fed, Except AK, HI          */
     @00809    f1212810    05.  /*Total M.D.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @00814    f1212808    05.  /*Total M.D.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @00819    f1212805    05.  /*Total M.D.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @00824    f0460210    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00829    f0460208    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00834    f0460207    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00839    f0460206    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00844    f0460205    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00849    f0460204    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00854    f0460203    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00859    f0460202    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00864    f0460201    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00869    f0460200    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00874    f0460299    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00879    f0460298    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00884    f0460297    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00889    f0460296    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00894    f0460295    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00899    f0460290    05.  /*Total M.D.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @00904    f1121510    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00909    f1121508    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00914    f1121507    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00919    f1121506    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00924    f1121505    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00929    f1121504    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00934    f1121503    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00939    f1121502    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00944    f1121501    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00949    f1121500    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00954    f1121599    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00959    f1121598    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00964    f1121597    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00969    f1121596    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00974    f1121595    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00979    f1121590    05.  /*M.D.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @00984    f0460310    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @00989    f0460308    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @00994    f0460307    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @00999    f0460306    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01004    f0460305    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01009    f0460304    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01014    f0460303    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01019    f0460302    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01024    f0460301    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01029    f0460300    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01034    f0460395    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01039    f0460390    05.  /*M.D.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @01044    f1121610    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01048    f1121608    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01052    f1121607    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01056    f1121606    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01060    f1121605    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01064    f1121604    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01068    f1121603    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01072    f1121602    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01076    f1121601    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01080    f1121600    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01084    f1121695    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01088    f1121690    04.  /*MDs, Tot Hosp-Based PC Non-Fed   Non-Fed;Res,FT Staff&Cl Fellow       */
     @01092    f1249910    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01097    f1249908    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01102    f1249907    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01107    f1249906    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01112    f1249905    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01117    f1249904    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01122    f1249903    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01127    f1249902    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01132    f1249901    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01137    f1249900    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01142    f1249995    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01147    f0460490    05.  /*M.D.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @01152    f1106790    05.  /*M.D.'s, Tot PC,Clinical Fellows  Non-Fed;Patn Care Hosp-Based         */
     @01157    f0460510    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01162    f0460508    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01167    f0460507    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01172    f0460506    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01177    f0460505    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01182    f0460504    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01187    f0460503    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01192    f0460502    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01197    f0460501    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01202    f0460500    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01207    f0460595    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01212    f0460590    05.  /*M.D.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @01217    f1121710    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01223    f1121708    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01229    f1121707    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01235    f1121706    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01241    f1121705    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01247    f1121704    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01253    f1121703    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01259    f1121702    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01265    f1121701    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01271    f1121700    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01277    f1121795    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01283    f1121790    06.  /*M.D.'s, Total Oth Prof Activity  Non-Fed                              */
     @01289    f0460610    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01294    f0460608    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01299    f0460607    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01304    f0460606    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01309    f0460605    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01314    f0460604    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01319    f0460603    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01324    f0460602    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01329    f0460601    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01334    f0460600    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01339    f0460695    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01344    f0460690    05.  /*M.D.'s, Total Administration     Non-Fed                              */
     @01349    f0460710    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01354    f0460708    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01359    f0460707    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01364    f0460706    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01369    f0460705    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01374    f0460704    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01379    f0460703    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01384    f0460702    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01389    f0460701    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01394    f0460700    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01399    f0460795    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01404    f0460790    05.  /*M.D.'s, Total Teaching           Non-Fed                              */
     @01409    f1106810    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01414    f1106808    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01419    f1106807    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01424    f1106806    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01429    f1106805    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01434    f1106804    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01439    f1106803    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01444    f1106802    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01449    f1106801    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01454    f1106800    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01459    f1106895    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01464    f1106890    05.  /*M.D.'s, Total Research           Non-Fed                              */
     @01469    f0460910    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01474    f0460908    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01479    f0460907    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01484    f0460906    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01489    f0460905    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01494    f0460904    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01499    f0460903    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01504    f0460902    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01509    f0460901    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01514    f0460900    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01519    f0460995    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01524    f0460990    05.  /*M.D.'s, Total Other              Non-Fed                              */
     @01529    f0461010    05.  /*MD's, Total Gen Pract, Total     Non-Fed                              */
     @01534    f0461008    05.  /*MD's, Total Gen Pract, Total     Non-Fed                              */
     @01539    f0461005    05.  /*MD's, Total Gen Pract, Total     Non-Fed                              */
     @01544    f1106910    05.  /*MD's, Tot Gen Pract,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @01549    f1106908    05.  /*MD's, Tot Gen Pract,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @01554    f1106905    05.  /*MD's, Tot Gen Pract,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @01559    f0886010    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01563    f0886008    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01567    f0886007    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01571    f0886006    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01575    f0886005    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01579    f0886000    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01583    f0886095    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01587    f0886090    04.  /*MD's, Tot Gen Pract, PC,Off Bsd  Non-Fed;Patient Care                 */
     @01591    f1250010    05.  /*MD's, Tot Gen Pract, PC,Hsp Res  Non-Fed;Patn Care Hosp-Based         */
     @01596    f1250008    05.  /*MD's, Tot Gen Pract, PC,Hsp Res  Non-Fed;Patn Care Hosp-Based         */
     @01601    f1250005    05.  /*MD's, Tot Gen Pract, PC,Hsp Res  Non-Fed;Patn Care Hosp-Based         */
     @01606    f0461310    05.  /*MD's,Tot Gen Prac,PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @01611    f0461308    05.  /*MD's,Tot Gen Prac,PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @01616    f0461305    05.  /*MD's,Tot Gen Prac,PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @01621    f0461410    05.  /*MD's, Tot Gen Pract, Administ    Non-Fed;MD's By Speclty/Actvty       */
     @01626    f0461408    05.  /*MD's, Tot Gen Pract, Administ    Non-Fed;MD's By Speclty/Actvty       */
     @01631    f0461405    05.  /*MD's, Tot Gen Pract, Administ    Non-Fed;MD's By Speclty/Actvty       */
     @01636    f0461510    05.  /*MD's, Tot Gen Pract, Teaching    Non-Fed;MD's By Speclty/Actvty       */
     @01641    f0461508    05.  /*MD's, Tot Gen Pract, Teaching    Non-Fed;MD's By Speclty/Actvty       */
     @01646    f0461505    05.  /*MD's, Tot Gen Pract, Teaching    Non-Fed;MD's By Speclty/Actvty       */
     @01651    f1107110    05.  /*MD's, Tot Gen Pract, Research    Non-Fed;MD's By Speclty/Actvty       */
     @01656    f1107108    05.  /*MD's, Tot Gen Pract, Research    Non-Fed;MD's By Speclty/Actvty       */
     @01661    f1107105    05.  /*MD's, Tot Gen Pract, Research    Non-Fed;MD's By Speclty/Actvty       */
     @01666    f0461710    05.  /*MD's, Tot Gen Pract, Other       Non-Fed;MD's By Speclty/Actvty       */
     @01671    f0461708    05.  /*MD's, Tot Gen Pract, Other       Non-Fed;MD's By Speclty/Actvty       */
     @01676    f0461705    05.  /*MD's, Tot Gen Pract, Other       Non-Fed;MD's By Speclty/Actvty       */
     @01681    f0994710    05.  /*MD's, Gen Pract, Total           Non-Fed                              */
     @01686    f0994708    05.  /*MD's, Gen Pract, Total           Non-Fed                              */
     @01691    f0994705    05.  /*MD's, Gen Pract, Total           Non-Fed                              */
     @01696    f1107210    05.  /*MD's, Gen Pract, Total Ptn Care  Non-Fed;Patient Care                 */
     @01701    f1107208    05.  /*MD's, Gen Pract, Total Ptn Care  Non-Fed;Patient Care                 */
     @01706    f1107205    05.  /*MD's, Gen Pract, Total Ptn Care  Non-Fed;Patient Care                 */
     @01711    f0994910    04.  /*MD's, Gen Pract, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @01715    f0994908    04.  /*MD's, Gen Pract, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @01719    f0994905    04.  /*MD's, Gen Pract, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @01723    f0995010    04.  /*MD's, Gen Pract, PC, Hsp Rsdnt   Non-Fed;Patn Care Hosp-Basd          */
     @01727    f0995008    04.  /*MD's, Gen Pract, PC, Hsp Rsdnt   Non-Fed;Patn Care Hosp-Basd          */
     @01731    f0995005    04.  /*MD's, Gen Pract, PC, Hsp Rsdnt   Non-Fed;Patn Care Hosp-Basd          */
     @01735    f0995110    04.  /*MD's, Gen Pract, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Basd          */
     @01739    f0995108    04.  /*MD's, Gen Pract, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Basd          */
     @01743    f0995105    04.  /*MD's, Gen Pract, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Basd          */
     @01747    f0995210    04.  /*MD's, Gen Pract, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @01751    f0995208    04.  /*MD's, Gen Pract, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @01755    f0995205    04.  /*MD's, Gen Pract, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @01759    f0995310    04.  /*MD's, Gen Pract, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @01763    f0995308    04.  /*MD's, Gen Pract, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @01767    f0995305    04.  /*MD's, Gen Pract, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @01771    f1107410    04.  /*MD's, Gen Pract, Research        Non-Fed;MD's By Speclty/Actvty       */
     @01775    f1107408    04.  /*MD's, Gen Pract, Research        Non-Fed;MD's By Speclty/Actvty       */
     @01779    f1107405    04.  /*MD's, Gen Pract, Research        Non-Fed;MD's By Speclty/Actvty       */
     @01783    f0995510    04.  /*MD's, Gen Pract, Other           Non-Fed;MD's By Speclty/Actvty       */
     @01787    f0995508    04.  /*MD's, Gen Pract, Other           Non-Fed;MD's By Speclty/Actvty       */
     @01791    f0995505    04.  /*MD's, Gen Pract, Other           Non-Fed;MD's By Speclty/Actvty       */
     @01795    f1199610    05.  /*MD's, Fam Med Gen, Total         Non-Fed                              */
     @01800    f1199608    05.  /*MD's, Fam Med Gen, Total         Non-Fed                              */
     @01805    f1199605    05.  /*MD's, Fam Med Gen, Total         Non-Fed                              */
     @01810    f1199710    05.  /*MD's, Fam Med Gen, Tot Ptn Cr    Non-Fed;Patient Care                 */
     @01815    f1199708    05.  /*MD's, Fam Med Gen, Tot Ptn Cr    Non-Fed;Patient Care                 */
     @01820    f1199705    05.  /*MD's, Fam Med Gen, Tot Ptn Cr    Non-Fed;Patient Care                 */
     @01825    f1199810    04.  /*MD's, Fam Med Gen,PC,Off Bsd     Non-Fed;Patn Care Office-Based       */
     @01829    f1199808    04.  /*MD's, Fam Med Gen,PC,Off Bsd     Non-Fed;Patn Care Office-Based       */
     @01833    f1199805    04.  /*MD's, Fam Med Gen,PC,Off Bsd     Non-Fed;Patn Care Office-Based       */
     @01837    f1250110    04.  /*MD's, Fam Med Gen,PC,Hsp Rsdnt   Non-Fed;Patn Care Hosp-Based         */
     @01841    f1250108    04.  /*MD's, Fam Med Gen,PC,Hsp Rsdnt   Non-Fed;Patn Care Hosp-Based         */
     @01845    f1250105    04.  /*MD's, Fam Med Gen,PC,Hsp Rsdnt   Non-Fed;Patn Care Hosp-Based         */
     @01849    f1200110    04.  /*MD's, Fam Med Gen,Hsp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @01853    f1200108    04.  /*MD's, Fam Med Gen,Hsp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @01857    f1200105    04.  /*MD's, Fam Med Gen,Hsp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @01861    f1200210    04.  /*MD's, Fam Med Gen,Administratn   Non-Fed;MD's By Speclty/Actvty       */
     @01865    f1200208    04.  /*MD's, Fam Med Gen,Administratn   Non-Fed;MD's By Speclty/Actvty       */
     @01869    f1200205    04.  /*MD's, Fam Med Gen,Administratn   Non-Fed;MD's By Speclty/Actvty       */
     @01873    f1200310    04.  /*MD's, Fam Med Gen,Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @01877    f1200308    04.  /*MD's, Fam Med Gen,Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @01881    f1200305    04.  /*MD's, Fam Med Gen,Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @01885    f1200410    04.  /*MD's, Fam Med Gen,Research       Non-Fed;MD's By Speclty/Actvty       */
     @01889    f1200408    04.  /*MD's, Fam Med Gen,Research       Non-Fed;MD's By Speclty/Actvty       */
     @01893    f1200405    04.  /*MD's, Fam Med Gen,Research       Non-Fed;MD's By Speclty/Actvty       */
     @01897    f1200510    04.  /*MD's, Fam Med Gen,Other          Non-Fed;MD's By Speclty/Actvty       */
     @01901    f1200508    04.  /*MD's, Fam Med Gen,Other          Non-Fed;MD's By Speclty/Actvty       */
     @01905    f1200505    04.  /*MD's, Fam Med Gen,Other          Non-Fed;MD's By Speclty/Actvty       */
     @01909    f1200610    05.  /*MD's, Fam Med Subspec, Total     Non-Fed                              */
     @01914    f1200608    05.  /*MD's, Fam Med Subspec, Total     Non-Fed                              */
     @01919    f1200605    05.  /*MD's, Fam Med Subspec, Total     Non-Fed                              */
     @01924    f1200710    05.  /*MD's, Fam Med Subsp,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @01929    f1200708    05.  /*MD's, Fam Med Subsp,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @01934    f1200705    05.  /*MD's, Fam Med Subsp,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @01939    f1200810    04.  /*MD's, Fam Med Subsp,PC,Off Bsd   Non-Fed;Patn Care Office-Based       */
     @01943    f1200808    04.  /*MD's, Fam Med Subsp,PC,Off Bsd   Non-Fed;Patn Care Office-Based       */
     @01947    f1200805    04.  /*MD's, Fam Med Subsp,PC,Off Bsd   Non-Fed;Patn Care Office-Based       */
     @01951    f1250210    04.  /*MD's, Fam Med Subsp,PC,Hsp Res   Non-Fed;Patn Care Hosp-Based         */
     @01955    f1250208    04.  /*MD's, Fam Med Subsp,PC,Hsp Res   Non-Fed;Patn Care Hosp-Based         */
     @01959    f1250205    04.  /*MD's, Fam Med Subsp,PC,Hsp Res   Non-Fed;Patn Care Hosp-Based         */
     @01963    f1201110    04.  /*MD's, Fam Med Subsp,Hsp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @01967    f1201108    04.  /*MD's, Fam Med Subsp,Hsp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @01971    f1201105    04.  /*MD's, Fam Med Subsp,Hsp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @01975    f1201210    04.  /*MD's, Fam Med Subsp,Admin        Non-Fed;MD's By Speclty/Actvty       */
     @01979    f1201208    04.  /*MD's, Fam Med Subsp,Admin        Non-Fed;MD's By Speclty/Actvty       */
     @01983    f1201205    04.  /*MD's, Fam Med Subsp,Admin        Non-Fed;MD's By Speclty/Actvty       */
     @01987    f1201310    04.  /*MD's, Fam Med Subsp,Teaching     Non-Fed;MD's By Speclty/Actvty       */
     @01991    f1201308    04.  /*MD's, Fam Med Subsp,Teaching     Non-Fed;MD's By Speclty/Actvty       */
     @01995    f1201305    04.  /*MD's, Fam Med Subsp,Teaching     Non-Fed;MD's By Speclty/Actvty       */
     @01999    f1201410    04.  /*MD's, Fam Med Subsp,Research     Non-Fed;MD's By Speclty/Actvty       */
     @02003    f1201408    04.  /*MD's, Fam Med Subsp,Research     Non-Fed;MD's By Speclty/Actvty       */
     @02007    f1201405    04.  /*MD's, Fam Med Subsp,Research     Non-Fed;MD's By Speclty/Actvty       */
     @02011    f1201510    04.  /*MD's, Fam Med Subsp,Other        Non-Fed;MD's By Speclty/Actvty       */
     @02015    f1201508    04.  /*MD's, Fam Med Subsp,Other        Non-Fed;MD's By Speclty/Actvty       */
     @02019    f1201505    04.  /*MD's, Fam Med Subsp,Other        Non-Fed;MD's By Speclty/Actvty       */
     @02023    f0461810    05.  /*Med Spec Tot, Total              Non-Fed;MD's By Speclty/Actvty       */
     @02028    f0461808    05.  /*Med Spec Tot, Total              Non-Fed;MD's By Speclty/Actvty       */
     @02033    f0461805    05.  /*Med Spec Tot, Total              Non-Fed;MD's By Speclty/Actvty       */
     @02038    f1107810    05.  /*Med Spec Tot, Total Patn Care    Non-Fed;Patient Care                 */
     @02043    f1107808    05.  /*Med Spec Tot, Total Patn Care    Non-Fed;Patient Care                 */
     @02048    f1107805    05.  /*Med Spec Tot, Total Patn Care    Non-Fed;Patient Care                 */
     @02053    f0886110    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02057    f0886108    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02061    f0886107    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02065    f0886106    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02069    f0886105    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02073    f0886100    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02077    f0886195    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02081    f0886190    04.  /*Med Spec Tot, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02085    f1250310    05.  /*Med Spec Tot, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02090    f1250308    05.  /*Med Spec Tot, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02095    f1250305    05.  /*Med Spec Tot, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02100    f0462110    05.  /*Med Spec Tot, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02105    f0462108    05.  /*Med Spec Tot, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02110    f0462105    05.  /*Med Spec Tot, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02115    f0462210    05.  /*Med Spec Tot, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @02120    f0462208    05.  /*Med Spec Tot, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @02125    f0462205    05.  /*Med Spec Tot, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @02130    f0462310    05.  /*Med Spec Tot, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @02135    f0462308    05.  /*Med Spec Tot, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @02140    f0462305    05.  /*Med Spec Tot, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @02145    f1108010    05.  /*Med Spec Tot, Research           Non-Fed;MD's By Speclty/Actvty       */
     @02150    f1108008    05.  /*Med Spec Tot, Research           Non-Fed;MD's By Speclty/Actvty       */
     @02155    f1108005    05.  /*Med Spec Tot, Research           Non-Fed;MD's By Speclty/Actvty       */
     @02160    f0462510    05.  /*Med Spec Tot, Other              Non-Fed;MD's By Speclty/Actvty       */
     @02165    f0462508    05.  /*Med Spec Tot, Other              Non-Fed;MD's By Speclty/Actvty       */
     @02170    f0462505    05.  /*Med Spec Tot, Other              Non-Fed;MD's By Speclty/Actvty       */
     @02175    f1167410    05.  /*Allergy & Immunology, Total      Non-Fed;MD's By Speclty/Actvty       */
     @02180    f1167408    05.  /*Allergy & Immunology, Total      Non-Fed;MD's By Speclty/Actvty       */
     @02185    f1167405    05.  /*Allergy & Immunology, Total      Non-Fed;MD's By Speclty/Actvty       */
     @02190    f1167510    05.  /*Allergy&Immunology,Tot Patn Cr   Non-Fed;Patient Care                 */
     @02195    f1167508    05.  /*Allergy&Immunology,Tot Patn Cr   Non-Fed;Patient Care                 */
     @02200    f1167505    05.  /*Allergy&Immunology,Tot Patn Cr   Non-Fed;Patient Care                 */
     @02205    f1167610    04.  /*Allergy&Immunology,PC,Off Based  Non-Fed;Patn Care Office-Based       */
     @02209    f1167608    04.  /*Allergy&Immunology,PC,Off Based  Non-Fed;Patn Care Office-Based       */
     @02213    f1167605    04.  /*Allergy&Immunology,PC,Off Based  Non-Fed;Patn Care Office-Based       */
     @02217    f1250410    04.  /*Allergy&Immunology,Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @02221    f1250408    04.  /*Allergy&Immunology,Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @02225    f1250405    04.  /*Allergy&Immunology,Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @02229    f1167910    04.  /*Allergy&Immunlgy,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02233    f1167908    04.  /*Allergy&Immunlgy,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02237    f1167905    04.  /*Allergy&Immunlgy,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02241    f1168010    04.  /*Allergy&Immunlgy,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @02245    f1168008    04.  /*Allergy&Immunlgy,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @02249    f1168005    04.  /*Allergy&Immunlgy,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @02253    f1168110    04.  /*Allergy&Immunology, Teaching     Non-Fed;MD's By Speclty/Actvty       */
     @02257    f1168108    04.  /*Allergy&Immunology, Teaching     Non-Fed;MD's By Speclty/Actvty       */
     @02261    f1168105    04.  /*Allergy&Immunology, Teaching     Non-Fed;MD's By Speclty/Actvty       */
     @02265    f1168210    04.  /*Allergy&Immunology, Research     Non-Fed;MD's By Speclty/Actvty       */
     @02269    f1168208    04.  /*Allergy&Immunology, Research     Non-Fed;MD's By Speclty/Actvty       */
     @02273    f1168205    04.  /*Allergy&Immunology, Research     Non-Fed;MD's By Speclty/Actvty       */
     @02277    f1168310    04.  /*Allergy&Immunology, Other        Non-Fed;MD's By Speclty/Actvty       */
     @02281    f1168308    04.  /*Allergy&Immunology, Other        Non-Fed;MD's By Speclty/Actvty       */
     @02285    f1168305    04.  /*Allergy&Immunology, Other        Non-Fed;MD's By Speclty/Actvty       */
     @02289    f0463110    05.  /*Cardiovas Dis, Total             Non-Fed;MD's By Speclty/Actvty       */
     @02294    f0463108    05.  /*Cardiovas Dis, Total             Non-Fed;MD's By Speclty/Actvty       */
     @02299    f0463105    05.  /*Cardiovas Dis, Total             Non-Fed;MD's By Speclty/Actvty       */
     @02304    f1108410    05.  /*Cardiovas Dis, Total Patn Care   Non-Fed;Patient Care                 */
     @02309    f1108408    05.  /*Cardiovas Dis, Total Patn Care   Non-Fed;Patient Care                 */
     @02314    f1108405    05.  /*Cardiovas Dis, Total Patn Care   Non-Fed;Patient Care                 */
     @02319    f0463310    04.  /*Cardiovas Dis, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @02323    f0463308    04.  /*Cardiovas Dis, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @02327    f0463305    04.  /*Cardiovas Dis, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @02331    f1250510    04.  /*Cardiovas Dis, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @02335    f1250508    04.  /*Cardiovas Dis, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @02339    f1250505    04.  /*Cardiovas Dis, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @02343    f0463510    04.  /*Cardiovas Dis, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @02347    f0463508    04.  /*Cardiovas Dis, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @02351    f0463505    04.  /*Cardiovas Dis, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @02355    f0997710    04.  /*Cardiovas Dis, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @02359    f0997708    04.  /*Cardiovas Dis, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @02363    f0997705    04.  /*Cardiovas Dis, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @02367    f0997810    04.  /*Cardiovas Dis, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @02371    f0997808    04.  /*Cardiovas Dis, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @02375    f0997805    04.  /*Cardiovas Dis, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @02379    f1108610    04.  /*Cardiovas Dis, Research          Non-Fed;MD's By Speclty/Actvty       */
     @02383    f1108608    04.  /*Cardiovas Dis, Research          Non-Fed;MD's By Speclty/Actvty       */
     @02387    f1108605    04.  /*Cardiovas Dis, Research          Non-Fed;MD's By Speclty/Actvty       */
     @02391    f0998010    04.  /*Cardiovas Dis, Other             Non-Fed;MD's By Speclty/Actvty       */
     @02395    f0998008    04.  /*Cardiovas Dis, Other             Non-Fed;MD's By Speclty/Actvty       */
     @02399    f0998005    04.  /*Cardiovas Dis, Other             Non-Fed;MD's By Speclty/Actvty       */
     @02403    f0463610    05.  /*Dermatology, Total               Non-Fed;MD's By Speclty/Actvty       */
     @02408    f0463608    05.  /*Dermatology, Total               Non-Fed;MD's By Speclty/Actvty       */
     @02413    f0463605    05.  /*Dermatology, Total               Non-Fed;MD's By Speclty/Actvty       */
     @02418    f1108710    05.  /*Dermatology, Total Patnt Care    Non-Fed;Patient Care                 */
     @02423    f1108708    05.  /*Dermatology, Total Patnt Care    Non-Fed;Patient Care                 */
     @02428    f1108705    05.  /*Dermatology, Total Patnt Care    Non-Fed;Patient Care                 */
     @02433    f0463810    04.  /*Dermatology, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @02437    f0463808    04.  /*Dermatology, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @02441    f0463805    04.  /*Dermatology, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @02445    f1250610    04.  /*Dermatology, PC, Hosp Resident   Non-Fed;Patn Care Hosp-Based         */
     @02449    f1250608    04.  /*Dermatology, PC, Hosp Resident   Non-Fed;Patn Care Hosp-Based         */
     @02453    f1250605    04.  /*Dermatology, PC, Hosp Resident   Non-Fed;Patn Care Hosp-Based         */
     @02457    f0464010    04.  /*Dermatology, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @02461    f0464008    04.  /*Dermatology, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @02465    f0464005    04.  /*Dermatology, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @02469    f0998310    04.  /*Dermatology, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @02473    f0998308    04.  /*Dermatology, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @02477    f0998305    04.  /*Dermatology, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @02481    f0998410    04.  /*Dermatology, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @02485    f0998408    04.  /*Dermatology, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @02489    f0998405    04.  /*Dermatology, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @02493    f1108910    04.  /*Dermatology, Research            Non-Fed;MD's By Speclty/Actvty       */
     @02497    f1108908    04.  /*Dermatology, Research            Non-Fed;MD's By Speclty/Actvty       */
     @02501    f1108905    04.  /*Dermatology, Research            Non-Fed;MD's By Speclty/Actvty       */
     @02505    f0998610    04.  /*Dermatology, Other               Non-Fed;MD's By Speclty/Actvty       */
     @02509    f0998608    04.  /*Dermatology, Other               Non-Fed;MD's By Speclty/Actvty       */
     @02513    f0998605    04.  /*Dermatology, Other               Non-Fed;MD's By Speclty/Actvty       */
     @02517    f0464110    05.  /*Gastroenterology, Total          Non-Fed;MD's By Speclty/Actvty       */
     @02522    f0464108    05.  /*Gastroenterology, Total          Non-Fed;MD's By Speclty/Actvty       */
     @02527    f0464105    05.  /*Gastroenterology, Total          Non-Fed;MD's By Speclty/Actvty       */
     @02532    f1109010    05.  /*Gastroenterology, Total Ptn Cr   Non-Fed;Patient Care                 */
     @02537    f1109008    05.  /*Gastroenterology, Total Ptn Cr   Non-Fed;Patient Care                 */
     @02542    f1109005    05.  /*Gastroenterology, Total Ptn Cr   Non-Fed;Patient Care                 */
     @02547    f0464310    04.  /*Gastroenterology, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @02551    f0464308    04.  /*Gastroenterology, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @02555    f0464305    04.  /*Gastroenterology, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @02559    f1250710    04.  /*Gastroenterology, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @02563    f1250708    04.  /*Gastroenterology, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @02567    f1250705    04.  /*Gastroenterology, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @02571    f0464510    04.  /*Gastroenterology, PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02575    f0464508    04.  /*Gastroenterology, PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02579    f0464505    04.  /*Gastroenterology, PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02583    f0998910    04.  /*Gastroenterology, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @02587    f0998908    04.  /*Gastroenterology, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @02591    f0998905    04.  /*Gastroenterology, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @02595    f0999010    04.  /*Gastroenterology, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @02599    f0999008    04.  /*Gastroenterology, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @02603    f0999005    04.  /*Gastroenterology, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @02607    f1109210    04.  /*Gastroenterology, Research       Non-Fed;MD's By Speclty/Actvty       */
     @02611    f1109208    04.  /*Gastroenterology, Research       Non-Fed;MD's By Speclty/Actvty       */
     @02615    f1109205    04.  /*Gastroenterology, Research       Non-Fed;MD's By Speclty/Actvty       */
     @02619    f0999210    04.  /*Gastroenterology, Other          Non-Fed;MD's By Speclty/Actvty       */
     @02623    f0999208    04.  /*Gastroenterology, Other          Non-Fed;MD's By Speclty/Actvty       */
     @02627    f0999205    04.  /*Gastroenterology, Other          Non-Fed;MD's By Speclty/Actvty       */
     @02631    f1120810    05.  /*General Internal Med, Total      Non-Fed;MD's By Speclty/Actvty       */
     @02636    f1120808    05.  /*General Internal Med, Total      Non-Fed;MD's By Speclty/Actvty       */
     @02641    f1120805    05.  /*General Internal Med, Total      Non-Fed;MD's By Speclty/Actvty       */
     @02646    f1109310    05.  /*Gnrl Int Med, Total Patn Care    Non-Fed;Patient Care                 */
     @02651    f1109308    05.  /*Gnrl Int Med, Total Patn Care    Non-Fed;Patient Care                 */
     @02656    f1109305    05.  /*Gnrl Int Med, Total Patn Care    Non-Fed;Patient Care                 */
     @02661    f1120910    04.  /*Gnrl Int Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02665    f1120908    04.  /*Gnrl Int Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02669    f1120905    04.  /*Gnrl Int Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @02673    f1250810    04.  /*Gnrl Int Med, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02677    f1250808    04.  /*Gnrl Int Med, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02681    f1250805    04.  /*Gnrl Int Med, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02685    f1121110    04.  /*Gnrl Int Med, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02689    f1121108    04.  /*Gnrl Int Med, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02693    f1121105    04.  /*Gnrl Int Med, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02697    f1121210    04.  /*General Int Med,Administration   Non-Fed;MD's By Speclty/Actvty       */
     @02701    f1121208    04.  /*General Int Med,Administration   Non-Fed;MD's By Speclty/Actvty       */
     @02705    f1121205    04.  /*General Int Med,Administration   Non-Fed;MD's By Speclty/Actvty       */
     @02709    f1121310    04.  /*General Int Med, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @02713    f1121308    04.  /*General Int Med, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @02717    f1121305    04.  /*General Int Med, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @02721    f1109510    04.  /*General Int Med, Research        Non-Fed;MD's By Speclty/Actvty       */
     @02725    f1109508    04.  /*General Int Med, Research        Non-Fed;MD's By Speclty/Actvty       */
     @02729    f1109505    04.  /*General Int Med, Research        Non-Fed;MD's By Speclty/Actvty       */
     @02733    f1121410    04.  /*General Int Med, Other           Non-Fed;MD's By Speclty/Actvty       */
     @02737    f1121408    04.  /*General Int Med, Other           Non-Fed;MD's By Speclty/Actvty       */
     @02741    f1121405    04.  /*General Int Med, Other           Non-Fed;MD's By Speclty/Actvty       */
     @02745    f1172410    05.  /*Int Med Subspecs, Total          Non-Fed;MD's By Speclty/Actvty       */
     @02750    f1172408    05.  /*Int Med Subspecs, Total          Non-Fed;MD's By Speclty/Actvty       */
     @02755    f1172405    05.  /*Int Med Subspecs, Total          Non-Fed;MD's By Speclty/Actvty       */
     @02760    f1172510    05.  /*Int Med Subspecs, Tot Patn Care  Non-Fed;Patient Care                 */
     @02765    f1172508    05.  /*Int Med Subspecs, Tot Patn Care  Non-Fed;Patient Care                 */
     @02770    f1172505    05.  /*Int Med Subspecs, Tot Patn Care  Non-Fed;Patient Care                 */
     @02775    f1172610    04.  /*Int Med Subspecs, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @02779    f1172608    04.  /*Int Med Subspecs, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @02783    f1172605    04.  /*Int Med Subspecs, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @02787    f1250910    04.  /*Int Med Subspecs, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @02791    f1250908    04.  /*Int Med Subspecs, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @02795    f1250905    04.  /*Int Med Subspecs, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @02799    f1172910    04.  /*Int Med Subspecs,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02803    f1172908    04.  /*Int Med Subspecs,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02807    f1172905    04.  /*Int Med Subspecs,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @02811    f1173010    04.  /*Int Med Subspecs, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @02815    f1173008    04.  /*Int Med Subspecs, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @02819    f1173005    04.  /*Int Med Subspecs, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @02823    f1173110    04.  /*Int Med Subspecs, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @02827    f1173108    04.  /*Int Med Subspecs, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @02831    f1173105    04.  /*Int Med Subspecs, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @02835    f1173210    04.  /*Int Med Subspecs, Research       Non-Fed;MD's By Speclty/Actvty       */
     @02839    f1173208    04.  /*Int Med Subspecs, Research       Non-Fed;MD's By Speclty/Actvty       */
     @02843    f1173205    04.  /*Int Med Subspecs, Research       Non-Fed;MD's By Speclty/Actvty       */
     @02847    f1173310    04.  /*Int Med Subspecs, Other          Non-Fed;MD's By Speclty/Actvty       */
     @02851    f1173308    04.  /*Int Med Subspecs, Other          Non-Fed;MD's By Speclty/Actvty       */
     @02855    f1173305    04.  /*Int Med Subspecs, Other          Non-Fed;MD's By Speclty/Actvty       */
     @02859    f1170410    05.  /*Pediatrics, General, Total       Non-Fed;MD's By Speclty/Actvty       */
     @02864    f1170408    05.  /*Pediatrics, General, Total       Non-Fed;MD's By Speclty/Actvty       */
     @02869    f1170405    05.  /*Pediatrics, General, Total       Non-Fed;MD's By Speclty/Actvty       */
     @02874    f1170510    05.  /*Pediatrics,Gen,Tot Patient Care  Non-Fed;Patient Care                 */
     @02879    f1170508    05.  /*Pediatrics,Gen,Tot Patient Care  Non-Fed;Patient Care                 */
     @02884    f1170505    05.  /*Pediatrics,Gen,Tot Patient Care  Non-Fed;Patient Care                 */
     @02889    f1170610    04.  /*Pediatrics,Gen,PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @02893    f1170608    04.  /*Pediatrics,Gen,PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @02897    f1170605    04.  /*Pediatrics,Gen,PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @02901    f1251010    04.  /*Pediatrics,Gen,PC,Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02905    f1251008    04.  /*Pediatrics,Gen,PC,Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02909    f1251005    04.  /*Pediatrics,Gen,PC,Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @02913    f1170910    04.  /*Pediatrics,Gen,PC,Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02917    f1170908    04.  /*Pediatrics,Gen,PC,Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02921    f1170905    04.  /*Pediatrics,Gen,PC,Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @02925    f1171010    04.  /*Pediatrics,Gen, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @02929    f1171008    04.  /*Pediatrics,Gen, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @02933    f1171005    04.  /*Pediatrics,Gen, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @02937    f1171110    04.  /*Pediatrics,Gen, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @02941    f1171108    04.  /*Pediatrics,Gen, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @02945    f1171105    04.  /*Pediatrics,Gen, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @02949    f1171210    04.  /*Pediatrics,Gen, Research         Non-Fed;MD's By Speclty/Actvty       */
     @02953    f1171208    04.  /*Pediatrics,Gen, Research         Non-Fed;MD's By Speclty/Actvty       */
     @02957    f1171205    04.  /*Pediatrics,Gen, Research         Non-Fed;MD's By Speclty/Actvty       */
     @02961    f1171310    04.  /*Pediatrics,Gen, Other            Non-Fed;MD's By Speclty/Actvty       */
     @02965    f1171308    04.  /*Pediatrics,Gen, Other            Non-Fed;MD's By Speclty/Actvty       */
     @02969    f1171305    04.  /*Pediatrics,Gen, Other            Non-Fed;MD's By Speclty/Actvty       */
     @02973    f1171410    05.  /*Ped Subspecs, Total              Non-Fed;MD's By Speclty/Actvty       */
     @02978    f1171408    05.  /*Ped Subspecs, Total              Non-Fed;MD's By Speclty/Actvty       */
     @02983    f1171405    05.  /*Ped Subspecs, Total              Non-Fed;MD's By Speclty/Actvty       */
     @02988    f1171510    05.  /*Ped Subspecs, Total Patn Care    Non-Fed;Patient Care                 */
     @02993    f1171508    05.  /*Ped Subspecs, Total Patn Care    Non-Fed;Patient Care                 */
     @02998    f1171505    05.  /*Ped Subspecs, Total Patn Care    Non-Fed;Patient Care                 */
     @03003    f1171610    04.  /*Ped Subspecs, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @03007    f1171608    04.  /*Ped Subspecs, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @03011    f1171605    04.  /*Ped Subspecs, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @03015    f1251110    04.  /*Ped Subspecs, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @03019    f1251108    04.  /*Ped Subspecs, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @03023    f1251105    04.  /*Ped Subspecs, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @03027    f1171910    04.  /*Ped Subspecs, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @03031    f1171908    04.  /*Ped Subspecs, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @03035    f1171905    04.  /*Ped Subspecs, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @03039    f1172010    04.  /*Ped Subspecs, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @03043    f1172008    04.  /*Ped Subspecs, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @03047    f1172005    04.  /*Ped Subspecs, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @03051    f1172110    04.  /*Ped Subspecs, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @03055    f1172108    04.  /*Ped Subspecs, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @03059    f1172105    04.  /*Ped Subspecs, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @03063    f1172210    04.  /*Ped Subspecs, Research           Non-Fed;MD's By Speclty/Actvty       */
     @03067    f1172208    04.  /*Ped Subspecs, Research           Non-Fed;MD's By Speclty/Actvty       */
     @03071    f1172205    04.  /*Ped Subspecs, Research           Non-Fed;MD's By Speclty/Actvty       */
     @03075    f1172310    04.  /*Ped Subspecs, Other              Non-Fed;MD's By Speclty/Actvty       */
     @03079    f1172308    04.  /*Ped Subspecs, Other              Non-Fed;MD's By Speclty/Actvty       */
     @03083    f1172305    04.  /*Ped Subspecs, Other              Non-Fed;MD's By Speclty/Actvty       */
     @03087    f0466110    05.  /*Ped Cardiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @03092    f0466108    05.  /*Ped Cardiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @03097    f0466105    05.  /*Ped Cardiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @03102    f1111210    05.  /*Ped Cardiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @03107    f1111208    05.  /*Ped Cardiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @03112    f1111205    05.  /*Ped Cardiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @03117    f0466310    04.  /*Ped Cardiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @03121    f0466308    04.  /*Ped Cardiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @03125    f0466305    04.  /*Ped Cardiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @03129    f1251210    04.  /*Ped Cardiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @03133    f1251208    04.  /*Ped Cardiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @03137    f1251205    04.  /*Ped Cardiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @03141    f0466510    04.  /*Ped Cardiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03145    f0466508    04.  /*Ped Cardiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03149    f0466505    04.  /*Ped Cardiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03153    f1001310    04.  /*Ped Cardiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @03157    f1001308    04.  /*Ped Cardiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @03161    f1001305    04.  /*Ped Cardiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @03165    f1001410    04.  /*Ped Cardiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @03169    f1001408    04.  /*Ped Cardiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @03173    f1001405    04.  /*Ped Cardiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @03177    f1111410    04.  /*Ped Cardiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @03181    f1111408    04.  /*Ped Cardiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @03185    f1111405    04.  /*Ped Cardiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @03189    f1001610    04.  /*Ped Cardiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @03193    f1001608    04.  /*Ped Cardiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @03197    f1001605    04.  /*Ped Cardiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @03201    f0466610    05.  /*Pulmonary Dis, Total             Non-Fed;MD's By Speclty/Actvty       */
     @03206    f0466608    05.  /*Pulmonary Dis, Total             Non-Fed;MD's By Speclty/Actvty       */
     @03211    f0466605    05.  /*Pulmonary Dis, Total             Non-Fed;MD's By Speclty/Actvty       */
     @03216    f1111510    05.  /*Pulmonary Dis, Total Patn Care   Non-Fed;Patient Care                 */
     @03221    f1111508    05.  /*Pulmonary Dis, Total Patn Care   Non-Fed;Patient Care                 */
     @03226    f1111505    05.  /*Pulmonary Dis, Total Patn Care   Non-Fed;Patient Care                 */
     @03231    f0466810    04.  /*Pulmonary Dis, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @03235    f0466808    04.  /*Pulmonary Dis, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @03239    f0466805    04.  /*Pulmonary Dis, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @03243    f1251310    04.  /*Pulmonary Dis, PC, Hosp Resdnt   Non-Fed,Patn Care Hosp-Based         */
     @03247    f1251308    04.  /*Pulmonary Dis, PC, Hosp Resdnt   Non-Fed,Patn Care Hosp-Based         */
     @03251    f1251305    04.  /*Pulmonary Dis, PC, Hosp Resdnt   Non-Fed,Patn Care Hosp-Based         */
     @03255    f0467010    04.  /*Pulmonary Dis, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03259    f0467008    04.  /*Pulmonary Dis, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03263    f0467005    04.  /*Pulmonary Dis, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03267    f1001910    04.  /*Pulmonary Dis, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @03271    f1001908    04.  /*Pulmonary Dis, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @03275    f1001905    04.  /*Pulmonary Dis, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @03279    f1002010    04.  /*Pulmonary Dis, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @03283    f1002008    04.  /*Pulmonary Dis, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @03287    f1002005    04.  /*Pulmonary Dis, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @03291    f1111710    04.  /*Pulmonary Dis, Research          Non-Fed;MD's By Speclty/Actvty       */
     @03295    f1111708    04.  /*Pulmonary Dis, Research          Non-Fed;MD's By Speclty/Actvty       */
     @03299    f1111705    04.  /*Pulmonary Dis, Research          Non-Fed;MD's By Speclty/Actvty       */
     @03303    f1002210    04.  /*Pulmonary Dis, Other             Non-Fed;MD's By Speclty/Actvty       */
     @03307    f1002208    04.  /*Pulmonary Dis, Other             Non-Fed;MD's By Speclty/Actvty       */
     @03311    f1002205    04.  /*Pulmonary Dis, Other             Non-Fed;MD's By Speclty/Actvty       */
     @03315    f0467110    05.  /*Surg Specs Tot, Total            Non-Fed;MD's By Speclty/Actvty       */
     @03320    f0467108    05.  /*Surg Specs Tot, Total            Non-Fed;MD's By Speclty/Actvty       */
     @03325    f0467105    05.  /*Surg Specs Tot, Total            Non-Fed;MD's By Speclty/Actvty       */
     @03330    f1111810    05.  /*Surg Specs Tot, Total Patn Care  Non-Fed;Patient Care                 */
     @03335    f1111808    05.  /*Surg Specs Tot, Total Patn Care  Non-Fed;Patient Care                 */
     @03340    f1111805    05.  /*Surg Specs Tot, Total Patn Care  Non-Fed;Patient Care                 */
     @03345    f0886210    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03349    f0886208    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03353    f0886207    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03357    f0886206    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03361    f0886205    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03365    f0886200    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03369    f0886295    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03373    f0886290    04.  /*Surg Specs Tot, PC, Office Bsd   Non-Fed;Patn Care Office-Based       */
     @03377    f1251410    05.  /*Surg Specs Tot, PC, Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @03382    f1251408    05.  /*Surg Specs Tot, PC, Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @03387    f1251405    05.  /*Surg Specs Tot, PC, Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @03392    f0467510    05.  /*Surg Specs Tot, PC, Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @03397    f0467508    05.  /*Surg Specs Tot, PC, Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @03402    f0467505    05.  /*Surg Specs Tot, PC, Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @03407    f0467610    05.  /*Surg Specs Tot, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @03412    f0467608    05.  /*Surg Specs Tot, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @03417    f0467605    05.  /*Surg Specs Tot, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @03422    f0467710    05.  /*Surg Specs Tot, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @03427    f0467708    05.  /*Surg Specs Tot, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @03432    f0467705    05.  /*Surg Specs Tot, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @03437    f1112010    05.  /*Surg Specs Tot, Research         Non-Fed;MD's By Speclty/Actvty       */
     @03442    f1112008    05.  /*Surg Specs Tot, Research         Non-Fed;MD's By Speclty/Actvty       */
     @03447    f1112005    05.  /*Surg Specs Tot, Research         Non-Fed;MD's By Speclty/Actvty       */
     @03452    f0467910    05.  /*Surg Specs Tot, Other            Non-Fed;MD's By Speclty/Actvty       */
     @03457    f0467908    05.  /*Surg Specs Tot, Other            Non-Fed;MD's By Speclty/Actvty       */
     @03462    f0467905    05.  /*Surg Specs Tot, Other            Non-Fed;MD's By Speclty/Actvty       */
     @03467    f0468010    05.  /*Genrl Surg, Total                Non-Fed;MD's By Speclty/Actvty       */
     @03472    f0468008    05.  /*Genrl Surg, Total                Non-Fed;MD's By Speclty/Actvty       */
     @03477    f0468005    05.  /*Genrl Surg, Total                Non-Fed;MD's By Speclty/Actvty       */
     @03482    f1112110    05.  /*Genrl Surg, Total Patient Care   Non-Fed;Patient Care                 */
     @03487    f1112108    05.  /*Genrl Surg, Total Patient Care   Non-Fed;Patient Care                 */
     @03492    f1112105    05.  /*Genrl Surg, Total Patient Care   Non-Fed;Patient Care                 */
     @03497    f0468210    04.  /*Genrl Surg, PC, Office Based     Non-Fed;Patn Care Office-Based       */
     @03501    f0468208    04.  /*Genrl Surg, PC, Office Based     Non-Fed;Patn Care Office-Based       */
     @03505    f0468205    04.  /*Genrl Surg, PC, Office Based     Non-Fed;Patn Care Office-Based       */
     @03509    f1251510    04.  /*Genrl Surg, PC, Hosp Residents   Non-Fed;Patn Care Hosp-Based         */
     @03513    f1251508    04.  /*Genrl Surg, PC, Hosp Residents   Non-Fed;Patn Care Hosp-Based         */
     @03517    f1251505    04.  /*Genrl Surg, PC, Hosp Residents   Non-Fed;Patn Care Hosp-Based         */
     @03521    f0468410    04.  /*Genrl Surg, PC, Hosp FT Staff    Non-Fed;Patn Care Hosp-Based         */
     @03525    f0468408    04.  /*Genrl Surg, PC, Hosp FT Staff    Non-Fed;Patn Care Hosp-Based         */
     @03529    f0468405    04.  /*Genrl Surg, PC, Hosp FT Staff    Non-Fed;Patn Care Hosp-Based         */
     @03533    f1002710    04.  /*Genrl Surg, Administration       Non-Fed;MD's By Speclty/Actvty       */
     @03537    f1002708    04.  /*Genrl Surg, Administration       Non-Fed;MD's By Speclty/Actvty       */
     @03541    f1002705    04.  /*Genrl Surg, Administration       Non-Fed;MD's By Speclty/Actvty       */
     @03545    f1002810    04.  /*Genrl Surg, Teaching             Non-Fed;MD's By Speclty/Actvty       */
     @03549    f1002808    04.  /*Genrl Surg, Teaching             Non-Fed;MD's By Speclty/Actvty       */
     @03553    f1002805    04.  /*Genrl Surg, Teaching             Non-Fed;MD's By Speclty/Actvty       */
     @03557    f1112310    04.  /*Genrl Surg, Research             Non-Fed;MD's By Speclty/Actvty       */
     @03561    f1112308    04.  /*Genrl Surg, Research             Non-Fed;MD's By Speclty/Actvty       */
     @03565    f1112305    04.  /*Genrl Surg, Research             Non-Fed;MD's By Speclty/Actvty       */
     @03569    f1003010    04.  /*Genrl Surg, Other                Non-Fed;MD's By Speclty/Actvty       */
     @03573    f1003008    04.  /*Genrl Surg, Other                Non-Fed;MD's By Speclty/Actvty       */
     @03577    f1003005    04.  /*Genrl Surg, Other                Non-Fed;MD's By Speclty/Actvty       */
     @03581    f0468510    05.  /*Neurolgcal Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03586    f0468508    05.  /*Neurolgcal Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03591    f0468505    05.  /*Neurolgcal Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03596    f1112410    05.  /*Neurolgcal Surg, Total Ptn Care  Non-Fed;Patient Care                 */
     @03601    f1112408    05.  /*Neurolgcal Surg, Total Ptn Care  Non-Fed;Patient Care                 */
     @03606    f1112405    05.  /*Neurolgcal Surg, Total Ptn Care  Non-Fed;Patient Care                 */
     @03611    f0468710    04.  /*Neurolgcal Surg, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @03615    f0468708    04.  /*Neurolgcal Surg, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @03619    f0468705    04.  /*Neurolgcal Surg, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @03623    f1251610    04.  /*Neurolgcal Surg, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @03627    f1251608    04.  /*Neurolgcal Surg, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @03631    f1251605    04.  /*Neurolgcal Surg, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @03635    f0468910    04.  /*Neurolgcal Surg, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @03639    f0468908    04.  /*Neurolgcal Surg, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @03643    f0468905    04.  /*Neurolgcal Surg, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @03647    f1003310    04.  /*Neurolgcal Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03651    f1003308    04.  /*Neurolgcal Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03655    f1003305    04.  /*Neurolgcal Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03659    f1003410    04.  /*Neurolgcal Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03663    f1003408    04.  /*Neurolgcal Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03667    f1003405    04.  /*Neurolgcal Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03671    f1112610    04.  /*Neurolgcal Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03675    f1112608    04.  /*Neurolgcal Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03679    f1112605    04.  /*Neurolgcal Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03683    f1003610    04.  /*Neurolgcal Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03687    f1003608    04.  /*Neurolgcal Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03691    f1003605    04.  /*Neurolgcal Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03695    f1168410    05.  /*Ob-Gyn, General, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03700    f1168408    05.  /*Ob-Gyn, General, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03705    f1168405    05.  /*Ob-Gyn, General, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03710    f1168510    05.  /*Ob-Gyn, Gen, Total Patient Care  Non-Fed;Patient Care                 */
     @03715    f1168508    05.  /*Ob-Gyn, Gen, Total Patient Care  Non-Fed;Patient Care                 */
     @03720    f1168505    05.  /*Ob-Gyn, Gen, Total Patient Care  Non-Fed;Patient Care                 */
     @03725    f1168610    04.  /*Ob-Gyn, Gen, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @03729    f1168608    04.  /*Ob-Gyn, Gen, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @03733    f1168605    04.  /*Ob-Gyn, Gen, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @03737    f1251710    04.  /*Ob-Gyn, Gen, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @03741    f1251708    04.  /*Ob-Gyn, Gen, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @03745    f1251705    04.  /*Ob-Gyn, Gen, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @03749    f1168910    04.  /*Ob-Gyn, Gen, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @03753    f1168908    04.  /*Ob-Gyn, Gen, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @03757    f1168905    04.  /*Ob-Gyn, Gen, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @03761    f1169010    04.  /*Ob-Gyn, General, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03765    f1169008    04.  /*Ob-Gyn, General, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03769    f1169005    04.  /*Ob-Gyn, General, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03773    f1169110    04.  /*Ob-Gyn, General, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03777    f1169108    04.  /*Ob-Gyn, General, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03781    f1169105    04.  /*Ob-Gyn, General, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03785    f1169210    04.  /*Ob-Gyn, General, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03789    f1169208    04.  /*Ob-Gyn, General, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03793    f1169205    04.  /*Ob-Gyn, General, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03797    f1169310    04.  /*Ob-Gyn, General, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03801    f1169308    04.  /*Ob-Gyn, General, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03805    f1169305    04.  /*Ob-Gyn, General, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03809    f1169410    05.  /*Ob-Gyn Subspecs, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03814    f1169408    05.  /*Ob-Gyn Subspecs, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03819    f1169405    05.  /*Ob-Gyn Subspecs, Total           Non-Fed;MD's By Speclty/Actvty       */
     @03824    f1169510    05.  /*Ob-Gyn Subspecs,Tot Patient Cr   Non-Fed;Patient Care                 */
     @03829    f1169508    05.  /*Ob-Gyn Subspecs,Tot Patient Cr   Non-Fed;Patient Care                 */
     @03834    f1169505    05.  /*Ob-Gyn Subspecs,Tot Patient Cr   Non-Fed;Patient Care                 */
     @03839    f1169610    04.  /*Ob-Gyn Subspecs,PC,Off Based     Non-Fed;Patn Care Office-Based       */
     @03843    f1169608    04.  /*Ob-Gyn Subspecs,PC,Off Based     Non-Fed;Patn Care Office-Based       */
     @03847    f1169605    04.  /*Ob-Gyn Subspecs,PC,Off Based     Non-Fed;Patn Care Office-Based       */
     @03851    f1251810    04.  /*Ob-Gyn Subspecs,PC,Hosp Residnt  Non-Fed;Patn Care Hosp-Based         */
     @03855    f1251808    04.  /*Ob-Gyn Subspecs,PC,Hosp Residnt  Non-Fed;Patn Care Hosp-Based         */
     @03859    f1251805    04.  /*Ob-Gyn Subspecs,PC,Hosp Residnt  Non-Fed;Patn Care Hosp-Based         */
     @03863    f1169910    04.  /*Ob-Gyn Subspecs,PC,Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03867    f1169908    04.  /*Ob-Gyn Subspecs,PC,Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03871    f1169905    04.  /*Ob-Gyn Subspecs,PC,Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @03875    f1170010    04.  /*Ob-Gyn Subspecs, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03879    f1170008    04.  /*Ob-Gyn Subspecs, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03883    f1170005    04.  /*Ob-Gyn Subspecs, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @03887    f1170110    04.  /*Ob-Gyn Subspecs, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03891    f1170108    04.  /*Ob-Gyn Subspecs, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03895    f1170105    04.  /*Ob-Gyn Subspecs, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @03899    f1170210    04.  /*Ob-Gyn Subspecs, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03903    f1170208    04.  /*Ob-Gyn Subspecs, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03907    f1170205    04.  /*Ob-Gyn Subspecs, Research        Non-Fed;MD's By Speclty/Actvty       */
     @03911    f1170310    04.  /*Ob-Gyn Subspecs, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03915    f1170308    04.  /*Ob-Gyn Subspecs, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03919    f1170305    04.  /*Ob-Gyn Subspecs, Other           Non-Fed;MD's By Speclty/Actvty       */
     @03923    f0469510    05.  /*Ophthalmolgy, Total              Non-Fed;MD's By Speclty/Actvty       */
     @03928    f0469508    05.  /*Ophthalmolgy, Total              Non-Fed;MD's By Speclty/Actvty       */
     @03933    f0469505    05.  /*Ophthalmolgy, Total              Non-Fed;MD's By Speclty/Actvty       */
     @03938    f1113010    05.  /*Ophthalmolgy, Total Patn Care    Non-Fed;Patient Care                 */
     @03943    f1113008    05.  /*Ophthalmolgy, Total Patn Care    Non-Fed;Patient Care                 */
     @03948    f1113005    05.  /*Ophthalmolgy, Total Patn Care    Non-Fed;Patient Care                 */
     @03953    f0469710    04.  /*Ophthalmolgy, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @03957    f0469708    04.  /*Ophthalmolgy, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @03961    f0469705    04.  /*Ophthalmolgy, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @03965    f1251910    04.  /*Ophthalmolgy, PC, Hosp Resdnts   Non-Fed;Patn Care Hosp-Based         */
     @03969    f1251908    04.  /*Ophthalmolgy, PC, Hosp Resdnts   Non-Fed;Patn Care Hosp-Based         */
     @03973    f1251905    04.  /*Ophthalmolgy, PC, Hosp Resdnts   Non-Fed;Patn Care Hosp-Based         */
     @03977    f0469910    04.  /*Ophthalmolgy, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @03981    f0469908    04.  /*Ophthalmolgy, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @03985    f0469905    04.  /*Ophthalmolgy, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @03989    f1004510    04.  /*Ophthalmolgy, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @03993    f1004508    04.  /*Ophthalmolgy, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @03997    f1004505    04.  /*Ophthalmolgy, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @04001    f1004610    04.  /*Ophthalmolgy, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @04005    f1004608    04.  /*Ophthalmolgy, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @04009    f1004605    04.  /*Ophthalmolgy, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @04013    f1113210    04.  /*Ophthalmolgy, Research           Non-Fed;MD's By Speclty/Actvty       */
     @04017    f1113208    04.  /*Ophthalmolgy, Research           Non-Fed;MD's By Speclty/Actvty       */
     @04021    f1113205    04.  /*Ophthalmolgy, Research           Non-Fed;MD's By Speclty/Actvty       */
     @04025    f1004810    04.  /*Ophthalmolgy, Other              Non-Fed;MD's By Speclty/Actvty       */
     @04029    f1004808    04.  /*Ophthalmolgy, Other              Non-Fed;MD's By Speclty/Actvty       */
     @04033    f1004805    04.  /*Ophthalmolgy, Other              Non-Fed;MD's By Speclty/Actvty       */
     @04037    f0470010    05.  /*Orthopedic Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @04042    f0470008    05.  /*Orthopedic Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @04047    f0470005    05.  /*Orthopedic Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @04052    f1113310    05.  /*Orthopedic Surg, Total Ptn Care  Non-Fed;Patient Care                 */
     @04057    f1113308    05.  /*Orthopedic Surg, Total Ptn Care  Non-Fed;Patient Care                 */
     @04062    f1113305    05.  /*Orthopedic Surg, Total Ptn Care  Non-Fed;Patient Care                 */
     @04067    f0470210    04.  /*Orthopedic Surg, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04071    f0470208    04.  /*Orthopedic Surg, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04075    f0470205    04.  /*Orthopedic Surg, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04079    f1252010    04.  /*Orthopedic Surg, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @04083    f1252008    04.  /*Orthopedic Surg, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @04087    f1252005    04.  /*Orthopedic Surg, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @04091    f0470410    04.  /*Orthopedic Surg, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04095    f0470408    04.  /*Orthopedic Surg, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04099    f0470405    04.  /*Orthopedic Surg, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04103    f1005110    04.  /*Orthopedic Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @04107    f1005108    04.  /*Orthopedic Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @04111    f1005105    04.  /*Orthopedic Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @04115    f1005210    04.  /*Orthopedic Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @04119    f1005208    04.  /*Orthopedic Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @04123    f1005205    04.  /*Orthopedic Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @04127    f1113510    04.  /*Orthopedic Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @04131    f1113508    04.  /*Orthopedic Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @04135    f1113505    04.  /*Orthopedic Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @04139    f1005410    04.  /*Orthopedic Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @04143    f1005408    04.  /*Orthopedic Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @04147    f1005405    04.  /*Orthopedic Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @04151    f0470510    05.  /*Otolaryngolgy, Total             Non-Fed,MD's By Speclty/Actvty       */
     @04156    f0470508    05.  /*Otolaryngolgy, Total             Non-Fed,MD's By Speclty/Actvty       */
     @04161    f0470505    05.  /*Otolaryngolgy, Total             Non-Fed,MD's By Speclty/Actvty       */
     @04166    f1113610    05.  /*Otolaryngolgy, Total Ptn Care    Non-Fed;Patient Care                 */
     @04171    f1113608    05.  /*Otolaryngolgy, Total Ptn Care    Non-Fed;Patient Care                 */
     @04176    f1113605    05.  /*Otolaryngolgy, Total Ptn Care    Non-Fed;Patient Care                 */
     @04181    f0470710    04.  /*Otolaryngolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04185    f0470708    04.  /*Otolaryngolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04189    f0470705    04.  /*Otolaryngolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04193    f1252110    04.  /*Otolaryngolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04197    f1252108    04.  /*Otolaryngolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04201    f1252105    04.  /*Otolaryngolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04205    f0470910    04.  /*Otolaryngolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04209    f0470908    04.  /*Otolaryngolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04213    f0470905    04.  /*Otolaryngolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04217    f1005710    04.  /*Otolaryngolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04221    f1005708    04.  /*Otolaryngolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04225    f1005705    04.  /*Otolaryngolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04229    f1005810    04.  /*Otolaryngolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04233    f1005808    04.  /*Otolaryngolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04237    f1005805    04.  /*Otolaryngolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04241    f1113810    04.  /*Otolaryngolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04245    f1113808    04.  /*Otolaryngolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04249    f1113805    04.  /*Otolaryngolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04253    f1006010    04.  /*Otolaryngolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04257    f1006008    04.  /*Otolaryngolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04261    f1006005    04.  /*Otolaryngolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04265    f0471010    05.  /*Plastic Surg, Total              Non-Fed;MD's By Speclty/Actvty       */
     @04270    f0471008    05.  /*Plastic Surg, Total              Non-Fed;MD's By Speclty/Actvty       */
     @04275    f0471005    05.  /*Plastic Surg, Total              Non-Fed;MD's By Speclty/Actvty       */
     @04280    f1113910    05.  /*Plastic Surg, Total Patn Care    Non-Fed;Patient Care                 */
     @04285    f1113908    05.  /*Plastic Surg, Total Patn Care    Non-Fed;Patient Care                 */
     @04290    f1113905    05.  /*Plastic Surg, Total Patn Care    Non-Fed;Patient Care                 */
     @04295    f0471210    04.  /*Plastic Surg, PC, Office Based   Non-Fed;MD's By Speclty/Actvty       */
     @04299    f0471208    04.  /*Plastic Surg, PC, Office Based   Non-Fed;MD's By Speclty/Actvty       */
     @04303    f0471205    04.  /*Plastic Surg, PC, Office Based   Non-Fed;MD's By Speclty/Actvty       */
     @04307    f1252210    04.  /*Plastic Surg, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @04311    f1252208    04.  /*Plastic Surg, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @04315    f1252205    04.  /*Plastic Surg, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @04319    f0471410    04.  /*Plastic Surg, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @04323    f0471408    04.  /*Plastic Surg, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @04327    f0471405    04.  /*Plastic Surg, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @04331    f1006310    04.  /*Plastic Surg, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @04335    f1006308    04.  /*Plastic Surg, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @04339    f1006305    04.  /*Plastic Surg, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @04343    f1006410    04.  /*Plastic Surg, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @04347    f1006408    04.  /*Plastic Surg, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @04351    f1006405    04.  /*Plastic Surg, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @04355    f1114110    04.  /*Plastic Surg, Research           Non-Fed;MD's By Speclty/Actvty       */
     @04359    f1114108    04.  /*Plastic Surg, Research           Non-Fed;MD's By Speclty/Actvty       */
     @04363    f1114105    04.  /*Plastic Surg, Research           Non-Fed;MD's By Speclty/Actvty       */
     @04367    f1006610    04.  /*Plastic Surg, Other              Non-Fed;MD's By Speclty/Actvty       */
     @04371    f1006608    04.  /*Plastic Surg, Other              Non-Fed;MD's By Speclty/Actvty       */
     @04375    f1006605    04.  /*Plastic Surg, Other              Non-Fed;MD's By Speclty/Actvty       */
     @04379    f0471510    05.  /*Colon/Rectal Srg, Total          Non-Fed;MD's By Speclty/Actvty       */
     @04384    f0471508    05.  /*Colon/Rectal Srg, Total          Non-Fed;MD's By Speclty/Actvty       */
     @04389    f0471505    05.  /*Colon/Rectal Srg, Total          Non-Fed;MD's By Speclty/Actvty       */
     @04394    f1114210    05.  /*Colon/Rectal Srg, Total Ptn Cr   Non-Fed;Patient Care                 */
     @04399    f1114208    05.  /*Colon/Rectal Srg, Total Ptn Cr   Non-Fed;Patient Care                 */
     @04404    f1114205    05.  /*Colon/Rectal Srg, Total Ptn Cr   Non-Fed;Patient Care                 */
     @04409    f0471710    04.  /*Colon/Rectal Srg, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @04413    f0471708    04.  /*Colon/Rectal Srg, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @04417    f0471705    04.  /*Colon/Rectal Srg, PC, Off Based  Non-Fed;Patn Care Office-Based       */
     @04421    f1252310    04.  /*Colon/Rectal Srg, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @04425    f1252308    04.  /*Colon/Rectal Srg, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @04429    f1252305    04.  /*Colon/Rectal Srg, PC, Hosp Res   Non-Fed;Patn Care Hosp-Based         */
     @04433    f0471910    04.  /*Colon/Rectal Srg, PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04437    f0471908    04.  /*Colon/Rectal Srg, PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04441    f0471905    04.  /*Colon/Rectal Srg, PC,Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04445    f1006910    04.  /*Colon/Rectal Srg, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @04449    f1006908    04.  /*Colon/Rectal Srg, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @04453    f1006905    04.  /*Colon/Rectal Srg, Administrat    Non-Fed;MD's By Speclty/Actvty       */
     @04457    f1007010    04.  /*Colon/Rectal Srg, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @04461    f1007008    04.  /*Colon/Rectal Srg, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @04465    f1007005    04.  /*Colon/Rectal Srg, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @04469    f1114410    04.  /*Colon/Rectal Srg, Research       Non-Fed;MD's By Speclty/Actvty       */
     @04473    f1114408    04.  /*Colon/Rectal Srg, Research       Non-Fed;MD's By Speclty/Actvty       */
     @04477    f1114405    04.  /*Colon/Rectal Srg, Research       Non-Fed;MD's By Speclty/Actvty       */
     @04481    f1007210    04.  /*Colon/Rectal Srg, Other          Non-Fed;MD's By Speclty/Actvty       */
     @04485    f1007208    04.  /*Colon/Rectal Srg, Other          Non-Fed;MD's By Speclty/Actvty       */
     @04489    f1007205    04.  /*Colon/Rectal Srg, Other          Non-Fed;MD's By Speclty/Actvty       */
     @04493    f0472010    05.  /*Thoracic Surg, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04498    f0472008    05.  /*Thoracic Surg, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04503    f0472005    05.  /*Thoracic Surg, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04508    f1114510    05.  /*Thoracic Surg, Total Patn Care   Non-Fed;Patient Care                 */
     @04513    f1114508    05.  /*Thoracic Surg, Total Patn Care   Non-Fed;Patient Care                 */
     @04518    f1114505    05.  /*Thoracic Surg, Total Patn Care   Non-Fed;Patient Care                 */
     @04523    f0472210    04.  /*Thoracic Surg, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04527    f0472208    04.  /*Thoracic Surg, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04531    f0472205    04.  /*Thoracic Surg, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04535    f1252410    04.  /*Thoracic Surg, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04539    f1252408    04.  /*Thoracic Surg, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04543    f1252405    04.  /*Thoracic Surg, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04547    f0472410    04.  /*Thoracic Surg, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04551    f0472408    04.  /*Thoracic Surg, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04555    f0472405    04.  /*Thoracic Surg, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04559    f1007510    04.  /*Thoracic Surg, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04563    f1007508    04.  /*Thoracic Surg, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04567    f1007505    04.  /*Thoracic Surg, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04571    f1007610    04.  /*Thoracic Surg, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04575    f1007608    04.  /*Thoracic Surg, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04579    f1007605    04.  /*Thoracic Surg, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04583    f1114710    04.  /*Thoracic Surg, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04587    f1114708    04.  /*Thoracic Surg, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04591    f1114705    04.  /*Thoracic Surg, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04595    f1007810    04.  /*Thoracic Surg, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04599    f1007808    04.  /*Thoracic Surg, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04603    f1007805    04.  /*Thoracic Surg, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04607    f0472510    05.  /*Urology, Total                   Non-Fed;MD's By Speclty/Actvty       */
     @04612    f0472508    05.  /*Urology, Total                   Non-Fed;MD's By Speclty/Actvty       */
     @04617    f0472505    05.  /*Urology, Total                   Non-Fed;MD's By Speclty/Actvty       */
     @04622    f1114810    05.  /*Urology, Total Patient Care      Non-Fed;Patient Care                 */
     @04627    f1114808    05.  /*Urology, Total Patient Care      Non-Fed;Patient Care                 */
     @04632    f1114805    05.  /*Urology, Total Patient Care      Non-Fed;Patient Care                 */
     @04637    f0472710    04.  /*Urology, PC, Office Based        Non-Fed;Patn Care Office-Based       */
     @04641    f0472708    04.  /*Urology, PC, Office Based        Non-Fed;Patn Care Office-Based       */
     @04645    f0472705    04.  /*Urology, PC, Office Based        Non-Fed;Patn Care Office-Based       */
     @04649    f1252510    04.  /*Urology, PC, Hosp Residents      Non-Fed;Patn Care Hosp-Based         */
     @04653    f1252508    04.  /*Urology, PC, Hosp Residents      Non-Fed;Patn Care Hosp-Based         */
     @04657    f1252505    04.  /*Urology, PC, Hosp Residents      Non-Fed;Patn Care Hosp-Based         */
     @04661    f0472910    04.  /*Urology, PC, Hosp FT Staff       Non-Fed;Patn Care Hosp-Based         */
     @04665    f0472908    04.  /*Urology, PC, Hosp FT Staff       Non-Fed;Patn Care Hosp-Based         */
     @04669    f0472905    04.  /*Urology, PC, Hosp FT Staff       Non-Fed;Patn Care Hosp-Based         */
     @04673    f1008110    04.  /*Urology, Administration          Non-Fed;MD's By Speclty/Actvty       */
     @04677    f1008108    04.  /*Urology, Administration          Non-Fed;MD's By Speclty/Actvty       */
     @04681    f1008105    04.  /*Urology, Administration          Non-Fed;MD's By Speclty/Actvty       */
     @04685    f1008210    04.  /*Urology, Teaching                Non-Fed;MD's By Speclty/Actvty       */
     @04689    f1008208    04.  /*Urology, Teaching                Non-Fed;MD's By Speclty/Actvty       */
     @04693    f1008205    04.  /*Urology, Teaching                Non-Fed;MD's By Speclty/Actvty       */
     @04697    f1115010    04.  /*Urology, Research                Non-Fed;MD's By Speclty/Actvty       */
     @04701    f1115008    04.  /*Urology, Research                Non-Fed;MD's By Speclty/Actvty       */
     @04705    f1115005    04.  /*Urology, Research                Non-Fed;MD's By Speclty/Actvty       */
     @04709    f1008410    04.  /*Urology, Other                   Non-Fed;MD's By Speclty/Actvty       */
     @04713    f1008408    04.  /*Urology, Other                   Non-Fed;MD's By Speclty/Actvty       */
     @04717    f1008405    04.  /*Urology, Other                   Non-Fed;MD's By Speclty/Actvty       */
     @04721    f0473010    05.  /*Other Spec, Tot, Total           Non-Fed;MD's By Speclty/Actvty       */
     @04726    f0473008    05.  /*Other Spec, Tot, Total           Non-Fed;MD's By Speclty/Actvty       */
     @04731    f0473005    05.  /*Other Spec, Tot, Total           Non-Fed;MD's By Speclty/Actvty       */
     @04736    f1115110    05.  /*Other Spec, Tot, Total Ptn Care  Non-Fed;Patient Care                 */
     @04741    f1115108    05.  /*Other Spec, Tot, Total Ptn Care  Non-Fed;Patient Care                 */
     @04746    f1115105    05.  /*Other Spec, Tot, Total Ptn Care  Non-Fed;Patient Care                 */
     @04751    f0886310    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04755    f0886308    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04759    f0886307    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04763    f0886306    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04767    f0886305    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04771    f0886300    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04775    f0886395    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04779    f0886390    04.  /*Other Spec, Tot, PC, Off Based   Non-Fed;Patn Care Office-Based       */
     @04783    f1252610    05.  /*Other Spec, Tot, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @04788    f1252608    05.  /*Other Spec, Tot, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @04793    f1252605    05.  /*Other Spec, Tot, PC, Hosp Res    Non-Fed;Patn Care Hosp-Based         */
     @04798    f0473310    05.  /*Other Spec, Tot, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04803    f0473308    05.  /*Other Spec, Tot, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04808    f0473305    05.  /*Other Spec, Tot, PC, Hsp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @04813    f0473410    05.  /*Other Spec, Tot, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @04818    f0473408    05.  /*Other Spec, Tot, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @04823    f0473405    05.  /*Other Spec, Tot, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @04828    f0473510    05.  /*Other Spec, Tot, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @04833    f0473508    05.  /*Other Spec, Tot, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @04838    f0473505    05.  /*Other Spec, Tot, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @04843    f1115310    05.  /*Other Spec, Tot, Research        Non-Fed;MD's By Speclty/Actvty       */
     @04848    f1115308    05.  /*Other Spec, Tot, Research        Non-Fed;MD's By Speclty/Actvty       */
     @04853    f1115305    05.  /*Other Spec, Tot, Research        Non-Fed;MD's By Speclty/Actvty       */
     @04858    f0473710    05.  /*Other Spec, Tot, Other           Non-Fed;MD's By Speclty/Actvty       */
     @04863    f0473708    05.  /*Other Spec, Tot, Other           Non-Fed;MD's By Speclty/Actvty       */
     @04868    f0473705    05.  /*Other Spec, Tot, Other           Non-Fed;MD's By Speclty/Actvty       */
     @04873    f0473810    05.  /*Aerospace Med, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04878    f0473808    05.  /*Aerospace Med, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04883    f0473805    05.  /*Aerospace Med, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04888    f1115410    05.  /*Aerospace Med, Total Patn Care   Non-Fed;Patient Care                 */
     @04893    f1115408    05.  /*Aerospace Med, Total Patn Care   Non-Fed;Patient Care                 */
     @04898    f1115405    05.  /*Aerospace Med, Total Patn Care   Non-Fed;Patient Care                 */
     @04903    f0474010    04.  /*Aerospace Med, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04907    f0474008    04.  /*Aerospace Med, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04911    f0474005    04.  /*Aerospace Med, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @04915    f1252710    04.  /*Aerospace Med, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04919    f1252708    04.  /*Aerospace Med, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04923    f1252705    04.  /*Aerospace Med, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @04927    f0474210    04.  /*Aerospace Med, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04931    f0474208    04.  /*Aerospace Med, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04935    f0474205    04.  /*Aerospace Med, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @04939    f1008910    04.  /*Aerospace Med, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04943    f1008908    04.  /*Aerospace Med, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04947    f1008905    04.  /*Aerospace Med, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @04951    f1009010    04.  /*Aerospace Med, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04955    f1009008    04.  /*Aerospace Med, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04959    f1009005    04.  /*Aerospace Med, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @04963    f1115610    04.  /*Aerospace Med, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04967    f1115608    04.  /*Aerospace Med, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04971    f1115605    04.  /*Aerospace Med, Research          Non-Fed;MD's By Speclty/Actvty       */
     @04975    f1009210    04.  /*Aerospace Med, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04979    f1009208    04.  /*Aerospace Med, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04983    f1009205    04.  /*Aerospace Med, Other             Non-Fed;MD's By Speclty/Actvty       */
     @04987    f0474310    05.  /*Anesthesiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04992    f0474308    05.  /*Anesthesiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @04997    f0474305    05.  /*Anesthesiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05002    f1115710    05.  /*Anesthesiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @05007    f1115708    05.  /*Anesthesiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @05012    f1115705    05.  /*Anesthesiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @05017    f0474510    04.  /*Anesthesiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05021    f0474508    04.  /*Anesthesiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05025    f0474505    04.  /*Anesthesiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05029    f1252810    04.  /*Anesthesiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05033    f1252808    04.  /*Anesthesiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05037    f1252805    04.  /*Anesthesiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05041    f0474710    04.  /*Anesthesiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05045    f0474708    04.  /*Anesthesiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05049    f0474705    04.  /*Anesthesiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05053    f1009510    04.  /*Anesthesiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05057    f1009508    04.  /*Anesthesiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05061    f1009505    04.  /*Anesthesiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05065    f1009610    04.  /*Anesthesiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05069    f1009608    04.  /*Anesthesiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05073    f1009605    04.  /*Anesthesiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05077    f1115910    04.  /*Anesthesiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05081    f1115908    04.  /*Anesthesiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05085    f1115905    04.  /*Anesthesiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05089    f1009810    04.  /*Anesthesiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05093    f1009808    04.  /*Anesthesiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05097    f1009805    04.  /*Anesthesiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05101    f0474810    05.  /*Child Psych, Total               Non-Fed;MD's By Speclty/Actvty       */
     @05106    f0474808    05.  /*Child Psych, Total               Non-Fed;MD's By Speclty/Actvty       */
     @05111    f0474805    05.  /*Child Psych, Total               Non-Fed;MD's By Speclty/Actvty       */
     @05116    f1116010    05.  /*Child Psych, Total Patn Care     Non-Fed;Patient Care                 */
     @05121    f1116008    05.  /*Child Psych, Total Patn Care     Non-Fed;Patient Care                 */
     @05126    f1116005    05.  /*Child Psych, Total Patn Care     Non-Fed;Patient Care                 */
     @05131    f0475010    04.  /*Child Psych, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @05135    f0475008    04.  /*Child Psych, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @05139    f0475005    04.  /*Child Psych, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @05143    f1252910    04.  /*Child Psych, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @05147    f1252908    04.  /*Child Psych, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @05151    f1252905    04.  /*Child Psych, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @05155    f0475210    04.  /*Child Psych, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @05159    f0475208    04.  /*Child Psych, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @05163    f0475205    04.  /*Child Psych, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @05167    f1010110    04.  /*Child Psych, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @05171    f1010108    04.  /*Child Psych, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @05175    f1010105    04.  /*Child Psych, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @05179    f1010210    04.  /*Child Psych, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @05183    f1010208    04.  /*Child Psych, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @05187    f1010205    04.  /*Child Psych, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @05191    f1116210    04.  /*Child Psych, Research            Non-Fed;MD's By Speclty/Actvty       */
     @05195    f1116208    04.  /*Child Psych, Research            Non-Fed;MD's By Speclty/Actvty       */
     @05199    f1116205    04.  /*Child Psych, Research            Non-Fed;MD's By Speclty/Actvty       */
     @05203    f1010410    04.  /*Child Psych, Other               Non-Fed;MD's By Speclty/Actvty       */
     @05207    f1010408    04.  /*Child Psych, Other               Non-Fed;MD's By Speclty/Actvty       */
     @05211    f1010405    04.  /*Child Psych, Other               Non-Fed;MD's By Speclty/Actvty       */
     @05215    f0475310    05.  /*Diag Radiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05220    f0475308    05.  /*Diag Radiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05225    f0475305    05.  /*Diag Radiolgy, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05230    f1116310    05.  /*Diag Radiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @05235    f1116308    05.  /*Diag Radiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @05240    f1116305    05.  /*Diag Radiolgy, Total Patn Care   Non-Fed;Patient Care                 */
     @05245    f0475510    04.  /*Diag Radiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05249    f0475508    04.  /*Diag Radiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05253    f0475505    04.  /*Diag Radiolgy, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05257    f1253010    04.  /*Diag Radiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05261    f1253008    04.  /*Diag Radiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05265    f1253005    04.  /*Diag Radiolgy, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05269    f0475710    04.  /*Diag Radiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05273    f0475708    04.  /*Diag Radiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05277    f0475705    04.  /*Diag Radiolgy, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05281    f1010710    04.  /*Diag Radiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05285    f1010708    04.  /*Diag Radiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05289    f1010705    04.  /*Diag Radiolgy, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05293    f1010810    04.  /*Diag Radiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05297    f1010808    04.  /*Diag Radiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05301    f1010805    04.  /*Diag Radiolgy, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05305    f1116510    04.  /*Diag Radiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05309    f1116508    04.  /*Diag Radiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05313    f1116505    04.  /*Diag Radiolgy, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05317    f1011010    04.  /*Diag Radiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05321    f1011008    04.  /*Diag Radiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05325    f1011005    04.  /*Diag Radiolgy, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05329    f0982610    05.  /*Emergency Med, Total             Non-Fed;Subset Of Other Specs        */
     @05334    f0982608    05.  /*Emergency Med, Total             Non-Fed;Subset Of Other Specs        */
     @05339    f0982605    05.  /*Emergency Med, Total             Non-Fed;Subset Of Other Specs        */
     @05344    f1116610    05.  /*Emergency Med, Total Patn Care   Non-Fed;Subset Of Other Specs        */
     @05349    f1116608    05.  /*Emergency Med, Total Patn Care   Non-Fed;Subset Of Other Specs        */
     @05354    f1116605    05.  /*Emergency Med, Total Patn Care   Non-Fed;Subset Of Other Specs        */
     @05359    f0982810    04.  /*Emergency Med, PC, Office Based  Non-Fed;Subset Of Other Specs        */
     @05363    f0982808    04.  /*Emergency Med, PC, Office Based  Non-Fed;Subset Of Other Specs        */
     @05367    f0982805    04.  /*Emergency Med, PC, Office Based  Non-Fed;Subset Of Other Specs        */
     @05371    f1253110    04.  /*Emergency Med, PC, Hosp Resdnt   Non-Fed;Subset Of Other Specs        */
     @05375    f1253108    04.  /*Emergency Med, PC, Hosp Resdnt   Non-Fed;Subset Of Other Specs        */
     @05379    f1253105    04.  /*Emergency Med, PC, Hosp Resdnt   Non-Fed;Subset Of Other Specs        */
     @05383    f0983010    04.  /*Emergency Med, PC, Hosp FT Stf   Non-Fed;Subset Of Other Specs        */
     @05387    f0983008    04.  /*Emergency Med, PC, Hosp FT Stf   Non-Fed;Subset Of Other Specs        */
     @05391    f0983005    04.  /*Emergency Med, PC, Hosp FT Stf   Non-Fed;Subset Of Other Specs        */
     @05395    f1018510    04.  /*Emergency Med, Administration    Non-Fed;Subset Of Other Specs        */
     @05399    f1018508    04.  /*Emergency Med, Administration    Non-Fed;Subset Of Other Specs        */
     @05403    f1018505    04.  /*Emergency Med, Administration    Non-Fed;Subset Of Other Specs        */
     @05407    f1018610    04.  /*Emergency Med, Teaching          Non-Fed;Subset Of Other Specs        */
     @05411    f1018608    04.  /*Emergency Med, Teaching          Non-Fed;Subset Of Other Specs        */
     @05415    f1018605    04.  /*Emergency Med, Teaching          Non-Fed;Subset Of Other Specs        */
     @05419    f1116810    04.  /*Emergency Med, Research          Non-Fed;Subset Of Other Specs        */
     @05423    f1116808    04.  /*Emergency Med, Research          Non-Fed;Subset Of Other Specs        */
     @05427    f1116805    04.  /*Emergency Med, Research          Non-Fed;Subset Of Other Specs        */
     @05431    f1018810    04.  /*Emergency Med, Other             Non-Fed;Subset Of Other Specs        */
     @05435    f1018808    04.  /*Emergency Med, Other             Non-Fed;Subset Of Other Specs        */
     @05439    f1018805    04.  /*Emergency Med, Other             Non-Fed;Subset Of Other Specs        */
     @05443    f0475810    05.  /*Forensic Path, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05448    f0475808    05.  /*Forensic Path, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05453    f0475805    05.  /*Forensic Path, Total             Non-Fed;MD's By Speclty/Actvty       */
     @05458    f1116910    05.  /*Forensic Path, Total Patn Care   Non-Fed;Patient Care                 */
     @05463    f1116908    05.  /*Forensic Path, Total Patn Care   Non-Fed;Patient Care                 */
     @05468    f1116905    05.  /*Forensic Path, Total Patn Care   Non-Fed;Patient Care                 */
     @05473    f0476010    04.  /*Forensic Path, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05477    f0476008    04.  /*Forensic Path, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05481    f0476005    04.  /*Forensic Path, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @05485    f1253210    04.  /*Forensic Path, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05489    f1253208    04.  /*Forensic Path, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05493    f1253205    04.  /*Forensic Path, PC, Hosp Resdnt   Non-Fed;Patn Care Hosp-Based         */
     @05497    f0476210    04.  /*Forensic Path, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05501    f0476208    04.  /*Forensic Path, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05505    f0476205    04.  /*Forensic Path, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @05509    f1011310    04.  /*Forensic Path, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05513    f1011308    04.  /*Forensic Path, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05517    f1011305    04.  /*Forensic Path, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @05521    f1011410    04.  /*Forensic Path, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05525    f1011408    04.  /*Forensic Path, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05529    f1011405    04.  /*Forensic Path, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @05533    f1117110    04.  /*Forensic Path, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05537    f1117108    04.  /*Forensic Path, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05541    f1117105    04.  /*Forensic Path, Research          Non-Fed;MD's By Speclty/Actvty       */
     @05545    f1011610    04.  /*Forensic Path, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05549    f1011608    04.  /*Forensic Path, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05553    f1011605    04.  /*Forensic Path, Other             Non-Fed;MD's By Speclty/Actvty       */
     @05557    f1242510    05.  /*Medical Genetics, Total          Non-Fed;MD's By Speclty/Actvty       */
     @05562    f1242508    05.  /*Medical Genetics, Total          Non-Fed;MD's By Speclty/Actvty       */
     @05567    f1242505    05.  /*Medical Genetics, Total          Non-Fed;MD's By Speclty/Actvty       */
     @05572    f1243210    05.  /*Medical Genetics,Tot Patnt Care  Non-Fed;Patient Care                 */
     @05577    f1243208    05.  /*Medical Genetics,Tot Patnt Care  Non-Fed;Patient Care                 */
     @05582    f1243205    05.  /*Medical Genetics,Tot Patnt Care  Non-Fed;Patient Care                 */
     @05587    f1243310    04.  /*Medical Genetics,PC,Off Based    Non-Fed;Patn Care Office-Based       */
     @05591    f1243308    04.  /*Medical Genetics,PC,Off Based    Non-Fed;Patn Care Office-Based       */
     @05595    f1243305    04.  /*Medical Genetics,PC,Off Based    Non-Fed;Patn Care Office-Based       */
     @05599    f1253310    04.  /*Medical Genetics,PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @05603    f1253308    04.  /*Medical Genetics,PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @05607    f1253305    04.  /*Medical Genetics,PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @05611    f1243610    04.  /*Medical Genetics,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @05615    f1243608    04.  /*Medical Genetics,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @05619    f1243605    04.  /*Medical Genetics,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @05623    f1243710    04.  /*Medical Genetics,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @05627    f1243708    04.  /*Medical Genetics,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @05631    f1243705    04.  /*Medical Genetics,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @05635    f1243810    04.  /*Medical Genetics, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @05639    f1243808    04.  /*Medical Genetics, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @05643    f1243805    04.  /*Medical Genetics, Teaching       Non-Fed;MD's By Speclty/Actvty       */
     @05647    f1243910    04.  /*Medical Genetics, Research       Non-Fed;MD's By Speclty/Actvty       */
     @05651    f1243908    04.  /*Medical Genetics, Research       Non-Fed;MD's By Speclty/Actvty       */
     @05655    f1243905    04.  /*Medical Genetics, Research       Non-Fed;MD's By Speclty/Actvty       */
     @05659    f1244010    04.  /*Medical Genetics, Other          Non-Fed;MD's By Speclty/Actvty       */
     @05663    f1244008    04.  /*Medical Genetics, Other          Non-Fed;MD's By Speclty/Actvty       */
     @05667    f1244005    04.  /*Medical Genetics, Other          Non-Fed;MD's By Speclty/Actvty       */
     @05671    f0476310    05.  /*Neurology, Total                 Non-Fed;MD's By Speclty/Actvty       */
     @05676    f0476308    05.  /*Neurology, Total                 Non-Fed;MD's By Speclty/Actvty       */
     @05681    f0476305    05.  /*Neurology, Total                 Non-Fed;MD's By Speclty/Actvty       */
     @05686    f1117210    05.  /*Neurology, Total Patient Care    Non-Fed;Patient Care                 */
     @05691    f1117208    05.  /*Neurology, Total Patient Care    Non-Fed;Patient Care                 */
     @05696    f1117205    05.  /*Neurology, Total Patient Care    Non-Fed;Patient Care                 */
     @05701    f0476510    04.  /*Neurology, PC, Office Based      Non-Fed;Patn Care Office-Based       */
     @05705    f0476508    04.  /*Neurology, PC, Office Based      Non-Fed;Patn Care Office-Based       */
     @05709    f0476505    04.  /*Neurology, PC, Office Based      Non-Fed;Patn Care Office-Based       */
     @05713    f1253410    04.  /*Neurology, PC, Hosp Residents    Non-Fed;Patn Care Hosp-Based         */
     @05717    f1253408    04.  /*Neurology, PC, Hosp Residents    Non-Fed;Patn Care Hosp-Based         */
     @05721    f1253405    04.  /*Neurology, PC, Hosp Residents    Non-Fed;Patn Care Hosp-Based         */
     @05725    f0476710    04.  /*Neurology, PC, Hosp FT Staff     Non-Fed;Patn Care Hosp-Based         */
     @05729    f0476708    04.  /*Neurology, PC, Hosp FT Staff     Non-Fed;Patn Care Hosp-Based         */
     @05733    f0476705    04.  /*Neurology, PC, Hosp FT Staff     Non-Fed;Patn Care Hosp-Based         */
     @05737    f1011910    04.  /*Neurology, Administration        Non-Fed;MD's By Speclty/Actvty       */
     @05741    f1011908    04.  /*Neurology, Administration        Non-Fed;MD's By Speclty/Actvty       */
     @05745    f1011905    04.  /*Neurology, Administration        Non-Fed;MD's By Speclty/Actvty       */
     @05749    f1012010    04.  /*Neurology, Teaching              Non-Fed;MD's By Speclty/Actvty       */
     @05753    f1012008    04.  /*Neurology, Teaching              Non-Fed;MD's By Speclty/Actvty       */
     @05757    f1012005    04.  /*Neurology, Teaching              Non-Fed;MD's By Speclty/Actvty       */
     @05761    f1117410    04.  /*Neurology, Research              Non-Fed;MD's By Speclty/Actvty       */
     @05765    f1117408    04.  /*Neurology, Research              Non-Fed;MD's By Speclty/Actvty       */
     @05769    f1117405    04.  /*Neurology, Research              Non-Fed;MD's By Speclty/Actvty       */
     @05773    f1012210    04.  /*Neurology, Other                 Non-Fed;MD's By Speclty/Actvty       */
     @05777    f1012208    04.  /*Neurology, Other                 Non-Fed;MD's By Speclty/Actvty       */
     @05781    f1012205    04.  /*Neurology, Other                 Non-Fed;MD's By Speclty/Actvty       */
     @05785    f0981610    05.  /*Nuclear Med, Total               Non-Fed;Subset Of Radiology          */
     @05790    f0981608    05.  /*Nuclear Med, Total               Non-Fed;Subset Of Radiology          */
     @05795    f0981605    05.  /*Nuclear Med, Total               Non-Fed;Subset Of Radiology          */
     @05800    f1117510    05.  /*Nuclear Med, Total Patient Care  Non-Fed;Subset Of Radiology          */
     @05805    f1117508    05.  /*Nuclear Med, Total Patient Care  Non-Fed;Subset Of Radiology          */
     @05810    f1117505    05.  /*Nuclear Med, Total Patient Care  Non-Fed;Subset Of Radiology          */
     @05815    f0981810    04.  /*Nuclear Med, PC, Office Based    Non-Fed;Subset Of Radiology          */
     @05819    f0981808    04.  /*Nuclear Med, PC, Office Based    Non-Fed;Subset Of Radiology          */
     @05823    f0981805    04.  /*Nuclear Med, PC, Office Based    Non-Fed;Subset Of Radiology          */
     @05827    f1253510    04.  /*Nuclear Med, PC, Hosp Residnts   Non-Fed;Subset Of Radiology          */
     @05831    f1253508    04.  /*Nuclear Med, PC, Hosp Residnts   Non-Fed;Subset Of Radiology          */
     @05835    f1253505    04.  /*Nuclear Med, PC, Hosp Residnts   Non-Fed;Subset Of Radiology          */
     @05839    f0982010    04.  /*Nuclear Med, PC, Hosp FT Staff   Non-Fed;Subset Of Radiology          */
     @05843    f0982008    04.  /*Nuclear Med, PC, Hosp FT Staff   Non-Fed;Subset Of Radiology          */
     @05847    f0982005    04.  /*Nuclear Med, PC, Hosp FT Staff   Non-Fed;Subset Of Radiology          */
     @05851    f1016710    04.  /*Nuclear Med, Administration      Non-Fed;Subset Of Radiology          */
     @05855    f1016708    04.  /*Nuclear Med, Administration      Non-Fed;Subset Of Radiology          */
     @05859    f1016705    04.  /*Nuclear Med, Administration      Non-Fed;Subset Of Radiology          */
     @05863    f1016810    04.  /*Nuclear Med, Teaching            Non-Fed;Subset Of Radiology          */
     @05867    f1016808    04.  /*Nuclear Med, Teaching            Non-Fed;Subset Of Radiology          */
     @05871    f1016805    04.  /*Nuclear Med, Teaching            Non-Fed;Subset Of Radiology          */
     @05875    f1117710    04.  /*Nuclear Med, Research            Non-Fed;Subset Of Radiology          */
     @05879    f1117708    04.  /*Nuclear Med, Research            Non-Fed;Subset Of Radiology          */
     @05883    f1117705    04.  /*Nuclear Med, Research            Non-Fed;Subset Of Radiology          */
     @05887    f1017010    04.  /*Nuclear Med, Other               Non-Fed;Subset Of Radiology          */
     @05891    f1017008    04.  /*Nuclear Med, Other               Non-Fed;Subset Of Radiology          */
     @05895    f1017005    04.  /*Nuclear Med, Other               Non-Fed;Subset Of Radiology          */
     @05899    f0476810    05.  /*Occupat Med, Total               Non-Fed;MD's By Speclty/Actvty       */
     @05904    f0476808    05.  /*Occupat Med, Total               Non-Fed;MD's By Speclty/Actvty       */
     @05909    f0476805    05.  /*Occupat Med, Total               Non-Fed;MD's By Speclty/Actvty       */
     @05914    f1117810    05.  /*Occupat Med, Total Patnt Care    Non-Fed;Patient Care                 */
     @05919    f1117808    05.  /*Occupat Med, Total Patnt Care    Non-Fed;Patient Care                 */
     @05924    f1117805    05.  /*Occupat Med, Total Patnt Care    Non-Fed;Patient Care                 */
     @05929    f0477010    04.  /*Occupat Med, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @05933    f0477008    04.  /*Occupat Med, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @05937    f0477005    04.  /*Occupat Med, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @05941    f1253610    04.  /*Occupat Med, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @05945    f1253608    04.  /*Occupat Med, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @05949    f1253605    04.  /*Occupat Med, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @05953    f0477210    04.  /*Occupat Med, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @05957    f0477208    04.  /*Occupat Med, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @05961    f0477205    04.  /*Occupat Med, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @05965    f1012510    04.  /*Occupat Med, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @05969    f1012508    04.  /*Occupat Med, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @05973    f1012505    04.  /*Occupat Med, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @05977    f1012610    04.  /*Occupat Med, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @05981    f1012608    04.  /*Occupat Med, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @05985    f1012605    04.  /*Occupat Med, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @05989    f1118010    04.  /*Occupat Med, Research            Non-Fed;MD's By Speclty/Actvty       */
     @05993    f1118008    04.  /*Occupat Med, Research            Non-Fed;MD's By Speclty/Actvty       */
     @05997    f1118005    04.  /*Occupat Med, Research            Non-Fed;MD's By Speclty/Actvty       */
     @06001    f1012810    04.  /*Occupat Med, Other               Non-Fed;MD's By Speclty/Actvty       */
     @06005    f1012808    04.  /*Occupat Med, Other               Non-Fed;MD's By Speclty/Actvty       */
     @06009    f1012805    04.  /*Occupat Med, Other               Non-Fed;MD's By Speclty/Actvty       */
     @06013    f0477310    05.  /*Psychiatry, Total                Non-Fed;MD's By Speclty/Actvty       */
     @06018    f0477308    05.  /*Psychiatry, Total                Non-Fed;MD's By Speclty/Actvty       */
     @06023    f0477305    05.  /*Psychiatry, Total                Non-Fed;MD's By Speclty/Actvty       */
     @06028    f1118110    05.  /*Psychiatry, Total Patient Care   Non-Fed;Patient Care                 */
     @06033    f1118108    05.  /*Psychiatry, Total Patient Care   Non-Fed;Patient Care                 */
     @06038    f1118105    05.  /*Psychiatry, Total Patient Care   Non-Fed;Patient Care                 */
     @06043    f0477510    04.  /*Psychiatry, PC, Office Based     Non-Fed;Patn Care Office-Based       */
     @06047    f0477508    04.  /*Psychiatry, PC, Office Based     Non-Fed;Patn Care Office-Based       */
     @06051    f0477505    04.  /*Psychiatry, PC, Office Based     Non-Fed;Patn Care Office-Based       */
     @06055    f1253710    04.  /*Psychiatry, PC, Hosp Residents   Non-Fed;Patn Care Hosp-Based         */
     @06059    f1253708    04.  /*Psychiatry, PC, Hosp Residents   Non-Fed;Patn Care Hosp-Based         */
     @06063    f1253705    04.  /*Psychiatry, PC, Hosp Residents   Non-Fed;Patn Care Hosp-Based         */
     @06067    f0477710    04.  /*Psychiatry, PC, Hosp FT Staff    Non-Fed;Patn Care Hosp-Based         */
     @06071    f0477708    04.  /*Psychiatry, PC, Hosp FT Staff    Non-Fed;Patn Care Hosp-Based         */
     @06075    f0477705    04.  /*Psychiatry, PC, Hosp FT Staff    Non-Fed;Patn Care Hosp-Based         */
     @06079    f1013110    04.  /*Psychiatry, Administration       Non-Fed;MD's By Speclty/Actvty       */
     @06083    f1013108    04.  /*Psychiatry, Administration       Non-Fed;MD's By Speclty/Actvty       */
     @06087    f1013105    04.  /*Psychiatry, Administration       Non-Fed;MD's By Speclty/Actvty       */
     @06091    f1013210    04.  /*Psychiatry, Teaching             Non-Fed;MD's By Speclty/Actvty       */
     @06095    f1013208    04.  /*Psychiatry, Teaching             Non-Fed;MD's By Speclty/Actvty       */
     @06099    f1013205    04.  /*Psychiatry, Teaching             Non-Fed;MD's By Speclty/Actvty       */
     @06103    f1118310    04.  /*Psychiatry, Research             Non-Fed;MD's By Speclty/Actvty       */
     @06107    f1118308    04.  /*Psychiatry, Research             Non-Fed;MD's By Speclty/Actvty       */
     @06111    f1118305    04.  /*Psychiatry, Research             Non-Fed;MD's By Speclty/Actvty       */
     @06115    f1013410    04.  /*Psychiatry, Other                Non-Fed;MD's By Speclty/Actvty       */
     @06119    f1013408    04.  /*Psychiatry, Other                Non-Fed;MD's By Speclty/Actvty       */
     @06123    f1013405    04.  /*Psychiatry, Other                Non-Fed;MD's By Speclty/Actvty       */
     @06127    f0477810    05.  /*Path,Anat/Clinic,Total           Non-Fed;MD's By Speclty/Actvty       */
     @06132    f0477808    05.  /*Path,Anat/Clinic,Total           Non-Fed;MD's By Speclty/Actvty       */
     @06137    f0477805    05.  /*Path,Anat/Clinic,Total           Non-Fed;MD's By Speclty/Actvty       */
     @06142    f1118410    05.  /*Path,Anat/Clinic,Tot Patient Cr  Non-Fed;Patient Care                 */
     @06147    f1118408    05.  /*Path,Anat/Clinic,Tot Patient Cr  Non-Fed;Patient Care                 */
     @06152    f1118405    05.  /*Path,Anat/Clinic,Tot Patient Cr  Non-Fed;Patient Care                 */
     @06157    f0478010    04.  /*Path,Anat/Clinic,PC,Off Based    Non-Fed;Patn Care Office-Based       */
     @06161    f0478008    04.  /*Path,Anat/Clinic,PC,Off Based    Non-Fed;Patn Care Office-Based       */
     @06165    f0478005    04.  /*Path,Anat/Clinic,PC,Off Based    Non-Fed;Patn Care Office-Based       */
     @06169    f1253810    04.  /*Path,Anat/Clinic,PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06173    f1253808    04.  /*Path,Anat/Clinic,PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06177    f1253805    04.  /*Path,Anat/Clinic,PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06181    f0478210    04.  /*Path,Anat/Clinic,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06185    f0478208    04.  /*Path,Anat/Clinic,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06189    f0478205    04.  /*Path,Anat/Clinic,PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06193    f1013710    04.  /*Path,Anat/Clinic,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @06197    f1013708    04.  /*Path,Anat/Clinic,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @06201    f1013705    04.  /*Path,Anat/Clinic,Administration  Non-Fed;MD's By Speclty/Actvty       */
     @06205    f1013810    04.  /*Path,Anat/Clinic,Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @06209    f1013808    04.  /*Path,Anat/Clinic,Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @06213    f1013805    04.  /*Path,Anat/Clinic,Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @06217    f1118610    04.  /*Path,Anat/Clinic,Research        Non-Fed;MD's By Speclty/Actvty       */
     @06221    f1118608    04.  /*Path,Anat/Clinic,Research        Non-Fed;MD's By Speclty/Actvty       */
     @06225    f1118605    04.  /*Path,Anat/Clinic,Research        Non-Fed;MD's By Speclty/Actvty       */
     @06229    f1014010    04.  /*Path,Anat/Clinic,Other           Non-Fed;MD's By Speclty/Actvty       */
     @06233    f1014008    04.  /*Path,Anat/Clinic,Other           Non-Fed;MD's By Speclty/Actvty       */
     @06237    f1014005    04.  /*Path,Anat/Clinic,Other           Non-Fed;MD's By Speclty/Actvty       */
     @06241    f0478310    05.  /*Phys Med/Rehab, Total            Non-Fed;MD's By Speclty/Actvty       */
     @06246    f0478308    05.  /*Phys Med/Rehab, Total            Non-Fed;MD's By Speclty/Actvty       */
     @06251    f0478305    05.  /*Phys Med/Rehab, Total            Non-Fed;MD's By Speclty/Actvty       */
     @06256    f1118710    05.  /*Phys Med/Rehab, Total Patnt Cr   Non-Fed;Patient Care                 */
     @06261    f1118708    05.  /*Phys Med/Rehab, Total Patnt Cr   Non-Fed;Patient Care                 */
     @06266    f1118705    05.  /*Phys Med/Rehab, Total Patnt Cr   Non-Fed;Patient Care                 */
     @06271    f0478510    04.  /*Phys Med/Rehab, PC, Office Base  Non-Fed;Patn Care Office-Based       */
     @06275    f0478508    04.  /*Phys Med/Rehab, PC, Office Base  Non-Fed;Patn Care Office-Based       */
     @06279    f0478505    04.  /*Phys Med/Rehab, PC, Office Base  Non-Fed;Patn Care Office-Based       */
     @06283    f1253910    04.  /*Phys Med/Rehab, PC, Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06287    f1253908    04.  /*Phys Med/Rehab, PC, Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06291    f1253905    04.  /*Phys Med/Rehab, PC, Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06295    f0478710    04.  /*Phys Med/Rehab, PC, Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06299    f0478708    04.  /*Phys Med/Rehab, PC, Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06303    f0478705    04.  /*Phys Med/Rehab, PC, Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06307    f1014310    04.  /*Phys Med/Rehab, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @06311    f1014308    04.  /*Phys Med/Rehab, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @06315    f1014305    04.  /*Phys Med/Rehab, Administration   Non-Fed;MD's By Speclty/Actvty       */
     @06319    f1014410    04.  /*Phys Med/Rehab, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @06323    f1014408    04.  /*Phys Med/Rehab, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @06327    f1014405    04.  /*Phys Med/Rehab, Teaching         Non-Fed;MD's By Speclty/Actvty       */
     @06331    f1118910    04.  /*Phys Med/Rehab, Research         Non-Fed;MD's By Speclty/Actvty       */
     @06335    f1118908    04.  /*Phys Med/Rehab, Research         Non-Fed;MD's By Speclty/Actvty       */
     @06339    f1118905    04.  /*Phys Med/Rehab, Research         Non-Fed;MD's By Speclty/Actvty       */
     @06343    f1014610    04.  /*Phys Med/Rehab, Other            Non-Fed;MD's By Speclty/Actvty       */
     @06347    f1014608    04.  /*Phys Med/Rehab, Other            Non-Fed;MD's By Speclty/Actvty       */
     @06351    f1014605    04.  /*Phys Med/Rehab, Other            Non-Fed;MD's By Speclty/Actvty       */
     @06355    f0478810    05.  /*Gen Prev Med, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06360    f0478808    05.  /*Gen Prev Med, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06365    f0478805    05.  /*Gen Prev Med, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06370    f1119010    05.  /*Gen Prev Med, Total Patnt Care   Non-Fed;Patient Care                 */
     @06375    f1119008    05.  /*Gen Prev Med, Total Patnt Care   Non-Fed;Patient Care                 */
     @06380    f1119005    05.  /*Gen Prev Med, Total Patnt Care   Non-Fed;Patient Care                 */
     @06385    f0479010    04.  /*Gen Prev Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06389    f0479008    04.  /*Gen Prev Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06393    f0479005    04.  /*Gen Prev Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06397    f1254010    04.  /*Gen Prev Med, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @06401    f1254008    04.  /*Gen Prev Med, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @06405    f1254005    04.  /*Gen Prev Med, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @06409    f0479210    04.  /*Gen Prev Med, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @06413    f0479208    04.  /*Gen Prev Med, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @06417    f0479205    04.  /*Gen Prev Med, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @06421    f1014910    04.  /*Gen Prev Med, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06425    f1014908    04.  /*Gen Prev Med, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06429    f1014905    04.  /*Gen Prev Med, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06433    f1015010    04.  /*Gen Prev Med, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06437    f1015008    04.  /*Gen Prev Med, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06441    f1015005    04.  /*Gen Prev Med, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06445    f1119210    04.  /*Gen Prev Med, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06449    f1119208    04.  /*Gen Prev Med, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06453    f1119205    04.  /*Gen Prev Med, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06457    f1015210    04.  /*Gen Prev Med, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06461    f1015208    04.  /*Gen Prev Med, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06465    f1015205    04.  /*Gen Prev Med, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06469    f0479310    05.  /*Public Health, Total             Non-Fed;MD's By Speclty/Actvty       */
     @06474    f0479308    05.  /*Public Health, Total             Non-Fed;MD's By Speclty/Actvty       */
     @06479    f0479305    05.  /*Public Health, Total             Non-Fed;MD's By Speclty/Actvty       */
     @06484    f1119310    05.  /*Public Health, Total Patnt Care  Non-Fed;Patient Care                 */
     @06489    f1119308    05.  /*Public Health, Total Patnt Care  Non-Fed;Patient Care                 */
     @06494    f1119305    05.  /*Public Health, Total Patnt Care  Non-Fed;Patient Care                 */
     @06499    f0479510    04.  /*Public Health, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @06503    f0479508    04.  /*Public Health, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @06507    f0479505    04.  /*Public Health, PC, Office Based  Non-Fed;Patn Care Office-Based       */
     @06511    f1254110    04.  /*Public Health, PC, Hosp Residnt  Non-Fed;Patn Care Hosp-Based         */
     @06515    f1254108    04.  /*Public Health, PC, Hosp Residnt  Non-Fed;Patn Care Hosp-Based         */
     @06519    f1254105    04.  /*Public Health, PC, Hosp Residnt  Non-Fed;Patn Care Hosp-Based         */
     @06523    f0479710    04.  /*Public Health, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @06527    f0479708    04.  /*Public Health, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @06531    f0479705    04.  /*Public Health, PC, Hosp FT Stf   Non-Fed;Patn Care Hosp-Based         */
     @06535    f1015510    04.  /*Public Health, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @06539    f1015508    04.  /*Public Health, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @06543    f1015505    04.  /*Public Health, Administration    Non-Fed;MD's By Speclty/Actvty       */
     @06547    f1015610    04.  /*Public Health, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @06551    f1015608    04.  /*Public Health, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @06555    f1015605    04.  /*Public Health, Teaching          Non-Fed;MD's By Speclty/Actvty       */
     @06559    f1119510    04.  /*Public Health, Research          Non-Fed;MD's By Speclty/Actvty       */
     @06563    f1119508    04.  /*Public Health, Research          Non-Fed;MD's By Speclty/Actvty       */
     @06567    f1119505    04.  /*Public Health, Research          Non-Fed;MD's By Speclty/Actvty       */
     @06571    f1015810    04.  /*Public Health, Other             Non-Fed;MD's By Speclty/Actvty       */
     @06575    f1015808    04.  /*Public Health, Other             Non-Fed;MD's By Speclty/Actvty       */
     @06579    f1015805    04.  /*Public Health, Other             Non-Fed;MD's By Speclty/Actvty       */
     @06583    f0981110    05.  /*Radiology, Total                 Non-Fed;MD's By Speclty/Actvty       */
     @06588    f0981108    05.  /*Radiology, Total                 Non-Fed;MD's By Speclty/Actvty       */
     @06593    f0981105    05.  /*Radiology, Total                 Non-Fed;MD's By Speclty/Actvty       */
     @06598    f1119610    05.  /*Radiology, Total Patient Care    Non-Fed;Patient Care                 */
     @06603    f1119608    05.  /*Radiology, Total Patient Care    Non-Fed;Patient Care                 */
     @06608    f1119605    05.  /*Radiology, Total Patient Care    Non-Fed;Patient Care                 */
     @06613    f0981310    04.  /*Radiology, PC, Office Based      Non-Fed;Patn Care Office-Based       */
     @06617    f0981308    04.  /*Radiology, PC, Office Based      Non-Fed;Patn Care Office-Based       */
     @06621    f0981305    04.  /*Radiology, PC, Office Based      Non-Fed;Patn Care Office-Based       */
     @06625    f1254210    04.  /*Radiology, PC, Hosp Residents    Non-Fed;Patn Care Hosp-Based         */
     @06629    f1254208    04.  /*Radiology, PC, Hosp Residents    Non-Fed;Patn Care Hosp-Based         */
     @06633    f1254205    04.  /*Radiology, PC, Hosp Residents    Non-Fed;Patn Care Hosp-Based         */
     @06637    f0981510    04.  /*Radiology, PC, Hosp FT Staff     Non-Fed;Patn Care Hosp-Based         */
     @06641    f0981508    04.  /*Radiology, PC, Hosp FT Staff     Non-Fed;Patn Care Hosp-Based         */
     @06645    f0981505    04.  /*Radiology, PC, Hosp FT Staff     Non-Fed;Patn Care Hosp-Based         */
     @06649    f1016110    04.  /*Radiology, Administration        Non-Fed;MD's By Speclty/Actvty       */
     @06653    f1016108    04.  /*Radiology, Administration        Non-Fed;MD's By Speclty/Actvty       */
     @06657    f1016105    04.  /*Radiology, Administration        Non-Fed;MD's By Speclty/Actvty       */
     @06661    f1016210    04.  /*Radiology, Teaching              Non-Fed;MD's By Speclty/Actvty       */
     @06665    f1016208    04.  /*Radiology, Teaching              Non-Fed;MD's By Speclty/Actvty       */
     @06669    f1016205    04.  /*Radiology, Teaching              Non-Fed;MD's By Speclty/Actvty       */
     @06673    f1119810    04.  /*Radiology, Research              Non-Fed;MD's By Speclty/Actvty       */
     @06677    f1119808    04.  /*Radiology, Research              Non-Fed;MD's By Speclty/Actvty       */
     @06681    f1119805    04.  /*Radiology, Research              Non-Fed;MD's By Speclty/Actvty       */
     @06685    f1016410    04.  /*Radiology, Other                 Non-Fed;MD's By Speclty/Actvty       */
     @06689    f1016408    04.  /*Radiology, Other                 Non-Fed;MD's By Speclty/Actvty       */
     @06693    f1016405    04.  /*Radiology, Other                 Non-Fed;MD's By Speclty/Actvty       */
     @06697    f0480310    05.  /*Rad Oncology, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06702    f0480308    05.  /*Rad Oncology, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06707    f0480305    05.  /*Rad Oncology, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06712    f1119910    05.  /*Rad Oncology, Total Patnt Care   Non-Fed;Patient Care                 */
     @06717    f1119908    05.  /*Rad Oncology, Total Patnt Care   Non-Fed;Patient Care                 */
     @06722    f1119905    05.  /*Rad Oncology, Total Patnt Care   Non-Fed;Patient Care                 */
     @06727    f0480510    04.  /*Rad Oncology, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06731    f0480508    04.  /*Rad Oncology, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06735    f0480505    04.  /*Rad Oncology, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06739    f1254310    04.  /*Rad Oncology, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @06743    f1254308    04.  /*Rad Oncology, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @06747    f1254305    04.  /*Rad Oncology, PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @06751    f0480710    04.  /*Rad Oncology, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @06755    f0480708    04.  /*Rad Oncology, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @06759    f0480705    04.  /*Rad Oncology, PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @06763    f1017310    04.  /*Rad Oncology, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06767    f1017308    04.  /*Rad Oncology, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06771    f1017305    04.  /*Rad Oncology, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06775    f1017410    04.  /*Rad Oncology, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06779    f1017408    04.  /*Rad Oncology, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06783    f1017405    04.  /*Rad Oncology, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @06787    f1120110    04.  /*Rad Oncology, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06791    f1120108    04.  /*Rad Oncology, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06795    f1120105    04.  /*Rad Oncology, Research           Non-Fed;MD's By Speclty/Actvty       */
     @06799    f1017610    04.  /*Rad Oncology, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06803    f1017608    04.  /*Rad Oncology, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06807    f1017605    04.  /*Rad Oncology, Other              Non-Fed;MD's By Speclty/Actvty       */
     @06811    f1365010    05.  /*Transplant Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @06816    f1365008    05.  /*Transplant Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @06821    f1365005    05.  /*Transplant Surg, Total           Non-Fed;MD's By Speclty/Actvty       */
     @06826    f1365110    05.  /*Transplant Surg, Tot Patn Care   Non-Fed;Patient Care                 */
     @06831    f1365108    05.  /*Transplant Surg, Tot Patn Care   Non-Fed;Patient Care                 */
     @06836    f1365105    05.  /*Transplant Surg, Tot Patn Care   Non-Fed;Patient Care                 */
     @06841    f1365210    04.  /*Transplant Surg, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @06845    f1365208    04.  /*Transplant Surg, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @06849    f1365205    04.  /*Transplant Surg, PC, Office Bsd  Non-Fed;Patn Care Office-Based       */
     @06853    f1365310    04.  /*Transplant Surg, PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06857    f1365308    04.  /*Transplant Surg, PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06861    f1365305    04.  /*Transplant Surg, PC,Hosp Resdnt  Non-Fed;Patn Care Hosp-Based         */
     @06865    f1365410    04.  /*Transplant Surg, PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06869    f1365408    04.  /*Transplant Surg, PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06873    f1365405    04.  /*Transplant Surg, PC,Hosp FT Stf  Non-Fed;Patn Care Hosp-Based         */
     @06877    f1365510    04.  /*Transplant Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @06881    f1365508    04.  /*Transplant Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @06885    f1365505    04.  /*Transplant Surg, Administration  Non-Fed;MD's By Speclty/Actvty       */
     @06889    f1365610    04.  /*Transplant Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @06893    f1365608    04.  /*Transplant Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @06897    f1365605    04.  /*Transplant Surg, Teaching        Non-Fed;MD's By Speclty/Actvty       */
     @06901    f1365710    04.  /*Transplant Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @06905    f1365708    04.  /*Transplant Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @06909    f1365705    04.  /*Transplant Surg, Research        Non-Fed;MD's By Speclty/Actvty       */
     @06913    f1365810    04.  /*Transplant Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @06917    f1365808    04.  /*Transplant Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @06921    f1365805    04.  /*Transplant Surg, Other           Non-Fed;MD's By Speclty/Actvty       */
     @06925    f1363510    05.  /*Vascular Med, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06930    f1363508    05.  /*Vascular Med, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06935    f1363505    05.  /*Vascular Med, Total              Non-Fed;MD's By Speclty/Actvty       */
     @06940    f1363610    05.  /*Vascular Med, Total Patn Care    Non-Fed;Patient Care                 */
     @06945    f1363608    05.  /*Vascular Med, Total Patn Care    Non-Fed;Patient Care                 */
     @06950    f1363605    05.  /*Vascular Med, Total Patn Care    Non-Fed;Patient Care                 */
     @06955    f1363710    04.  /*Vascular Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06959    f1363708    04.  /*Vascular Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06963    f1363705    04.  /*Vascular Med, PC, Office Based   Non-Fed;Patn Care Office-Based       */
     @06967    f1363810    04.  /*Vascular Med, PC, Hosp Resdnt    Non-Fed,Patn Care Hosp-Based         */
     @06971    f1363808    04.  /*Vascular Med, PC, Hosp Resdnt    Non-Fed,Patn Care Hosp-Based         */
     @06975    f1363805    04.  /*Vascular Med, PC, Hosp Resdnt    Non-Fed,Patn Care Hosp-Based         */
     @06979    f1363910    04.  /*Vascular Med, PC, Hosp FT Stf    Non-Fed;Patn Care Hosp-Based         */
     @06983    f1363908    04.  /*Vascular Med, PC, Hosp FT Stf    Non-Fed;Patn Care Hosp-Based         */
     @06987    f1363905    04.  /*Vascular Med, PC, Hosp FT Stf    Non-Fed;Patn Care Hosp-Based         */
     @06991    f1364010    04.  /*Vascular Med, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06995    f1364008    04.  /*Vascular Med, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @06999    f1364005    04.  /*Vascular Med, Administration     Non-Fed;MD's By Speclty/Actvty       */
     @07003    f1364110    04.  /*Vascular Med, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @07007    f1364108    04.  /*Vascular Med, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @07011    f1364105    04.  /*Vascular Med, Teaching           Non-Fed;MD's By Speclty/Actvty       */
     @07015    f1364210    04.  /*Vascular Med, Research           Non-Fed;MD's By Speclty/Actvty       */
     @07019    f1364208    04.  /*Vascular Med, Research           Non-Fed;MD's By Speclty/Actvty       */
     @07023    f1364205    04.  /*Vascular Med, Research           Non-Fed;MD's By Speclty/Actvty       */
     @07027    f1364310    04.  /*Vascular Med, Other              Non-Fed;MD's By Speclty/Actvty       */
     @07031    f1364308    04.  /*Vascular Med, Other              Non-Fed;MD's By Speclty/Actvty       */
     @07035    f1364305    04.  /*Vascular Med, Other              Non-Fed;MD's By Speclty/Actvty       */
     @07039    f0982110    05.  /*Other Specs, Total               Non-Fed;Specs Other Than Above       */
     @07044    f0982108    05.  /*Other Specs, Total               Non-Fed;Specs Other Than Above       */
     @07049    f0982105    05.  /*Other Specs, Total               Non-Fed;Specs Other Than Above       */
     @07054    f1120210    05.  /*Other Specs, Total Patnt Care    Non-Fed;Specs Other Than Above       */
     @07059    f1120208    05.  /*Other Specs, Total Patnt Care    Non-Fed;Specs Other Than Above       */
     @07064    f1120205    05.  /*Other Specs, Total Patnt Care    Non-Fed;Specs Other Than Above       */
     @07069    f0982310    04.  /*Other Specs, PC, Office Based    Non-Fed;Specs Other Than Above       */
     @07073    f0982308    04.  /*Other Specs, PC, Office Based    Non-Fed;Specs Other Than Above       */
     @07077    f0982305    04.  /*Other Specs, PC, Office Based    Non-Fed;Specs Other Than Above       */
     @07081    f1254410    04.  /*Other Specs, PC, Hosp Residents  Non-Fed;Specs Other Than Above       */
     @07085    f1254408    04.  /*Other Specs, PC, Hosp Residents  Non-Fed;Specs Other Than Above       */
     @07089    f1254405    04.  /*Other Specs, PC, Hosp Residents  Non-Fed;Specs Other Than Above       */
     @07093    f0982510    04.  /*Other Specs, PC, Hosp FT Staff   Non-Fed;Specs Other Than Above       */
     @07097    f0982508    04.  /*Other Specs, PC, Hosp FT Staff   Non-Fed;Specs Other Than Above       */
     @07101    f0982505    04.  /*Other Specs, PC, Hosp FT Staff   Non-Fed;Specs Other Than Above       */
     @07105    f1017910    04.  /*Other Specs, Administration      Non-Fed;Specs Other Than Above       */
     @07109    f1017908    04.  /*Other Specs, Administration      Non-Fed;Specs Other Than Above       */
     @07113    f1017905    04.  /*Other Specs, Administration      Non-Fed;Specs Other Than Above       */
     @07117    f1018010    04.  /*Other Specs, Teaching            Non-Fed;Specs Other Than Above       */
     @07121    f1018008    04.  /*Other Specs, Teaching            Non-Fed;Specs Other Than Above       */
     @07125    f1018005    04.  /*Other Specs, Teaching            Non-Fed;Specs Other Than Above       */
     @07129    f1120410    04.  /*Other Specs, Research            Non-Fed;Specs Other Than Above       */
     @07133    f1120408    04.  /*Other Specs, Research            Non-Fed;Specs Other Than Above       */
     @07137    f1120405    04.  /*Other Specs, Research            Non-Fed;Specs Other Than Above       */
     @07141    f1018210    04.  /*Other Specs, Other               Non-Fed;Specs Other Than Above       */
     @07145    f1018208    04.  /*Other Specs, Other               Non-Fed;Specs Other Than Above       */
     @07149    f1018205    04.  /*Other Specs, Other               Non-Fed;Specs Other Than Above       */
     @07153    f0481310    05.  /*Unspecified, Total               Non-Fed;MD's By Speclty/Actvty       */
     @07158    f0481308    05.  /*Unspecified, Total               Non-Fed;MD's By Speclty/Actvty       */
     @07163    f0481305    05.  /*Unspecified, Total               Non-Fed;MD's By Speclty/Actvty       */
     @07168    f1120510    05.  /*Unspecified, Total Patient Care  Non-Fed;Patient Care                 */
     @07173    f1120508    05.  /*Unspecified, Total Patient Care  Non-Fed;Patient Care                 */
     @07178    f1120505    05.  /*Unspecified, Total Patient Care  Non-Fed;Patient Care                 */
     @07183    f0481510    04.  /*Unspecified, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @07187    f0481508    04.  /*Unspecified, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @07191    f0481505    04.  /*Unspecified, PC, Office Based    Non-Fed;Patn Care Office-Based       */
     @07195    f1254510    04.  /*Unspecified, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @07199    f1254508    04.  /*Unspecified, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @07203    f1254505    04.  /*Unspecified, PC, Hosp Residents  Non-Fed;Patn Care Hosp-Based         */
     @07207    f0481710    04.  /*Unspecified, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @07211    f0481708    04.  /*Unspecified, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @07215    f0481705    04.  /*Unspecified, PC, Hosp FT Staff   Non-Fed;Patn Care Hosp-Based         */
     @07219    f1019110    04.  /*Unspecified, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @07223    f1019108    04.  /*Unspecified, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @07227    f1019105    04.  /*Unspecified, Administration      Non-Fed;MD's By Speclty/Actvty       */
     @07231    f1019210    04.  /*Unspecified, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @07235    f1019208    04.  /*Unspecified, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @07239    f1019205    04.  /*Unspecified, Teaching            Non-Fed;MD's By Speclty/Actvty       */
     @07243    f1120710    04.  /*Unspecified, Research            Non-Fed;MD's By Speclty/Actvty       */
     @07247    f1120708    04.  /*Unspecified, Research            Non-Fed;MD's By Speclty/Actvty       */
     @07251    f1120705    04.  /*Unspecified, Research            Non-Fed;MD's By Speclty/Actvty       */
     @07255    f1019410    04.  /*Unspecified, Other               Non-Fed;MD's By Speclty/Actvty       */
     @07259    f1019408    04.  /*Unspecified, Other               Non-Fed;MD's By Speclty/Actvty       */
     @07263    f1019405    04.  /*Unspecified, Other               Non-Fed;MD's By Speclty/Actvty       */
     @07267    f0481810    05.  /*MD's Inactive, Total             Non-Fed                              */
     @07272    f0481808    05.  /*MD's Inactive, Total             Non-Fed                              */
     @07277    f0481805    05.  /*MD's Inactive, Total             Non-Fed                              */
     @07282    f0481910    05.  /*MD's Not Classified, Total       Non-Fed                              */
     @07287    f0481908    05.  /*MD's Not Classified, Total       Non-Fed                              */
     @07292    f0481905    05.  /*MD's Not Classified, Total       Non-Fed                              */
     @07297    f1468110    05.  /*Phys,Tot Ptn Care,Tot Graduates  Non-Fed                              */
     @07302    f1468210    05.  /*Phys,Tot Ptn Care, US Graduates  Non-Fed                              */
     @07307    f1468310    05.  /*Phys,Tot Ptn Care,Canadian Grad  Non-Fed                              */
     @07312    f1468410    05.  /*Phys,Tot Ptn Care, IMG Grads     Non-Fed                              */
     @07317    f1468510    05.  /*MD's,Tot Ptn Care,Tot Graduates  Non-Fed                              */
     @07322    f1468610    05.  /*MD's,Tot Ptn Care, US Graduates  Non-Fed                              */
     @07327    f1468710    05.  /*MD's,Tot Ptn Care,Canadian Grad  Non-Fed                              */
     @07332    f1468810    05.  /*MD's,Tot Ptn Care, IMG Grads     Non-Fed                              */
     @07337    f1468910    05.  /*DO's,Tot Ptn Care,Tot Graduates  Non-Fed                              */
     @07342    f1469010    05.  /*DO's,Tot Ptn Care, US Graduates  Non-Fed                              */
     @07347    f1126910    03.  /*M.D.'s, Tot PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07350    f1126908    03.  /*M.D.'s, Tot PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07353    f1126905    03.  /*M.D.'s, Tot PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07356    f1127010    04.  /*M.D.'s, Total PC, Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07360    f1127008    04.  /*M.D.'s, Total PC, Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07364    f1127005    04.  /*M.D.'s, Total PC, Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07368    f1127110    04.  /*M.D.'s, Total Oth Prof Activity  Fed                                  */
     @07372    f1127108    04.  /*M.D.'s, Total Oth Prof Activity  Fed                                  */
     @07376    f1127105    04.  /*M.D.'s, Total Oth Prof Activity  Fed                                  */
     @07380    f1387810    03.  /*M.D.'s, Total, Inactive          Fed                                  */
     @07383    f1387808    03.  /*M.D.'s, Total, Inactive          Fed                                  */
     @07386    f1387805    03.  /*M.D.'s, Total, Inactive          Fed                                  */
     @07389    f1127310    02.  /*MD's,Tot Gen Prac,PC,Hosp Res    Fed;Patn Care Hosp-Based             */
     @07391    f1127308    02.  /*MD's,Tot Gen Prac,PC,Hosp Res    Fed;Patn Care Hosp-Based             */
     @07393    f1127305    02.  /*MD's,Tot Gen Prac,PC,Hosp Res    Fed;Patn Care Hosp-Based             */
     @07395    f1127410    03.  /*MD's,Tot Gen Prac,PC,Hsp FT Stf  Fed;Patn Care Hosp-Based             */
     @07398    f1127408    03.  /*MD's,Tot Gen Prac,PC,Hsp FT Stf  Fed;Patn Care Hosp-Based             */
     @07401    f1127405    03.  /*MD's,Tot Gen Prac,PC,Hsp FT Stf  Fed;Patn Care Hosp-Based             */
     @07404    f1127510    03.  /*MD's,Tot Gen Prac,Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07407    f1127508    03.  /*MD's,Tot Gen Prac,Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07410    f1127505    03.  /*MD's,Tot Gen Prac,Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07413    f1127710    02.  /*Gen Int Med, PC, Hosp Residents  Fed;Patn Care Hosp-Based             */
     @07415    f1127708    02.  /*Gen Int Med, PC, Hosp Residents  Fed;Patn Care Hosp-Based             */
     @07417    f1127705    02.  /*Gen Int Med, PC, Hosp Residents  Fed;Patn Care Hosp-Based             */
     @07419    f1127810    03.  /*Gen Int Med, PC, Hosp FT Staff   Fed;Patn Care Hosp-Based             */
     @07422    f1127808    03.  /*Gen Int Med, PC, Hosp FT Staff   Fed;Patn Care Hosp-Based             */
     @07425    f1127805    03.  /*Gen Int Med, PC, Hosp FT Staff   Fed;Patn Care Hosp-Based             */
     @07428    f1127910    03.  /*Gen Internal Med, Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07431    f1127908    03.  /*Gen Internal Med, Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07434    f1127905    03.  /*Gen Internal Med, Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07437    f1173510    02.  /*Pediatrics,Gen,PC,Hosp Resident  Fed;Patn Care Hosp-Based             */
     @07439    f1173508    02.  /*Pediatrics,Gen,PC,Hosp Resident  Fed;Patn Care Hosp-Based             */
     @07441    f1173505    02.  /*Pediatrics,Gen,PC,Hosp Resident  Fed;Patn Care Hosp-Based             */
     @07443    f1173610    03.  /*Pediatrics,Gen,PC,Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07446    f1173608    03.  /*Pediatrics,Gen,PC,Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07449    f1173605    03.  /*Pediatrics,Gen,PC,Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07452    f1173710    03.  /*Pediatrics, Gen, Oth Prof Act    Fed;MD's By Speclty/Actvty           */
     @07455    f1173708    03.  /*Pediatrics, Gen, Oth Prof Act    Fed;MD's By Speclty/Actvty           */
     @07458    f1173705    03.  /*Pediatrics, Gen, Oth Prof Act    Fed;MD's By Speclty/Actvty           */
     @07461    f1173910    02.  /*Other Med, PC, Hosp Residents    Fed;Patn Care Hosp-Based             */
     @07463    f1173908    02.  /*Other Med, PC, Hosp Residents    Fed;Patn Care Hosp-Based             */
     @07465    f1173905    02.  /*Other Med, PC, Hosp Residents    Fed;Patn Care Hosp-Based             */
     @07467    f1174010    03.  /*Other Med, PC, Hosp FT Staff     Fed;Patn Care Hosp-Based             */
     @07470    f1174008    03.  /*Other Med, PC, Hosp FT Staff     Fed;Patn Care Hosp-Based             */
     @07473    f1174005    03.  /*Other Med, PC, Hosp FT Staff     Fed;Patn Care Hosp-Based             */
     @07476    f1174110    03.  /*Other Med, Other Prof Activity   Fed;MD's By Speclty/Actvty           */
     @07479    f1174108    03.  /*Other Med, Other Prof Activity   Fed;MD's By Speclty/Actvty           */
     @07482    f1174105    03.  /*Other Med, Other Prof Activity   Fed;MD's By Speclty/Actvty           */
     @07485    f1128910    02.  /*Genrl Surg, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07487    f1128908    02.  /*Genrl Surg, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07489    f1128905    02.  /*Genrl Surg, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07491    f1129010    03.  /*Genrl Surg, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07494    f1129008    03.  /*Genrl Surg, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07497    f1129005    03.  /*Genrl Surg, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07500    f1129110    02.  /*Genrl Surg, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07502    f1129108    02.  /*Genrl Surg, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07504    f1129105    02.  /*Genrl Surg, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07506    f1174310    02.  /*Ob-Gyn, Gen, PC,Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07508    f1174308    02.  /*Ob-Gyn, Gen, PC,Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07510    f1174305    02.  /*Ob-Gyn, Gen, PC,Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07512    f1174410    03.  /*Ob-Gyn, Gen, PC, Hosp FT Staff   Fed;Patn Care Hosp-Based             */
     @07515    f1174408    03.  /*Ob-Gyn, Gen, PC, Hosp FT Staff   Fed;Patn Care Hosp-Based             */
     @07518    f1174405    03.  /*Ob-Gyn, Gen, PC, Hosp FT Staff   Fed;Patn Care Hosp-Based             */
     @07521    f1174510    02.  /*Ob-Gyn, Gen, Oth Prof Activity   Fed;MD's By Speclty/Actvty           */
     @07523    f1174508    02.  /*Ob-Gyn, Gen, Oth Prof Activity   Fed;MD's By Speclty/Actvty           */
     @07525    f1174505    02.  /*Ob-Gyn, Gen, Oth Prof Activity   Fed;MD's By Speclty/Actvty           */
     @07527    f1174710    02.  /*Ob-Gyn Subspecs,PC,Hosp Resdnt   Fed;Patn Care Hosp-Based             */
     @07529    f1174708    02.  /*Ob-Gyn Subspecs,PC,Hosp Resdnt   Fed;Patn Care Hosp-Based             */
     @07531    f1174705    02.  /*Ob-Gyn Subspecs,PC,Hosp Resdnt   Fed;Patn Care Hosp-Based             */
     @07533    f1174810    02.  /*Ob-Gyn Subspecs,PC,Hosp FT Stf   Fed;Patn Care Hosp-Based             */
     @07535    f1174808    02.  /*Ob-Gyn Subspecs,PC,Hosp FT Stf   Fed;Patn Care Hosp-Based             */
     @07537    f1174805    02.  /*Ob-Gyn Subspecs,PC,Hosp FT Stf   Fed;Patn Care Hosp-Based             */
     @07539    f1174910    02.  /*Ob-Gyn Subspecs, Oth Prof Act    Fed;MD's By Speclty/Actvty           */
     @07541    f1174908    02.  /*Ob-Gyn Subspecs, Oth Prof Act    Fed;MD's By Speclty/Actvty           */
     @07543    f1174905    02.  /*Ob-Gyn Subspecs, Oth Prof Act    Fed;MD's By Speclty/Actvty           */
     @07545    f1129710    02.  /*Other Surg, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07547    f1129708    02.  /*Other Surg, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07549    f1129705    02.  /*Other Surg, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07551    f1129810    03.  /*Other Surg, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07554    f1129808    03.  /*Other Surg, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07557    f1129805    03.  /*Other Surg, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07560    f1129910    03.  /*Other Surg, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07563    f1129908    03.  /*Other Surg, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07566    f1129905    03.  /*Other Surg, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07569    f1130110    02.  /*Psychiatry, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07571    f1130108    02.  /*Psychiatry, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07573    f1130105    02.  /*Psychiatry, PC, Hosp Residents   Fed;Patn Care Hosp-Based             */
     @07575    f1130210    03.  /*Psychiatry, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07578    f1130208    03.  /*Psychiatry, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07581    f1130205    03.  /*Psychiatry, PC, Hosp FT Staff    Fed;Patn Care Hosp-Based             */
     @07584    f1130310    03.  /*Psychiatry, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07587    f1130308    03.  /*Psychiatry, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07590    f1130305    03.  /*Psychiatry, Other Prof Activity  Fed;MD's By Speclty/Actvty           */
     @07593    f1130510    02.  /*Oth Oth Spec, PC, Hosp Resident  Fed;Patn Care Hosp-Based             */
     @07595    f1130508    02.  /*Oth Oth Spec, PC, Hosp Resident  Fed;Patn Care Hosp-Based             */
     @07597    f1130505    02.  /*Oth Oth Spec, PC, Hosp Resident  Fed;Patn Care Hosp-Based             */
     @07599    f1130610    03.  /*Oth Oth Spec, PC, Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07602    f1130608    03.  /*Oth Oth Spec, PC, Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07605    f1130605    03.  /*Oth Oth Spec, PC, Hosp FT Staff  Fed;Patn Care Hosp-Based             */
     @07608    f1130710    03.  /*Other Other Spec, Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07611    f1130708    03.  /*Other Other Spec, Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07614    f1130705    03.  /*Other Other Spec, Oth Prof Act   Fed;MD's By Speclty/Actvty           */
     @07617    f0482010    05.  /*Total M.D.'s, Male               Non-Fed;Incl.Inact & Not Class       */
     @07622    f0482008    05.  /*Total M.D.'s, Male               Non-Fed;Incl.Inact & Not Class       */
     @07627    f0482005    05.  /*Total M.D.'s, Male               Non-Fed;Incl.Inact & Not Class       */
     @07632    f0482110    05.  /*Total M.D.'s, Female             Non-Fed;Incl.Inact & Not Class       */
     @07637    f0482108    05.  /*Total M.D.'s, Female             Non-Fed;Incl.Inact & Not Class       */
     @07642    f0482105    05.  /*Total M.D.'s, Female             Non-Fed;Incl.Inact & Not Class       */
     @07647    f0490010    04.  /*MD's, Inactive, Male             Non-Fed;MD's By Gender/Speclty       */
     @07651    f0490008    04.  /*MD's, Inactive, Male             Non-Fed;MD's By Gender/Speclty       */
     @07655    f0490005    04.  /*MD's, Inactive, Male             Non-Fed;MD's By Gender/Speclty       */
     @07659    f0490110    03.  /*MD's, Inactive, Female           Non-Fed;MD's By Gender/Speclty       */
     @07662    f0490108    03.  /*MD's, Inactive, Female           Non-Fed;MD's By Gender/Speclty       */
     @07665    f0490105    03.  /*MD's, Inactive, Female           Non-Fed;MD's By Gender/Speclty       */
     @07668    f0490410    05.  /*Total M.D.'s, < 35               Non-Fed;Incl.Inact & Not Class       */
     @07673    f0490408    05.  /*Total M.D.'s, < 35               Non-Fed;Incl.Inact & Not Class       */
     @07678    f0490405    05.  /*Total M.D.'s, < 35               Non-Fed;Incl.Inact & Not Class       */
     @07683    f0490510    05.  /*Total M.D.'s, 35-44              Non-Fed;Incl.Inact & Not Class       */
     @07688    f0490508    05.  /*Total M.D.'s, 35-44              Non-Fed;Incl.Inact & Not Class       */
     @07693    f0490505    05.  /*Total M.D.'s, 35-44              Non-Fed;Incl.Inact & Not Class       */
     @07698    f0490610    05.  /*Total M.D.'s, 45-54              Non-Fed;Incl.Inact & Not Class       */
     @07703    f0490608    05.  /*Total M.D.'s, 45-54              Non-Fed;Incl.Inact & Not Class       */
     @07708    f0490605    05.  /*Total M.D.'s, 45-54              Non-Fed;Incl.Inact & Not Class       */
     @07713    f0490710    05.  /*Total M.D.'s, 55-64              Non-Fed;Incl.Inact & Not Class       */
     @07718    f0490708    05.  /*Total M.D.'s, 55-64              Non-Fed;Incl.Inact & Not Class       */
     @07723    f0490705    05.  /*Total M.D.'s, 55-64              Non-Fed;Incl.Inact & Not Class       */
     @07728    f1201610    05.  /*Total M.D.'s, 65-74              Non-Fed;Incl.Inact & Not Class       */
     @07733    f1201608    05.  /*Total M.D.'s, 65-74              Non-Fed;Incl.Inact & Not Class       */
     @07738    f1201605    05.  /*Total M.D.'s, 65-74              Non-Fed;Incl.Inact & Not Class       */
     @07743    f1201710    05.  /*Total M.D.'s, 75 +               Non-Fed;Incl.Inact & Not Class       */
     @07748    f1201708    05.  /*Total M.D.'s, 75 +               Non-Fed;Incl.Inact & Not Class       */
     @07753    f1201705    05.  /*Total M.D.'s, 75 +               Non-Fed;Incl.Inact & Not Class       */
     @07758    f0491010    04.  /*MD's, Tot General Pract, < 35    Non-Fed;MD's By Age/Specialty        */
     @07762    f0491008    04.  /*MD's, Tot General Pract, < 35    Non-Fed;MD's By Age/Specialty        */
     @07766    f0491005    04.  /*MD's, Tot General Pract, < 35    Non-Fed;MD's By Age/Specialty        */
     @07770    f0491110    04.  /*MD's, Tot General Pract, 35-44   Non-Fed;MD's By Age/Specialty        */
     @07774    f0491108    04.  /*MD's, Tot General Pract, 35-44   Non-Fed;MD's By Age/Specialty        */
     @07778    f0491105    04.  /*MD's, Tot General Pract, 35-44   Non-Fed;MD's By Age/Specialty        */
     @07782    f0491210    04.  /*MD's, Tot General Pract, 45-54   Non-Fed;MD's By Age/Specialty        */
     @07786    f0491208    04.  /*MD's, Tot General Pract, 45-54   Non-Fed;MD's By Age/Specialty        */
     @07790    f0491205    04.  /*MD's, Tot General Pract, 45-54   Non-Fed;MD's By Age/Specialty        */
     @07794    f0491310    04.  /*MD's, Tot General Pract, 55-64   Non-Fed;MD's By Age/Specialty        */
     @07798    f0491308    04.  /*MD's, Tot General Pract, 55-64   Non-Fed;MD's By Age/Specialty        */
     @07802    f0491305    04.  /*MD's, Tot General Pract, 55-64   Non-Fed;MD's By Age/Specialty        */
     @07806    f1201810    04.  /*MD's, Tot General Pract, 65-74   Non-Fed;MD's By Age/Specialty        */
     @07810    f1201808    04.  /*MD's, Tot General Pract, 65-74   Non-Fed;MD's By Age/Specialty        */
     @07814    f1201805    04.  /*MD's, Tot General Pract, 65-74   Non-Fed;MD's By Age/Specialty        */
     @07818    f1201910    04.  /*MD's, Tot General Pract, 75 +    Non-Fed;MD's By Age/Specialty        */
     @07822    f1201908    04.  /*MD's, Tot General Pract, 75 +    Non-Fed;MD's By Age/Specialty        */
     @07826    f1201905    04.  /*MD's, Tot General Pract, 75 +    Non-Fed;MD's By Age/Specialty        */
     @07830    f1074910    04.  /*MD's, General Pract, < 35        Non-Fed;MD's By Age/Specialty        */
     @07834    f1074908    04.  /*MD's, General Pract, < 35        Non-Fed;MD's By Age/Specialty        */
     @07838    f1074905    04.  /*MD's, General Pract, < 35        Non-Fed;MD's By Age/Specialty        */
     @07842    f1075010    04.  /*MD's, General Pract, 35-44       Non-Fed;MD's By Age/Specialty        */
     @07846    f1075008    04.  /*MD's, General Pract, 35-44       Non-Fed;MD's By Age/Specialty        */
     @07850    f1075005    04.  /*MD's, General Pract, 35-44       Non-Fed;MD's By Age/Specialty        */
     @07854    f1075110    04.  /*MD's, General Pract, 45-54       Non-Fed;MD's By Age/Specialty        */
     @07858    f1075108    04.  /*MD's, General Pract, 45-54       Non-Fed;MD's By Age/Specialty        */
     @07862    f1075105    04.  /*MD's, General Pract, 45-54       Non-Fed;MD's By Age/Specialty        */
     @07866    f1075210    04.  /*MD's, General Pract, 55-64       Non-Fed;MD's By Age/Specialty        */
     @07870    f1075208    04.  /*MD's, General Pract, 55-64       Non-Fed;MD's By Age/Specialty        */
     @07874    f1075205    04.  /*MD's, General Pract, 55-64       Non-Fed;MD's By Age/Specialty        */
     @07878    f1202010    04.  /*MD's, General Pract, 65-74       Non-Fed;MD's By Age/Specialty        */
     @07882    f1202008    04.  /*MD's, General Pract, 65-74       Non-Fed;MD's By Age/Specialty        */
     @07886    f1202005    04.  /*MD's, General Pract, 65-74       Non-Fed;MD's By Age/Specialty        */
     @07890    f1202110    04.  /*MD's, General Pract, 75 +        Non-Fed;MD's By Age/Specialty        */
     @07894    f1202108    04.  /*MD's, General Pract, 75 +        Non-Fed;MD's By Age/Specialty        */
     @07898    f1202105    04.  /*MD's, General Pract, 75 +        Non-Fed;MD's By Age/Specialty        */
     @07902    f1202210    04.  /*MD's, Family Med Gen, < 35       Non-Fed;MD's By Age/Specialty        */
     @07906    f1202208    04.  /*MD's, Family Med Gen, < 35       Non-Fed;MD's By Age/Specialty        */
     @07910    f1202205    04.  /*MD's, Family Med Gen, < 35       Non-Fed;MD's By Age/Specialty        */
     @07914    f1202310    04.  /*MD's, Family Med Gen, 35-44      Non-Fed;MD's By Age/Specialty        */
     @07918    f1202308    04.  /*MD's, Family Med Gen, 35-44      Non-Fed;MD's By Age/Specialty        */
     @07922    f1202305    04.  /*MD's, Family Med Gen, 35-44      Non-Fed;MD's By Age/Specialty        */
     @07926    f1202410    04.  /*MD's, Family Med Gen, 45-54      Non-Fed;MD's By Age/Specialty        */
     @07930    f1202408    04.  /*MD's, Family Med Gen, 45-54      Non-Fed;MD's By Age/Specialty        */
     @07934    f1202405    04.  /*MD's, Family Med Gen, 45-54      Non-Fed;MD's By Age/Specialty        */
     @07938    f1202510    04.  /*MD's, Family Med Gen, 55-64      Non-Fed;MD's By Age/Specialty        */
     @07942    f1202508    04.  /*MD's, Family Med Gen, 55-64      Non-Fed;MD's By Age/Specialty        */
     @07946    f1202505    04.  /*MD's, Family Med Gen, 55-64      Non-Fed;MD's By Age/Specialty        */
     @07950    f1202610    04.  /*MD's, Family Med Gen, 65-74      Non-Fed;MD's By Age/Specialty        */
     @07954    f1202608    04.  /*MD's, Family Med Gen, 65-74      Non-Fed;MD's By Age/Specialty        */
     @07958    f1202605    04.  /*MD's, Family Med Gen, 65-74      Non-Fed;MD's By Age/Specialty        */
     @07962    f1202710    04.  /*MD's, Family Med Gen, 75 +       Non-Fed;MD's By Age/Specialty        */
     @07966    f1202708    04.  /*MD's, Family Med Gen, 75 +       Non-Fed;MD's By Age/Specialty        */
     @07970    f1202705    04.  /*MD's, Family Med Gen, 75 +       Non-Fed;MD's By Age/Specialty        */
     @07974    f1202810    04.  /*MD's, Family Prac Subsp, < 35    Non-Fed;MD's By Age/Specialty        */
     @07978    f1202808    04.  /*MD's, Family Prac Subsp, < 35    Non-Fed;MD's By Age/Specialty        */
     @07982    f1202805    04.  /*MD's, Family Prac Subsp, < 35    Non-Fed;MD's By Age/Specialty        */
     @07986    f1202910    04.  /*MD's, Family Prac Subsp, 35-44   Non-Fed;MD's By Age/Specialty        */
     @07990    f1202908    04.  /*MD's, Family Prac Subsp, 35-44   Non-Fed;MD's By Age/Specialty        */
     @07994    f1202905    04.  /*MD's, Family Prac Subsp, 35-44   Non-Fed;MD's By Age/Specialty        */
     @07998    f1203010    04.  /*MD's, Family Prac Subsp, 45-54   Non-Fed;MD's By Age/Specialty        */
     @08002    f1203008    04.  /*MD's, Family Prac Subsp, 45-54   Non-Fed;MD's By Age/Specialty        */
     @08006    f1203005    04.  /*MD's, Family Prac Subsp, 45-54   Non-Fed;MD's By Age/Specialty        */
     @08010    f1203110    04.  /*MD's, Family Prac Subsp, 55-64   Non-Fed;MD's By Age/Specialty        */
     @08014    f1203108    04.  /*MD's, Family Prac Subsp, 55-64   Non-Fed;MD's By Age/Specialty        */
     @08018    f1203105    04.  /*MD's, Family Prac Subsp, 55-64   Non-Fed;MD's By Age/Specialty        */
     @08022    f1203210    04.  /*MD's, Family Prac Subsp, 65-74   Non-Fed;MD's By Age/Specialty        */
     @08026    f1203208    04.  /*MD's, Family Prac Subsp, 65-74   Non-Fed;MD's By Age/Specialty        */
     @08030    f1203205    04.  /*MD's, Family Prac Subsp, 65-74   Non-Fed;MD's By Age/Specialty        */
     @08034    f1203310    04.  /*MD's, Family Prac Subsp, 75 +    Non-Fed;MD's By Age/Specialty        */
     @08038    f1203308    04.  /*MD's, Family Prac Subsp, 75 +    Non-Fed;MD's By Age/Specialty        */
     @08042    f1203305    04.  /*MD's, Family Prac Subsp, 75 +    Non-Fed;MD's By Age/Specialty        */
     @08046    f0491610    05.  /*Medical Specs, Total, < 35       Non-Fed;MD's By Age/Specialty        */
     @08051    f0491608    05.  /*Medical Specs, Total, < 35       Non-Fed;MD's By Age/Specialty        */
     @08056    f0491605    05.  /*Medical Specs, Total, < 35       Non-Fed;MD's By Age/Specialty        */
     @08061    f0491710    05.  /*Medical Specs, Total, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08066    f0491708    05.  /*Medical Specs, Total, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08071    f0491705    05.  /*Medical Specs, Total, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08076    f0491810    05.  /*Medical Specs, Total, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08081    f0491808    05.  /*Medical Specs, Total, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08086    f0491805    05.  /*Medical Specs, Total, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08091    f0491910    05.  /*Medical Specs, Total, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08096    f0491908    05.  /*Medical Specs, Total, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08101    f0491905    05.  /*Medical Specs, Total, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08106    f1203410    05.  /*Medical Specs, Total, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08111    f1203408    05.  /*Medical Specs, Total, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08116    f1203405    05.  /*Medical Specs, Total, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08121    f1203510    05.  /*Medical Specs, Total, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08126    f1203508    05.  /*Medical Specs, Total, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08131    f1203505    05.  /*Medical Specs, Total, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08136    f1185910    04.  /*Allergy & Immunology, < 35       Non-Fed;MD's By Age/Specialty        */
     @08140    f1185908    04.  /*Allergy & Immunology, < 35       Non-Fed;MD's By Age/Specialty        */
     @08144    f1185905    04.  /*Allergy & Immunology, < 35       Non-Fed;MD's By Age/Specialty        */
     @08148    f1186010    04.  /*Allergy & Immunology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08152    f1186008    04.  /*Allergy & Immunology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08156    f1186005    04.  /*Allergy & Immunology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08160    f1186110    04.  /*Allergy & Immunology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08164    f1186108    04.  /*Allergy & Immunology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08168    f1186105    04.  /*Allergy & Immunology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08172    f1186210    04.  /*Allergy & Immunology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08176    f1186208    04.  /*Allergy & Immunology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08180    f1186205    04.  /*Allergy & Immunology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08184    f1203610    04.  /*Allergy & Immunology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08188    f1203608    04.  /*Allergy & Immunology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08192    f1203605    04.  /*Allergy & Immunology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08196    f1203710    04.  /*Allergy & Immunology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08200    f1203708    04.  /*Allergy & Immunology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08204    f1203705    04.  /*Allergy & Immunology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08208    f0492810    04.  /*Cardiovascular Diseases, < 35    Non-Fed;MD's By Age/Specialty        */
     @08212    f0492808    04.  /*Cardiovascular Diseases, < 35    Non-Fed;MD's By Age/Specialty        */
     @08216    f0492805    04.  /*Cardiovascular Diseases, < 35    Non-Fed;MD's By Age/Specialty        */
     @08220    f0492910    04.  /*Cardiovascular Diseases, 35-44   Non-Fed;MD's By Age/Specialty        */
     @08224    f0492908    04.  /*Cardiovascular Diseases, 35-44   Non-Fed;MD's By Age/Specialty        */
     @08228    f0492905    04.  /*Cardiovascular Diseases, 35-44   Non-Fed;MD's By Age/Specialty        */
     @08232    f0493010    04.  /*Cardiovascular Diseases, 45-54   Non-Fed;MD's By Age/Specialty        */
     @08236    f0493008    04.  /*Cardiovascular Diseases, 45-54   Non-Fed;MD's By Age/Specialty        */
     @08240    f0493005    04.  /*Cardiovascular Diseases, 45-54   Non-Fed;MD's By Age/Specialty        */
     @08244    f0493110    04.  /*Cardiovascular Diseases, 55-64   Non-Fed;MD's By Age/Specialty        */
     @08248    f0493108    04.  /*Cardiovascular Diseases, 55-64   Non-Fed;MD's By Age/Specialty        */
     @08252    f0493105    04.  /*Cardiovascular Diseases, 55-64   Non-Fed;MD's By Age/Specialty        */
     @08256    f1203810    04.  /*Cardiovascular Diseases, 65-74   Non-Fed;MD's By Age/Specialty        */
     @08260    f1203808    04.  /*Cardiovascular Diseases, 65-74   Non-Fed;MD's By Age/Specialty        */
     @08264    f1203805    04.  /*Cardiovascular Diseases, 65-74   Non-Fed;MD's By Age/Specialty        */
     @08268    f1203910    04.  /*Cardiovascular Diseases, 75 +    Non-Fed;MD's By Age/Specialty        */
     @08272    f1203908    04.  /*Cardiovascular Diseases, 75 +    Non-Fed;MD's By Age/Specialty        */
     @08276    f1203905    04.  /*Cardiovascular Diseases, 75 +    Non-Fed;MD's By Age/Specialty        */
     @08280    f0493410    04.  /*Dermatology, < 35                Non-Fed;MD's By Age/Specialty        */
     @08284    f0493408    04.  /*Dermatology, < 35                Non-Fed;MD's By Age/Specialty        */
     @08288    f0493405    04.  /*Dermatology, < 35                Non-Fed;MD's By Age/Specialty        */
     @08292    f0493510    04.  /*Dermatology, 35-44               Non-Fed;MD's By Age/Specialty        */
     @08296    f0493508    04.  /*Dermatology, 35-44               Non-Fed;MD's By Age/Specialty        */
     @08300    f0493505    04.  /*Dermatology, 35-44               Non-Fed;MD's By Age/Specialty        */
     @08304    f0493610    04.  /*Dermatology, 45-54               Non-Fed;MD's By Age/Specialty        */
     @08308    f0493608    04.  /*Dermatology, 45-54               Non-Fed;MD's By Age/Specialty        */
     @08312    f0493605    04.  /*Dermatology, 45-54               Non-Fed;MD's By Age/Specialty        */
     @08316    f0493710    04.  /*Dermatology, 55-64               Non-Fed;MD's By Age/Specialty        */
     @08320    f0493708    04.  /*Dermatology, 55-64               Non-Fed;MD's By Age/Specialty        */
     @08324    f0493705    04.  /*Dermatology, 55-64               Non-Fed;MD's By Age/Specialty        */
     @08328    f1204010    04.  /*Dermatology, 65-74               Non-Fed;MD's By Age/Specialty        */
     @08332    f1204008    04.  /*Dermatology, 65-74               Non-Fed;MD's By Age/Specialty        */
     @08336    f1204005    04.  /*Dermatology, 65-74               Non-Fed;MD's By Age/Specialty        */
     @08340    f1204110    04.  /*Dermatology, 75 +                Non-Fed;MD's By Age/Specialty        */
     @08344    f1204108    04.  /*Dermatology, 75 +                Non-Fed;MD's By Age/Specialty        */
     @08348    f1204105    04.  /*Dermatology, 75 +                Non-Fed;MD's By Age/Specialty        */
     @08352    f0494010    04.  /*Gastroenterology, < 35           Non-Fed;MD's By Age/Specialty        */
     @08356    f0494008    04.  /*Gastroenterology, < 35           Non-Fed;MD's By Age/Specialty        */
     @08360    f0494005    04.  /*Gastroenterology, < 35           Non-Fed;MD's By Age/Specialty        */
     @08364    f0494110    04.  /*Gastroenterology, 35-44          Non-Fed;MD's By Age/Specialty        */
     @08368    f0494108    04.  /*Gastroenterology, 35-44          Non-Fed;MD's By Age/Specialty        */
     @08372    f0494105    04.  /*Gastroenterology, 35-44          Non-Fed;MD's By Age/Specialty        */
     @08376    f0494210    04.  /*Gastroenterology, 45-54          Non-Fed;MD's By Age/Specialty        */
     @08380    f0494208    04.  /*Gastroenterology, 45-54          Non-Fed;MD's By Age/Specialty        */
     @08384    f0494205    04.  /*Gastroenterology, 45-54          Non-Fed;MD's By Age/Specialty        */
     @08388    f0494310    04.  /*Gastroenterology, 55-64          Non-Fed;MD's By Age/Specialty        */
     @08392    f0494308    04.  /*Gastroenterology, 55-64          Non-Fed;MD's By Age/Specialty        */
     @08396    f0494305    04.  /*Gastroenterology, 55-64          Non-Fed;MD's By Age/Specialty        */
     @08400    f1204210    04.  /*Gastroenterology, 65-74          Non-Fed;MD's By Age/Specialty        */
     @08404    f1204208    04.  /*Gastroenterology, 65-74          Non-Fed;MD's By Age/Specialty        */
     @08408    f1204205    04.  /*Gastroenterology, 65-74          Non-Fed;MD's By Age/Specialty        */
     @08412    f1204310    04.  /*Gastroenterology, 75 +           Non-Fed;MD's By Age/Specialty        */
     @08416    f1204308    04.  /*Gastroenterology, 75 +           Non-Fed;MD's By Age/Specialty        */
     @08420    f1204305    04.  /*Gastroenterology, 75 +           Non-Fed;MD's By Age/Specialty        */
     @08424    f1186410    04.  /*General Internal Med, < 35       Non-Fed;MD's By Age/Specialty        */
     @08428    f1186408    04.  /*General Internal Med, < 35       Non-Fed;MD's By Age/Specialty        */
     @08432    f1186405    04.  /*General Internal Med, < 35       Non-Fed;MD's By Age/Specialty        */
     @08436    f1186510    04.  /*General Internal Med, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08440    f1186508    04.  /*General Internal Med, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08444    f1186505    04.  /*General Internal Med, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08448    f1186610    04.  /*General Internal Med, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08452    f1186608    04.  /*General Internal Med, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08456    f1186605    04.  /*General Internal Med, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08460    f1186710    04.  /*General Internal Med, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08464    f1186708    04.  /*General Internal Med, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08468    f1186705    04.  /*General Internal Med, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08472    f1204410    04.  /*General Internal Med, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08476    f1204408    04.  /*General Internal Med, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08480    f1204405    04.  /*General Internal Med, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08484    f1204510    04.  /*General Internal Med, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08488    f1204508    04.  /*General Internal Med, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08492    f1204505    04.  /*General Internal Med, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08496    f1186910    04.  /*Internal Med Subspecs, < 35      Non-Fed;MD's By Age/Specialty        */
     @08500    f1186908    04.  /*Internal Med Subspecs, < 35      Non-Fed;MD's By Age/Specialty        */
     @08504    f1186905    04.  /*Internal Med Subspecs, < 35      Non-Fed;MD's By Age/Specialty        */
     @08508    f1187010    04.  /*Internal Med Subspecs, 35-44     Non-Fed;MD's By Age/Specialty        */
     @08512    f1187008    04.  /*Internal Med Subspecs, 35-44     Non-Fed;MD's By Age/Specialty        */
     @08516    f1187005    04.  /*Internal Med Subspecs, 35-44     Non-Fed;MD's By Age/Specialty        */
     @08520    f1187110    04.  /*Internal Med Subspecs, 45-54     Non-Fed;MD's By Age/Specialty        */
     @08524    f1187108    04.  /*Internal Med Subspecs, 45-54     Non-Fed;MD's By Age/Specialty        */
     @08528    f1187105    04.  /*Internal Med Subspecs, 45-54     Non-Fed;MD's By Age/Specialty        */
     @08532    f1187210    04.  /*Internal Med Subspecs, 55-64     Non-Fed;MD's By Age/Specialty        */
     @08536    f1187208    04.  /*Internal Med Subspecs, 55-64     Non-Fed;MD's By Age/Specialty        */
     @08540    f1187205    04.  /*Internal Med Subspecs, 55-64     Non-Fed;MD's By Age/Specialty        */
     @08544    f1204610    04.  /*Internal Med Subspecs, 65-74     Non-Fed;MD's By Age/Specialty        */
     @08548    f1204608    04.  /*Internal Med Subspecs, 65-74     Non-Fed;MD's By Age/Specialty        */
     @08552    f1204605    04.  /*Internal Med Subspecs, 65-74     Non-Fed;MD's By Age/Specialty        */
     @08556    f1204710    04.  /*Internal Med Subspecs, 75 +      Non-Fed;MD's By Age/Specialty        */
     @08560    f1204708    04.  /*Internal Med Subspecs, 75 +      Non-Fed;MD's By Age/Specialty        */
     @08564    f1204705    04.  /*Internal Med Subspecs, 75 +      Non-Fed;MD's By Age/Specialty        */
     @08568    f1187410    04.  /*Pediatrics, General, < 35        Non-Fed;MD's By Age/Specialty        */
     @08572    f1187408    04.  /*Pediatrics, General, < 35        Non-Fed;MD's By Age/Specialty        */
     @08576    f1187405    04.  /*Pediatrics, General, < 35        Non-Fed;MD's By Age/Specialty        */
     @08580    f1187510    04.  /*Pediatrics, General, 35-44       Non-Fed;MD's By Age/Specialty        */
     @08584    f1187508    04.  /*Pediatrics, General, 35-44       Non-Fed;MD's By Age/Specialty        */
     @08588    f1187505    04.  /*Pediatrics, General, 35-44       Non-Fed;MD's By Age/Specialty        */
     @08592    f1187610    04.  /*Pediatrics, General, 45-54       Non-Fed;MD's By Age/Specialty        */
     @08596    f1187608    04.  /*Pediatrics, General, 45-54       Non-Fed;MD's By Age/Specialty        */
     @08600    f1187605    04.  /*Pediatrics, General, 45-54       Non-Fed;MD's By Age/Specialty        */
     @08604    f1187710    04.  /*Pediatrics, General, 55-64       Non-Fed;MD's By Age/Specialty        */
     @08608    f1187708    04.  /*Pediatrics, General, 55-64       Non-Fed;MD's By Age/Specialty        */
     @08612    f1187705    04.  /*Pediatrics, General, 55-64       Non-Fed;MD's By Age/Specialty        */
     @08616    f1204810    04.  /*Pediatrics, General, 65-74       Non-Fed;MD's By Age/Specialty        */
     @08620    f1204808    04.  /*Pediatrics, General, 65-74       Non-Fed;MD's By Age/Specialty        */
     @08624    f1204805    04.  /*Pediatrics, General, 65-74       Non-Fed;MD's By Age/Specialty        */
     @08628    f1204910    04.  /*Pediatrics, General, 75 +        Non-Fed;MD's By Age/Specialty        */
     @08632    f1204908    04.  /*Pediatrics, General, 75 +        Non-Fed;MD's By Age/Specialty        */
     @08636    f1204905    04.  /*Pediatrics, General, 75 +        Non-Fed;MD's By Age/Specialty        */
     @08640    f1187910    04.  /*Pediatric Subspecs, < 35         Non-Fed;MD's By Age/Specialty        */
     @08644    f1187908    04.  /*Pediatric Subspecs, < 35         Non-Fed;MD's By Age/Specialty        */
     @08648    f1187905    04.  /*Pediatric Subspecs, < 35         Non-Fed;MD's By Age/Specialty        */
     @08652    f1188010    04.  /*Pediatric Subspecs, 35-44        Non-Fed;MD's By Age/Specialty        */
     @08656    f1188008    04.  /*Pediatric Subspecs, 35-44        Non-Fed;MD's By Age/Specialty        */
     @08660    f1188005    04.  /*Pediatric Subspecs, 35-44        Non-Fed;MD's By Age/Specialty        */
     @08664    f1188110    04.  /*Pediatric Subspecs, 45-54        Non-Fed;MD's By Age/Specialty        */
     @08668    f1188108    04.  /*Pediatric Subspecs, 45-54        Non-Fed;MD's By Age/Specialty        */
     @08672    f1188105    04.  /*Pediatric Subspecs, 45-54        Non-Fed;MD's By Age/Specialty        */
     @08676    f1188210    04.  /*Pediatric Subspecs, 55-64        Non-Fed;MD's By Age/Specialty        */
     @08680    f1188208    04.  /*Pediatric Subspecs, 55-64        Non-Fed;MD's By Age/Specialty        */
     @08684    f1188205    04.  /*Pediatric Subspecs, 55-64        Non-Fed;MD's By Age/Specialty        */
     @08688    f1205010    04.  /*Pediatric Subspecs, 65-74        Non-Fed;MD's By Age/Specialty        */
     @08692    f1205008    04.  /*Pediatric Subspecs, 65-74        Non-Fed;MD's By Age/Specialty        */
     @08696    f1205005    04.  /*Pediatric Subspecs, 65-74        Non-Fed;MD's By Age/Specialty        */
     @08700    f1205110    04.  /*Pediatric Subspecs, 75 +         Non-Fed;MD's By Age/Specialty        */
     @08704    f1205108    04.  /*Pediatric Subspecs, 75 +         Non-Fed;MD's By Age/Specialty        */
     @08708    f1205105    04.  /*Pediatric Subspecs, 75 +         Non-Fed;MD's By Age/Specialty        */
     @08712    f0496410    04.  /*Pediatric Cardiology, < 35       Non-Fed;MD's By Age/Specialty        */
     @08716    f0496408    04.  /*Pediatric Cardiology, < 35       Non-Fed;MD's By Age/Specialty        */
     @08720    f0496405    04.  /*Pediatric Cardiology, < 35       Non-Fed;MD's By Age/Specialty        */
     @08724    f0496510    04.  /*Pediatric Cardiology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08728    f0496508    04.  /*Pediatric Cardiology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08732    f0496505    04.  /*Pediatric Cardiology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @08736    f0496610    04.  /*Pediatric Cardiology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08740    f0496608    04.  /*Pediatric Cardiology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08744    f0496605    04.  /*Pediatric Cardiology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @08748    f0496710    04.  /*Pediatric Cardiology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08752    f0496708    04.  /*Pediatric Cardiology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08756    f0496705    04.  /*Pediatric Cardiology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @08760    f1205210    04.  /*Pediatric Cardiology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08764    f1205208    04.  /*Pediatric Cardiology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08768    f1205205    04.  /*Pediatric Cardiology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @08772    f1205310    04.  /*Pediatric Cardiology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08776    f1205308    04.  /*Pediatric Cardiology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08780    f1205305    04.  /*Pediatric Cardiology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @08784    f0497010    04.  /*Pulmonary Diseases, < 35         Non-Fed;MD's By Age/Specialty        */
     @08788    f0497008    04.  /*Pulmonary Diseases, < 35         Non-Fed;MD's By Age/Specialty        */
     @08792    f0497005    04.  /*Pulmonary Diseases, < 35         Non-Fed;MD's By Age/Specialty        */
     @08796    f0497110    04.  /*Pulmonary Diseases, 35-44        Non-Fed;MD's By Age/Specialty        */
     @08800    f0497108    04.  /*Pulmonary Diseases, 35-44        Non-Fed;MD's By Age/Specialty        */
     @08804    f0497105    04.  /*Pulmonary Diseases, 35-44        Non-Fed;MD's By Age/Specialty        */
     @08808    f0497210    04.  /*Pulmonary Diseases, 45-54        Non-Fed;MD's By Age/Specialty        */
     @08812    f0497208    04.  /*Pulmonary Diseases, 45-54        Non-Fed;MD's By Age/Specialty        */
     @08816    f0497205    04.  /*Pulmonary Diseases, 45-54        Non-Fed;MD's By Age/Specialty        */
     @08820    f0497310    04.  /*Pulmonary Diseases, 55-64        Non-Fed;MD's By Age/Specialty        */
     @08824    f0497308    04.  /*Pulmonary Diseases, 55-64        Non-Fed;MD's By Age/Specialty        */
     @08828    f0497305    04.  /*Pulmonary Diseases, 55-64        Non-Fed;MD's By Age/Specialty        */
     @08832    f1205410    04.  /*Pulmonary Diseases, 65-74        Non-Fed;MD's By Age/Specialty        */
     @08836    f1205408    04.  /*Pulmonary Diseases, 65-74        Non-Fed;MD's By Age/Specialty        */
     @08840    f1205405    04.  /*Pulmonary Diseases, 65-74        Non-Fed;MD's By Age/Specialty        */
     @08844    f1205510    04.  /*Pulmonary Diseases, 75 +         Non-Fed;MD's By Age/Specialty        */
     @08848    f1205508    04.  /*Pulmonary Diseases, 75 +         Non-Fed;MD's By Age/Specialty        */
     @08852    f1205505    04.  /*Pulmonary Diseases, 75 +         Non-Fed;MD's By Age/Specialty        */
     @08856    f0497610    05.  /*Surgical Specs, Total, < 35      Non-Fed;MD's By Age/Specialty        */
     @08861    f0497608    05.  /*Surgical Specs, Total, < 35      Non-Fed;MD's By Age/Specialty        */
     @08866    f0497605    05.  /*Surgical Specs, Total, < 35      Non-Fed;MD's By Age/Specialty        */
     @08871    f0497710    05.  /*Surgical Specs, Total, 35-44     Non-Fed;MD's By Age/Specialty        */
     @08876    f0497708    05.  /*Surgical Specs, Total, 35-44     Non-Fed;MD's By Age/Specialty        */
     @08881    f0497705    05.  /*Surgical Specs, Total, 35-44     Non-Fed;MD's By Age/Specialty        */
     @08886    f0497810    05.  /*Surgical Specs, Total, 45-54     Non-Fed;MD's By Age/Specialty        */
     @08891    f0497808    05.  /*Surgical Specs, Total, 45-54     Non-Fed;MD's By Age/Specialty        */
     @08896    f0497805    05.  /*Surgical Specs, Total, 45-54     Non-Fed;MD's By Age/Specialty        */
     @08901    f0497910    05.  /*Surgical Specs, Total, 55-64     Non-Fed;MD's By Age/Specialty        */
     @08906    f0497908    05.  /*Surgical Specs, Total, 55-64     Non-Fed;MD's By Age/Specialty        */
     @08911    f0497905    05.  /*Surgical Specs, Total, 55-64     Non-Fed;MD's By Age/Specialty        */
     @08916    f1205610    05.  /*Surgical Specs, Total, 65-74     Non-Fed;MD's By Age/Specialty        */
     @08921    f1205608    05.  /*Surgical Specs, Total, 65-74     Non-Fed;MD's By Age/Specialty        */
     @08926    f1205605    05.  /*Surgical Specs, Total, 65-74     Non-Fed;MD's By Age/Specialty        */
     @08931    f1205710    05.  /*Surgical Specs, Total, 75 +      Non-Fed;MD's By Age/Specialty        */
     @08936    f1205708    05.  /*Surgical Specs, Total, 75 +      Non-Fed;MD's By Age/Specialty        */
     @08941    f1205705    05.  /*Surgical Specs, Total, 75 +      Non-Fed;MD's By Age/Specialty        */
     @08946    f0498210    04.  /*General Surgery, < 35            Non-Fed;MD's By Age/Specialty        */
     @08950    f0498208    04.  /*General Surgery, < 35            Non-Fed;MD's By Age/Specialty        */
     @08954    f0498205    04.  /*General Surgery, < 35            Non-Fed;MD's By Age/Specialty        */
     @08958    f0498310    04.  /*General Surgery, 35-44           Non-Fed;MD's By Age/Specialty        */
     @08962    f0498308    04.  /*General Surgery, 35-44           Non-Fed;MD's By Age/Specialty        */
     @08966    f0498305    04.  /*General Surgery, 35-44           Non-Fed;MD's By Age/Specialty        */
     @08970    f0498410    04.  /*General Surgery, 45-54           Non-Fed;MD's By Age/Specialty        */
     @08974    f0498408    04.  /*General Surgery, 45-54           Non-Fed;MD's By Age/Specialty        */
     @08978    f0498405    04.  /*General Surgery, 45-54           Non-Fed;MD's By Age/Specialty        */
     @08982    f0498510    04.  /*General Surgery, 55-64           Non-Fed;MD's By Age/Specialty        */
     @08986    f0498508    04.  /*General Surgery, 55-64           Non-Fed;MD's By Age/Specialty        */
     @08990    f0498505    04.  /*General Surgery, 55-64           Non-Fed;MD's By Age/Specialty        */
     @08994    f1205810    04.  /*General Surgery, 65-74           Non-Fed;MD's By Age/Specialty        */
     @08998    f1205808    04.  /*General Surgery, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09002    f1205805    04.  /*General Surgery, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09006    f1205910    04.  /*General Surgery, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09010    f1205908    04.  /*General Surgery, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09014    f1205905    04.  /*General Surgery, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09018    f0498810    04.  /*Neurological Surgery, < 35       Non-Fed;MD's By Age/Specialty        */
     @09022    f0498808    04.  /*Neurological Surgery, < 35       Non-Fed;MD's By Age/Specialty        */
     @09026    f0498805    04.  /*Neurological Surgery, < 35       Non-Fed;MD's By Age/Specialty        */
     @09030    f0498910    04.  /*Neurological Surgery, 35-44      Non-Fed;MD's By Age/Specialty        */
     @09034    f0498908    04.  /*Neurological Surgery, 35-44      Non-Fed;MD's By Age/Specialty        */
     @09038    f0498905    04.  /*Neurological Surgery, 35-44      Non-Fed;MD's By Age/Specialty        */
     @09042    f0499010    04.  /*Neurological Surgery, 45-54      Non-Fed;MD's By Age/Specialty        */
     @09046    f0499008    04.  /*Neurological Surgery, 45-54      Non-Fed;MD's By Age/Specialty        */
     @09050    f0499005    04.  /*Neurological Surgery, 45-54      Non-Fed;MD's By Age/Specialty        */
     @09054    f0499110    04.  /*Neurological Surgery, 55-64      Non-Fed;MD's By Age/Specialty        */
     @09058    f0499108    04.  /*Neurological Surgery, 55-64      Non-Fed;MD's By Age/Specialty        */
     @09062    f0499105    04.  /*Neurological Surgery, 55-64      Non-Fed;MD's By Age/Specialty        */
     @09066    f1206010    04.  /*Neurological Surgery, 65-74      Non-Fed;MD's By Age/Specialty        */
     @09070    f1206008    04.  /*Neurological Surgery, 65-74      Non-Fed;MD's By Age/Specialty        */
     @09074    f1206005    04.  /*Neurological Surgery, 65-74      Non-Fed;MD's By Age/Specialty        */
     @09078    f1206110    04.  /*Neurological Surgery, 75 +       Non-Fed;MD's By Age/Specialty        */
     @09082    f1206108    04.  /*Neurological Surgery, 75 +       Non-Fed;MD's By Age/Specialty        */
     @09086    f1206105    04.  /*Neurological Surgery, 75 +       Non-Fed;MD's By Age/Specialty        */
     @09090    f1188410    04.  /*Ob-Gyn, General, < 35            Non-Fed;MD's By Age/Specialty        */
     @09094    f1188408    04.  /*Ob-Gyn, General, < 35            Non-Fed;MD's By Age/Specialty        */
     @09098    f1188405    04.  /*Ob-Gyn, General, < 35            Non-Fed;MD's By Age/Specialty        */
     @09102    f1188510    04.  /*Ob-Gyn, General, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09106    f1188508    04.  /*Ob-Gyn, General, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09110    f1188505    04.  /*Ob-Gyn, General, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09114    f1188610    04.  /*Ob-Gyn, General, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09118    f1188608    04.  /*Ob-Gyn, General, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09122    f1188605    04.  /*Ob-Gyn, General, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09126    f1188710    04.  /*Ob-Gyn, General, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09130    f1188708    04.  /*Ob-Gyn, General, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09134    f1188705    04.  /*Ob-Gyn, General, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09138    f1206210    04.  /*Ob-Gyn, General, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09142    f1206208    04.  /*Ob-Gyn, General, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09146    f1206205    04.  /*Ob-Gyn, General, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09150    f1206310    04.  /*Ob-Gyn, General, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09154    f1206308    04.  /*Ob-Gyn, General, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09158    f1206305    04.  /*Ob-Gyn, General, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09162    f1188910    04.  /*Ob-Gyn Subspecs, < 35            Non-Fed;MD's By Age/Specialty        */
     @09166    f1188908    04.  /*Ob-Gyn Subspecs, < 35            Non-Fed;MD's By Age/Specialty        */
     @09170    f1188905    04.  /*Ob-Gyn Subspecs, < 35            Non-Fed;MD's By Age/Specialty        */
     @09174    f1189010    04.  /*Ob-Gyn Subspecs, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09178    f1189008    04.  /*Ob-Gyn Subspecs, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09182    f1189005    04.  /*Ob-Gyn Subspecs, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09186    f1189110    04.  /*Ob-Gyn Subspecs, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09190    f1189108    04.  /*Ob-Gyn Subspecs, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09194    f1189105    04.  /*Ob-Gyn Subspecs, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09198    f1189210    04.  /*Ob-Gyn Subspecs, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09202    f1189208    04.  /*Ob-Gyn Subspecs, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09206    f1189205    04.  /*Ob-Gyn Subspecs, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09210    f1206410    04.  /*Ob-Gyn Subspecs, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09214    f1206408    04.  /*Ob-Gyn Subspecs, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09218    f1206405    04.  /*Ob-Gyn Subspecs, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09222    f1206510    04.  /*Ob-Gyn Subspecs, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09226    f1206508    04.  /*Ob-Gyn Subspecs, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09230    f1206505    04.  /*Ob-Gyn Subspecs, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09234    f0500010    04.  /*Ophthalmology, < 35              Non-Fed;MD's By Age/Specialty        */
     @09238    f0500008    04.  /*Ophthalmology, < 35              Non-Fed;MD's By Age/Specialty        */
     @09242    f0500005    04.  /*Ophthalmology, < 35              Non-Fed;MD's By Age/Specialty        */
     @09246    f0500110    04.  /*Ophthalmology, 35-44             Non-Fed;MD's By Age/Specialty        */
     @09250    f0500108    04.  /*Ophthalmology, 35-44             Non-Fed;MD's By Age/Specialty        */
     @09254    f0500105    04.  /*Ophthalmology, 35-44             Non-Fed;MD's By Age/Specialty        */
     @09258    f0500210    04.  /*Ophthalmology, 45-54             Non-Fed;MD's By Age/Specialty        */
     @09262    f0500208    04.  /*Ophthalmology, 45-54             Non-Fed;MD's By Age/Specialty        */
     @09266    f0500205    04.  /*Ophthalmology, 45-54             Non-Fed;MD's By Age/Specialty        */
     @09270    f0500310    04.  /*Ophthalmology, 55-64             Non-Fed;MD's By Age/Specialty        */
     @09274    f0500308    04.  /*Ophthalmology, 55-64             Non-Fed;MD's By Age/Specialty        */
     @09278    f0500305    04.  /*Ophthalmology, 55-64             Non-Fed;MD's By Age/Specialty        */
     @09282    f1206610    04.  /*Ophthalmology, 65-74             Non-Fed;MD's By Age/Specialty        */
     @09286    f1206608    04.  /*Ophthalmology, 65-74             Non-Fed;MD's By Age/Specialty        */
     @09290    f1206605    04.  /*Ophthalmology, 65-74             Non-Fed;MD's By Age/Specialty        */
     @09294    f1206710    04.  /*Ophthalmology, 75 +              Non-Fed;MD's By Age/Specialty        */
     @09298    f1206708    04.  /*Ophthalmology, 75 +              Non-Fed;MD's By Age/Specialty        */
     @09302    f1206705    04.  /*Ophthalmology, 75 +              Non-Fed;MD's By Age/Specialty        */
     @09306    f0500610    04.  /*Orthopedic Surgery, < 35         Non-Fed;MD's By Age/Specialty        */
     @09310    f0500608    04.  /*Orthopedic Surgery, < 35         Non-Fed;MD's By Age/Specialty        */
     @09314    f0500605    04.  /*Orthopedic Surgery, < 35         Non-Fed;MD's By Age/Specialty        */
     @09318    f0500710    04.  /*Orthopedic Surgery, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09322    f0500708    04.  /*Orthopedic Surgery, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09326    f0500705    04.  /*Orthopedic Surgery, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09330    f0500810    04.  /*Orthopedic Surgery, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09334    f0500808    04.  /*Orthopedic Surgery, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09338    f0500805    04.  /*Orthopedic Surgery, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09342    f0500910    04.  /*Orthopedic Surgery, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09346    f0500908    04.  /*Orthopedic Surgery, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09350    f0500905    04.  /*Orthopedic Surgery, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09354    f1206810    04.  /*Orthopedic Surgery, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09358    f1206808    04.  /*Orthopedic Surgery, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09362    f1206805    04.  /*Orthopedic Surgery, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09366    f1206910    04.  /*Orthopedic Surgery, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09370    f1206908    04.  /*Orthopedic Surgery, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09374    f1206905    04.  /*Orthopedic Surgery, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09378    f0501210    04.  /*Otolaryngology, < 35             Non-Fed;MD's By Age/Specialty        */
     @09382    f0501208    04.  /*Otolaryngology, < 35             Non-Fed;MD's By Age/Specialty        */
     @09386    f0501205    04.  /*Otolaryngology, < 35             Non-Fed;MD's By Age/Specialty        */
     @09390    f0501310    04.  /*Otolaryngology, 35-44            Non-Fed;MD's By Age/Specialty        */
     @09394    f0501308    04.  /*Otolaryngology, 35-44            Non-Fed;MD's By Age/Specialty        */
     @09398    f0501305    04.  /*Otolaryngology, 35-44            Non-Fed;MD's By Age/Specialty        */
     @09402    f0501410    04.  /*Otolaryngology, 45-54            Non-Fed;MD's By Age/Specialty        */
     @09406    f0501408    04.  /*Otolaryngology, 45-54            Non-Fed;MD's By Age/Specialty        */
     @09410    f0501405    04.  /*Otolaryngology, 45-54            Non-Fed;MD's By Age/Specialty        */
     @09414    f0501510    04.  /*Otolaryngology, 55-64            Non-Fed;MD's By Age/Specialty        */
     @09418    f0501508    04.  /*Otolaryngology, 55-64            Non-Fed;MD's By Age/Specialty        */
     @09422    f0501505    04.  /*Otolaryngology, 55-64            Non-Fed;MD's By Age/Specialty        */
     @09426    f1207010    04.  /*Otolaryngology, 65-74            Non-Fed;MD's By Age/Specialty        */
     @09430    f1207008    04.  /*Otolaryngology, 65-74            Non-Fed;MD's By Age/Specialty        */
     @09434    f1207005    04.  /*Otolaryngology, 65-74            Non-Fed;MD's By Age/Specialty        */
     @09438    f1207110    04.  /*Otolaryngology, 75 +             Non-Fed;MD's By Age/Specialty        */
     @09442    f1207108    04.  /*Otolaryngology, 75 +             Non-Fed;MD's By Age/Specialty        */
     @09446    f1207105    04.  /*Otolaryngology, 75 +             Non-Fed;MD's By Age/Specialty        */
     @09450    f0501810    04.  /*Plastic Surgery, < 35            Non-Fed;MD's By Age/Specialty        */
     @09454    f0501808    04.  /*Plastic Surgery, < 35            Non-Fed;MD's By Age/Specialty        */
     @09458    f0501805    04.  /*Plastic Surgery, < 35            Non-Fed;MD's By Age/Specialty        */
     @09462    f0501910    04.  /*Plastic Surgery, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09466    f0501908    04.  /*Plastic Surgery, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09470    f0501905    04.  /*Plastic Surgery, 35-44           Non-Fed;MD's By Age/Specialty        */
     @09474    f0502010    04.  /*Plastic Surgery, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09478    f0502008    04.  /*Plastic Surgery, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09482    f0502005    04.  /*Plastic Surgery, 45-54           Non-Fed;MD's By Age/Specialty        */
     @09486    f0502110    04.  /*Plastic Surgery, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09490    f0502108    04.  /*Plastic Surgery, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09494    f0502105    04.  /*Plastic Surgery, 55-64           Non-Fed;MD's By Age/Specialty        */
     @09498    f1207210    04.  /*Plastic Surgery, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09502    f1207208    04.  /*Plastic Surgery, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09506    f1207205    04.  /*Plastic Surgery, 65-74           Non-Fed;MD's By Age/Specialty        */
     @09510    f1207310    04.  /*Plastic Surgery, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09514    f1207308    04.  /*Plastic Surgery, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09518    f1207305    04.  /*Plastic Surgery, 75 +            Non-Fed;MD's By Age/Specialty        */
     @09522    f0502410    04.  /*Colon & Rectal Surgery, < 35     Non-Fed;MD's By Age/Specialty        */
     @09526    f0502408    04.  /*Colon & Rectal Surgery, < 35     Non-Fed;MD's By Age/Specialty        */
     @09530    f0502405    04.  /*Colon & Rectal Surgery, < 35     Non-Fed;MD's By Age/Specialty        */
     @09534    f0502510    04.  /*Colon & Rectal Surgery, 35-44    Non-Fed;MD's By Age/Specialty        */
     @09538    f0502508    04.  /*Colon & Rectal Surgery, 35-44    Non-Fed;MD's By Age/Specialty        */
     @09542    f0502505    04.  /*Colon & Rectal Surgery, 35-44    Non-Fed;MD's By Age/Specialty        */
     @09546    f0502610    04.  /*Colon & Rectal Surgery, 45-54    Non-Fed;MD's By Age/Specialty        */
     @09550    f0502608    04.  /*Colon & Rectal Surgery, 45-54    Non-Fed;MD's By Age/Specialty        */
     @09554    f0502605    04.  /*Colon & Rectal Surgery, 45-54    Non-Fed;MD's By Age/Specialty        */
     @09558    f0502710    04.  /*Colon & Rectal Surgery, 55-64    Non-Fed;MD's By Age/Specialty        */
     @09562    f0502708    04.  /*Colon & Rectal Surgery, 55-64    Non-Fed;MD's By Age/Specialty        */
     @09566    f0502705    04.  /*Colon & Rectal Surgery, 55-64    Non-Fed;MD's By Age/Specialty        */
     @09570    f1207410    04.  /*Colon & Rectal Surgery, 65-74    Non-Fed;MD's By Age/Specialty        */
     @09574    f1207408    04.  /*Colon & Rectal Surgery, 65-74    Non-Fed;MD's By Age/Specialty        */
     @09578    f1207405    04.  /*Colon & Rectal Surgery, 65-74    Non-Fed;MD's By Age/Specialty        */
     @09582    f1207510    04.  /*Colon & Rectal Surgery, 75 +     Non-Fed;MD's By Age/Specialty        */
     @09586    f1207508    04.  /*Colon & Rectal Surgery, 75 +     Non-Fed;MD's By Age/Specialty        */
     @09590    f1207505    04.  /*Colon & Rectal Surgery, 75 +     Non-Fed;MD's By Age/Specialty        */
     @09594    f0503010    04.  /*Thoracic Surgery, < 35           Non-Fed;MD's By Age/Specialty        */
     @09598    f0503008    04.  /*Thoracic Surgery, < 35           Non-Fed;MD's By Age/Specialty        */
     @09602    f0503005    04.  /*Thoracic Surgery, < 35           Non-Fed;MD's By Age/Specialty        */
     @09606    f0503110    04.  /*Thoracic Surgery, 35-44          Non-Fed;MD's By Age/Specialty        */
     @09610    f0503108    04.  /*Thoracic Surgery, 35-44          Non-Fed;MD's By Age/Specialty        */
     @09614    f0503105    04.  /*Thoracic Surgery, 35-44          Non-Fed;MD's By Age/Specialty        */
     @09618    f0503210    04.  /*Thoracic Surgery, 45-54          Non-Fed;MD's By Age/Specialty        */
     @09622    f0503208    04.  /*Thoracic Surgery, 45-54          Non-Fed;MD's By Age/Specialty        */
     @09626    f0503205    04.  /*Thoracic Surgery, 45-54          Non-Fed;MD's By Age/Specialty        */
     @09630    f0503310    04.  /*Thoracic Surgery, 55-64          Non-Fed;MD's By Age/Specialty        */
     @09634    f0503308    04.  /*Thoracic Surgery, 55-64          Non-Fed;MD's By Age/Specialty        */
     @09638    f0503305    04.  /*Thoracic Surgery, 55-64          Non-Fed;MD's By Age/Specialty        */
     @09642    f1207610    04.  /*Thoracic Surgery, 65-74          Non-Fed;MD's By Age/Specialty        */
     @09646    f1207608    04.  /*Thoracic Surgery, 65-74          Non-Fed;MD's By Age/Specialty        */
     @09650    f1207605    04.  /*Thoracic Surgery, 65-74          Non-Fed;MD's By Age/Specialty        */
     @09654    f1207710    04.  /*Thoracic Surgery, 75 +           Non-Fed;MD's By Age/Specialty        */
     @09658    f1207708    04.  /*Thoracic Surgery, 75 +           Non-Fed;MD's By Age/Specialty        */
     @09662    f1207705    04.  /*Thoracic Surgery, 75 +           Non-Fed;MD's By Age/Specialty        */
     @09666    f0503610    04.  /*Urology, < 35                    Non-Fed;MD's By Age/Specialty        */
     @09670    f0503608    04.  /*Urology, < 35                    Non-Fed;MD's By Age/Specialty        */
     @09674    f0503605    04.  /*Urology, < 35                    Non-Fed;MD's By Age/Specialty        */
     @09678    f0503710    04.  /*Urology, 35-44                   Non-Fed;MD's By Age/Specialty        */
     @09682    f0503708    04.  /*Urology, 35-44                   Non-Fed;MD's By Age/Specialty        */
     @09686    f0503705    04.  /*Urology, 35-44                   Non-Fed;MD's By Age/Specialty        */
     @09690    f0503810    04.  /*Urology, 45-54                   Non-Fed;MD's By Age/Specialty        */
     @09694    f0503808    04.  /*Urology, 45-54                   Non-Fed;MD's By Age/Specialty        */
     @09698    f0503805    04.  /*Urology, 45-54                   Non-Fed;MD's By Age/Specialty        */
     @09702    f0503910    04.  /*Urology, 55-64                   Non-Fed;MD's By Age/Specialty        */
     @09706    f0503908    04.  /*Urology, 55-64                   Non-Fed;MD's By Age/Specialty        */
     @09710    f0503905    04.  /*Urology, 55-64                   Non-Fed;MD's By Age/Specialty        */
     @09714    f1207810    04.  /*Urology, 65-74                   Non-Fed;MD's By Age/Specialty        */
     @09718    f1207808    04.  /*Urology, 65-74                   Non-Fed;MD's By Age/Specialty        */
     @09722    f1207805    04.  /*Urology, 65-74                   Non-Fed;MD's By Age/Specialty        */
     @09726    f1207910    04.  /*Urology, 75 +                    Non-Fed;MD's By Age/Specialty        */
     @09730    f1207908    04.  /*Urology, 75 +                    Non-Fed;MD's By Age/Specialty        */
     @09734    f1207905    04.  /*Urology, 75 +                    Non-Fed;MD's By Age/Specialty        */
     @09738    f0504210    05.  /*Other Specs, Total, < 35         Non-Fed;MD's By Age/Specialty        */
     @09743    f0504208    05.  /*Other Specs, Total, < 35         Non-Fed;MD's By Age/Specialty        */
     @09748    f0504205    05.  /*Other Specs, Total, < 35         Non-Fed;MD's By Age/Specialty        */
     @09753    f0504310    05.  /*Other Specs, Total, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09758    f0504308    05.  /*Other Specs, Total, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09763    f0504305    05.  /*Other Specs, Total, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09768    f0504410    05.  /*Other Specs, Total, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09773    f0504408    05.  /*Other Specs, Total, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09778    f0504405    05.  /*Other Specs, Total, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09783    f0504510    05.  /*Other Specs, Total, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09788    f0504508    05.  /*Other Specs, Total, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09793    f0504505    05.  /*Other Specs, Total, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09798    f1208010    05.  /*Other Specs, Total, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09803    f1208008    05.  /*Other Specs, Total, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09808    f1208005    05.  /*Other Specs, Total, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09813    f1208110    05.  /*Other Specs, Total, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09818    f1208108    05.  /*Other Specs, Total, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09823    f1208105    05.  /*Other Specs, Total, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09828    f0504810    04.  /*Aerospace Medicine, < 35         Non-Fed;MD's By Age/Specialty        */
     @09832    f0504808    04.  /*Aerospace Medicine, < 35         Non-Fed;MD's By Age/Specialty        */
     @09836    f0504805    04.  /*Aerospace Medicine, < 35         Non-Fed;MD's By Age/Specialty        */
     @09840    f0504910    04.  /*Aerospace Medicine, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09844    f0504908    04.  /*Aerospace Medicine, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09848    f0504905    04.  /*Aerospace Medicine, 35-44        Non-Fed;MD's By Age/Specialty        */
     @09852    f0505010    04.  /*Aerospace Medicine, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09856    f0505008    04.  /*Aerospace Medicine, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09860    f0505005    04.  /*Aerospace Medicine, 45-54        Non-Fed;MD's By Age/Specialty        */
     @09864    f0505110    04.  /*Aerospace Medicine, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09868    f0505108    04.  /*Aerospace Medicine, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09872    f0505105    04.  /*Aerospace Medicine, 55-64        Non-Fed;MD's By Age/Specialty        */
     @09876    f1208210    04.  /*Aerospace Medicine, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09880    f1208208    04.  /*Aerospace Medicine, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09884    f1208205    04.  /*Aerospace Medicine, 65-74        Non-Fed;MD's By Age/Specialty        */
     @09888    f1208310    04.  /*Aerospace Medicine, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09892    f1208308    04.  /*Aerospace Medicine, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09896    f1208305    04.  /*Aerospace Medicine, 75 +         Non-Fed;MD's By Age/Specialty        */
     @09900    f0505410    04.  /*Anesthesiology, < 35             Non-Fed;MD's By Age/Specialty        */
     @09904    f0505408    04.  /*Anesthesiology, < 35             Non-Fed;MD's By Age/Specialty        */
     @09908    f0505405    04.  /*Anesthesiology, < 35             Non-Fed;MD's By Age/Specialty        */
     @09912    f0505510    04.  /*Anesthesiology, 35-44            Non-Fed;MD's By Age/Specialty        */
     @09916    f0505508    04.  /*Anesthesiology, 35-44            Non-Fed;MD's By Age/Specialty        */
     @09920    f0505505    04.  /*Anesthesiology, 35-44            Non-Fed;MD's By Age/Specialty        */
     @09924    f0505610    04.  /*Anesthesiology, 45-54            Non-Fed;MD's By Age/Specialty        */
     @09928    f0505608    04.  /*Anesthesiology, 45-54            Non-Fed;MD's By Age/Specialty        */
     @09932    f0505605    04.  /*Anesthesiology, 45-54            Non-Fed;MD's By Age/Specialty        */
     @09936    f0505710    04.  /*Anesthesiology, 55-64            Non-Fed;MD's By Age/Specialty        */
     @09940    f0505708    04.  /*Anesthesiology, 55-64            Non-Fed;MD's By Age/Specialty        */
     @09944    f0505705    04.  /*Anesthesiology, 55-64            Non-Fed;MD's By Age/Specialty        */
     @09948    f1208410    04.  /*Anesthesiology, 65-74            Non-Fed;MD's By Age/Specialty        */
     @09952    f1208408    04.  /*Anesthesiology, 65-74            Non-Fed;MD's By Age/Specialty        */
     @09956    f1208405    04.  /*Anesthesiology, 65-74            Non-Fed;MD's By Age/Specialty        */
     @09960    f1208510    04.  /*Anesthesiology, 75 +             Non-Fed;MD's By Age/Specialty        */
     @09964    f1208508    04.  /*Anesthesiology, 75 +             Non-Fed;MD's By Age/Specialty        */
     @09968    f1208505    04.  /*Anesthesiology, 75 +             Non-Fed;MD's By Age/Specialty        */
     @09972    f0506010    04.  /*Child Psychiatry, < 35           Non-Fed;MD's By Age/Specialty        */
     @09976    f0506008    04.  /*Child Psychiatry, < 35           Non-Fed;MD's By Age/Specialty        */
     @09980    f0506005    04.  /*Child Psychiatry, < 35           Non-Fed;MD's By Age/Specialty        */
     @09984    f0506110    04.  /*Child Psychiatry, 35-44          Non-Fed;MD's By Age/Specialty        */
     @09988    f0506108    04.  /*Child Psychiatry, 35-44          Non-Fed;MD's By Age/Specialty        */
     @09992    f0506105    04.  /*Child Psychiatry, 35-44          Non-Fed;MD's By Age/Specialty        */
     @09996    f0506210    04.  /*Child Psychiatry, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10000    f0506208    04.  /*Child Psychiatry, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10004    f0506205    04.  /*Child Psychiatry, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10008    f0506310    04.  /*Child Psychiatry, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10012    f0506308    04.  /*Child Psychiatry, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10016    f0506305    04.  /*Child Psychiatry, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10020    f1208610    04.  /*Child Psychiatry, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10024    f1208608    04.  /*Child Psychiatry, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10028    f1208605    04.  /*Child Psychiatry, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10032    f1208710    04.  /*Child Psychiatry, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10036    f1208708    04.  /*Child Psychiatry, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10040    f1208705    04.  /*Child Psychiatry, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10044    f0506610    04.  /*Diagnostic Radiology, < 35       Non-Fed;MD's By Age/Specialty        */
     @10048    f0506608    04.  /*Diagnostic Radiology, < 35       Non-Fed;MD's By Age/Specialty        */
     @10052    f0506605    04.  /*Diagnostic Radiology, < 35       Non-Fed;MD's By Age/Specialty        */
     @10056    f0506710    04.  /*Diagnostic Radiology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @10060    f0506708    04.  /*Diagnostic Radiology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @10064    f0506705    04.  /*Diagnostic Radiology, 35-44      Non-Fed;MD's By Age/Specialty        */
     @10068    f0506810    04.  /*Diagnostic Radiology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @10072    f0506808    04.  /*Diagnostic Radiology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @10076    f0506805    04.  /*Diagnostic Radiology, 45-54      Non-Fed;MD's By Age/Specialty        */
     @10080    f0506910    04.  /*Diagnostic Radiology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @10084    f0506908    04.  /*Diagnostic Radiology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @10088    f0506905    04.  /*Diagnostic Radiology, 55-64      Non-Fed;MD's By Age/Specialty        */
     @10092    f1208810    04.  /*Diagnostic Radiology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @10096    f1208808    04.  /*Diagnostic Radiology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @10100    f1208805    04.  /*Diagnostic Radiology, 65-74      Non-Fed;MD's By Age/Specialty        */
     @10104    f1208910    04.  /*Diagnostic Radiology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @10108    f1208908    04.  /*Diagnostic Radiology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @10112    f1208905    04.  /*Diagnostic Radiology, 75 +       Non-Fed;MD's By Age/Specialty        */
     @10116    f1075910    04.  /*Emergency Medicine, < 35         Non-Fed;MD's By Age/Specialty        */
     @10120    f1075908    04.  /*Emergency Medicine, < 35         Non-Fed;MD's By Age/Specialty        */
     @10124    f1075905    04.  /*Emergency Medicine, < 35         Non-Fed;MD's By Age/Specialty        */
     @10128    f1076010    04.  /*Emergency Medicine, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10132    f1076008    04.  /*Emergency Medicine, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10136    f1076005    04.  /*Emergency Medicine, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10140    f1076110    04.  /*Emergency Medicine, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10144    f1076108    04.  /*Emergency Medicine, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10148    f1076105    04.  /*Emergency Medicine, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10152    f1076210    04.  /*Emergency Medicine, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10156    f1076208    04.  /*Emergency Medicine, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10160    f1076205    04.  /*Emergency Medicine, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10164    f1209010    04.  /*Emergency Medicine, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10168    f1209008    04.  /*Emergency Medicine, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10172    f1209005    04.  /*Emergency Medicine, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10176    f1209110    04.  /*Emergency Medicine, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10180    f1209108    04.  /*Emergency Medicine, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10184    f1209105    04.  /*Emergency Medicine, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10188    f0507210    04.  /*Forensic Pathology, < 35         Non-Fed;MD's By Age/Specialty        */
     @10192    f0507208    04.  /*Forensic Pathology, < 35         Non-Fed;MD's By Age/Specialty        */
     @10196    f0507205    04.  /*Forensic Pathology, < 35         Non-Fed;MD's By Age/Specialty        */
     @10200    f0507310    04.  /*Forensic Pathology, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10204    f0507308    04.  /*Forensic Pathology, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10208    f0507305    04.  /*Forensic Pathology, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10212    f0507410    04.  /*Forensic Pathology, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10216    f0507408    04.  /*Forensic Pathology, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10220    f0507405    04.  /*Forensic Pathology, 45-54        Non-Fed;MD's By Age/Specialty        */
     @10224    f0507510    04.  /*Forensic Pathology, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10228    f0507508    04.  /*Forensic Pathology, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10232    f0507505    04.  /*Forensic Pathology, 55-64        Non-Fed;MD's By Age/Specialty        */
     @10236    f1209210    04.  /*Forensic Pathology, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10240    f1209208    04.  /*Forensic Pathology, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10244    f1209205    04.  /*Forensic Pathology, 65-74        Non-Fed;MD's By Age/Specialty        */
     @10248    f1209310    04.  /*Forensic Pathology, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10252    f1209308    04.  /*Forensic Pathology, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10256    f1209305    04.  /*Forensic Pathology, 75 +         Non-Fed;MD's By Age/Specialty        */
     @10260    f1242610    04.  /*Medical Genetics, < 35           Non-Fed;MD's By Age/Specialty        */
     @10264    f1242608    04.  /*Medical Genetics, < 35           Non-Fed;MD's By Age/Specialty        */
     @10268    f1242605    04.  /*Medical Genetics, < 35           Non-Fed;MD's By Age/Specialty        */
     @10272    f1242710    04.  /*Medical Genetics, 35-44          Non-Fed;MD's By Age/Specialty        */
     @10276    f1242708    04.  /*Medical Genetics, 35-44          Non-Fed;MD's By Age/Specialty        */
     @10280    f1242705    04.  /*Medical Genetics, 35-44          Non-Fed;MD's By Age/Specialty        */
     @10284    f1242810    04.  /*Medical Genetics, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10288    f1242808    04.  /*Medical Genetics, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10292    f1242805    04.  /*Medical Genetics, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10296    f1242910    04.  /*Medical Genetics, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10300    f1242908    04.  /*Medical Genetics, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10304    f1242905    04.  /*Medical Genetics, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10308    f1243010    04.  /*Medical Genetics, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10312    f1243008    04.  /*Medical Genetics, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10316    f1243005    04.  /*Medical Genetics, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10320    f1243110    04.  /*Medical Genetics, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10324    f1243108    04.  /*Medical Genetics, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10328    f1243105    04.  /*Medical Genetics, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10332    f0507810    04.  /*Neurology, < 35                  Non-Fed;MD's By Age/Specialty        */
     @10336    f0507808    04.  /*Neurology, < 35                  Non-Fed;MD's By Age/Specialty        */
     @10340    f0507805    04.  /*Neurology, < 35                  Non-Fed;MD's By Age/Specialty        */
     @10344    f0507910    04.  /*Neurology, 35-44                 Non-Fed;MD's By Age/Specialty        */
     @10348    f0507908    04.  /*Neurology, 35-44                 Non-Fed;MD's By Age/Specialty        */
     @10352    f0507905    04.  /*Neurology, 35-44                 Non-Fed;MD's By Age/Specialty        */
     @10356    f0508010    04.  /*Neurology, 45-54                 Non-Fed;MD's By Age/Specialty        */
     @10360    f0508008    04.  /*Neurology, 45-54                 Non-Fed;MD's By Age/Specialty        */
     @10364    f0508005    04.  /*Neurology, 45-54                 Non-Fed;MD's By Age/Specialty        */
     @10368    f0508110    04.  /*Neurology, 55-64                 Non-Fed;MD's By Age/Specialty        */
     @10372    f0508108    04.  /*Neurology, 55-64                 Non-Fed;MD's By Age/Specialty        */
     @10376    f0508105    04.  /*Neurology, 55-64                 Non-Fed;MD's By Age/Specialty        */
     @10380    f1209410    04.  /*Neurology, 65-74                 Non-Fed;MD's By Age/Specialty        */
     @10384    f1209408    04.  /*Neurology, 65-74                 Non-Fed;MD's By Age/Specialty        */
     @10388    f1209405    04.  /*Neurology, 65-74                 Non-Fed;MD's By Age/Specialty        */
     @10392    f1209510    04.  /*Neurology, 75 +                  Non-Fed;MD's By Age/Specialty        */
     @10396    f1209508    04.  /*Neurology, 75 +                  Non-Fed;MD's By Age/Specialty        */
     @10400    f1209505    04.  /*Neurology, 75 +                  Non-Fed;MD's By Age/Specialty        */
     @10404    f1076410    04.  /*Nuclear Medicine, < 35           Non-Fed;MD's By Age/Specialty        */
     @10408    f1076408    04.  /*Nuclear Medicine, < 35           Non-Fed;MD's By Age/Specialty        */
     @10412    f1076405    04.  /*Nuclear Medicine, < 35           Non-Fed;MD's By Age/Specialty        */
     @10416    f1076510    04.  /*Nuclear Medicine, 35-44          Non-Fed;MD's By Age/Specialty        */
     @10420    f1076508    04.  /*Nuclear Medicine, 35-44          Non-Fed;MD's By Age/Specialty        */
     @10424    f1076505    04.  /*Nuclear Medicine, 35-44          Non-Fed;MD's By Age/Specialty        */
     @10428    f1076610    04.  /*Nuclear Medicine, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10432    f1076608    04.  /*Nuclear Medicine, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10436    f1076605    04.  /*Nuclear Medicine, 45-54          Non-Fed;MD's By Age/Specialty        */
     @10440    f1076710    04.  /*Nuclear Medicine, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10444    f1076708    04.  /*Nuclear Medicine, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10448    f1076705    04.  /*Nuclear Medicine, 55-64          Non-Fed;MD's By Age/Specialty        */
     @10452    f1209610    04.  /*Nuclear Medicine, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10456    f1209608    04.  /*Nuclear Medicine, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10460    f1209605    04.  /*Nuclear Medicine, 65-74          Non-Fed;MD's By Age/Specialty        */
     @10464    f1209710    04.  /*Nuclear Medicine, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10468    f1209708    04.  /*Nuclear Medicine, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10472    f1209705    04.  /*Nuclear Medicine, 75 +           Non-Fed;MD's By Age/Specialty        */
     @10476    f0508410    04.  /*Occupational Medicine, < 35      Non-Fed;MD's By Age/Specialty        */
     @10480    f0508408    04.  /*Occupational Medicine, < 35      Non-Fed;MD's By Age/Specialty        */
     @10484    f0508405    04.  /*Occupational Medicine, < 35      Non-Fed;MD's By Age/Specialty        */
     @10488    f0508510    04.  /*Occupational Medicine, 35-44     Non-Fed;MD's By Age/Specialty        */
     @10492    f0508508    04.  /*Occupational Medicine, 35-44     Non-Fed;MD's By Age/Specialty        */
     @10496    f0508505    04.  /*Occupational Medicine, 35-44     Non-Fed;MD's By Age/Specialty        */
     @10500    f0508610    04.  /*Occupational Medicine, 45-54     Non-Fed;MD's By Age/Specialty        */
     @10504    f0508608    04.  /*Occupational Medicine, 45-54     Non-Fed;MD's By Age/Specialty        */
     @10508    f0508605    04.  /*Occupational Medicine, 45-54     Non-Fed;MD's By Age/Specialty        */
     @10512    f0508710    04.  /*Occupational Medicine, 55-64     Non-Fed;MD's By Age/Specialty        */
     @10516    f0508708    04.  /*Occupational Medicine, 55-64     Non-Fed;MD's By Age/Specialty        */
     @10520    f0508705    04.  /*Occupational Medicine, 55-64     Non-Fed;MD's By Age/Specialty        */
     @10524    f1209810    04.  /*Occupational Medicine, 65-74     Non-Fed;MD's By Age/Specialty        */
     @10528    f1209808    04.  /*Occupational Medicine, 65-74     Non-Fed;MD's By Age/Specialty        */
     @10532    f1209805    04.  /*Occupational Medicine, 65-74     Non-Fed;MD's By Age/Specialty        */
     @10536    f1209910    04.  /*Occupational Medicine, 75 +      Non-Fed;MD's By Age/Specialty        */
     @10540    f1209908    04.  /*Occupational Medicine, 75 +      Non-Fed;MD's By Age/Specialty        */
     @10544    f1209905    04.  /*Occupational Medicine, 75 +      Non-Fed;MD's By Age/Specialty        */
     @10548    f0509010    04.  /*Psychiatry, < 35                 Non-Fed;MD's By Age/Specialty        */
     @10552    f0509008    04.  /*Psychiatry, < 35                 Non-Fed;MD's By Age/Specialty        */
     @10556    f0509005    04.  /*Psychiatry, < 35                 Non-Fed;MD's By Age/Specialty        */
     @10560    f0509110    04.  /*Psychiatry, 35-44                Non-Fed;MD's By Age/Specialty        */
     @10564    f0509108    04.  /*Psychiatry, 35-44                Non-Fed;MD's By Age/Specialty        */
     @10568    f0509105    04.  /*Psychiatry, 35-44                Non-Fed;MD's By Age/Specialty        */
     @10572    f0509210    04.  /*Psychiatry, 45-54                Non-Fed;MD's By Age/Specialty        */
     @10576    f0509208    04.  /*Psychiatry, 45-54                Non-Fed;MD's By Age/Specialty        */
     @10580    f0509205    04.  /*Psychiatry, 45-54                Non-Fed;MD's By Age/Specialty        */
     @10584    f0509310    04.  /*Psychiatry, 55-64                Non-Fed;MD's By Age/Specialty        */
     @10588    f0509308    04.  /*Psychiatry, 55-64                Non-Fed;MD's By Age/Specialty        */
     @10592    f0509305    04.  /*Psychiatry, 55-64                Non-Fed;MD's By Age/Specialty        */
     @10596    f1210010    04.  /*Psychiatry, 65-74                Non-Fed;MD's By Age/Specialty        */
     @10600    f1210008    04.  /*Psychiatry, 65-74                Non-Fed;MD's By Age/Specialty        */
     @10604    f1210005    04.  /*Psychiatry, 65-74                Non-Fed;MD's By Age/Specialty        */
     @10608    f1210110    04.  /*Psychiatry, 75 +                 Non-Fed;MD's By Age/Specialty        */
     @10612    f1210108    04.  /*Psychiatry, 75 +                 Non-Fed;MD's By Age/Specialty        */
     @10616    f1210105    04.  /*Psychiatry, 75 +                 Non-Fed;MD's By Age/Specialty        */
     @10620    f0509610    04.  /*Pathology, Anat/Clinic, < 35     Non-Fed;MD's By Age/Specialty        */
     @10624    f0509608    04.  /*Pathology, Anat/Clinic, < 35     Non-Fed;MD's By Age/Specialty        */
     @10628    f0509605    04.  /*Pathology, Anat/Clinic, < 35     Non-Fed;MD's By Age/Specialty        */
     @10632    f0509710    04.  /*Pathology, Anat/Clinic, 35-44    Non-Fed;MD's By Age/Specialty        */
     @10636    f0509708    04.  /*Pathology, Anat/Clinic, 35-44    Non-Fed;MD's By Age/Specialty        */
     @10640    f0509705    04.  /*Pathology, Anat/Clinic, 35-44    Non-Fed;MD's By Age/Specialty        */
     @10644    f0509810    04.  /*Pathology, Anat/Clinic, 45-54    Non-Fed;MD's By Age/Specialty        */
     @10648    f0509808    04.  /*Pathology, Anat/Clinic, 45-54    Non-Fed;MD's By Age/Specialty        */
     @10652    f0509805    04.  /*Pathology, Anat/Clinic, 45-54    Non-Fed;MD's By Age/Specialty        */
     @10656    f0509910    04.  /*Pathology, Anat/Clinic, 55-64    Non-Fed;MD's By Age/Specialty        */
     @10660    f0509908    04.  /*Pathology, Anat/Clinic, 55-64    Non-Fed;MD's By Age/Specialty        */
     @10664    f0509905    04.  /*Pathology, Anat/Clinic, 55-64    Non-Fed;MD's By Age/Specialty        */
     @10668    f1210210    04.  /*Pathology, Anat/Clinic, 65-74    Non-Fed;MD's By Age/Specialty        */
     @10672    f1210208    04.  /*Pathology, Anat/Clinic, 65-74    Non-Fed;MD's By Age/Specialty        */
     @10676    f1210205    04.  /*Pathology, Anat/Clinic, 65-74    Non-Fed;MD's By Age/Specialty        */
     @10680    f1210310    04.  /*Pathology, Anat/Clinic, 75 +     Non-Fed;MD's By Age/Specialty        */
     @10684    f1210308    04.  /*Pathology, Anat/Clinic, 75 +     Non-Fed;MD's By Age/Specialty        */
     @10688    f1210305    04.  /*Pathology, Anat/Clinic, 75 +     Non-Fed;MD's By Age/Specialty        */
     @10692    f0510210    04.  /*Physical Med & Rehab, < 35       Non-Fed;MD's By Age/Specialty        */
     @10696    f0510208    04.  /*Physical Med & Rehab, < 35       Non-Fed;MD's By Age/Specialty        */
     @10700    f0510205    04.  /*Physical Med & Rehab, < 35       Non-Fed;MD's By Age/Specialty        */
     @10704    f0510310    04.  /*Physical Med & Rehab, 35-44      Non-Fed;MD's By Age/Specialty        */
     @10708    f0510308    04.  /*Physical Med & Rehab, 35-44      Non-Fed;MD's By Age/Specialty        */
     @10712    f0510305    04.  /*Physical Med & Rehab, 35-44      Non-Fed;MD's By Age/Specialty        */
     @10716    f0510410    04.  /*Physical Med & Rehab, 45-54      Non-Fed;MD's By Age/Specialty        */
     @10720    f0510408    04.  /*Physical Med & Rehab, 45-54      Non-Fed;MD's By Age/Specialty        */
     @10724    f0510405    04.  /*Physical Med & Rehab, 45-54      Non-Fed;MD's By Age/Specialty        */
     @10728    f0510510    04.  /*Physical Med & Rehab, 55-64      Non-Fed;MD's By Age/Specialty        */
     @10732    f0510508    04.  /*Physical Med & Rehab, 55-64      Non-Fed;MD's By Age/Specialty        */
     @10736    f0510505    04.  /*Physical Med & Rehab, 55-64      Non-Fed;MD's By Age/Specialty        */
     @10740    f1210410    04.  /*Physical Med & Rehab, 65-74      Non-Fed;MD's By Age/Specialty        */
     @10744    f1210408    04.  /*Physical Med & Rehab, 65-74      Non-Fed;MD's By Age/Specialty        */
     @10748    f1210405    04.  /*Physical Med & Rehab, 65-74      Non-Fed;MD's By Age/Specialty        */
     @10752    f1210510    04.  /*Physical Med & Rehab, 75 +       Non-Fed;MD's By Age/Specialty        */
     @10756    f1210508    04.  /*Physical Med & Rehab, 75 +       Non-Fed;MD's By Age/Specialty        */
     @10760    f1210505    04.  /*Physical Med & Rehab, 75 +       Non-Fed;MD's By Age/Specialty        */
     @10764    f0510810    04.  /*General Preventive Med, < 35     Non-Fed;MD's By Age/Specialty        */
     @10768    f0510808    04.  /*General Preventive Med, < 35     Non-Fed;MD's By Age/Specialty        */
     @10772    f0510805    04.  /*General Preventive Med, < 35     Non-Fed;MD's By Age/Specialty        */
     @10776    f0510910    04.  /*General Preventive Med, 35-44    Non-Fed;MD's By Age/Specialty        */
     @10780    f0510908    04.  /*General Preventive Med, 35-44    Non-Fed;MD's By Age/Specialty        */
     @10784    f0510905    04.  /*General Preventive Med, 35-44    Non-Fed;MD's By Age/Specialty        */
     @10788    f0511010    04.  /*General Preventive Med, 45-54    Non-Fed;MD's By Age/Specialty        */
     @10792    f0511008    04.  /*General Preventive Med, 45-54    Non-Fed;MD's By Age/Specialty        */
     @10796    f0511005    04.  /*General Preventive Med, 45-54    Non-Fed;MD's By Age/Specialty        */
     @10800    f0511110    04.  /*General Preventive Med, 55-64    Non-Fed;MD's By Age/Specialty        */
     @10804    f0511108    04.  /*General Preventive Med, 55-64    Non-Fed;MD's By Age/Specialty        */
     @10808    f0511105    04.  /*General Preventive Med, 55-64    Non-Fed;MD's By Age/Specialty        */
     @10812    f1210610    04.  /*General Preventive Med, 65-74    Non-Fed;MD's By Age/Specialty        */
     @10816    f1210608    04.  /*General Preventive Med, 65-74    Non-Fed;MD's By Age/Specialty        */
     @10820    f1210605    04.  /*General Preventive Med, 65-74    Non-Fed;MD's By Age/Specialty        */
     @10824    f1210710    04.  /*General Preventive Med, 75 +     Non-Fed;MD's By Age/Specialty        */
     @10828    f1210708    04.  /*General Preventive Med, 75 +     Non-Fed;MD's By Age/Specialty        */
     @10832    f1210705    04.  /*General Preventive Med, 75 +     Non-Fed;MD's By Age/Specialty        */
     @10836    f0511410    04.  /*Public Health, < 35              Non-Fed;MD's By Age/Specialty        */
     @10840    f0511408    04.  /*Public Health, < 35              Non-Fed;MD's By Age/Specialty        */
     @10844    f0511405    04.  /*Public Health, < 35              Non-Fed;MD's By Age/Specialty        */
     @10848    f0511510    04.  /*Public Health, 35-44             Non-Fed;MD's By Age/Specialty        */
     @10852    f0511508    04.  /*Public Health, 35-44             Non-Fed;MD's By Age/Specialty        */
     @10856    f0511505    04.  /*Public Health, 35-44             Non-Fed;MD's By Age/Specialty        */
     @10860    f0511610    04.  /*Public Health, 45-54             Non-Fed;MD's By Age/Specialty        */
     @10864    f0511608    04.  /*Public Health, 45-54             Non-Fed;MD's By Age/Specialty        */
     @10868    f0511605    04.  /*Public Health, 45-54             Non-Fed;MD's By Age/Specialty        */
     @10872    f0511710    04.  /*Public Health, 55-64             Non-Fed;MD's By Age/Specialty        */
     @10876    f0511708    04.  /*Public Health, 55-64             Non-Fed;MD's By Age/Specialty        */
     @10880    f0511705    04.  /*Public Health, 55-64             Non-Fed;MD's By Age/Specialty        */
     @10884    f1210810    04.  /*Public Health, 65-74             Non-Fed;MD's By Age/Specialty        */
     @10888    f1210808    04.  /*Public Health, 65-74             Non-Fed;MD's By Age/Specialty        */
     @10892    f1210805    04.  /*Public Health, 65-74             Non-Fed;MD's By Age/Specialty        */
     @10896    f1210910    04.  /*Public Health, 75 +              Non-Fed;MD's By Age/Specialty        */
     @10900    f1210908    04.  /*Public Health, 75 +              Non-Fed;MD's By Age/Specialty        */
     @10904    f1210905    04.  /*Public Health, 75 +              Non-Fed;MD's By Age/Specialty        */
     @10908    f1077310    04.  /*Radiology, < 35                  Non-Fed;MD's By Age/Specialty        */
     @10912    f1077308    04.  /*Radiology, < 35                  Non-Fed;MD's By Age/Specialty        */
     @10916    f1077305    04.  /*Radiology, < 35                  Non-Fed;MD's By Age/Specialty        */
     @10920    f1077410    04.  /*Radiology, 35-44                 Non-Fed;MD's By Age/Specialty        */
     @10924    f1077408    04.  /*Radiology, 35-44                 Non-Fed;MD's By Age/Specialty        */
     @10928    f1077405    04.  /*Radiology, 35-44                 Non-Fed;MD's By Age/Specialty        */
     @10932    f1077510    04.  /*Radiology, 45-54                 Non-Fed;MD's By Age/Specialty        */
     @10936    f1077508    04.  /*Radiology, 45-54                 Non-Fed;MD's By Age/Specialty        */
     @10940    f1077505    04.  /*Radiology, 45-54                 Non-Fed;MD's By Age/Specialty        */
     @10944    f1077610    04.  /*Radiology, 55-64                 Non-Fed;MD's By Age/Specialty        */
     @10948    f1077608    04.  /*Radiology, 55-64                 Non-Fed;MD's By Age/Specialty        */
     @10952    f1077605    04.  /*Radiology, 55-64                 Non-Fed;MD's By Age/Specialty        */
     @10956    f1211010    04.  /*Radiology, 65-74                 Non-Fed;MD's By Age/Specialty        */
     @10960    f1211008    04.  /*Radiology, 65-74                 Non-Fed;MD's By Age/Specialty        */
     @10964    f1211005    04.  /*Radiology, 65-74                 Non-Fed;MD's By Age/Specialty        */
     @10968    f1211110    04.  /*Radiology, 75 +                  Non-Fed;MD's By Age/Specialty        */
     @10972    f1211108    04.  /*Radiology, 75 +                  Non-Fed;MD's By Age/Specialty        */
     @10976    f1211105    04.  /*Radiology, 75 +                  Non-Fed;MD's By Age/Specialty        */
     @10980    f0512610    04.  /*Radiation Oncology, < 35         Non-Fed;MD's By Age/Specialty        */
     @10984    f0512608    04.  /*Radiation Oncology, < 35         Non-Fed;MD's By Age/Specialty        */
     @10988    f0512605    04.  /*Radiation Oncology, < 35         Non-Fed;MD's By Age/Specialty        */
     @10992    f0512710    04.  /*Radiation Oncology, 35-44        Non-Fed;MD's By Age/Specialty        */
     @10996    f0512708    04.  /*Radiation Oncology, 35-44        Non-Fed;MD's By Age/Specialty        */
     @11000    f0512705    04.  /*Radiation Oncology, 35-44        Non-Fed;MD's By Age/Specialty        */
     @11004    f0512810    04.  /*Radiation Oncology, 45-54        Non-Fed;MD's By Age/Specialty        */
     @11008    f0512808    04.  /*Radiation Oncology, 45-54        Non-Fed;MD's By Age/Specialty        */
     @11012    f0512805    04.  /*Radiation Oncology, 45-54        Non-Fed;MD's By Age/Specialty        */
     @11016    f0512910    04.  /*Radiation Oncology, 55-64        Non-Fed;MD's By Age/Specialty        */
     @11020    f0512908    04.  /*Radiation Oncology, 55-64        Non-Fed;MD's By Age/Specialty        */
     @11024    f0512905    04.  /*Radiation Oncology, 55-64        Non-Fed;MD's By Age/Specialty        */
     @11028    f1211210    04.  /*Radiation Oncology, 65-74        Non-Fed;MD's By Age/Specialty        */
     @11032    f1211208    04.  /*Radiation Oncology, 65-74        Non-Fed;MD's By Age/Specialty        */
     @11036    f1211205    04.  /*Radiation Oncology, 65-74        Non-Fed;MD's By Age/Specialty        */
     @11040    f1211310    04.  /*Radiation Oncology, 75 +         Non-Fed;MD's By Age/Specialty        */
     @11044    f1211308    04.  /*Radiation Oncology, 75 +         Non-Fed;MD's By Age/Specialty        */
     @11048    f1211305    04.  /*Radiation Oncology, 75 +         Non-Fed;MD's By Age/Specialty        */
     @11052    f1365910    04.  /*Transplantation Surgery, < 35    Non-Fed;MD's By Age/Specialty        */
     @11056    f1365908    04.  /*Transplantation Surgery, < 35    Non-Fed;MD's By Age/Specialty        */
     @11060    f1365905    04.  /*Transplantation Surgery, < 35    Non-Fed;MD's By Age/Specialty        */
     @11064    f1366010    04.  /*Transplantation Surgery, 35-44   Non-Fed;MD's By Age/Specialty        */
     @11068    f1366008    04.  /*Transplantation Surgery, 35-44   Non-Fed;MD's By Age/Specialty        */
     @11072    f1366005    04.  /*Transplantation Surgery, 35-44   Non-Fed;MD's By Age/Specialty        */
     @11076    f1366110    04.  /*Transplantation Surgery, 45-54   Non-Fed;MD's By Age/Specialty        */
     @11080    f1366108    04.  /*Transplantation Surgery, 45-54   Non-Fed;MD's By Age/Specialty        */
     @11084    f1366105    04.  /*Transplantation Surgery, 45-54   Non-Fed;MD's By Age/Specialty        */
     @11088    f1366210    04.  /*Transplantation Surgery, 55-64   Non-Fed;MD's By Age/Specialty        */
     @11092    f1366208    04.  /*Transplantation Surgery, 55-64   Non-Fed;MD's By Age/Specialty        */
     @11096    f1366205    04.  /*Transplantation Surgery, 55-64   Non-Fed;MD's By Age/Specialty        */
     @11100    f1366310    04.  /*Transplantation Surgery, 65-74   Non-Fed;MD's By Age/Specialty        */
     @11104    f1366308    04.  /*Transplantation Surgery, 65-74   Non-Fed;MD's By Age/Specialty        */
     @11108    f1366305    04.  /*Transplantation Surgery, 65-74   Non-Fed;MD's By Age/Specialty        */
     @11112    f1366410    04.  /*Transplantation Surgery, 75 +    Non-Fed;MD's By Age/Specialty        */
     @11116    f1366408    04.  /*Transplantation Surgery, 75 +    Non-Fed;MD's By Age/Specialty        */
     @11120    f1366405    04.  /*Transplantation Surgery, 75 +    Non-Fed;MD's By Age/Specialty        */
     @11124    f1364410    04.  /*Vascular Medicine, < 35          Non-Fed;MD's By Age/Specialty        */
     @11128    f1364408    04.  /*Vascular Medicine, < 35          Non-Fed;MD's By Age/Specialty        */
     @11132    f1364405    04.  /*Vascular Medicine, < 35          Non-Fed;MD's By Age/Specialty        */
     @11136    f1364510    04.  /*Vascular Medicine, 35-44         Non-Fed;MD's By Age/Specialty        */
     @11140    f1364508    04.  /*Vascular Medicine, 35-44         Non-Fed;MD's By Age/Specialty        */
     @11144    f1364505    04.  /*Vascular Medicine, 35-44         Non-Fed;MD's By Age/Specialty        */
     @11148    f1364610    04.  /*Vascular Medicine, 45-54         Non-Fed;MD's By Age/Specialty        */
     @11152    f1364608    04.  /*Vascular Medicine, 45-54         Non-Fed;MD's By Age/Specialty        */
     @11156    f1364605    04.  /*Vascular Medicine, 45-54         Non-Fed;MD's By Age/Specialty        */
     @11160    f1364710    04.  /*Vascular Medicine, 55-64         Non-Fed;MD's By Age/Specialty        */
     @11164    f1364708    04.  /*Vascular Medicine, 55-64         Non-Fed;MD's By Age/Specialty        */
     @11168    f1364705    04.  /*Vascular Medicine, 55-64         Non-Fed;MD's By Age/Specialty        */
     @11172    f1364810    04.  /*Vascular Medicine, 65-74         Non-Fed;MD's By Age/Specialty        */
     @11176    f1364808    04.  /*Vascular Medicine, 65-74         Non-Fed;MD's By Age/Specialty        */
     @11180    f1364805    04.  /*Vascular Medicine, 65-74         Non-Fed;MD's By Age/Specialty        */
     @11184    f1364910    04.  /*Vascular Medicine, 75 +          Non-Fed;MD's By Age/Specialty        */
     @11188    f1364908    04.  /*Vascular Medicine, 75 +          Non-Fed;MD's By Age/Specialty        */
     @11192    f1364905    04.  /*Vascular Medicine, 75 +          Non-Fed;MD's By Age/Specialty        */
     @11196    f1077710    04.  /*Other Specialty, < 35            Non-Fed;Specs Other Than Above       */
     @11200    f1077708    04.  /*Other Specialty, < 35            Non-Fed;Specs Other Than Above       */
     @11204    f1077705    04.  /*Other Specialty, < 35            Non-Fed;Specs Other Than Above       */
     @11208    f1077810    04.  /*Other Specialty, 35-44           Non-Fed;Specs Other Than Above       */
     @11212    f1077808    04.  /*Other Specialty, 35-44           Non-Fed;Specs Other Than Above       */
     @11216    f1077805    04.  /*Other Specialty, 35-44           Non-Fed;Specs Other Than Above       */
     @11220    f1077910    04.  /*Other Specialty, 45-54           Non-Fed;Specs Other Than Above       */
     @11224    f1077908    04.  /*Other Specialty, 45-54           Non-Fed;Specs Other Than Above       */
     @11228    f1077905    04.  /*Other Specialty, 45-54           Non-Fed;Specs Other Than Above       */
     @11232    f1078010    04.  /*Other Specialty, 55-64           Non-Fed;Specs Other Than Above       */
     @11236    f1078008    04.  /*Other Specialty, 55-64           Non-Fed;Specs Other Than Above       */
     @11240    f1078005    04.  /*Other Specialty, 55-64           Non-Fed;Specs Other Than Above       */
     @11244    f1211410    04.  /*Other Specialty, 65-74           Non-Fed;Specs Other Than Above       */
     @11248    f1211408    04.  /*Other Specialty, 65-74           Non-Fed;Specs Other Than Above       */
     @11252    f1211405    04.  /*Other Specialty, 65-74           Non-Fed;Specs Other Than Above       */
     @11256    f1211510    04.  /*Other Specialty, 75 +            Non-Fed;Specs Other Than Above       */
     @11260    f1211508    04.  /*Other Specialty, 75 +            Non-Fed;Specs Other Than Above       */
     @11264    f1211505    04.  /*Other Specialty, 75 +            Non-Fed;Specs Other Than Above       */
     @11268    f0513810    04.  /*Unspecified, < 35                Non-Fed;MD's By Age/Specialty        */
     @11272    f0513808    04.  /*Unspecified, < 35                Non-Fed;MD's By Age/Specialty        */
     @11276    f0513805    04.  /*Unspecified, < 35                Non-Fed;MD's By Age/Specialty        */
     @11280    f0513910    04.  /*Unspecified, 35-44               Non-Fed;MD's By Age/Specialty        */
     @11284    f0513908    04.  /*Unspecified, 35-44               Non-Fed;MD's By Age/Specialty        */
     @11288    f0513905    04.  /*Unspecified, 35-44               Non-Fed;MD's By Age/Specialty        */
     @11292    f0514010    04.  /*Unspecified, 45-54               Non-Fed;MD's By Age/Specialty        */
     @11296    f0514008    04.  /*Unspecified, 45-54               Non-Fed;MD's By Age/Specialty        */
     @11300    f0514005    04.  /*Unspecified, 45-54               Non-Fed;MD's By Age/Specialty        */
     @11304    f0514110    04.  /*Unspecified, 55-64               Non-Fed;MD's By Age/Specialty        */
     @11308    f0514108    04.  /*Unspecified, 55-64               Non-Fed;MD's By Age/Specialty        */
     @11312    f0514105    04.  /*Unspecified, 55-64               Non-Fed;MD's By Age/Specialty        */
     @11316    f1211610    04.  /*Unspecified, 65-74               Non-Fed;MD's By Age/Specialty        */
     @11320    f1211608    04.  /*Unspecified, 65-74               Non-Fed;MD's By Age/Specialty        */
     @11324    f1211605    04.  /*Unspecified, 65-74               Non-Fed;MD's By Age/Specialty        */
     @11328    f1211710    04.  /*Unspecified, 75 +                Non-Fed;MD's By Age/Specialty        */
     @11332    f1211708    04.  /*Unspecified, 75 +                Non-Fed;MD's By Age/Specialty        */
     @11336    f1211705    04.  /*Unspecified, 75 +                Non-Fed;MD's By Age/Specialty        */
     @11340    f0514410    04.  /*MD's, Inactive, < 35             Non-Fed;MD's By Age/Specialty        */
     @11344    f0514408    04.  /*MD's, Inactive, < 35             Non-Fed;MD's By Age/Specialty        */
     @11348    f0514405    04.  /*MD's, Inactive, < 35             Non-Fed;MD's By Age/Specialty        */
     @11352    f0514510    04.  /*MD's, Inactive, 35-44            Non-Fed;MD's By Age/Specialty        */
     @11356    f0514508    04.  /*MD's, Inactive, 35-44            Non-Fed;MD's By Age/Specialty        */
     @11360    f0514505    04.  /*MD's, Inactive, 35-44            Non-Fed;MD's By Age/Specialty        */
     @11364    f0514610    04.  /*MD's, Inactive, 45-54            Non-Fed;MD's By Age/Specialty        */
     @11368    f0514608    04.  /*MD's, Inactive, 45-54            Non-Fed;MD's By Age/Specialty        */
     @11372    f0514605    04.  /*MD's, Inactive, 45-54            Non-Fed;MD's By Age/Specialty        */
     @11376    f0514710    04.  /*MD's, Inactive, 55-64            Non-Fed;MD's By Age/Specialty        */
     @11380    f0514708    04.  /*MD's, Inactive, 55-64            Non-Fed;MD's By Age/Specialty        */
     @11384    f0514705    04.  /*MD's, Inactive, 55-64            Non-Fed;MD's By Age/Specialty        */
     @11388    f1211810    04.  /*MD's, Inactive, 65-74            Non-Fed;MD's By Age/Specialty        */
     @11392    f1211808    04.  /*MD's, Inactive, 65-74            Non-Fed;MD's By Age/Specialty        */
     @11396    f1211805    04.  /*MD's, Inactive, 65-74            Non-Fed;MD's By Age/Specialty        */
     @11400    f1211910    04.  /*MD's, Inactive, 75 +             Non-Fed;MD's By Age/Specialty        */
     @11404    f1211908    04.  /*MD's, Inactive, 75 +             Non-Fed;MD's By Age/Specialty        */
     @11408    f1211905    04.  /*MD's, Inactive, 75 +             Non-Fed;MD's By Age/Specialty        */
     @11412    f0515010    04.  /*MD's, Not Classified, < 35       Non-Fed;MD's By Age/Specialty        */
     @11416    f0515008    04.  /*MD's, Not Classified, < 35       Non-Fed;MD's By Age/Specialty        */
     @11420    f0515005    04.  /*MD's, Not Classified, < 35       Non-Fed;MD's By Age/Specialty        */
     @11424    f0515110    04.  /*MD's, Not Classified, 35-44      Non-Fed;MD's By Age/Specialty        */
     @11428    f0515107    04.  /*MD's, Not Classified, 35-44      Non-Fed;MD's By Age/Specialty        */
     @11432    f0515105    04.  /*MD's, Not Classified, 35-44      Non-Fed;MD's By Age/Specialty        */
     @11436    f0515210    04.  /*MD's, Not Classified, 45-54      Non-Fed;MD's By Age/Specialty        */
     @11440    f0515208    04.  /*MD's, Not Classified, 45-54      Non-Fed;MD's By Age/Specialty        */
     @11444    f0515205    04.  /*MD's, Not Classified, 45-54      Non-Fed;MD's By Age/Specialty        */
     @11448    f0515310    04.  /*MD's, Not Classified, 55-64      Non-Fed;MD's By Age/Specialty        */
     @11452    f0515308    04.  /*MD's, Not Classified, 55-64      Non-Fed;MD's By Age/Specialty        */
     @11456    f0515305    04.  /*MD's, Not Classified, 55-64      Non-Fed;MD's By Age/Specialty        */
     @11460    f1212010    04.  /*MD's, Not Classified, 65-74      Non-Fed;MD's By Age/Specialty        */
     @11464    f1212008    04.  /*MD's, Not Classified, 65-74      Non-Fed;MD's By Age/Specialty        */
     @11468    f1212005    04.  /*MD's, Not Classified, 65-74      Non-Fed;MD's By Age/Specialty        */
     @11472    f1212110    04.  /*MD's, Not Classified, 75 +       Non-Fed;MD's By Age/Specialty        */
     @11476    f1212108    04.  /*MD's, Not Classified, 75 +       Non-Fed;MD's By Age/Specialty        */
     @11480    f1212105    04.  /*MD's, Not Classified, 75 +       Non-Fed;MD's By Age/Specialty        */
     @11484    f0861200    07.  /*Physicians and Surgeons          Table 1, Code 306                    */
     @11491    f0861290    06.  /*Physicians, M.D.'s & D.O.'s                                           */
     @11497    f0861280    06.  /*Physicians, M.D.'s & D.O.'s                                           */
     @11503    f1387910    04.  /*Total D.O.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @11507    f1387908    04.  /*Total D.O.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @11511    f1387906    05.  /*Total D.O.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @11516    f1387905    05.  /*Total D.O.'s, Tot Non-Fed & Fed  Non-Fd&Fed;Incl Inact/Not Class      */
     @11521    f1388010    04.  /*Total D.O.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @11525    f1388008    04.  /*Total D.O.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @11529    f1388006    05.  /*Total D.O.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @11534    f1388005    05.  /*Total D.O.'s, Total Non-Fed      Non-Fed;Incl Inact/Not Class         */
     @11539    f1388110    03.  /*Total D.O.'s, Total Federal      Fed;Incl Inact/Not Class             */
     @11542    f1388108    03.  /*Total D.O.'s, Total Federal      Fed;Incl Inact/Not Class             */
     @11545    f1388106    05.  /*Total D.O.'s, Total Federal      Fed;Incl Inact/Not Class             */
     @11550    f1388105    05.  /*Total D.O.'s, Total Federal      Fed;Incl Inact/Not Class             */
     @11555    f1388210    04.  /*Tot Active D.O.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @11559    f1388208    04.  /*Tot Active D.O.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @11563    f1388206    05.  /*Tot Active D.O.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @11568    f1388205    05.  /*Tot Active D.O.s Non-Fed & Fed   Non-Fed & Fed;Excl Inact             */
     @11573    f1388310    04.  /*Total Active D.O.s Non-Federal   Non-Fed; Excl Inact                  */
     @11577    f1388308    04.  /*Total Active D.O.s Non-Federal   Non-Fed; Excl Inact                  */
     @11581    f1388306    05.  /*Total Active D.O.s Non-Federal   Non-Fed; Excl Inact                  */
     @11586    f1388305    05.  /*Total Active D.O.s Non-Federal   Non-Fed; Excl Inact                  */
     @11591    f1388410    03.  /*Total Active D.O.s Federal       Fed; Excl Inact                      */
     @11594    f1388408    03.  /*Total Active D.O.s Federal       Fed; Excl Inact                      */
     @11597    f1388406    05.  /*Total Active D.O.s Federal       Fed; Excl Inact                      */
     @11602    f1388405    05.  /*Total Active D.O.s Federal       Fed; Excl Inact                      */
     @11607    f1469310    04.  /*D.O.'s, Total Ptn Care Non-Fed   Non-Fed;Patient Care                 */
     @11611    f1469410    04.  /*D.O.'s, PC, Off Based Non-Fed    Non-Fed;Patn Care Office-Based       */
     @11615    f1469510    04.  /*D.O.'s, Total PC, Hosp Resident  Non-Fed;Patn Care Hosp-Based         */
     @11619    f1469610    04.  /*D.O.'s, Total PC, Hosp FT Staff  Non-Fed;Patn Care Hosp-Based         */
     @11623    f1469710    03.  /*D.O.'s, Total Oth Prof Activity  Non-Fed                              */
     @11626    f1469810    03.  /*DO's Inactive, Total             Non-Fed                              */
     @11629    f1469910    03.  /*DO's Not Classified, Total       Non-Fed                              */
     @11632    f1470010    04.  /*Total D.O.'s, Male               Non-Fed;Incl.Inact & Not Class       */
     @11636    f1470110    04.  /*Total D.O.'s, Female             Non-Fed;Incl.Inact & Not Class       */
     @11640    f1470210    03.  /*DO's, Inactive, Male             Non-Fed;DO's By Gender               */
     @11643    f1470310    03.  /*DO's, Inactive, Female           Non-Fed;DO's By Gender               */
     @11646    f1470410    04.  /*Total D.O.'s, < 35               Non-Fed;Incl.Inact & Not Class       */
     @11650    f1470510    04.  /*Total D.O.'s, 35-44              Non-Fed;Incl.Inact & Not Class       */
     @11654    f1470610    04.  /*Total D.O.'s, 45-54              Non-Fed;Incl.Inact & Not Class       */
     @11658    f1470710    04.  /*Total D.O.'s, 55-64              Non-Fed;Incl.Inact & Not Class       */
     @11662    f1470810    04.  /*Total D.O.'s, 65-74              Non-Fed;Incl.Inact & Not Class       */
     @11666    f1470910    04.  /*Total D.O.'s, 75 +               Non-Fed;Incl.Inact & Not Class       */
     @11670    f1471010    02.  /*DO's, Inactive, < 35             Non-Fed;DO's By Age                  */
     @11672    f1471110    02.  /*DO's, Inactive, 35-44            Non-Fed;DO's By Age                  */
     @11674    f1471210    02.  /*DO's, Inactive, 45-54            Non-Fed;DO's By Age                  */
     @11676    f1471310    02.  /*DO's, Inactive, 55-64            Non-Fed;DO's By Age                  */
     @11678    f1471410    03.  /*DO's, Inactive, 65-74            Non-Fed;DO's By Age                  */
     @11681    f1471510    03.  /*DO's, Inactive, 75 +             Non-Fed;DO's By Age                  */
     @11684    f1471610    03.  /*DO's, Gen Pract, Total           Non-Fed;DO's By Specialty            */
     @11687    f1471710    03.  /*DO's, Gen Pract, Total Ptn Care  Non-Fed;Patient Care                 */
     @11690    f1471810    04.  /*DO's, Fam Med Gen, Total         Non-Fed;DO's By Specialty            */
     @11694    f1471910    04.  /*DO's, Fam Med Gen, Tot Ptn Cr    Non-Fed;Patient Care                 */
     @11698    f1472010    02.  /*DO's, Fam Med Subspec, Total     Non-Fed;DO's By Specialty            */
     @11700    f1472110    02.  /*DO's, Fam Med Subsp,Tot Ptn Cr   Non-Fed;Patient Care                 */
     @11702    f1472210    04.  /*DO's, Gnrl Int Med, Total        Non-Fed;DO's By Specialty            */
     @11706    f1472310    04.  /*DO's, Gnrl Int Med, Tot Ptn Cr   Non-Fed;Patn Care Office-Based       */
     @11710    f1472410    03.  /*DO's, Int Med Subspecs, Total    Non-Fed;DO's By Specialty            */
     @11713    f1472510    03.  /*DO's, IntMed Subspcs,Tot Ptn Cr  Non-Fed;Patient Care                 */
     @11716    f1472610    03.  /*DO's, Pediatrics, General, Tot   Non-Fed;DO's By Specialty            */
     @11719    f1472710    03.  /*DO's, Pediatrics,Gen,Tot Ptn Cr  Non-Fed;Patient Care                 */
     @11722    f1472810    02.  /*DO's, Ped Subspecs, Total        Non-Fed;DO's By Specialty            */
     @11724    f1472910    02.  /*DO's, Ped Subspecs, Tot Patn Cr  Non-Fed;Patient Care                 */
     @11726    f1473010    03.  /*DO's, Ob-Gyn, General, Total     Non-Fed;DO's By Specialty            */
     @11729    f1473110    03.  /*DO's, Ob-Gyn, Gen, Tot Patn Cr   Non-Fed;Patient Care                 */
     @11732    f1473210    02.  /*DO's, Ob-Gyn Subspecs, Total     Non-Fed;DO's By Specialty            */
     @11734    f1473310    02.  /*DO's, Ob-Gyn Subspcs,Tot Ptn Cr  Non-Fed;Patient Care                 */
     @11736    f1473410    03.  /*DO's, Genrl Surg, Total          Non-Fed;DO's By Specialty            */
     @11739    f1473510    03.  /*DO's, Genrl Surg, Tot Ptnt Care  Non-Fed;Patient Care                 */
     @11742    f1473610    03.  /*DO's, Orthopedic Surg, Total     Non-Fed;DO's By Specialty            */
     @11745    f1473710    03.  /*DO's, Orthopedic Srg,Tot Ptn Cr  Non-Fed;Patient Care                 */
     @11748    f1473810    03.  /*DO's, Anesthesiolgy, Total       Non-Fed;DO's By Specialty            */
     @11751    f1473910    03.  /*DO's, Anesthesiolgy, Tot Ptn Cr  Non-Fed;Patient Care                 */
     @11754    f1474010    03.  /*DO's, Emergency Med, Total       Non-Fed;DO's By Specialty            */
     @11757    f1474110    03.  /*DO's, Emergency Med, Tot Ptn Cr  Non-Fed;Patient Care                 */
     @11760    f1474210    03.  /*DO's, Psychiatry, Total          Non-Fed;DO's By Specialty            */
     @11763    f1474310    03.  /*DO's, Psychiatry, Tot Patnt Cr   Non-Fed;Patient Care                 */
     @11766    f1474410    03.  /*DO's, Phys Med/Rehab, Total      Non-Fed;DO's By Specialty            */
     @11769    f1474510    03.  /*DO's, Phys Med/Rehab,Tot Ptn Cr  Non-Fed;Patient Care                 */
     @11772    f1474610    04.  /*DO's, Other Specs, Total         Non-Fed;Specs Other Than Above       */
     @11776    f1474710    04.  /*DO's, Other Specs, Tot Patnt Cr  Non-Fed;Specs Other Than Above       */
     @11780    f1359907    04.  /*D.O. Total Active Non-Fed & Fed                                       */
     @11784    f1359904    04.  /*D.O. Total Active Non-Fed & Fed                                       */
     @11788    f1359903    04.  /*D.O. Total Active Non-Fed & Fed                                       */
     @11792    f1359901    04.  /*D.O. Total Active Non-Fed & Fed                                       */
     @11796    f1359607    04.  /*D.O. Total Non-Federal           Incl Inactive/Retired                */
     @11800    f1359604    04.  /*D.O. Total Non-Federal           Incl Inactive/Retired                */
     @11804    f1359603    04.  /*D.O. Total Non-Federal           Incl Inactive/Retired                */
     @11808    f1359601    04.  /*D.O. Total Non-Federal           Incl Inactive/Retired                */
     @11812    f1325707    04.  /*D.O. Total Active Non-Federal                                         */
     @11816    f1325704    04.  /*D.O. Total Active Non-Federal                                         */
     @11820    f1325703    04.  /*D.O. Total Active Non-Federal                                         */
     @11824    f1325701    04.  /*D.O. Total Active Non-Federal                                         */
     @11828    f1325798    04.  /*D.O. Total Active Non-Federal                                         */
     @11832    f1398507    04.  /*D.O. Total Patient Care          Non-Fed by Major Prof Activity       */
     @11836    f1398504    03.  /*D.O. Patient Care                Non-Fed by Major Prof Activity       */
     @11839    f1398503    03.  /*D.O. Patient Care                Non-Fed by Major Prof Activity       */
     @11842    f1325801    03.  /*D.O. Patient Care                Non-Fed by Practice Type             */
     @11845    f1325898    03.  /*D.O. Patient Care                Non-Fed by Practice Type             */
     @11848    f1412307    03.  /*D.O. Office Based, Patient Care  Non-Fed by Major Prof Activity       */
     @11851    f1412407    03.  /*D.O. Hospital Staff, Patn Care   Non-Fed by Major Prof Activity       */
     @11854    f1412507    03.  /*D.O. Postdoc Train, Patn Care    Non-Fed by Major Prof Activity       */
     @11857    f1325901    03.  /*D.O. Internship/Residency        Non-Fed by Practice Type             */
     @11860    f1325998    03.  /*D.O. Internship/Residency        Non-Fed by Practice Type             */
     @11863    f1398607    03.  /*D.O. Administration              Non-Fed by Major Prof Activity       */
     @11866    f1398604    03.  /*D.O. Administration              Non-Fed by Major Prof Activity       */
     @11869    f1398603    03.  /*D.O. Administration              Non-Fed by Major Prof Activity       */
     @11872    f1326001    03.  /*D.O. Administration              Non-Fed by Practice Type             */
     @11875    f1326098    03.  /*D.O. Administration              Non-Fed by Practice Type             */
     @11878    f1398707    03.  /*D.O. Teaching                    Non-Fed by Major Prof Activity       */
     @11881    f1398704    03.  /*D.O. Teaching                    Non-Fed by Major Prof Activity       */
     @11884    f1398703    03.  /*D.O. Teaching                    Non-Fed by Major Prof Activity       */
     @11887    f1326101    03.  /*D.O. Teaching                    Non-Fed by Practice Type             */
     @11890    f1326198    03.  /*D.O. Teaching                    Non-Fed by Practice Type             */
     @11893    f1398807    03.  /*D.O. Research                    Non-Fed by Major Prof Activity       */
     @11896    f1398804    03.  /*D.O. Research                    Non-Fed by Major Prof Activity       */
     @11899    f1398803    03.  /*D.O. Research                    Non-Fed by Major Prof Activity       */
     @11902    f1326201    03.  /*D.O. Research                    Non-Fed by Practice Type             */
     @11905    f1326298    03.  /*D.O. Research                    Non-Fed by Practice Type             */
     @11908    f1398907    03.  /*D.O. Other Major Prof Activity   Non-Fed by Major Prof Activity       */
     @11911    f1398904    03.  /*D.O. Other Major Prof Activity   Non-Fed by Major Prof Activity       */
     @11914    f1398903    03.  /*D.O. Other Major Prof Activity   Non-Fed by Major Prof Activity       */
     @11917    f1326301    03.  /*D.O. Other Practice Type         Non-Fed by Practice Type             */
     @11920    f1326398    03.  /*D.O. Other Practice Type         Non-Fed by Practice Type             */
     @11923    f1399007    03.  /*D.O. Inactive/Retired            Non-Fed by Major Prof Activity       */
     @11926    f1399004    03.  /*D.O. Inactive/Retired            Non-Fed by Major Prof Activity       */
     @11929    f1399003    03.  /*D.O. Inactive/Retired            Non-Fed by Major Prof Activity       */
     @11932    f1359701    03.  /*D.O. Inactive/Retired            Non-Fed by Practice Type             */
     @11935    f1412607    02.  /*D.O. Major Prof Activity Unknwn  Non-Fed by Major Prof Activity       */
     @11937    f1326407    04.  /*D.O. Total Male                  Non-Fed by Gender                    */
     @11941    f1326404    03.  /*D.O. Total Male                  Non-Fed by Gender                    */
     @11944    f1326403    03.  /*D.O. Total Male                  Non-Fed by Gender                    */
     @11947    f1326401    03.  /*D.O. Total Male                  Non-Fed by Gender                    */
     @11950    f1326498    03.  /*D.O. Total Male                  Non-Fed by Gender                    */
     @11953    f1326507    03.  /*D.O. Total Female                Non-Fed by Gender                    */
     @11956    f1326504    03.  /*D.O. Total Female                Non-Fed by Gender                    */
     @11959    f1326503    03.  /*D.O. Total Female                Non-Fed by Gender                    */
     @11962    f1326501    03.  /*D.O. Total Female                Non-Fed by Gender                    */
     @11965    f1326598    03.  /*D.O. Total Female                Non-Fed by Gender                    */
     @11968    f1359803    03.  /*D.O. Gender Unknown              Non-Fed by Gender                    */
     @11971    f1359801    03.  /*D.O. Gender Unknown              Non-Fed by Gender                    */
     @11974    f1326607    03.  /*D.O. Board Certified             Non-Fed by Osteo Board Cert          */
     @11977    f1326604    03.  /*D.O. Board Certified             Non-Fed by Osteo Board Cert          */
     @11980    f1326603    03.  /*D.O. Board Certified             Non-Fed by Osteo Board Cert          */
     @11983    f1326601    03.  /*D.O. Board Certified             Non-Fed by Osteo Board Cert          */
     @11986    f1326698    03.  /*D.O. Board Certified             Non-Fed by Osteo Board Cert          */
     @11989    f1326707    03.  /*D.O. Not Board Certified         Non-Fed by Osteo Board Cert          */
     @11992    f1326704    03.  /*D.O. Not Board Certified         Non-Fed by Osteo Board Cert          */
     @11995    f1326703    03.  /*D.O. Not Board Certified         Non-Fed by Osteo Board Cert          */
     @11998    f1326701    03.  /*D.O. Not Board Certified         Non-Fed by Osteo Board Cert          */
     @12001    f1326798    03.  /*D.O. Not Board Certified         Non-Fed by Osteo Board Cert          */
     @12004    f1326807    03.  /*D.O. < 35                        Non-Fed by Age                       */
     @12007    f1326804    03.  /*D.O. < 35                        Non-Fed by Age                       */
     @12010    f1326803    03.  /*D.O. < 35                        Non-Fed by Age                       */
     @12013    f1326801    03.  /*D.O. < 35                        Non-Fed by Age                       */
     @12016    f1326898    03.  /*D.O. < 35                        Non-Fed by Age                       */
     @12019    f1326907    03.  /*D.O. 35-44                       Non-Fed by Age                       */
     @12022    f1326904    03.  /*D.O. 35-44                       Non-Fed by Age                       */
     @12025    f1326903    03.  /*D.O. 35-44                       Non-Fed by Age                       */
     @12028    f1326901    03.  /*D.O. 35-44                       Non-Fed by Age                       */
     @12031    f1326998    03.  /*D.O. 35-44                       Non-Fed by Age                       */
     @12034    f1327007    03.  /*D.O. 45-54                       Non-Fed by Age                       */
     @12037    f1327004    03.  /*D.O. 45-54                       Non-Fed by Age                       */
     @12040    f1327003    03.  /*D.O. 45-54                       Non-Fed by Age                       */
     @12043    f1327001    03.  /*D.O. 45-54                       Non-Fed by Age                       */
     @12046    f1327098    03.  /*D.O. 45-54                       Non-Fed by Age                       */
     @12049    f1327107    03.  /*D.O. 55-64                       Non-Fed by Age                       */
     @12052    f1327104    03.  /*D.O. 55-64                       Non-Fed by Age                       */
     @12055    f1327103    03.  /*D.O. 55-64                       Non-Fed by Age                       */
     @12058    f1327101    03.  /*D.O. 55-64                       Non-Fed by Age                       */
     @12061    f1327198    03.  /*D.O. 55-64                       Non-Fed by Age                       */
     @12064    f1327207    03.  /*D.O. 65-74                       Non-Fed by Age                       */
     @12067    f1327204    03.  /*D.O. 65-74                       Non-Fed by Age                       */
     @12070    f1327203    03.  /*D.O. 65-74                       Non-Fed by Age                       */
     @12073    f1327201    03.  /*D.O. 65-74                       Non-Fed by Age                       */
     @12076    f1327298    03.  /*D.O. 65-74                       Non-Fed by Age                       */
     @12079    f1327307    03.  /*D.O. > 74                        Non-Fed by Age                       */
     @12082    f1327304    03.  /*D.O. > 74                        Non-Fed by Age                       */
     @12085    f1327303    03.  /*D.O. > 74                        Non-Fed by Age                       */
     @12088    f1327301    03.  /*D.O. > 74                        Non-Fed by Age                       */
     @12091    f1327398    03.  /*D.O. > 74                        Non-Fed by Age                       */
     @12094    f1327407    03.  /*D.O. Age Unknown                 Non-Fed by Age                       */
     @12097    f1327404    03.  /*D.O. Age Unknown                 Non-Fed by Age                       */
     @12100    f1327403    03.  /*D.O. Age Unknown                 Non-Fed by Age                       */
     @12103    f1327401    03.  /*D.O. Age Unknown                 Non-Fed by Age                       */
     @12106    f1327498    03.  /*D.O. Age Unknown                 Non-Fed by Age                       */
     @12109    f1399107    03.  /*D.O. General/Family Practice     Non-Fed by Specialty Category        */
     @12112    f1399104    03.  /*D.O. General/Family Practice     Non-Fed by Specialty Category        */
     @12115    f1399103    03.  /*D.O. General/Family Practice     Non-Fed by Specialty Category        */
     @12118    f1327501    03.  /*D.O. General/Family Practice     Non-Fed by Primary Care Status       */
     @12121    f1327598    03.  /*D.O. General/Family Practice     Non-Fed by Primary Care Status       */
     @12124    f1399207    03.  /*D.O. General Pediatrics          Non-Fed by Specialty Category        */
     @12127    f1399204    03.  /*D.O. General Pediatrics          Non-Fed by Specialty Category        */
     @12130    f1399203    03.  /*D.O. General Pediatrics          Non-Fed by Specialty Category        */
     @12133    f1327601    03.  /*D.O. General Pediatrics          Non-Fed by Primary Care Status       */
     @12136    f1327698    03.  /*D.O. General Pediatrics          Non-Fed by Primary Care Status       */
     @12139    f1399307    03.  /*D.O. General Internal Medicine   Non-Fed by Specialty Category        */
     @12142    f1399304    03.  /*D.O. General Internal Medicine   Non-Fed by Specialty Category        */
     @12145    f1399303    03.  /*D.O. General Internal Medicine   Non-Fed by Specialty Category        */
     @12148    f1327701    03.  /*D.O. General Internal Medicine   Non-Fed by Primary Care Status       */
     @12151    f1327798    03.  /*D.O. General Internal Medicine   Non-Fed by Primary Care Status       */
     @12154    f1399407    03.  /*D.O. Obstetrics and Gynecology   Non-Fed by Specialty Category        */
     @12157    f1399404    03.  /*D.O. Obstetrics and Gynecology   Non-Fed by Specialty Category        */
     @12160    f1399403    03.  /*D.O. Obstetrics and Gynecology   Non-Fed by Specialty Category        */
     @12163    f1327801    03.  /*D.O. Obstetrics and Gynecology   Non-Fed by Primary Care Status       */
     @12166    f1327898    03.  /*D.O. Obstetrics and Gynecology   Non-Fed by Primary Care Status       */
     @12169    f1399507    03.  /*D.O. Osteopathic Specialties     Non-Fed by Specialty Category        */
     @12172    f1399504    03.  /*D.O. Osteopathic Specialties     Non-Fed by Specialty Category        */
     @12175    f1399503    03.  /*D.O. Osteopathic Specialties     Non-Fed by Specialty Category        */
     @12178    f1327901    03.  /*D.O. Osteo Manipulative Treatmt  Non-Fed by Primary Care Status       */
     @12181    f1327998    03.  /*D.O. Osteo Manipulative Treatmt  Non-Fed by Primary Care Status       */
     @12184    f1328001    03.  /*D.O. Non Primary Care            Non-Fed by Primary Care Status       */
     @12187    f1328098    03.  /*D.O. Non Primary Care            Non-Fed by Primary Care Status       */
     @12190    f1399607    03.  /*D.O. Other Specialty             Non-Fed by Specialty Category        */
     @12193    f1399604    03.  /*D.O. Other Specialty             Non-Fed by Specialty Category        */
     @12196    f1399603    03.  /*D.O. Other Specialty             Non-Fed by Specialty Category        */
     @12199    f1399707    03.  /*D.O. Presumed in Postdoc Train   Non-Fed by Specialty Category        */
     @12202    f1399704    03.  /*D.O. Presumed in Postdoc Train   Non-Fed by Specialty Category        */
     @12205    f1399703    03.  /*D.O. Presumed in Postdoc Train   Non-Fed by Specialty Category        */
     @12208    f1399807    03.  /*D.O. Specialty Unknown           Non-Fed by Specialty Category        */
     @12211    f1399804    03.  /*D.O. Specialty Unknown           Non-Fed by Specialty Category        */
     @12214    f1399803    03.  /*D.O. Specialty Unknown           Non-Fed by Specialty Category        */
     @12217    f1328101    03.  /*D.O. Primary Cre Status Unknown  Non-Fed by Primary Care Status       */
     @12220    f1328198    03.  /*D.O. Primary Cre Status Unknown  Non-Fed by Primary Care Status       */
     @12223    f1465010    05.  /*Dentists w/NPI                   With CMS NPI; See User Doc           */
     @12228    f1467009    05.  /*Dentists from State Boards       State Brds Lic; See User Doc         */
     @12233    f1318307    06.  /*Dentists, Total Prof Active      Non-Fed & Fed                        */
     @12239    f1318398    06.  /*Dentists, Total Prof Active      Non-Fed & Fed                        */
     @12245    f1318395    06.  /*Dentists, Total Prof Active      Non-Fed & Fed                        */
     @12251    f1317791    06.  /*Dentists, Total Prof Active      NF&Fed;Calc Field;See User Doc       */
     @12257    f1317107    06.  /*Dentists, Total Priv Practice    Non-Fed                              */
     @12263    f1317198    06.  /*Dentists, Total Priv Practice    Non-Fed                              */
     @12269    f1317195    06.  /*Dentists, Total Priv Practice    Non-Fed                              */
     @12275    f1317891    06.  /*Dentists, Total Priv Practice    NonFed;Calc Field;See User Doc       */
     @12281    f1317907    05.  /*Dentists, State or Local Govt    Non-Fed                              */
     @12286    f1317998    05.  /*Dentists, State or Local Govt    Non-Fed                              */
     @12291    f1317995    05.  /*Dentists, State or Local Govt    Non-Fed                              */
     @12296    f1328207    05.  /*Dent,Staff, Fac & Staf,Hlth Org  Non-Fed                              */
     @12301    f1328298    05.  /*Dent,Staff, Fac & Staf,Hlth Org  Non-Fed                              */
     @12306    f1318095    05.  /*Dentists, Hosp Stf or Other Org  Non-Fed                              */
     @12311    f1318107    05.  /*Dentists, Intern/Resident        Non-Fed                              */
     @12316    f1318198    05.  /*Dentists, Intern/Resident        Non-Fed                              */
     @12321    f1318195    05.  /*Dentists, Graduate Student       Non-Fed                              */
     @12326    f1318407    05.  /*Dent,Armed Forces & Oth Fed Srv  Fed                                  */
     @12331    f1318498    05.  /*Dent,Armed Forces & Oth Fed Srv  Fed                                  */
     @12336    f1318495    05.  /*Dent,Armed Forces & Oth Fed Srv  Fed                                  */
     @12341    f1328607    05.  /*Dentists, Faculty                Non-Fed                              */
     @12346    f1328698    05.  /*Dentists, Faculty                Non-Fed                              */
     @12351    f1409207    03.  /*Dentists,PT Faculty/PT Practice  Non-Fed                              */
     @12354    f1409307    02.  /*Dentists, Seeking Employment     Non-Fed; Not in Pratice              */
     @12356    f1328307    05.  /*Dentists, Other                  Non-Fed                              */
     @12361    f1328398    05.  /*Dentists, Other                  Non-Fed                              */
     @12366    f1328407    05.  /*Dentists, No Longer in Practice  Non-Fed                              */
     @12371    f1328498    05.  /*Dentists, Retired                Non-Fed                              */
     @12376    f1409407    05.  /*Dentists, Occup Type Unknown     Non-Fed                              */
     @12381    f1050607    06.  /*Dentists, Total, Priv Pract, FT  Non-Fed                              */
     @12387    f1050698    06.  /*Dentists, Total, Priv Pract, FT  Non-Fed                              */
     @12393    f1050695    06.  /*Dentists, Total, Priv Pract, FT  Non-Fed                              */
     @12399    f1050707    06.  /*Dentists, Total, Priv Pract, PT  Non-Fed                              */
     @12405    f1050798    06.  /*Dentists, Total, Priv Pract, PT  Non-Fed                              */
     @12411    f1050795    06.  /*Dentists, Total, Priv Pract, PT  Non-Fed                              */
     @12417    f1317207    06.  /*Dent, Total Male, Priv Pract     Non-Fed                              */
     @12423    f1317298    06.  /*Dent, Total Male, Priv Pract     Non-Fed                              */
     @12429    f1317295    06.  /*Dent, Total Male, Priv Pract     Non-Fed                              */
     @12435    f1317307    06.  /*Dent, Total Female, Priv Pract   Non-Fed                              */
     @12441    f1317398    06.  /*Dent, Total Female, Priv Pract   Non-Fed                              */
     @12447    f1317395    06.  /*Dent, Total Female, Priv Pract   Non-Fed                              */
     @12453    f1409507    03.  /*Dent, Gender Unknown,Priv Pract  Non-Fed                              */
     @12456    f0861300    07.  /*Dentists                         Table 1, Code 301                    */
     @12463    f0861390    06.  /*Dentists                                                              */
     @12469    f0861380    06.  /*Dentists                                                              */
     @12475    f0350687    05.  /*Dentists, Total Active           Non-Fed                              */
     @12480    f0350681    05.  /*Dentists, Total Active           Non-Fed                              */
     @12485    f1317407    06.  /*Dent, Priv Pract,Tot GPs & Ped   Non-Fed;General & Pediatrics         */
     @12491    f1317498    06.  /*Dent, Priv Pract,Tot GPs & Ped   Non-Fed;General & Pediatrics         */
     @12497    f1317495    06.  /*Dent, Priv Pract,Tot GPs & Ped   Non-Fed;General & Pediatrics         */
     @12503    f1317507    06.  /*Dent, Priv Pract,Tot Other Spec  Non-Fed;All Other Specialties        */
     @12509    f1317598    06.  /*Dent, Priv Pract,Tot Other Spec  Non-Fed;All Other Specialties        */
     @12515    f1317595    06.  /*Dent, Priv Pract,Tot Other Spec  Non-Fed;All Other Specialties        */
     @12521    f1049807    06.  /*# Active Dentists < 35           Non-Fed;Private Practice             */
     @12527    f1049898    06.  /*# Active Dentists < 35           Non-Fed;Private Practice             */
     @12533    f1049895    06.  /*# Active Dentists < 35           Non-Fed;Private Practice             */
     @12539    f1049887    05.  /*# Active Dentists < 35           Non-Fed                              */
     @12544    f1049881    05.  /*# Active Dentists < 35           Non-Fed                              */
     @12549    f1131807    06.  /*# Active Dentists 35-44          Non-Fed;Private Practice             */
     @12555    f1131898    06.  /*# Active Dentists 35-44          Non-Fed;Private Practice             */
     @12561    f1131895    06.  /*# Active Dentists 35-44          Non-Fed;Private Practice             */
     @12567    f1131887    05.  /*# Active Dentists 35-44          Non-Fed                              */
     @12572    f1049981    05.  /*# Active Dentists 35-39          Non-Fed                              */
     @12577    f1050081    05.  /*# Active Dentists 40-44          Non-Fed                              */
     @12582    f1131907    06.  /*# Active Dentists 45-54          Non-Fed;Private Practice             */
     @12588    f1131998    06.  /*# Active Dentists 45-54          Non-Fed;Private Practice             */
     @12594    f1131995    06.  /*# Active Dentists 45-54          Non-Fed;Private Practice             */
     @12600    f1131987    05.  /*# Active Dentists 45-54          Non-Fed                              */
     @12605    f1050181    05.  /*# Active Dentists 45-49          Non-Fed                              */
     @12610    f1050281    05.  /*# Active Dentists 50-54          Non-Fed                              */
     @12615    f1317607    06.  /*# Active Dentists 55-64          Non-Fed;Private Practice             */
     @12621    f1317698    06.  /*# Active Dentists 55-64          Non-Fed;Private Practice             */
     @12627    f1317695    06.  /*# Active Dentists 55-64          Non-Fed;Private Practice             */
     @12633    f1050387    05.  /*# Active Dentists 55-59          Non-Fed                              */
     @12638    f1050381    05.  /*# Active Dentists 55-59          Non-Fed                              */
     @12643    f1050487    05.  /*# Active Dentists 60-64          Non-Fed                              */
     @12648    f1050481    05.  /*# Active Dentists 60-64          Non-Fed                              */
     @12653    f1050507    06.  /*# Active Dentists 65 +           Non-Fed;Private Practice             */
     @12659    f1050598    06.  /*# Active Dentists 65 +           Non-Fed;Private Practice             */
     @12665    f1050595    06.  /*# Active Dentists 65 +           Non-Fed;Private Practice             */
     @12671    f1050587    05.  /*# Active Dentists 65 +           Non-Fed                              */
     @12676    f1050581    05.  /*# Active Dentists 65 +           Non-Fed                              */
     @12681    f1328507    05.  /*# Active Dentists Age Unknown    Non-Fed;Private Practice             */
     @12686    f1328598    05.  /*# Active Dentists Age Unknown    Non-Fed;Private Practice             */
     @12691    f1466909    05.  /*Licensed Dental Hygienists       State Brds Lic; See User Doc         */
     @12696    f0862800    07.  /*Dental Hygienists                Table 1, Code 331                    */
     @12703    f0862890    06.  /*Dental Hygienists                                                     */
     @12709    f0862880    06.  /*Dental Hygienists                                                     */
     @12715    f0863300    07.  /*Dental Assistants                Table 1, Code 364                    */
     @12722    f0863390    06.  /*Dental Assistants                                                     */
     @12728    f0863380    06.  /*Dental Assistants                                                     */
     @12734    f0864190    06.  /*Dental Lab/Med Appl. Technician                                       */
     @12740    f0864180    06.  /*Dental Lab/Med Appl. Technician                                       */
     @12746    f1464110    04.  /*Physician Assistants w/NPI       With CMS NPI; See User Doc           */
     @12750    f1322810    04.  /*Physician Assistants             Projections                          */
     @12754    f1322807    04.  /*Physician Assistants             Projections                          */
     @12758    f1322803    04.  /*Physician Assistants             Projections                          */
     @12762    f1322801    04.  /*Physician Assistants             Projections                          */
     @12766    f1322899    03.  /*Physician Assistants             Projections                          */
     @12769    f1322898    03.  /*Physician Assistants             Projections                          */
     @12772    f1322910    04.  /*Physician Assistants, Female     Projections                          */
     @12776    f1322907    04.  /*Physician Assistants, Female     Projections                          */
     @12780    f1322903    04.  /*Physician Assistants, Female     Projections                          */
     @12784    f1322901    04.  /*Physician Assistants, Female     Projections                          */
     @12788    f1322999    03.  /*Physician Assistants, Female     Projections                          */
     @12791    f1322998    03.  /*Physician Assistants, Female     Projections                          */
     @12794    f1323010    04.  /*Physician Assistants, Male       Projections                          */
     @12798    f1323007    04.  /*Physician Assistants, Male       Projections                          */
     @12802    f1323003    04.  /*Physician Assistants, Male       Projections                          */
     @12806    f1323001    04.  /*Physician Assistants, Male       Projections                          */
     @12810    f1323099    03.  /*Physician Assistants, Male       Projections                          */
     @12813    f1323098    03.  /*Physician Assistants, Male       Projections                          */
     @12816    f1366510    04.  /*Physician Assist,Gender Unknown  Projections                          */
     @12820    f1366507    04.  /*Physician Assist,Gender Unknown  Projections                          */
     @12824    f1366503    04.  /*Physician Assist,Gender Unknown  Projections                          */
     @12828    f1366501    04.  /*Physician Assist,Gender Unknown  Projections                          */
     @12832    f1366610    04.  /*Physician Assistants, Active     Projections                          */
     @12836    f1366607    04.  /*Physician Assistants, Active     Projections                          */
     @12840    f1366603    04.  /*Physician Assistants, Active     Projections                          */
     @12844    f1366601    04.  /*Physician Assistants, Active     Projections                          */
     @12848    f1395810    04.  /*Physician Assistants, Inactive   Projections                          */
     @12852    f1395807    04.  /*Physician Assistants, Inactive   Projections                          */
     @12856    f1395803    04.  /*Physician Assistants, Inactive   Projections                          */
     @12860    f1395903    04.  /*Physician Assistants, Prim Care  Projections                          */
     @12864    f1396003    04.  /*Physician Assistants, Surg Spec  Projections                          */
     @12868    f1396103    04.  /*Physician Assistants,Other Spec  Projections                          */
     @12872    f1396203    04.  /*Physician Assistants, Unk Spec   Projections                          */
     @12876    f0862600    07.  /*Physician Assistants             Table 1, Code 311                    */
     @12883    f0862690    06.  /*Physician Assistants                                                  */
     @12889    f0862680    06.  /*Physician Assistants                                                  */
     @12895    f1464610    04.  /*Adv Practice Regist Nurse w/NPI  APRN;W/CMS NPI; See User Doc         */
     @12899    f1464210    04.  /*Nurse Practitioners w/NPI        With CMS NPI; See User Doc           */
     @12903    f1367501    05.  /*Nurse Practitioners                                                   */
     @12908    f1464310    04.  /*Clinical Nurse Specialist w/NPI  CNS; W/CMS NPI; See User Doc         */
     @12912    f1464410    04.  /*Cert Regist Nurs Anesthet w/NPI  CRNA;W/CMS NPI; See User Doc         */
     @12916    f1423709    05.  /*Cert Regist Nurse Anesthetists   CRNA;State Brds Lic; See User        */
     @12921    f1464510    04.  /*Adv Pract Nurse Midwives w/NPI   With CMS NPI; See User Doc           */
     @12925    f1396311    03.  /*Certified Nurse Midwives                                              */
     @12928    f1396303    03.  /*Certified Nurse Midwives                                              */
     @12931    f1396403    03.  /*Certified Nurse Midwives, FT     Full Time (35 or more hours)         */
     @12934    f1396503    03.  /*Certified Nurse Midwives, PT     Part Time (34 or less hours)         */
     @12937    f1396603    03.  /*Cert Nurse Midwvs,Retrd/Not Emp  Retired or Not Emloyed               */
     @12940    f1396703    03.  /*Cert Nurse Midwve,Unk Emp Stat   No Response                          */
     @12943    f1396803    03.  /*Cert Nurse Midwvs,FT Hosp/Med    Hospital/Medical Center              */
     @12946    f1396903    03.  /*Cert Nurse Midwvs,FT Mid/PhysPr  Midwife or Phys Owned Practice       */
     @12949    f1397003    03.  /*Cert Nurse Midwvs,FT Educ Inst   Educational Institution              */
     @12952    f1397103    03.  /*Cert Nurse Midwvs,FT Oth EmpTyp  Other Employment Type                */
     @12955    f1397203    03.  /*Cert Nurse Midwvs,FT Unk EmpTyp  No Responded to Employmnt Type       */
     @12958    f0861900    07.  /*Registered Nurses                Table 1, Code 313                    */
     @12965    f0861990    06.  /*Registered Nurses                                                     */
     @12971    f0861980    06.  /*Registered Nurses                                                     */
     @12977    f0863100    07.  /*LPNs/LVNs                        Table 1, Code 350                    */
     @12984    f0863190    06.  /*Licensed Practical Nurses                                             */
     @12990    f0863180    06.  /*Licensed Practical Nurses                                             */
     @12996    f1464810    04.  /*Chiropractors w/NPI              With CMS NPI; See User Doc           */
     @13000    f1466809    05.  /*Licensed Chiropractors           State Brds Lic; See User Doc         */
     @13005    f1366701    04.  /*Chiropractors                                                         */
     @13009    f1393800    07.  /*Chiropractors                    Table 1, Code 300                    */
     @13016    f1393900    07.  /*Dieticians and Nutritionists     Table 1, Code 303                    */
     @13023    f0862090    06.  /*Dieticians                                                            */
     @13029    f0862080    06.  /*Dieticians                                                            */
     @13035    f1464910    04.  /*Optometrists w/NPI               With CMS NPI; See User Doc           */
     @13039    f1423909    05.  /*Licensed Optometrists            State Brds Lic; See User Doc         */
     @13044    f0861500    07.  /*Optometrists                     Table 1, Code 304                    */
     @13051    f0861590    06.  /*Optometrists                                                          */
     @13057    f0861580    06.  /*Optometrists                                                          */
     @13063    f1424009    05.  /*Licensed Pharmacists             State Brds Lic; See User Doc         */
     @13068    f0861800    07.  /*Pharmacists                      Table 1, Code 305                    */
     @13075    f0861890    06.  /*Pharmacists                                                           */
     @13081    f0861880    06.  /*Pharmacists                                                           */
     @13087    f1464710    04.  /*Podiatrists w/NPI                With CMS NPI; See User Doc           */
     @13091    f1424209    05.  /*Licensed Podiatrists             State Brds Lic; See User Doc         */
     @13096    f0861400    07.  /*Podiatrists                      Table 1, Code 312                    */
     @13103    f0861490    06.  /*Podiatrists                                                           */
     @13109    f0861480    06.  /*Podiatrists                                                           */
     @13115    f1423609    05.  /*Licensed Audiologists            State Brds Lic; See User Doc         */
     @13120    f1394000    07.  /*Audiologists                     Table 1, Code 314                    */
     @13127    f0862200    07.  /*Occupational Therapists          Table 1, Code 315                    */
     @13134    f0862290    06.  /*Occupational Therapists                                               */
     @13140    f0862280    06.  /*Occupational Therapists                                               */
     @13146    f1467109    05.  /*Licensed Physical Therapists     State Brds Lic; See User Doc         */
     @13151    f0862300    07.  /*Physical Therapists              Table 1, Code 316                    */
     @13158    f0862390    06.  /*Physical Therapists                                                   */
     @13164    f0862380    06.  /*Physical Therapists                                                   */
     @13170    f1394100    07.  /*Radiation Therapists             Table 1, Code 320                    */
     @13177    f1394200    07.  /*Recreational Therapists          Table 1, Code 321                    */
     @13184    f0862100    07.  /*Respiratory Therapists           Table 1, Code 322                    */
     @13191    f0862190    06.  /*Respiratory Therapists                                                */
     @13197    f0862180    06.  /*Inhalation Therapists                                                 */
     @13203    f1424409    05.  /*Licensed Speech-Language Path    State Brds Lic; See User Doc         */
     @13208    f0862400    07.  /*Speech-Language Pathologists     Table 1, Code 323                    */
     @13215    f0862490    06.  /*Speech Therapists                                                     */
     @13221    f0862480    06.  /*Speech Therapists                                                     */
     @13227    f1394300    07.  /*Therapists, All Other            Table 1, Code 324                    */
     @13234    f0862590    06.  /*Therapists,N.E.C.                Not Elsewhere Classified             */
     @13240    f0862580    06.  /*Therapists,N.E.C.                Not Elsewhere Classified             */
     @13246    f0861600    07.  /*Veterinarians                    Table 1, Code 325                    */
     @13253    f0861690    06.  /*Veterinarians                                                         */
     @13259    f0861680    06.  /*Veterinarians                                                         */
     @13265    f1394400    07.  /*Hlth Diag&Treat Practioners,Oth  Table 1, Code 326                    */
     @13272    f0861790    06.  /*Health Diag Practitioners,N.E.C  Not Elsewhere Classified             */
     @13278    f0861780    06.  /*Health Diag Practitioners,N.E.C  Not Elsewhere Classified             */
     @13284    f1395700    07.  /*Healthcare Practitioner Prof     Table 3, Code 03, All Counties       */
     @13291    f0862700    07.  /*Clinic Lab Technlgsts&Techncns   Table 1, Code 330                    */
     @13298    f0862790    06.  /*Clinical Laboratory Technicians                                       */
     @13304    f0862780    06.  /*Clinical Laboratory Technicians                                       */
     @13310    f1394500    07.  /*Diag Relatd Technlgsts&Techncns  Table 1, Code 332                    */
     @13317    f1394600    07.  /*Emerg Med Technicns&Paramedics   Table 1, Code 340                    */
     @13324    f1394700    07.  /*Hlth Diag&Treat Practr SuppTech  Table 1, Code 341                    */
     @13331    f0862900    07.  /*Med Records & Health Info Techs  Table 1, Code 351                    */
     @13338    f0862990    06.  /*Health Record Technicians                                             */
     @13344    f0862980    06.  /*Health Record Technicians                                             */
     @13350    f0864000    07.  /*Opticians, Dispensing            Table 1, Code 352                    */
     @13357    f0864090    06.  /*Optical Goods Workers                                                 */
     @13363    f0864080    06.  /*Optical Goods Workers                                                 */
     @13369    f1394800    07.  /*Misc Hlth Technlgsts&Techncns    Table 1, Code 353                    */
     @13376    f1394900    07.  /*Oth Hlthcare Practr & Tech Occp  Table 1, Code 354                    */
     @13383    f1395000    07.  /*Nursing,Psych,& Home Hlth Aides  Table 1, Code 360                    */
     @13390    f0863590    06.  /*Nurs Aides Orderlies/Attendents                                       */
     @13396    f0863580    06.  /*Nurs Aides Orderlies/Attendents                                       */
     @13402    f0863490    06.  /*Health Aides Except Nursing                                           */
     @13408    f0863480    06.  /*Health Aides Except Nursing                                           */
     @13414    f1395100    07.  /*Occuptn Therapist Assists/Aides  Table 1, Code 361                    */
     @13421    f1395200    07.  /*Physical Therapst Assists/Aides  Table 1, Code 362                    */
     @13428    f1395300    07.  /*Massage Therapists               Table 1, Code 363                    */
     @13435    f1395400    07.  /*Med Asst&Oth Hlthcare Supp Occp  Table 1, Code 365                    */
     @13442    f0863900    07.  /*Medical Scientists               Table 1, Code 165                    */
     @13449    f0863990    06.  /*Medical Scientists                                                    */
     @13455    f0863980    06.  /*Medical Scientists                                                    */
     @13461    f1424309    05.  /*Licensed Psychologists           State Brds Lic; See User Doc         */
     @13466    f1249500    07.  /*Psychologists                    Table 1, Code 182                    */
     @13473    f1249590    06.  /*Psychologists                                                         */
     @13479    f1249690    06.  /*Sociologists                                                          */
     @13485    f1395500    07.  /*Misc Social Scientist,Sociolgst  Table 1, Code 186                    */
     @13492    f1249800    07.  /*Social Workers                   Table 1, Code 201                    */
     @13499    f1249890    06.  /*Social Workers                                                        */
     @13505    f1395600    07.  /*Misc Comm&Social Serv Speclsts   Table 1, Code 202                    */
     @13512    f0863090    06.  /*Radiologic Technicians                                                */
     @13518    f0863080    06.  /*Radiologic Technicians                                                */
     @13524    f0863290    06.  /*Health Tech N.E.C.               Not Elsewhere Classified             */
     @13530    f0863280    06.  /*Health Tech N.E.C.               Not Elsewhere Classified             */
     @13536    f0863690    06.  /*Managers Medicine/Health                                              */
     @13542    f0863680    06.  /*Managers Medicine/Health                                              */
     @13548    f0863790    06.  /*Medical Science Teachers                                              */
     @13554    f0863780    06.  /*Medical Science Teachers                                              */
     @13560    f0863890    06.  /*Health Specialties Teachers                                           */
     @13566    f0863880    06.  /*Health Specialties Teachers                                           */
     @13572    f1249390    06.  /*Psychology Teachers                                                   */
     @13578    f1249490    06.  /*Social Work Teachers                                                  */
     @13584    f0886808    03.  /*Total Number Hospitals                                                */
     @13587    f0886807    03.  /*Total Number Hospitals                                                */
     @13590    f0886806    03.  /*Total Number Hospitals                                                */
     @13593    f0886805    03.  /*Total Number Hospitals                                                */
     @13596    f0886800    03.  /*Total Number Hospitals                                                */
     @13599    f0886908    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13602    f0886907    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13605    f0886906    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13608    f0886905    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13611    f0886900    03.  /*# Short Term General Hosps       Coded '10-1'                         */
     @13614    f0887008    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13617    f0887007    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13620    f0887006    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13623    f0887005    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13626    f0887000    03.  /*# Short Term Non-General Hosps   Coded Not='10' & ='1'                */
     @13629    f0887108    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13632    f0887107    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13635    f0887106    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13638    f0887105    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13641    f0887100    03.  /*# Long Term Hospitals            Coded LOS = '2'                      */
     @13644    f1318508    02.  /*# Psychiatric Short Term Hosps   Short Term Hospitals                 */
     @13646    f1318608    02.  /*# Rehabilitation ST Hosps        Short Term Hospitals                 */
     @13648    f1466608    02.  /*# Children's Gen Med/Srg ST Hsp  Short Term Hospitals                 */
     @13650    f1318708    02.  /*# Children's Psych ST Hosps      Short Term Hospitals                 */
     @13652    f1411808    02.  /*# Acute Long-Term Care ST Hosps  Short Term Hospitals                 */
     @13654    f1067708    02.  /*# Gen Medical/Surgical LT Hosps  Long Term Hospitals                  */
     @13656    f1067808    02.  /*# Psychiatric LT Hosps           Long Term Hospitals                  */
     @13658    f1067908    02.  /*# Rehabilitation LT Hosps        Long Term Hospitals                  */
     @13660    f1068008    02.  /*# Chronic Disease LT Hosps       Long Term Hospitals                  */
     @13662    f1068208    02.  /*# Instn/Mentally Retrd LT Hosps  Long Term Hospitals                  */
     @13664    f1068308    02.  /*# Children's Psych LT Hosps      Long Term Hospitals                  */
     @13666    f1411908    02.  /*# Acute Long-Term Care LT Hosps  Long Term Hospitals                  */
     @13668    f0887208    03.  /*# Short Term Community Hosps     See User Doc For Definition          */
     @13671    f0887205    03.  /*# Short Term Community Hosps     See User Doc For Definition          */
     @13674    f0887200    03.  /*# Short Term Community Hosps     See User Doc For Definition          */
     @13677    f0887608    02.  /*# Veterans' Hospitals            Coded Hosp Control = '45'            */
     @13679    f1403108    02.  /*# Critical Access Hospitals      Total Hospitals                      */
     @13681    f1403208    02.  /*# Critical Access ST Gen Hosps   Short Term General Hospitals         */
     @13683    f1403308    02.  /*# Rural Referral Centers         Total Hospitals                      */
     @13685    f1403408    02.  /*# Sole Community Providers       Total Hospitals                      */
     @13687    f1241708    02.  /*# Hosp Participating in Network  Total Hospitals                      */
     @13689    f0887708    03.  /*# Hosp W/JCAHO Accreditation     Short Term General Hospitals         */
     @13692    f0887808    03.  /*# Hosp W/JCAHO Accreditation     ST Non-Gen + Long Term Hosps         */
     @13695    f0887908    02.  /*# Hosp W/Residency Training      Short Term General Hospitals         */
     @13697    f0888008    02.  /*# Hosp W/Residency Training      ST Non-Gen + Long Term Hosps         */
     @13699    f0888108    02.  /*# Hosp W/Medical School Affiln   Short Term General Hospitals         */
     @13701    f0888208    02.  /*# Hosp W/Medical School Affiln   ST Non-Gen + Long Term Hosps         */
     @13703    f0888308    02.  /*# Hosp W/Medical School Affiln   Veterans Hospitals                   */
     @13705    f0888608    02.  /*# Hosp W/Prof Nursing School     Short Term General Hospitals         */
     @13707    f0888708    02.  /*# Hosp W/Prof Nursing School     Short Term Community                 */
     @13709    f0888908    02.  /*# Hosp W/Prof Nursing School     ST Non-Gen + Long Term Hosps         */
     @13711    f0889008    02.  /*# Member Council Teaching Hosp   Short Term General                   */
     @13713    f0889108    02.  /*# Member Council Teaching Hosp   Veterans Hospitals                   */
     @13715    f0889208    02.  /*# Member Council Teaching Hosp   Short Term Community                 */
     @13717    f0889408    02.  /*# Member Council Teaching Hosp   ST Non-Gen + Long Term Hosps         */
     @13719    f0889508    02.  /*# Hsp W/Amer Osteo Assoc Accred  Short Term General Hospitals         */
     @13721    f0889608    02.  /*# Hsp W/Amer Osteo Assoc Accred  ST Non-Gen + Long Term Hosps         */
     @13723    f0889708    02.  /*# Hsp W/Amer Osteo Assoc Intern  Short Term General Hospitals         */
     @13725    f0889808    02.  /*# Hsp W/Amer Osteo Assoc Intern  ST Non-Gen + Long Term Hosps         */
     @13727    f0889908    02.  /*# Hsp W/Amer Osteo Assoc Residn  Short Term General Hospitals         */
     @13729    f0890008    02.  /*# Hsp W/Amer Osteo Assoc Residn  ST Non-Gen + Long Term Hosps         */
     @13731    f0890308    03.  /*#Hsp W/Blue Crss Contrct/Partcn  Short Term General Hospitals         */
     @13734    f0890408    03.  /*#Hsp W/Blue Crss Contrct/Partcn  ST Non-Gen + Long Term Hosps         */
     @13737    f0890508    03.  /*# Hosp W/Medicare Certification  Short Term General Hospitals         */
     @13740    f0890608    03.  /*# Hosp W/Medicare Certification  ST Non-Gen + Long Term Hosps         */
     @13743    f0890908    08.  /*Hospital Admissions              Total Hospitals                      */
     @13751    f0890907    08.  /*Hospital Admissions              Total Hospitals                      */
     @13759    f0890906    08.  /*Hospital Admissions              Total Hospitals                      */
     @13767    f0890905    08.  /*Hospital Admissions              Total Hospitals                      */
     @13775    f0890900    08.  /*Hospital Admissions              Total Hospitals                      */
     @13783    f0891008    07.  /*Short Term Gen Hosp Admissions                                        */
     @13790    f0891007    07.  /*Short Term Gen Hosp Admissions                                        */
     @13797    f0891006    07.  /*Short Term Gen Hosp Admissions                                        */
     @13804    f0891005    09.  /*Short Term Gen Hosp Admissions                                        */
     @13813    f0891000    09.  /*Short Term Gen Hosp Admissions                                        */
     @13822    f0891108    07.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13829    f0891107    07.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13836    f0891106    07.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13843    f0891105    09.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13852    f0891100    09.  /*STNG/LT, Hosp Admissions         ST Non-Gen + Long Term Hosps         */
     @13861    f0891208    07.  /*Short Term Community Hosp Admis                                       */
     @13868    f0891205    09.  /*Short Term Community Hosp Admis                                       */
     @13877    f0891200    09.  /*Short Term Community Hosp Admis                                       */
     @13886    f0892008    06.  /*Veterans' Hospital Admissions                                         */
     @13892    f1405308    06.  /*Nurs Home Admissions, Tot Hosp   Total Hospitals                      */
     @13898    f1405307    06.  /*Nurs Home Admissions, Tot Hosp   Total Hospitals                      */
     @13904    f1405306    06.  /*Nurs Home Admissions, Tot Hosp   Total Hospitals                      */
     @13910    f1405305    06.  /*Nurs Home Admissions, Tot Hosp   Total Hospitals                      */
     @13916    f1405408    06.  /*Nurs Home Admissions,STGEN Hosp  Short Term General Hospitals         */
     @13922    f1405407    06.  /*Nurs Home Admissions,STGEN Hosp  Short Term General Hospitals         */
     @13928    f1405406    06.  /*Nurs Home Admissions,STGEN Hosp  Short Term General Hospitals         */
     @13934    f1405405    06.  /*Nurs Home Admissions,STGEN Hosp  Short Term General Hospitals         */
     @13940    f1405508    06.  /*Nurs Home Admissions, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @13946    f1405507    06.  /*Nurs Home Admissions, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @13952    f1405506    06.  /*Nurs Home Admissions, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @13958    f1405505    06.  /*Nurs Home Admissions, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @13964    f0892108    06.  /*Hospital Beds                    Total Hospitals                      */
     @13970    f0892107    07.  /*Hospital Beds                    Total Hospitals                      */
     @13977    f0892106    07.  /*Hospital Beds                    Total Hospitals                      */
     @13984    f0892105    07.  /*Hospital Beds                    Total Hospitals                      */
     @13991    f0892100    07.  /*Hospital Beds                    Total Hospitals                      */
     @13998    f0892208    06.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @14004    f0892207    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @14011    f0892206    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @14018    f0892205    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @14025    f0892200    07.  /*Short Term General Hosp Beds     Coded '10-1'                         */
     @14032    f0892308    06.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @14038    f0892307    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @14045    f0892306    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @14052    f0892305    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @14059    f0892300    07.  /*Short Term Non-Gen Hosp Beds     Coded Not='10' & ='1'                */
     @14066    f0892408    06.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14072    f0892407    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14079    f0892406    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14086    f0892405    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14093    f0892400    07.  /*Long Term Hosp Beds              Coded LOS='2'                        */
     @14100    f0892508    06.  /*Short Term Community Hosp Beds                                        */
     @14106    f0892505    07.  /*Short Term Community Hosp Beds                                        */
     @14113    f0892500    07.  /*Short Term Community Hosp Beds                                        */
     @14120    f0892908    06.  /*Veterans' Hospital Beds                                               */
     @14126    f1404908    05.  /*Nursing Home Beds, Total Hosp    Total Hospitals                      */
     @14131    f1404907    05.  /*Nursing Home Beds, Total Hosp    Total Hospitals                      */
     @14136    f1404906    05.  /*Nursing Home Beds, Total Hosp    Total Hospitals                      */
     @14141    f1404905    05.  /*Nursing Home Beds, Total Hosp    Total Hospitals                      */
     @14146    f1405008    05.  /*Nursing Home Beds, ST Gen Hosp   Short Term General Hospitals         */
     @14151    f1405007    05.  /*Nursing Home Beds, ST Gen Hosp   Short Term General Hospitals         */
     @14156    f1405006    05.  /*Nursing Home Beds, ST Gen Hosp   Short Term General Hospitals         */
     @14161    f1405005    05.  /*Nursing Home Beds, ST Gen Hosp   Short Term General Hospitals         */
     @14166    f1405108    05.  /*Nursing Home Beds, STNG Hosp     Short Tern Non-Gen Hospitals         */
     @14171    f1405107    05.  /*Nursing Home Beds, STNG Hosp     Short Tern Non-Gen Hospitals         */
     @14176    f1405106    05.  /*Nursing Home Beds, STNG Hosp     Short Tern Non-Gen Hospitals         */
     @14181    f1405105    05.  /*Nursing Home Beds, STNG Hosp     Short Tern Non-Gen Hospitals         */
     @14186    f1405208    05.  /*Nursing Home Beds,Long Term Hsp  Long Term Hospitals                  */
     @14191    f1405207    05.  /*Nursing Home Beds,Long Term Hsp  Long Term Hospitals                  */
     @14196    f1405206    05.  /*Nursing Home Beds,Long Term Hsp  Long Term Hospitals                  */
     @14201    f1405205    05.  /*Nursing Home Beds,Long Term Hsp  Long Term Hospitals                  */
     @14206    f1404108    06.  /*Licensed Beds, Total Hospital    Incl Nurs Home;Total Hosps           */
     @14212    f1404107    07.  /*Licensed Beds, Total Hospital    Incl Nurs Home;Total Hosps           */
     @14219    f1404106    07.  /*Licensed Beds, Total Hospital    Incl Nurs Home;Total Hosps           */
     @14226    f1404105    07.  /*Licensed Beds, Total Hospital    Incl Nurs Home;Total Hosps           */
     @14233    f1404208    06.  /*Licensed Beds, Short Term Hosp   Incl Nurs Homes                      */
     @14239    f1404207    07.  /*Licensed Beds, Short Term Hosp   Incl Nurs Homes                      */
     @14246    f1404206    07.  /*Licensed Beds, Short Term Hosp   Incl Nurs Homes                      */
     @14253    f1404205    07.  /*Licensed Beds, Short Term Hosp   Incl Nurs Homes                      */
     @14260    f1404308    06.  /*Licensed Beds,Short Non-Gen Hsp  Incl Nurs Homes                      */
     @14266    f1404307    07.  /*Licensed Beds,Short Non-Gen Hsp  Incl Nurs Homes                      */
     @14273    f1404306    07.  /*Licensed Beds,Short Non-Gen Hsp  Incl Nurs Homes                      */
     @14280    f1404305    07.  /*Licensed Beds,Short Non-Gen Hsp  Incl Nurs Homes                      */
     @14287    f1404408    06.  /*Licensed Beds, Long Term Hosp    Incl Nurs Homes                      */
     @14293    f1404407    07.  /*Licensed Beds, Long Term Hosp    Incl Nurs Homes                      */
     @14300    f1404406    07.  /*Licensed Beds, Long Term Hosp    Incl Nurs Homes                      */
     @14307    f1404405    07.  /*Licensed Beds, Long Term Hosp    Incl Nurs Homes                      */
     @14314    f1404508    05.  /*Licensed Nursing Home Beds       Total Hospitals                      */
     @14319    f1404507    05.  /*Licensed Nursing Home Beds       Total Hospitals                      */
     @14324    f1404506    05.  /*Licensed Nursing Home Beds       Total Hospitals                      */
     @14329    f1404505    05.  /*Licensed Nursing Home Beds       Total Hospitals                      */
     @14334    f1404608    05.  /*Licensed Nurs Home Beds, STGEN   Short Term General Hospitals         */
     @14339    f1404607    05.  /*Licensed Nurs Home Beds, STGEN   Short Term General Hospitals         */
     @14344    f1404606    05.  /*Licensed Nurs Home Beds, STGEN   Short Term General Hospitals         */
     @14349    f1404605    05.  /*Licensed Nurs Home Beds, STGEN   Short Term General Hospitals         */
     @14354    f1404708    05.  /*Licensed Nurs Home Beds, STNG    Short Tern Non-Gen Hospitals         */
     @14359    f1404707    05.  /*Licensed Nurs Home Beds, STNG    Short Tern Non-Gen Hospitals         */
     @14364    f1404706    05.  /*Licensed Nurs Home Beds, STNG    Short Tern Non-Gen Hospitals         */
     @14369    f1404705    05.  /*Licensed Nurs Home Beds, STNG    Short Tern Non-Gen Hospitals         */
     @14374    f1404808    05.  /*Licensed Nurs Home Beds, LT      Long Term Hospitals                  */
     @14379    f1404807    05.  /*Licensed Nurs Home Beds, LT      Long Term Hospitals                  */
     @14384    f1404806    05.  /*Licensed Nurs Home Beds, LT      Long Term Hospitals                  */
     @14389    f1404805    05.  /*Licensed Nurs Home Beds, LT      Long Term Hospitals                  */
     @14394    f0893008    05.  /*Bassinets Set Up & Staffed       Short Term General Hospitals         */
     @14399    f0893005    06.  /*Bassinets Set Up & Staffed       Short Term General Hospitals         */
     @14405    f0893000    06.  /*Bassinets Set Up & Staffed       Short Term General Hospitals         */
     @14411    f0893108    05.  /*Bassinets Set Up & Staffed       ST Non-Gen + Long Term Hosps         */
     @14416    f0893105    06.  /*Bassinets Set Up & Staffed       ST Non-Gen + Long Term Hosps         */
     @14422    f0893100    06.  /*Bassinets Set Up & Staffed       ST Non-Gen + Long Term Hosps         */
     @14428    f1138608    03.  /*# ST Gen Hosp, 006-049 Beds                                           */
     @14431    f1138605    03.  /*# ST Gen Hosp, 006-049 Beds                                           */
     @14434    f1138600    03.  /*# ST Gen Hosp, 006-049 Beds                                           */
     @14437    f1138708    03.  /*# ST Gen Hosp, 050-099 Beds                                           */
     @14440    f1138705    03.  /*# ST Gen Hosp, 050-099 Beds                                           */
     @14443    f1138700    03.  /*# ST Gen Hosp, 050-099 Beds                                           */
     @14446    f1138808    03.  /*# ST Gen Hosp, 100-199 Beds                                           */
     @14449    f1138805    03.  /*# ST Gen Hosp, 100-199 Beds                                           */
     @14452    f1138800    03.  /*# ST Gen Hosp, 100-199 Beds                                           */
     @14455    f1138908    03.  /*# ST Gen Hosp, 200-299 Beds                                           */
     @14458    f1138905    03.  /*# ST Gen Hosp, 200-299 Beds                                           */
     @14461    f1138900    03.  /*# ST Gen Hosp, 200-299 Beds                                           */
     @14464    f1139008    03.  /*# ST Gen Hosp, 300+ Beds                                              */
     @14467    f1139005    03.  /*# ST Gen Hosp, 300+ Beds                                              */
     @14470    f1139000    03.  /*# ST Gen Hosp, 300+ Beds                                              */
     @14473    f1139908    03.  /*# STNG/LT Hosps,006-049 Beds     ST Non-Gen + Long Term Hosps         */
     @14476    f1140008    03.  /*# STNG/LT Hosps,050-099 Beds     ST Non-Gen + Long Term Hosps         */
     @14479    f1140108    03.  /*# STNG/LT Hosps,100-199 Beds     ST Non-Gen + Long Term Hosps         */
     @14482    f1140208    03.  /*# STNG/LT Hosps,200-299 Beds     ST Non-Gen + Long Term Hosps         */
     @14485    f1140308    03.  /*# STNG/LT Hosps,300+ Beds        ST Non-Gen + Long Term Hosps         */
     @14488    f1140408    02.  /*# Veteran Hosp, 006-049 Beds                                          */
     @14490    f1140508    02.  /*# Veteran Hosp, 050-099 Beds                                          */
     @14492    f1140608    02.  /*# Veteran Hosp, 100-199 Beds                                          */
     @14494    f1140708    02.  /*# Veteran Hosp, 200-299 Beds                                          */
     @14496    f1140808    02.  /*# Veteran Hosp, 300+ Beds                                             */
     @14498    f1256208    03.  /*# Hosp W/Gen Med/Surg Cr, Adult  Short Term General Hospitals         */
     @14501    f1256308    03.  /*# Hosp W/Gen Med/Surg Care, Ped  Short Term General Hospitals         */
     @14504    f1256408    03.  /*# Hosp W/Obstetric Care          Short Term General Hospitals         */
     @14507    f1256508    03.  /*# Hosp W/Medical/Surg Intens Cr  Short Term General Hospitals         */
     @14510    f1256608    03.  /*# Hosp W/Cardiac Intensive Care  Short Term General Hospitals         */
     @14513    f1256708    03.  /*# Hosp W/Neonatal Intens Care    Short Term General Hospitals         */
     @14516    f1256808    03.  /*# Hosp W/Neonatal Intermed Care  Short Term General Hospitals         */
     @14519    f1256908    03.  /*# Hosp W/Pediatric Intens Care   Short Term General Hospitals         */
     @14522    f1257008    03.  /*# Hosp W/Burn Care               Short Term General Hospitals         */
     @14525    f1257108    03.  /*# Hosp W/Other Special Care      Short Term General Hospitals         */
     @14528    f1331008    03.  /*# Hosp W/Other Intensive Care    Short Term General Hospitals         */
     @14531    f1257208    03.  /*# Hosp W/Physical Rehab Care     Short Term General Hospitals         */
     @14534    f1257308    03.  /*# Hosp W/Alc/Drug Abuse IP Care  Short Term General Hospitals         */
     @14537    f1257408    03.  /*# Hosp W/Psychiatric Care        Short Term General Hospitals         */
     @14540    f1257508    03.  /*# Hosp W/Skilled Nursing Care    Short Term General Hospitals         */
     @14543    f1257608    03.  /*# Hosp W/Intermediate Nurs Care  Short Term General Hospitals         */
     @14546    f1331208    03.  /*# Hosp W/Acute Long-Term Care    Short Term General Hospitals         */
     @14549    f1257708    03.  /*# Hosp W/Other Long-Term Care    Short Term General Hospitals         */
     @14552    f1257808    03.  /*# Hosp W/Other Care              Short Term General Hospitals         */
     @14555    f1257908    03.  /*# Hosp W/Adult Day Care Program  Short Term General Hospitals         */
     @14558    f1392808    03.  /*# Hosp W/Airborne Inf Isol Room  Short Term General Hospitals         */
     @14561    f1258008    03.  /*# Hosp W/Alc/Drug Abuse OP Serv  Short Term General Hospitals         */
     @14564    f1400008    03.  /*# Hosp W/Alzheimer Center        Short Term General Hospitals         */
     @14567    f1361308    03.  /*# Hosp W/Ambulance Services      Short Term General Hospitals         */
     @14570    f1412708    03.  /*# Hosp W/Ambulatory Surgery Ctr  Short Term General Hospitals         */
     @14573    f1258208    03.  /*# Hosp W/Arthritis Treatmt Cntr  Short Term General Hospitals         */
     @14576    f1258308    03.  /*# Hosp W/Assisted Living         Short Term General Hospitals         */
     @14579    f1331308    03.  /*# Hosp W/Auxiliary Services      Short Term General Hospitals         */
     @14582    f1393008    03.  /*# Hosp W/Bariart/Wgt Cntrl Serv  Short Term General Hospitals         */
     @14585    f1258408    03.  /*# Hsp W/Birth Rm/LDR Rm/LDRP Rm  Short Term General Hospitals         */
     @14588    f1409608    03.  /*# Hosp W/Blood Donor Center      Short Term General Hospitals         */
     @14591    f1258508    03.  /*# Hosp W/Breast Cancer Scrn/Mam  Short Term General Hospitals         */
     @14594    f1406808    03.  /*#Hsp W/Adlt Diagn/Invasive Cath  Short Term General Hospitals         */
     @14597    f1406908    03.  /*# Hsp W/Ped Diagn/Invasive Cath  Short Term General Hospitals         */
     @14600    f1407008    03.  /*#Hsp W/Adlt Intervntnl Card Cth  Short Term General Hospitals         */
     @14603    f1407108    03.  /*#Hsp W/Ped Intervntnl Card Cath  Short Term General Hospitals         */
     @14606    f1407208    03.  /*# Hosp W/Adult Cardiac Surgery   Short Term General Hospitals         */
     @14609    f1407308    03.  /*# Hosp W/Ped Cardiac Surgery     Short Term General Hospitals         */
     @14612    f1466108    03.  /*#Hsp W/Adult Cardiac Electrophy  Short Term General Hospitals         */
     @14615    f1466208    03.  /*# Hosp W/Ped Cardiac Electrophy  Short Term General Hospitals         */
     @14618    f1409708    03.  /*# Hosp W/Cardiac Rehabilitation  Short Term General Hospitals         */
     @14621    f1258708    03.  /*# Hosp W/Case Management         Short Term General Hospitals         */
     @14624    f1410908    03.  /*# Hosp W/Case Management         ST Non-Gen + Long Term Hosps         */
     @14627    f1393108    03.  /*# Hosp W/Chapl/Pastor Care Serv  Short Term General Hospitals         */
     @14630    f1400208    03.  /*# Hosp W/Chemotherapy            Short Term General Hospitals         */
     @14633    f1258808    03.  /*# Hosp W/Child Wellness Program  Short Term General Hospitals         */
     @14636    f1331408    03.  /*# Hosp W/Chiropractic Services   Short Term General Hospitals         */
     @14639    f1258908    03.  /*# Hosp W/Community Outreach      Short Term General Hospitals         */
     @14642    f1331508    03.  /*#Hsp W/Complmnt/Altern Med Serv  Short Term General Hospitals         */
     @14645    f1409808    03.  /*# Hosp W/Computer Asst Orth Srg  Short Term General Hospitals         */
     @14648    f1259008    03.  /*# Hosp W/Crisis Prevention       Short Term General Hospitals         */
     @14651    f1259108    03.  /*# Hosp W/Dental Services         Short Term General Hospitals         */
     @14654    f1259208    03.  /*# Hosp W/Emergency Department    Short Term General Hospitals         */
     @14657    f1409908    03.  /*#Hsp W/Freestnd/Satllt Emer Dpt  Short Term General Hospitals         */
     @14660    f1259308    03.  /*# Hosp W/Certified Trauma Cntr   Short Term General Hospitals         */
     @14663    f1361408    03.  /*# Hosp W/Enabling Services       Short Term General Hospitals         */
     @14666    f1260308    03.  /*# Hosp W/Hospice                 Short Term General Hospitals         */
     @14669    f1331708    03.  /*# Hosp W/Pain Management Pgm     Short Term General Hospitals         */
     @14672    f1361508    03.  /*# Hosp W/Palliative Care Pgm     Short Term General Hospitals         */
     @14675    f1420908    03.  /*# Hosp W/IP Palliative Cre Unit  Short Term General Hospitals         */
     @14678    f1466308    03.  /*# Hosp W/Optical Colonoscopy     Short Term General Hospitals         */
     @14681    f1421008    03.  /*# Hosp W/Endoscopic Ultrasound   Short Term General Hospitals         */
     @14684    f1421108    03.  /*# Hosp W/Ablat of Barrets Esoph  Short Term General Hospitals         */
     @14687    f1421208    03.  /*# Hosp W/Esoph Impedance Study   Short Term General Hospitals         */
     @14690    f1421308    03.  /*# Hosp W/ECRP                    Short Term General Hospitals         */
     @14693    f1361608    03.  /*# Hosp W/Enrollment Assist Pgm   Short Term General Hospitals         */
     @14696    f1259408    03.  /*# Hosp W/Extracorporeal Shock    Short Term General Hospitals         */
     @14699    f1259508    03.  /*# Hosp W/Fitness Center          Short Term General Hospitals         */
     @14702    f1259608    03.  /*# Hosp W/Freestandng Outpat Ctr  Short Term General Hospitals         */
     @14705    f1259708    03.  /*# Hosp W/Geriatric Services      Short Term General Hospitals         */
     @14708    f1411008    03.  /*# Hosp W/Geriatric Services      ST Non-Gen + Long Term Hosps         */
     @14711    f1259808    03.  /*# Hosp W/Health Fair             Short Term General Hospitals         */
     @14714    f1259908    03.  /*# Hosp W/Community Health Educ   Short Term General Hospitals         */
     @14717    f1260008    03.  /*# Hosp W/Health Screenings       Short Term General Hospitals         */
     @14720    f1421408    03.  /*# Hosp W/Health Research         Short Term General Hospitals         */
     @14723    f1361708    03.  /*# Hosp W/Hemodialysis            Short Term General Hospitals         */
     @14726    f1260108    03.  /*# Hosp W/HIV-AIDS Services       Short Term General Hospitals         */
     @14729    f1260208    03.  /*# Hosp W/Home Health Services    Short Term General Hospitals         */
     @14732    f1260408    03.  /*#Hsp W/Hsp-Bsd Outpat Cr Ctr/Sv  Short Term General Hospitals         */
     @14735    f1421508    03.  /*# Hosp W/Immunization Program    Short Term General Hospitals         */
     @14738    f1410008    03.  /*# Hosp W/Indigent Care Clinic    Short Term General Hospitals         */
     @14741    f1393208    03.  /*# Hosp W/Ling/Translation Serv   Short Term General Hospitals         */
     @14744    f1411108    03.  /*# Hosp W/Ling/Translation Serv   ST Non-Gen + Long Term Hosps         */
     @14747    f1260508    03.  /*# Hosp W/Meals On Wheels         Short Term General Hospitals         */
     @14750    f1410108    03.  /*# Hosp W/Mobile Health Services  Short Term General Hospitals         */
     @14753    f1393308    03.  /*# Hosp W/Neurological Services   Short Term General Hospitals         */
     @14756    f1260608    03.  /*# Hosp W/Nutrition Programs      Short Term General Hospitals         */
     @14759    f1411208    03.  /*# Hosp W/Nutrition Programs      ST Non-Gen + Long Term Hosps         */
     @14762    f1260708    03.  /*# Hosp W/Occupational Hlth Serv  Short Term General Hospitals         */
     @14765    f1411308    03.  /*# Hosp W/Occupational Hlth Serv  ST Non-Gen + Long Term Hosps         */
     @14768    f1260808    03.  /*# Hosp W/Oncology Services       Short Term General Hospitals         */
     @14771    f1393408    03.  /*# Hosp W/Orthopedic Services     Short Term General Hospitals         */
     @14774    f1261108    03.  /*# Hosp W/Outpatient Surgery      Short Term General Hospitals         */
     @14777    f1407408    03.  /*# Hosp W/Patient Ctrl Analgesia  Short Term General Hospitals         */
     @14780    f1261208    03.  /*# Hosp W/Patient Education Cntr  Short Term General Hospitals         */
     @14783    f1261308    03.  /*# Hosp W/Patient Repr Services   Short Term General Hospitals         */
     @14786    f1411408    03.  /*# Hosp W/Patient Repr Services   ST Non-Gen + Long Term Hosps         */
     @14789    f1261408    03.  /*# Hosp W/Physical Rehab OP Serv  Short Term General Hospitals         */
     @14792    f1411508    03.  /*# Hosp W/Physical Rehab OP Serv  ST Non-Gen + Long Term Hosps         */
     @14795    f1466408    03.  /*# Hosp W/Robot-Asst Walk Therap  Short Term General Hospitals         */
     @14798    f1466508    03.  /*# Hosp W/Simulated Rehab Enviro  Short Term General Hospitals         */
     @14801    f1261508    03.  /*# Hosp W/Primary Care Dept       Short Term General Hospitals         */
     @14804    f1261608    03.  /*# Hosp W/Psych Child/Adoles Ser  Short Term General Hospitals         */
     @14807    f1261708    03.  /*# Hosp W/Psych Consl/Liaisn Ser  Short Term General Hospitals         */
     @14810    f1261808    03.  /*# Hosp W/Psych Consl/Liaisn Ser  ST Non-Gen + Long Term Hosps         */
     @14813    f1261908    03.  /*# Hosp W/Psych Educational Serv  Short Term General Hospitals         */
     @14816    f1262008    03.  /*# Hosp W/Psych Emergency Serv    Short Term General Hospitals         */
     @14819    f1262108    03.  /*# Hosp W/Psych Geriatric Serv    Short Term General Hospitals         */
     @14822    f1262208    03.  /*# Hosp W/Psych Outpatient Serv   Short Term General Hospitals         */
     @14825    f1262308    03.  /*# Hosp W/Psych Part Hosp Prog    Short Term General Hospitals         */
     @14828    f1410208    03.  /*# Hosp W/Image-guided Rad Ther   Short Term General Hospitals         */
     @14831    f1400408    03.  /*#Hsp W/Intens-Modulatd Rad Ther  Short Term General Hospitals         */
     @14834    f1421608    03.  /*# Hosp W/Proton Therapy          Short Term General Hospitals         */
     @14837    f1407508    03.  /*# Hosp W/Shaped Beam Rad System  Short Term General Hospitals         */
     @14840    f1410708    03.  /*# Hosp W/Stereotactic Radiosurg  Short Term General Hospitals         */
     @14843    f1262508    03.  /*# Hosp W/C.T. Scanner            Short Term General Hospitals         */
     @14846    f1262608    03.  /*# Hosp W/Diag Radioisotope Fac   Short Term General Hospitals         */
     @14849    f1400508    03.  /*#Hsp W/Electrn Beam Comp Tomogr  Short Term General Hospitals         */
     @14852    f1410308    03.  /*# Hsp W/Full-field Digit Mammog  Short Term General Hospitals         */
     @14855    f1262708    03.  /*# Hosp W/Mag Resonance Imaging   Short Term General Hospitals         */
     @14858    f1262808    03.  /*# Hosp W/Mag Resonance Imaging   ST Non-Gen + Long Term Hosps         */
     @14861    f1421708    03.  /*# Hosp W/Intraoperative MRI      Short Term General Hospitals         */
     @14864    f1400608    03.  /*#Hsp W/Multislce Sp Com Tom <64  Short Term General Hospitals         */
     @14867    f1410408    03.  /*#Hsp W/Multislce Sp Com Tom 64+  Short Term General Hospitals         */
     @14870    f1262908    03.  /*# Hosp W/Positron Emission Tom   Short Term General Hospitals         */
     @14873    f1410508    03.  /*# Hosp W/Positron Emiss Tom/CT   Short Term General Hospitals         */
     @14876    f1263008    03.  /*# Hsp W/Singl Photon Emis Tomog  Short Term General Hospitals         */
     @14879    f1263108    03.  /*# Hosp W/Ultrasound              Short Term General Hospitals         */
     @14882    f1400708    03.  /*# Hosp W/Fertility Clinic        Short Term General Hospitals         */
     @14885    f1400808    03.  /*#Hosp W/Genetic Test/Counseling  Short Term General Hospitals         */
     @14888    f1263308    03.  /*# Hosp W/Retirement Housing      Short Term General Hospitals         */
     @14891    f1410608    03.  /*# Hosp W/Robotic Surgery         Short Term General Hospitals         */
     @14894    f1361808    03.  /*# Hosp W/Sleep Center            Short Term General Hospitals         */
     @14897    f1263408    03.  /*# Hosp W/Social Work Services    Short Term General Hospitals         */
     @14900    f1411608    03.  /*# Hosp W/Social Work Services    ST Non-Gen + Long Term Hosps         */
     @14903    f1263508    03.  /*# Hosp W/Sports Medicine         Short Term General Hospitals         */
     @14906    f1263608    03.  /*# Hosp W/Support Groups          Short Term General Hospitals         */
     @14909    f1411708    03.  /*# Hosp W/Support Groups          ST Non-Gen + Long Term Hosps         */
     @14912    f1393508    03.  /*# Hosp W/Swing Bed Services      Short Term General Hospitals         */
     @14915    f1263708    03.  /*# Hosp W/Teen Outreach Services  Short Term General Hospitals         */
     @14918    f1361908    03.  /*# Hosp W/Tobacco Treatment Serv  Short Term General Hospitals         */
     @14921    f1407608    03.  /*#Hsp W/Bone Marrow Transplt Ser  Short Term General Hospitals         */
     @14924    f1407708    03.  /*# Hosp W/Heart Transplant        Short Term General Hospitals         */
     @14927    f1407808    03.  /*# Hosp W/Kidney Transplant       Short Term General Hospitals         */
     @14930    f1407908    03.  /*# Hosp W/Liver Transplant        Short Term General Hospitals         */
     @14933    f1408008    03.  /*# Hosp W/Lung Transplant         Short Term General Hospitals         */
     @14936    f1408108    03.  /*# Hosp W/Tissue Transplant       Short Term General Hospitals         */
     @14939    f1408208    03.  /*# Hosp W/Oth Transplant Service  Short Term General Hospitals         */
     @14942    f1263908    03.  /*# Hosp W/Transport to Hlth Fac   Short Term General Hospitals         */
     @14945    f1264008    03.  /*# Hosp W/Urgent Care Center      Short Term General Hospitals         */
     @14948    f1410808    03.  /*# Hosp W/Virtual Colonoscopy     Short Term General Hospitals         */
     @14951    f1264108    03.  /*# Hosp W/Volunteer Serv Dept     Short Term General Hospitals         */
     @14954    f1264208    03.  /*# Hosp W/Women's Hlth Cntr/Serv  Short Term General Hospitals         */
     @14957    f1393608    03.  /*# Hosp W/Wound Mngmnt Services   Short Term General Hospitals         */
     @14960    f1403508    03.  /*# Hosp w/Hospitalists Care       Short Term General Hospitals         */
     @14963    f1403608    03.  /*# Hosp w/Hospitalists Care       ST Non-Gen + Long Term Hosps         */
     @14966    f1264308    03.  /*# Hsp Participtn in Phys Arrang  Short Term General Hospitals         */
     @14969    f1264408    03.  /*# Hsp Developmnt of Ins Product  Short Term General Hospitals         */
     @14972    f0907108    05.  /*Gen Med/Surg, Adult, Bed Set Up  Short Term General Hospitals         */
     @14977    f0907708    05.  /*Gen Med/Surg, Ped, Beds Set Up   Short Term General Hospitals         */
     @14982    f0908308    05.  /*Obstetrics Care, Beds Set Up     Short Term General Hospitals         */
     @14987    f0913908    05.  /*Med/Surg Intens Cr, Beds Set Up  Short Term General Hospitals         */
     @14992    f0913308    05.  /*Cardiac Intens Cr, Beds Set Up   Short Term General Hospitals         */
     @14997    f0914508    05.  /*Neonatal Intens Cr, Beds Set Up  Short Term General Hospitals         */
     @15002    f0915108    05.  /*Neonat Intermed Cr, Beds Set Up  Short Term General Hospitals         */
     @15007    f0916308    05.  /*Pediatric Intens Cr, Bed Set Up  Short Term General Hospitals         */
     @15012    f0912708    05.  /*Burn Care, Beds Set Up           Short Term General Hospitals         */
     @15017    f0910308    05.  /*Oth Special Care, Beds Set Up    Short Term General Hospitals         */
     @15022    f1330908    05.  /*Other Intensive Cr, Bed Set Up   Short Term General Hospitals         */
     @15027    f0921508    05.  /*Rehabilitation Care, Bed Set Up  Short Term General Hospitals         */
     @15032    f1143908    05.  /*Alchl/Chem Depend Cr,Bed Set Up  Short Term General Hospitals         */
     @15037    f1143708    05.  /*Psychiatric Care, Beds Set Up    Short Term General Hospitals         */
     @15042    f1133708    05.  /*Skilled Nurs Care, Beds Set Up   Short Term General Hospitals         */
     @15047    f1133908    05.  /*Intermediate Care, Beds Set Up   Short Term General Hospitals         */
     @15052    f1331108    05.  /*Acute LT Care, Beds Set Up       Short Term General Hospitals         */
     @15057    f1256008    05.  /*Other LT Care, Beds Set Up       Short Term General Hospitals         */
     @15062    f1256108    05.  /*Other Care, Beds Set Up          Short Term General Hospitals         */
     @15067    f0904708    06.  /*Total Inpatient, Beds Set Up     Short Term General Hospitals         */
     @15073    f0930708    06.  /*# FTE Total Facility Personnel   Incl Nurs Homes; ST Gen Hosps        */
     @15079    f0930705    06.  /*# FTE Total Facility Personnel   Incl Nurs Homes; ST Gen Hosps        */
     @15085    f0930700    06.  /*# FTE Total Facility Personnel   Incl Nurs Homes; ST Gen Hosps        */
     @15091    f0930808    06.  /*# FTE Total Facility Personnel   Incl Nurs Homes; STNG/LT Hosps       */
     @15097    f0930805    06.  /*# FTE Total Facility Personnel   Incl Nurs Homes; STNG/LT Hosps       */
     @15103    f0930800    06.  /*# FTE Total Facility Personnel   Incl Nurs Homes; STNG/LT Hosps       */
     @15109    f1130808    05.  /*# FTE Physicians & Dentists      Incl Nurs Homes; ST Gen Hosps        */
     @15114    f1130805    05.  /*# FTE Physicians & Dentists      Incl Nurs Homes; ST Gen Hosps        */
     @15119    f1130800    05.  /*# FTE Physicians & Dentists      Incl Nurs Homes; ST Gen Hosps        */
     @15124    f1130908    05.  /*# FTE Physicians & Dentists      Incl Nurs Homes; STNG/LT Hosps       */
     @15129    f1130905    05.  /*# FTE Physicians & Dentists      Incl Nurs Homes; STNG/LT Hosps       */
     @15134    f1130900    05.  /*# FTE Physicians & Dentists      Incl Nurs Homes; STNG/LT Hosps       */
     @15139    f0931108    04.  /*# FTE Physicians & Dentists      Incl Nurs Homes;Veterans Hosps       */
     @15143    f1266308    06.  /*# FTE Medical & Dental Residnts  Incl Nurs Homes; ST Gen Hosps        */
     @15149    f1266305    06.  /*# FTE Medical & Dental Residnts  Incl Nurs Homes; ST Gen Hosps        */
     @15155    f1266300    06.  /*# FTE Medical & Dental Residnts  Incl Nurs Homes; ST Gen Hosps        */
     @15161    f1266408    06.  /*# FTE Medical & Dental Residnts  Incl Nurs Homes; STNG/LT Hosps       */
     @15167    f1266405    06.  /*# FTE Medical & Dental Residnts  Incl Nurs Homes; STNG/LT Hosps       */
     @15173    f1266400    06.  /*# FTE Medical & Dental Residnts  Incl Nurs Homes; STNG/LT Hosps       */
     @15179    f0931408    04.  /*# FTE Other Trainees             Incl Nurs Homes; ST Gen Hosps        */
     @15183    f0931405    04.  /*# FTE Other Trainees             Incl Nurs Homes; ST Gen Hosps        */
     @15187    f0931400    07.  /*# FTE Other Trainees             Incl Nurs Homes; ST Gen Hosps        */
     @15194    f0931508    04.  /*# FTE Other Trainees             Incl Nurs Homes; STNG/LT Hosps       */
     @15198    f0931505    04.  /*# FTE Other Trainees             Incl Nurs Homes; STNG/LT Hosps       */
     @15202    f0931500    07.  /*# FTE Other Trainees             Incl Nurs Homes; STNG/LT Hosps       */
     @15209    f1266508    05.  /*# FTE Total Trainees             Incl Nurs Homes; ST Gen Hosps        */
     @15214    f1266505    05.  /*# FTE Total Trainees             Incl Nurs Homes; ST Gen Hosps        */
     @15219    f1266500    07.  /*# FTE Total Trainees             Incl Nurs Homes; ST Gen Hosps        */
     @15226    f1266608    05.  /*# FTE Total Trainees             Incl Nurs Homes; STNG/LT Hosps       */
     @15231    f1266605    05.  /*# FTE Total Trainees             Incl Nurs Homes; STNG/LT Hosps       */
     @15236    f1266600    07.  /*# FTE Total Trainees             Incl Nurs Homes; STNG/LT Hosps       */
     @15243    f0931608    06.  /*# FTE R.N.s                      Incl Nurs Homes; ST Gen Hosps        */
     @15249    f0931605    06.  /*# FTE R.N.s                      Incl Nurs Homes; ST Gen Hosps        */
     @15255    f0931600    06.  /*# FTE R.N.s                      Incl Nurs Homes; ST Gen Hosps        */
     @15261    f0931708    06.  /*# FTE R.N.s                      Incl Nurs Homes; STNG/LT Hosps       */
     @15267    f0931705    06.  /*# FTE R.N.s                      Incl Nurs Homes; STNG/LT Hosps       */
     @15273    f0931700    06.  /*# FTE R.N.s                      Incl Nurs Homes; STNG/LT Hosps       */
     @15279    f0931808    06.  /*# FTE R.N.s                      Incl Nurs Homes;Veterans Hosps       */
     @15285    f0931908    06.  /*# FTE L.P.N.s & L.V.N.s          Incl Nurs Homes; ST Gen Hosps        */
     @15291    f0931905    06.  /*# FTE L.P.N.s & L.V.N.s          Incl Nurs Homes; ST Gen Hosps        */
     @15297    f0931900    06.  /*# FTE L.P.N.s & L.V.N.s          Incl Nurs Homes; ST Gen Hosps        */
     @15303    f0932008    06.  /*# FTE L.P.N.s & L.V.N.s          Incl Nurs Homes; STNG/LT Hosps       */
     @15309    f0932005    06.  /*# FTE L.P.N.s & L.V.N.s          Incl Nurs Homes; STNG/LT Hosps       */
     @15315    f0932000    06.  /*# FTE L.P.N.s & L.V.N.s          Incl Nurs Homes; STNG/LT Hosps       */
     @15321    f1266108    07.  /*# FTE Other Personnel            Incl Nurs Homes; ST Gen Hosps        */
     @15328    f1266105    07.  /*# FTE Other Personnel            Incl Nurs Homes; ST Gen Hosps        */
     @15335    f1266100    07.  /*# FTE Other Personnel            Incl Nurs Homes; ST Gen Hosps        */
     @15342    f1266208    07.  /*# FTE Other Personnel            Incl Nurs Homes; STNG/LT Hosps       */
     @15349    f1266205    07.  /*# FTE Other Personnel            Incl Nurs Homes; STNG/LT Hosps       */
     @15356    f1266200    07.  /*# FTE Other Personnel            Incl Nurs Homes; STNG/LT Hosps       */
     @15363    f0932308    06.  /*# FTE All Oth Personnel,VA Hosp  Incl NH; Res,Train,LPN/LVN&Oth       */
     @15369    f1266708    07.  /*# FTE Total Hospital Personnel   Short Term General Hospitals         */
     @15376    f1266705    07.  /*# FTE Total Hospital Personnel   Short Term General Hospitals         */
     @15383    f1266700    07.  /*# FTE Total Hospital Personnel   Short Term General Hospitals         */
     @15390    f1266808    07.  /*# FTE Total Hospital Personnel   ST Non-Gen + Long Term Hosps         */
     @15397    f1266805    07.  /*# FTE Total Hospital Personnel   ST Non-Gen + Long Term Hosps         */
     @15404    f1266800    07.  /*# FTE Total Hospital Personnel   ST Non-Gen + Long Term Hosps         */
     @15411    f0962308    06.  /*# FTE Tot Nurs Home Personnel    Short Term General Hospitals         */
     @15417    f0962305    06.  /*# FTE Tot Nurs Home Personnel    Short Term General Hospitals         */
     @15423    f0962300    06.  /*# FTE Tot Nurs Home Personnel    Short Term General Hospitals         */
     @15429    f0962408    06.  /*# FTE Tot Nurs Home Personnel    ST Non-Gen + Long Term Hosps         */
     @15435    f0962405    06.  /*# FTE Tot Nurs Home Personnel    ST Non-Gen + Long Term Hosps         */
     @15441    f0962400    06.  /*# FTE Tot Nurs Home Personnel    ST Non-Gen + Long Term Hosps         */
     @15447    f1033708    08.  /*Total Facility Personnel, FT     Incl Nurs Homes; ST Gen Hosps        */
     @15455    f1033705    08.  /*Total Facility Personnel, FT     Incl Nurs Homes; ST Gen Hosps        */
     @15463    f1033700    08.  /*Total Facility Personnel, FT     Incl Nurs Homes; ST Gen Hosps        */
     @15471    f1033808    08.  /*Total Facility Personnel, FT     Incl Nurs Homes; STNG/LT Hosps       */
     @15479    f1033805    08.  /*Total Facility Personnel, FT     Incl Nurs Homes; STNG/LT Hosps       */
     @15487    f1033800    08.  /*Total Facility Personnel, FT     Incl Nurs Homes; STNG/LT Hosps       */
     @15495    f1033908    06.  /*Total Facility Personnel, PT     Incl Nurs Homes; ST Gen Hosps        */
     @15501    f1033905    06.  /*Total Facility Personnel, PT     Incl Nurs Homes; ST Gen Hosps        */
     @15507    f1033900    06.  /*Total Facility Personnel, PT     Incl Nurs Homes; ST Gen Hosps        */
     @15513    f1034008    06.  /*Total Facility Personnel, PT     Incl Nurs Homes; STNG/LT Hosps       */
     @15519    f1034005    06.  /*Total Facility Personnel, PT     Incl Nurs Homes; STNG/LT Hosps       */
     @15525    f1034000    06.  /*Total Facility Personnel, PT     Incl Nurs Homes; STNG/LT Hosps       */
     @15531    f1264508    06.  /*Physicians & Dentists, FT        Incl Nurs Homes; ST Gen Hosps        */
     @15537    f1264608    06.  /*Physicians & Dentists, FT        Incl Nurs Homes; STNG/LT Hosps       */
     @15543    f1265308    06.  /*Physicians & Dentists, PT        Incl Nurs Homes; ST Gen Hosps        */
     @15549    f1265408    06.  /*Physicians & Dentists, PT        Incl Nurs Homes; STNG/LT Hosps       */
     @15555    f1197308    06.  /*Medical/Dental Res/Interns, FT   Incl Nurs Homes; ST Gen Hosps        */
     @15561    f1197808    06.  /*Medical/Dental Res/Interns, FT   Incl Nurs Homes; STNG/LT Hosps       */
     @15567    f1197408    06.  /*Medical/Dental Res/Interns, PT   Incl Nurs Homes; ST Gen Hosps        */
     @15573    f1197908    06.  /*Medical/Dental Res/Interns, PT   Incl Nurs Homes; STNG/LT Hosps       */
     @15579    f1213008    06.  /*Other Trainees, Full-Time        See User Doc for Def;ST Gen Hs       */
     @15585    f1213108    06.  /*Other Trainees, Full-Time        See User Doc for Def;STNG/LT         */
     @15591    f1213208    06.  /*Other Trainees, Part-Time        See User Doc for Def;ST Gen Hs       */
     @15597    f1213308    06.  /*Other Trainees, Part-Time        See User Doc for Def;STNG/LT         */
     @15603    f1264708    06.  /*Registered Nurses, Full-Time     Incl Nurs Homes; ST Gen Hosps        */
     @15609    f1264808    06.  /*Registered Nurses, Full-Time     Incl Nurs Homes; STNG/LT Hosps       */
     @15615    f1265508    06.  /*Registered Nurses, Part-Time     Incl Nurs Homes; ST Gen Hosps        */
     @15621    f1265608    06.  /*Registered Nurses, Part-Time     Incl Nurs Homes; STNG/LT Hosps       */
     @15627    f1264908    06.  /*LPN/LVNs, Full-Time              Incl Nurs Homes; ST Gen Hosps        */
     @15633    f1265008    06.  /*LPN/LVNs, Full-Time              Incl Nurs Homes; STNG/LT Hosps       */
     @15639    f1265708    06.  /*LPN/LVNs, Part-Time              Incl Nurs Homes; ST Gen Hosps        */
     @15645    f1265808    06.  /*LPN/LVNs, Part-Time              Incl Nurs Homes; STNG/LT Hosps       */
     @15651    f1400908    06.  /*Nursing Assistive Personnel, FT  Incl Nurs Homes; ST Gen Hosps        */
     @15657    f1401008    06.  /*Nursing Assistive Personnel, FT  Incl Nurs Homes; STNG/LT Hosps       */
     @15663    f1401108    06.  /*Nursing Assistive Personnel, PT  Incl Nurs Homes; ST Gen Hosps        */
     @15669    f1401208    06.  /*Nursing Assistive Personnel, PT  Incl Nurs Homes; STNG/LT Hosps       */
     @15675    f1412908    06.  /*Radiology Technicians, FT        Incl Nurs Homes; ST Gen Hosps        */
     @15681    f1413008    06.  /*Radiology Technicians, FT        Incl Nurs Homes; STNG/LT Hosps       */
     @15687    f1413108    06.  /*Radiology Technicians, PT        Incl Nurs Homes; ST Gen Hosps        */
     @15693    f1413208    06.  /*Radiology Technicians, PT        Incl Nurs Homes; STNG/LT Hosps       */
     @15699    f1413308    06.  /*Laboratory Technicians, FT       Incl Nurs Homes; ST Gen Hosps        */
     @15705    f1413408    06.  /*Laboratory Technicians, FT       Incl Nurs Homes; STNG/LT Hosps       */
     @15711    f1413508    06.  /*Laboratory Technicians, PT       Incl Nurs Homes; ST Gen Hosps        */
     @15717    f1413608    06.  /*Laboratory Technicians, PT       Incl Nurs Homes; STNG/LT Hosps       */
     @15723    f1413708    06.  /*Pharmacists, Licensed, FT        Incl Nurs Homes; ST Gen Hosps        */
     @15729    f1413808    06.  /*Pharmacists, Licensed, FT        Incl Nurs Homes; STNG/LT Hosps       */
     @15735    f1413908    06.  /*Pharmacists, Licensed, PT        Incl Nurs Homes; ST Gen Hosps        */
     @15741    f1414008    06.  /*Pharmacists, Licensed, PT        Incl Nurs Homes; STNG/LT Hosps       */
     @15747    f1414108    06.  /*Pharmacy Technicians, FT         Incl Nurs Homes; ST Gen Hosps        */
     @15753    f1414208    06.  /*Pharmacy Technicians, FT         Incl Nurs Homes; STNG/LT Hosps       */
     @15759    f1414308    06.  /*Pharmacy Technicians, PT         Incl Nurs Homes; ST Gen Hosps        */
     @15765    f1414408    06.  /*Pharmacy Technicians, PT         Incl Nurs Homes; STNG/LT Hosps       */
     @15771    f1421908    06.  /*Respiratory Therapists, FT       Incl Nurs Homes; ST Gen Hosps        */
     @15777    f1422008    06.  /*Respiratory Therapists, FT       Incl Nurs Homes; STNG/LT Hosps       */
     @15783    f1422108    06.  /*Respiratory Therapists, PT       Incl Nurs Homes; ST Gen Hosps        */
     @15789    f1422208    06.  /*Respiratory Therapists, PT       Incl Nurs Homes; STNG/LT Hosps       */
     @15795    f1265108    06.  /*All Other Personnel, Full-Time   Incl Nurs Homes; ST Gen Hosps        */
     @15801    f1265208    06.  /*All Other Personnel, Full-Time   Incl Nurs Homes; STNG/LT Hosps       */
     @15807    f1265908    06.  /*All Other Personnel, Part-Time   Incl Nurs Homes; ST Gen Hosps        */
     @15813    f1266008    06.  /*All Other Personnel, Part-Time   Incl Nurs Homes; STNG/LT Hosps       */
     @15819    f0932408    06.  /*Total Hosp Personnel, Full-Time  Short Term General Hospitals         */
     @15825    f0932405    06.  /*Total Hosp Personnel, Full-Time  Short Term General Hospitals         */
     @15831    f0932400    06.  /*Total Hosp Personnel, Full-Time  Short Term General Hospitals         */
     @15837    f0932508    06.  /*Total Hosp Personnel, Full-Time  ST Non-Gen + Long Term Hosps         */
     @15843    f0932505    06.  /*Total Hosp Personnel, Full-Time  ST Non-Gen + Long Term Hosps         */
     @15849    f0932500    06.  /*Total Hosp Personnel, Full-Time  ST Non-Gen + Long Term Hosps         */
     @15855    f0932608    06.  /*Total Hosp Personnel, Part-Time  Short Term General Hospitals         */
     @15861    f0932605    06.  /*Total Hosp Personnel, Part-Time  Short Term General Hospitals         */
     @15867    f0932600    06.  /*Total Hosp Personnel, Part-Time  Short Term General Hospitals         */
     @15873    f0932708    06.  /*Total Hosp Personnel, Part-Time  ST Non-Gen + Long Term Hosps         */
     @15879    f0932705    06.  /*Total Hosp Personnel, Part-Time  ST Non-Gen + Long Term Hosps         */
     @15885    f0932700    06.  /*Total Hosp Personnel, Part-Time  ST Non-Gen + Long Term Hosps         */
     @15891    f0941508    06.  /*Nursing Home Personnel Tot, FT   Short Term General Hospitals         */
     @15897    f0941505    06.  /*Nursing Home Personnel Tot, FT   Short Term General Hospitals         */
     @15903    f0941500    06.  /*Nursing Home Personnel Tot, FT   Short Term General Hospitals         */
     @15909    f0941608    06.  /*Nursing Home Personnel Tot, FT   ST Non-Gen + Long Term Hosps         */
     @15915    f0941605    06.  /*Nursing Home Personnel Tot, FT   ST Non-Gen + Long Term Hosps         */
     @15921    f0941600    06.  /*Nursing Home Personnel Tot, FT   ST Non-Gen + Long Term Hosps         */
     @15927    f0941708    06.  /*Nursing Home Personnel Tot, PT   Short Term General Hospitals         */
     @15933    f0941705    06.  /*Nursing Home Personnel Tot, PT   Short Term General Hospitals         */
     @15939    f0941700    06.  /*Nursing Home Personnel Tot, PT   Short Term General Hospitals         */
     @15945    f0941808    06.  /*Nursing Home Personnel Tot, PT   ST Non-Gen + Long Term Hosps         */
     @15951    f0941805    06.  /*Nursing Home Personnel Tot, PT   ST Non-Gen + Long Term Hosps         */
     @15957    f0941800    06.  /*Nursing Home Personnel Tot, PT   ST Non-Gen + Long Term Hosps         */
     @15963    f1403708    04.  /*Hospitalists, Full-Time          Short Term General Hospitals         */
     @15967    f1403705    04.  /*Hospitalists, Full-Time          Short Term General Hospitals         */
     @15971    f1403808    04.  /*Hospitalists, Full-Time          ST Non-Gen + Long Term Hosps         */
     @15975    f1403805    04.  /*Hospitalists, Full-Time          ST Non-Gen + Long Term Hosps         */
     @15979    f1403908    04.  /*Hospitalists, Part-Time          Short Term General Hospitals         */
     @15983    f1403905    04.  /*Hospitalists, Part-Time          Short Term General Hospitals         */
     @15987    f1404008    04.  /*Hospitalists, Part-Time          ST Non-Gen + Long Term Hosps         */
     @15991    f1404005    04.  /*Hospitalists, Part-Time          ST Non-Gen + Long Term Hosps         */
     @15995    f0953708    03.  /*Dist Hosp By 00 - 04 Services    Short Term General Hospitals         */
     @15998    f0953705    03.  /*Dist Hosp By 00 - 04 Services    Short Term General Hospitals         */
     @16001    f0953700    03.  /*Dist Hosp By 00 - 04 Services    Short Term General Hospitals         */
     @16004    f0953808    03.  /*Dist Hosp By 00 - 04 Services    ST Non-Gen + Long Term Hosps         */
     @16007    f0953805    03.  /*Dist Hosp By 00 - 04 Services    ST Non-Gen + Long Term Hosps         */
     @16010    f0953800    03.  /*Dist Hosp By 00 - 04 Services    ST Non-Gen + Long Term Hosps         */
     @16013    f0953908    03.  /*Dist Hosp By 05 - 14 Services    Short Term General Hospitals         */
     @16016    f0953905    03.  /*Dist Hosp By 05 - 14 Services    Short Term General Hospitals         */
     @16019    f0953900    03.  /*Dist Hosp By 05 - 14 Services    Short Term General Hospitals         */
     @16022    f0954008    03.  /*Dist Hosp By 05 - 14 Services    ST Non-Gen + Long Term Hosps         */
     @16025    f0954005    03.  /*Dist Hosp By 05 - 14 Services    ST Non-Gen + Long Term Hosps         */
     @16028    f0954000    03.  /*Dist Hosp By 05 - 14 Services    ST Non-Gen + Long Term Hosps         */
     @16031    f0954108    03.  /*Dist Hosp By 15 - 24 Services    Short Term General Hospitals         */
     @16034    f0954105    03.  /*Dist Hosp By 15 - 24 Services    Short Term General Hospitals         */
     @16037    f0954100    03.  /*Dist Hosp By 15 - 24 Services    Short Term General Hospitals         */
     @16040    f0954208    03.  /*Dist Hosp By 15 - 24 Services    ST Non-Gen + Long Term Hosps         */
     @16043    f0954205    03.  /*Dist Hosp By 15 - 24 Services    ST Non-Gen + Long Term Hosps         */
     @16046    f0954200    03.  /*Dist Hosp By 15 - 24 Services    ST Non-Gen + Long Term Hosps         */
     @16049    f0954308    03.  /*Dist Hosp By 25+ Services        Short Term General Hospitals         */
     @16052    f0954305    03.  /*Dist Hosp By 25+ Services        Short Term General Hospitals         */
     @16055    f0954300    03.  /*Dist Hosp By 25+ Services        Short Term General Hospitals         */
     @16058    f0954408    03.  /*Dist Hosp By 25+ Services        ST Non-Gen + Long Term Hosps         */
     @16061    f0954405    03.  /*Dist Hosp By 25+ Services        ST Non-Gen + Long Term Hosps         */
     @16064    f0954400    03.  /*Dist Hosp By 25+ Services        ST Non-Gen + Long Term Hosps         */
     @16067    f1321109    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16072    f1321108    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16077    f1321107    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16082    f1321106    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16087    f1321105    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16092    f1321100    05.  /*# Skilled Nursing Facilities     Certified Medicare Providers         */
     @16097    f1321209    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16102    f1321208    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16107    f1321207    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16112    f1321206    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16117    f1321205    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16122    f1321200    05.  /*Skilled Nurs Fac Total Beds      Certified Medicare Providers         */
     @16127    f1321309    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16132    f1321308    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16137    f1321307    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16142    f1321306    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16147    f1321305    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16152    f1321300    05.  /*Skilled Nurs Fac Certified Beds  Certified Medicare Providers         */
     @16157    f1321509    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16162    f1321508    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16167    f1321507    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16172    f1321506    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16177    f1321505    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16182    f1321500    05.  /*# Nursing Facilities             Certified Medicare Providers         */
     @16187    f1321609    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16192    f1321608    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16197    f1321607    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16202    f1321606    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16207    f1321605    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16212    f1321600    05.  /*Nursing Facilities Total Beds    Certified Medicare Providers         */
     @16217    f1321709    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16222    f1321708    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16227    f1321707    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16232    f1321706    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16237    f1321705    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16242    f1321700    05.  /*Nursing Facilities Cert Beds     Certified Medicare Providers         */
     @16247    f1321409    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16252    f1321408    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16257    f1321407    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16262    f1321406    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16267    f1321405    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16272    f1321400    05.  /*# Home Health Agencies           Certified Medicare Providers         */
     @16277    f1321809    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16282    f1321808    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16287    f1321807    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16292    f1321806    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16297    f1321805    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16302    f1321800    05.  /*# Rural Health Clinics           Certified Medicare Providers         */
     @16307    f1321909    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16312    f1321908    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16317    f1321907    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16322    f1321906    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16327    f1321905    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16332    f1321900    05.  /*# Ambulatory Surgery Centers     Certified Medicare Providers         */
     @16337    f1322009    05.  /*# Hospices                       Certified Medicare Providers         */
     @16342    f1322008    05.  /*# Hospices                       Certified Medicare Providers         */
     @16347    f1322007    05.  /*# Hospices                       Certified Medicare Providers         */
     @16352    f1322006    05.  /*# Hospices                       Certified Medicare Providers         */
     @16357    f1322005    05.  /*# Hospices                       Certified Medicare Providers         */
     @16362    f1322000    05.  /*# Hospices                       Certified Medicare Providers         */
     @16367    f1322109    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16372    f1322108    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16377    f1322107    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16382    f1322106    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16387    f1322105    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16392    f1322100    05.  /*# Community Mental Health Ctrs   Certified Medicare Providers         */
     @16397    f1332009    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16402    f1332008    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16407    f1332007    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16412    f1332006    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16417    f1332005    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16422    f1332000    05.  /*# Fed Qualified Health Centers   Certified Medicare Providers         */
     @16427    f0954508    08.  /*Inpatient Days                   Incl Nurs Home;Total Hosp            */
     @16435    f0954507    08.  /*Inpatient Days                   Incl Nurs Home;Total Hosp            */
     @16443    f0954506    08.  /*Inpatient Days                   Incl Nurs Home;Total Hosp            */
     @16451    f0954505    08.  /*Inpatient Days                   Incl Nurs Home;Total Hosp            */
     @16459    f0954608    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16466    f0954607    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16473    f0954606    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16480    f0954605    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16487    f0954600    07.  /*Inpatient Days in ST Gen Hosp                                         */
     @16494    f0954708    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16501    f0954707    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16508    f0954706    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16515    f0954705    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16522    f0954700    07.  /*Inptn Days in STNG/LT Hosp       ST Non-Gen + Long Term Hosps         */
     @16529    f1318808    06.  /*Inptn Days in ST Psychiatric     Short Term Hospitals                 */
     @16535    f1318908    06.  /*Inptn Days in ST Rehabilitation  Short Term Hospitals                 */
     @16541    f1466708    06.  /*Inptn Days in ST Chldrn's Gen    Short Term Hospitals                 */
     @16547    f1319008    06.  /*Inptn Days in ST Chldrn's Psych  Short Term Hospitals                 */
     @16553    f1412008    06.  /*Inptn Days in ST Acute LT Care   Short Term Hospitals                 */
     @16559    f1068408    06.  /*Inptn Days in LT Gen Med/Surg    Long Term Hospitals                  */
     @16565    f1068508    06.  /*Inptn Days in LT Psychiatric     Long Term Hospitals                  */
     @16571    f1068608    06.  /*Inptn Days in LT Rehabilitation  Long Term Hospitals                  */
     @16577    f1068708    06.  /*Inptn Day in LT Chronic Disease  Long Term Hospitals                  */
     @16583    f1068908    06.  /*Inptn Day in LT Inst/Ment Retrd  Long Term Hospitals                  */
     @16589    f1069008    06.  /*Inptn Days in LT Chldrn's Psych  Long Term Hospitals                  */
     @16595    f1412108    06.  /*Inptn Days in LT Acute LT Care   Long Term Hospitals                  */
     @16601    f0954808    07.  /*Inptn Days in Short Term Comm                                         */
     @16608    f0954805    07.  /*Inptn Days in Short Term Comm                                         */
     @16615    f0954800    07.  /*Inptn Days in Short Term Comm                                         */
     @16622    f0955208    06.  /*Inpatient Days in VA Hosps       Veterans Hospitals                   */
     @16628    f1405608    06.  /*Nurs Home Inpatient Days         Total Hospitals                      */
     @16634    f1405607    07.  /*Nurs Home Inpatient Days         Total Hospitals                      */
     @16641    f1405606    07.  /*Nurs Home Inpatient Days         Total Hospitals                      */
     @16648    f1405605    07.  /*Nurs Home Inpatient Days         Total Hospitals                      */
     @16655    f1405708    06.  /*Nurs Home Inpatient Days, STGEN  Short Term General Hospitals         */
     @16661    f1405707    07.  /*Nurs Home Inpatient Days, STGEN  Short Term General Hospitals         */
     @16668    f1405706    07.  /*Nurs Home Inpatient Days, STGEN  Short Term General Hospitals         */
     @16675    f1405705    07.  /*Nurs Home Inpatient Days, STGEN  Short Term General Hospitals         */
     @16682    f1405808    06.  /*Nurs Home Inptn Days, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @16688    f1405807    07.  /*Nurs Home Inptn Days, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @16695    f1405806    07.  /*Nurs Home Inptn Days, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @16702    f1405805    07.  /*Nurs Home Inptn Days, STNG/LT    ST Non-Gen + Long Term Hosps         */
     @16709    f1031308    06.  /*# Tot Fac Medicare Inpat Dchrg   Short Term General Hospitals         */
     @16715    f1031305    06.  /*# Tot Fac Medicare Inpat Dchrg   Short Term General Hospitals         */
     @16721    f1031300    06.  /*# Tot Fac Medicare Inpat Dchrg   Short Term General Hospitals         */
     @16727    f1031408    06.  /*# Tot Fac Medicare Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @16733    f1031405    06.  /*# Tot Fac Medicare Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @16739    f1031400    06.  /*# Tot Fac Medicare Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @16745    f1031508    06.  /*# Tot Fac Medicaid Inpat Dchrg   Short Term General Hospitals         */
     @16751    f1031505    06.  /*# Tot Fac Medicaid Inpat Dchrg   Short Term General Hospitals         */
     @16757    f1031500    06.  /*# Tot Fac Medicaid Inpat Dchrg   Short Term General Hospitals         */
     @16763    f1031608    06.  /*# Tot Fac Medicaid Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @16769    f1031605    06.  /*# Tot Fac Medicaid Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @16775    f1031600    06.  /*# Tot Fac Medicaid Inpat Dchrg   ST Non-Gen + Long Term Hosps         */
     @16781    f1139108    03.  /*Dist Hosp By 00 - 39% Util Rate  Short Term General Hospitals         */
     @16784    f1139105    03.  /*Dist Hosp By 00 - 39% Util Rate  Short Term General Hospitals         */
     @16787    f1139100    03.  /*Dist Hosp By 00 - 39% Util Rate  Short Term General Hospitals         */
     @16790    f1139208    03.  /*Dist Hosp By 40 - 59% Util Rate  Short Term General Hospitals         */
     @16793    f1139205    03.  /*Dist Hosp By 40 - 59% Util Rate  Short Term General Hospitals         */
     @16796    f1139200    03.  /*Dist Hosp By 40 - 59% Util Rate  Short Term General Hospitals         */
     @16799    f1139308    03.  /*Dist Hosp By 60 - 79% Util Rate  Short Term General Hospitals         */
     @16802    f1139305    03.  /*Dist Hosp By 60 - 79% Util Rate  Short Term General Hospitals         */
     @16805    f1139300    03.  /*Dist Hosp By 60 - 79% Util Rate  Short Term General Hospitals         */
     @16808    f1139408    03.  /*Dist Hosp By 80+% Util Rate      Short Term General Hospitals         */
     @16811    f1139405    03.  /*Dist Hosp By 80+% Util Rate      Short Term General Hospitals         */
     @16814    f1139400    03.  /*Dist Hosp By 80+% Util Rate      Short Term General Hospitals         */
     @16817    f0956608    08.  /*Outpat Visits in ST Gen Hosp     Emer Dept + Other OP Visits          */
     @16825    f0956607    08.  /*Outpat Visits in ST Gen Hosp     Emer Dept + Other OP Visits          */
     @16833    f0956606    08.  /*Outpat Visits in ST Gen Hosp     Emer Room + Other OP Visits          */
     @16841    f0956605    08.  /*Outpat Visits in ST Gen Hosp     Emer Room + Other OP Visits          */
     @16849    f0956600    08.  /*Outpat Visits in ST Gen Hosp     Emer Room + Other OP Visits          */
     @16857    f0956708    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Dept + Other OP Visits          */
     @16865    f0956707    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Dept + Other OP Visits          */
     @16873    f0956706    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Dept + Other OP Visits          */
     @16881    f0956705    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Room + Other OP Visits          */
     @16889    f0956700    08.  /*Outpat Visits in ST Non-Gen Hsp  Emer Room + Other OP Visits          */
     @16897    f0956808    08.  /*Outpat Visits in Long Term Hosp  Emer Dept + Other OP Visits          */
     @16905    f0956807    08.  /*Outpat Visits in Long Term Hosp  Emer Dept + Other OP Visits          */
     @16913    f0956806    08.  /*Outpat Visits in Long Term Hosp  Emer Dept + Other OP Visits          */
     @16921    f0956805    08.  /*Outpat Visits in Long Term Hosp  Emer Room + Other OP Visits          */
     @16929    f0956800    08.  /*Outpat Visits in Long Term Hosp  Emer Room + Other OP Visits          */
     @16937    f0957108    08.  /*Outpatient Visits in VA Hosp     Emer Dept + Other OP Visits          */
     @16945    f0957208    08.  /*Emergency Department Visits      Short Term General Hospitals         */
     @16953    f0957207    08.  /*Emergency Department Visits      Short Term General Hospitals         */
     @16961    f0957206    08.  /*Emergency Department Visits      Short Term General Hospitals         */
     @16969    f0957205    08.  /*Emergency Room Visits            Short Term General Hospitals         */
     @16977    f0957200    08.  /*Emergency Room Visits            Short Term General Hospitals         */
     @16985    f0957408    08.  /*Emergency Department Visits      ST Non-Gen + Long Term Hosps         */
     @16993    f0957407    08.  /*Emergency Department Visits      ST Non-Gen + Long Term Hosps         */
     @17001    f0957406    08.  /*Emergency Department Visits      ST Non-Gen + Long Term Hosps         */
     @17009    f0957405    08.  /*Emergency Room Visits            ST Non-Gen + Long Term Hosps         */
     @17017    f0957400    08.  /*Emergency Room Visits            ST Non-Gen + Long Term Hosps         */
     @17025    f0957508    08.  /*Outpatient Visits - Other        Short Term General Hospitals         */
     @17033    f0957505    08.  /*Outpatient Visits - Other        Short Term General Hospitals         */
     @17041    f0957500    08.  /*Outpatient Visits - Other        Short Term General Hospitals         */
     @17049    f0957608    08.  /*Outpatient Visits - Other        ST Non-Gen + Long Term Hosps         */
     @17057    f0957605    08.  /*Outpatient Visits - Other        ST Non-Gen + Long Term Hosps         */
     @17065    f0957600    08.  /*Outpatient Visits - Other        ST Non-Gen + Long Term Hosps         */
     @17073    f0957708    09.  /*Total Medicare Inpatient Days    Short Term General Hospitals         */
     @17082    f0957705    09.  /*Total Medicare Inpatient Days    Short Term General Hospitals         */
     @17091    f0957700    09.  /*Total Medicare Inpatient Days    Short Term General Hospitals         */
     @17100    f0957808    09.  /*Total Medicare Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17109    f0957805    09.  /*Total Medicare Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17118    f0957800    09.  /*Total Medicare Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17127    f0970608    08.  /*Total Medicaid Inpatient Days    Short Term General Hospitals         */
     @17135    f0970605    08.  /*Total Medicaid Inpatient Days    Short Term General Hospitals         */
     @17143    f0970600    08.  /*Total Medicaid Inpatient Days    Short Term General Hospitals         */
     @17151    f0958008    08.  /*Total Medicaid Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17159    f0958005    08.  /*Total Medicaid Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17167    f0958000    08.  /*Total Medicaid Inpatient Days    ST Non-Gen + Long Term Hosps         */
     @17175    f0958308    06.  /*# Surgical Operations, Inpatnt   Short Term General Hospitals         */
     @17181    f0958305    06.  /*# Surgical Operations, Inpatnt   Short Term General Hospitals         */
     @17187    f0958300    06.  /*# Surgical Operations, Inpatnt   Short Term General Hospitals         */
     @17193    f0958408    06.  /*# Surgical Operations, Inpatnt   ST Non-Gen + Long Term Hosps         */
     @17199    f0958405    06.  /*# Surgical Operations, Inpatnt   ST Non-Gen + Long Term Hosps         */
     @17205    f0958400    06.  /*# Surgical Operations, Inpatnt   ST Non-Gen + Long Term Hosps         */
     @17211    f0970708    06.  /*# Surgical Operations, Outpatnt  Short Term General Hospitals         */
     @17217    f0970705    06.  /*# Surgical Operations, Outpatnt  Short Term General Hospitals         */
     @17223    f0970700    06.  /*# Surgical Operations, Outpatnt  Short Term General Hospitals         */
     @17229    f0958608    06.  /*# Surgical Operations, Outpatnt  ST Non-Gen + Long Term Hosps         */
     @17235    f0958605    06.  /*# Surgical Operations, Outpatnt  ST Non-Gen + Long Term Hosps         */
     @17241    f0958600    06.  /*# Surgical Operations, Outpatnt  ST Non-Gen + Long Term Hosps         */
     @17247    f0958708    06.  /*# Surgical Operations, Total     Short Term General Hospitals         */
     @17253    f0958705    06.  /*# Surgical Operations, Total     Short Term General Hospitals         */
     @17259    f0958700    06.  /*# Surgical Operations, Total     Short Term General Hospitals         */
     @17265    f0958908    06.  /*# Surgical Operations, Total     ST Non-Gen + Long Term Hosps         */
     @17271    f0958905    06.  /*# Surgical Operations, Total     ST Non-Gen + Long Term Hosps         */
     @17277    f0958900    06.  /*# Surgical Operations, Total     ST Non-Gen + Long Term Hosps         */
     @17283    f0959208    06.  /*# Surgical Operations, Total     Veterans Hospitals                   */
     @17289    f1331808    03.  /*# Operating Rooms                Short Term General Hospitals         */
     @17292    f1331805    03.  /*# Operating Rooms                Short Term General Hospitals         */
     @17295    f1331800    03.  /*# Operating Rooms                Short Term General Hospitals         */
     @17298    f1331908    03.  /*# Operating Rooms                ST Non-Gen + Long Term Hosps         */
     @17301    f1331905    03.  /*# Operating Rooms                ST Non-Gen + Long Term Hosps         */
     @17304    f1331900    03.  /*# Operating Rooms                ST Non-Gen + Long Term Hosps         */
     @17307    f1392908    04.  /*# Airborne Infection Isol Rooms  Short Term General Hospitals         */
     @17311    f1392905    04.  /*# Airborne Infection Isol Rooms  Short Term General Hospitals         */
     @17315    f1393708    04.  /*# Airborne Infection Isol Rooms  ST Non-Gen + Long Term Hosps         */
     @17319    f1393705    04.  /*# Airborne Infection Isol Rooms  ST Non-Gen + Long Term Hosps         */
     @17323    f0959308    03.  /*# Facilities Reporting Expenses  Short Term General Hospitals         */
     @17326    f0959305    03.  /*# Facilities Reporting Expenses  Short Term General Hospitals         */
     @17329    f0959300    03.  /*# Facilities Reporting Expenses  Short Term General Hospitals         */
     @17332    f0959408    03.  /*# Facilities Reporting Expenses  ST Non-Gen + Long Term Hosps         */
     @17335    f0959405    03.  /*# Facilities Reporting Expenses  ST Non-Gen + Long Term Hosps         */
     @17338    f0959400    03.  /*# Facilities Reporting Expenses  ST Non-Gen + Long Term Hosps         */
     @17341    f0959508    03.  /*# Facilities Reporting Expenses  Veterans Hospitals                   */
     @17344    f0959608    09.  /*Total Rep Facility Exp (1000's)  In Thousands, ST Gen Hosps           */
     @17353    f0959605    09.  /*Total Rep Facility Exp (1000's)  In Thousands, ST Gen Hosps           */
     @17362    f0959600    09.  /*Total Rep Facility Exp (1000's)  In Thousands, ST Gen Hosps           */
     @17371    f0959708    09.  /*Total Rep Facility Exp (1000's)  In Thousands, STNG/LT Hosps          */
     @17380    f0959705    09.  /*Total Rep Facility Exp (1000's)  In Thousands, STNG/LT Hosps          */
     @17389    f0959700    09.  /*Total Rep Facility Exp (1000's)  In Thousands, STNG/LT Hosps          */
     @17398    f0959808    09.  /*Total Rep Facility Exp (1000's)  In Thousands, Veterans Hosps         */
     @17407    f0960708    03.  /*# Facs Reporting Payroll Expens  Short Term General Hospitals         */
     @17410    f0960705    03.  /*# Facs Reporting Payroll Expens  Short Term General Hospitals         */
     @17413    f0960700    03.  /*# Facs Reporting Payroll Expens  Short Term General Hospitals         */
     @17416    f0960808    03.  /*# Facs Reporting Payroll Expens  ST Non-Gen + Long Term Hosps         */
     @17419    f0960805    03.  /*# Facs Reporting Payroll Expens  ST Non-Gen + Long Term Hosps         */
     @17422    f0960800    03.  /*# Facs Reporting Payroll Expens  ST Non-Gen + Long Term Hosps         */
     @17425    f0960908    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, ST Gen Hosps           */
     @17434    f0960905    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, ST Gen Hosps           */
     @17443    f0960900    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, ST Gen Hosps           */
     @17452    f0961008    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, STNG/LT Hosps          */
     @17461    f0961005    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, STNG/LT Hosps          */
     @17470    f0961000    09.  /*Tot Rep Payroll Expense(1000's)  In Thousands, STNG/LT Hosps          */
     @17479    f1319410    06.2 /*Medicare Adv PtA Aged Pymt Rate  (.01)                                */
     @17485    f1319409    06.2 /*Medicare Adv PtA Aged Pymt Rate  (.01)                                */
     @17491    f1319408    06.2 /*Medicare Adv PtA Aged Pymt Rate  (.01)                                */
     @17497    f1319407    06.2 /*Medicare Adv PtA Aged Pymt Rate  (.01)                                */
     @17503    f1319406    06.2 /*Medicare Adv PtA Aged Pymt Rate  (.01)                                */
     @17509    f1319405    06.2 /*Medicare Adv PtA Aged Pymt Rate  (.01)                                */
     @17515    f1319400    06.2 /*Medcre+Choice PtA Aged Pmt Rate  (.01)                                */
     @17521    f1319510    06.2 /*Medicare Adv PtB Aged Pymt Rate  (.01)                                */
     @17527    f1319509    06.2 /*Medicare Adv PtB Aged Pymt Rate  (.01)                                */
     @17533    f1319508    06.2 /*Medicare Adv PtB Aged Pymt Rate  (.01)                                */
     @17539    f1319507    06.2 /*Medicare Adv PtB Aged Pymt Rate  (.01)                                */
     @17545    f1319506    06.2 /*Medicare Adv PtB Aged Pymt Rate  (.01)                                */
     @17551    f1319505    06.2 /*Medicare Adv PtB Aged Pymt Rate  (.01)                                */
     @17557    f1319500    06.2 /*Medcre+Choice PtB Aged Pmt Rate  (.01)                                */
     @17563    f0453010    08.  /*Census Population                Whole Numbers                        */
     @17571    f1198409    08.  /*Population Estimate              Whole Numbers                        */
     @17579    f1198408    08.  /*Population Estimate              Whole Numbers                        */
     @17587    f1198407    08.  /*Population Estimate              Whole Numbers                        */
     @17595    f1198406    08.  /*Population Estimate              Whole Numbers                        */
     @17603    f1198405    08.  /*Population Estimate              Whole Numbers                        */
     @17611    f1198404    08.  /*Population Estimate              Whole Numbers                        */
     @17619    f1198403    08.  /*Population Estimate              Whole Numbers                        */
     @17627    f1198402    08.  /*Population Estimate              Whole Numbers                        */
     @17635    f1198401    08.  /*Population Estimate              Whole Numbers                        */
     @17643    f0453000    08.  /*Census Population                Whole Numbers                        */
     @17651    f1198499    08.  /*Population Estimate              Whole Numbers                        */
     @17659    f1198498    08.  /*Population Estimate              Whole Numbers                        */
     @17667    f1198497    08.  /*Population Estimate              Whole Numbers                        */
     @17675    f1198496    08.  /*Population Estimate              Whole Numbers                        */
     @17683    f1198495    08.  /*Population Estimate              Whole Numbers                        */
     @17691    f1198494    08.  /*Population Estimate              Whole Numbers                        */
     @17699    f1198493    08.  /*Population Estimate              Whole Numbers                        */
     @17707    f1198492    08.  /*Population Estimate              Whole Numbers                        */
     @17715    f1198491    08.  /*Population Estimate              Whole Numbers                        */
     @17723    f1139790    05.  /*Census Population (100's)        In Hundreds                          */
     @17728    f0403988    05.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @17733    f0403987    05.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @17738    f0403986    05.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @17743    f0403985    06.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @17749    f0403984    06.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @17755    f0403983    06.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @17761    f0403982    06.  /*Population Estimate (100's)      In Hundreds; Prov. Est.              */
     @17767    f1139780    05.  /*Census Population (100's)        In Hundreds                          */
     @17772    f0017970    07.  /*Census Population (100's)        In Hundreds (Total Resident)         */
     @17779    f1139860    05.  /*Census Population (100's)        In Hundreds                          */
     @17784    f1139850    05.  /*Census Population (100's)        In Hundreds                          */
     @17789    f1139840    05.  /*Census Population (100's)        In Hundreds                          */
     @17794    f1318208    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @17803    f1318207    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @17812    f1318206    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @17821    f1318205    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @17830    f1318200    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @17839    f1318295    09.  /*Persons/Quasi-individual         Whole Numbers                        */
     @17848    f1390609    07.  /*Pop Total Male                   Whole Numbers, Estimates             */
     @17855    f1390608    07.  /*Pop Total Male                   Whole Numbers, Estimates             */
     @17862    f1390607    07.  /*Pop Total Male                   Whole Numbers, Estimates             */
     @17869    f1390606    07.  /*Pop Total Male                   Whole Numbers, Estimates             */
     @17876    f1390605    07.  /*Pop Total Male                   Whole Numbers, Estimates             */
     @17883    f1390600    07.  /*Pop Total Male                   Whole Numbers, Estimates             */
     @17890    f1390709    07.  /*Pop Total Female                 Whole Numbers, Estimates             */
     @17897    f1390708    07.  /*Pop Total Female                 Whole Numbers, Estimates             */
     @17904    f1390707    07.  /*Pop Total Female                 Whole Numbers, Estimates             */
     @17911    f1390706    07.  /*Pop Total Female                 Whole Numbers, Estimates             */
     @17918    f1390705    07.  /*Pop Total Female                 Whole Numbers, Estimates             */
     @17925    f1390700    07.  /*Pop Total Female                 Whole Numbers, Estimates             */
     @17932    f1390809    07.  /*Pop White Male                   Whole Numbers, Estimates             */
     @17939    f1390808    07.  /*Pop White Male                   Whole Numbers, Estimates             */
     @17946    f1390807    07.  /*Pop White Male                   Whole Numbers, Estimates             */
     @17953    f1390806    07.  /*Pop White Male                   Whole Numbers, Estimates             */
     @17960    f1390805    07.  /*Pop White Male                   Whole Numbers, Estimates             */
     @17967    f1390800    07.  /*Pop White Male                   Whole Numbers, Estimates             */
     @17974    f1390909    07.  /*Pop White Female                 Whole Numbers, Estimates             */
     @17981    f1390908    07.  /*Pop White Female                 Whole Numbers, Estimates             */
     @17988    f1390907    07.  /*Pop White Female                 Whole Numbers, Estimates             */
     @17995    f1390906    07.  /*Pop White Female                 Whole Numbers, Estimates             */
     @18002    f1390905    07.  /*Pop White Female                 Whole Numbers, Estimates             */
     @18009    f1390900    07.  /*Pop White Female                 Whole Numbers, Estimates             */
     @18016    f1392609    07.  /*Pop White Non-Hisp/Latino Male   Whole Numbers, Estimates             */
     @18023    f1392608    07.  /*Pop White Non-Hisp/Latino Male   Whole Numbers, Estimates             */
     @18030    f1392607    07.  /*Pop White Non-Hisp/Latino Male   Whole Numbers, Estimates             */
     @18037    f1392606    07.  /*Pop White Non-Hisp/Latino Male   Whole Numbers, Estimates             */
     @18044    f1392605    07.  /*Pop White Non-Hisp/Latino Male   Whole Numbers, Estimates             */
     @18051    f1392600    07.  /*Pop White Non-Hisp/Latino Male   Whole Numbers, Estimates             */
     @18058    f1392709    07.  /*Pop White Non-Hisp/Latino Femle  Whole Numbers, Estimates             */
     @18065    f1392708    07.  /*Pop White Non-Hisp/Latino Femle  Whole Numbers, Estimates             */
     @18072    f1392707    07.  /*Pop White Non-Hisp/Latino Femle  Whole Numbers, Estimates             */
     @18079    f1392706    07.  /*Pop White Non-Hisp/Latino Femle  Whole Numbers, Estimates             */
     @18086    f1392705    07.  /*Pop White Non-Hisp/Latino Femle  Whole Numbers, Estimates             */
     @18093    f1392700    07.  /*Pop White Non-Hisp/Latino Femle  Whole Numbers, Estimates             */
     @18100    f1392409    07.  /*Pop White Hispanic/Latino Male   Whole Numbers, Estimates             */
     @18107    f1392408    07.  /*Pop White Hispanic/Latino Male   Whole Numbers, Estimates             */
     @18114    f1392407    07.  /*Pop White Hispanic/Latino Male   Whole Numbers, Estimates             */
     @18121    f1392406    07.  /*Pop White Hispanic/Latino Male   Whole Numbers, Estimates             */
     @18128    f1392405    07.  /*Pop White Hispanic/Latino Male   Whole Numbers, Estimates             */
     @18135    f1392400    07.  /*Pop White Hispanic/Latino Male   Whole Numbers, Estimates             */
     @18142    f1392509    07.  /*Pop White Hispanic/Latino Femle  Whole Numbers, Estimates             */
     @18149    f1392508    07.  /*Pop White Hispanic/Latino Femle  Whole Numbers, Estimates             */
     @18156    f1392507    07.  /*Pop White Hispanic/Latino Femle  Whole Numbers, Estimates             */
     @18163    f1392506    07.  /*Pop White Hispanic/Latino Femle  Whole Numbers, Estimates             */
     @18170    f1392505    07.  /*Pop White Hispanic/Latino Femle  Whole Numbers, Estimates             */
     @18177    f1392500    07.  /*Pop White Hispanic/Latino Femle  Whole Numbers, Estimates             */
     @18184    f1391009    06.  /*Pop Black/African Amer Male      Whole Numbers, Estimates             */
     @18190    f1391008    06.  /*Pop Black/African Amer Male      Whole Numbers, Estimates             */
     @18196    f1391007    06.  /*Pop Black/African Amer Male      Whole Numbers, Estimates             */
     @18202    f1391006    06.  /*Pop Black/African Amer Male      Whole Numbers, Estimates             */
     @18208    f1391005    06.  /*Pop Black/African Amer Male      Whole Numbers, Estimates             */
     @18214    f1391000    06.  /*Pop Black/African Amer Male      Whole Numbers, Estimates             */
     @18220    f1391109    06.  /*Pop Black/African Amer Female    Whole Numbers, Estimates             */
     @18226    f1391108    06.  /*Pop Black/African Amer Female    Whole Numbers, Estimates             */
     @18232    f1391107    06.  /*Pop Black/African Amer Female    Whole Numbers, Estimates             */
     @18238    f1391106    06.  /*Pop Black/African Amer Female    Whole Numbers, Estimates             */
     @18244    f1391105    06.  /*Pop Black/African Amer Female    Whole Numbers, Estimates             */
     @18250    f1391100    06.  /*Pop Black/African Amer Female    Whole Numbers, Estimates             */
     @18256    f1397909    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Male  Whole Numbers, Estimates             */
     @18262    f1397908    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Male  Whole Numbers, Estimates             */
     @18268    f1397907    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Male  Whole Numbers, Estimates             */
     @18274    f1397906    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Male  Whole Numbers, Estimates             */
     @18280    f1397905    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Male  Whole Numbers, Estimates             */
     @18286    f1398009    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Fmle  Whole Numbers, Estimates             */
     @18292    f1398008    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Fmle  Whole Numbers, Estimates             */
     @18298    f1398007    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Fmle  Whole Numbers, Estimates             */
     @18304    f1398006    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Fmle  Whole Numbers, Estimates             */
     @18310    f1398005    06.  /*Pop Bl/Afr Am Non-Hisp/Lat Fmle  Whole Numbers, Estimates             */
     @18316    f1398109    06.  /*Pop Bl/Afr Hispanic/Latino Male  Whole Numbers, Estimates             */
     @18322    f1398108    06.  /*Pop Bl/Afr Hispanic/Latino Male  Whole Numbers, Estimates             */
     @18328    f1398107    06.  /*Pop Bl/Afr Hispanic/Latino Male  Whole Numbers, Estimates             */
     @18334    f1398106    06.  /*Pop Bl/Afr Hispanic/Latino Male  Whole Numbers, Estimates             */
     @18340    f1398105    06.  /*Pop Bl/Afr Hispanic/Latino Male  Whole Numbers, Estimates             */
     @18346    f1398209    06.  /*Pop Bl/Afr Hispanic/Latino Fmle  Whole Numbers, Estimates             */
     @18352    f1398208    06.  /*Pop Bl/Afr Hispanic/Latino Fmle  Whole Numbers, Estimates             */
     @18358    f1398207    06.  /*Pop Bl/Afr Hispanic/Latino Fmle  Whole Numbers, Estimates             */
     @18364    f1398206    06.  /*Pop Bl/Afr Hispanic/Latino Fmle  Whole Numbers, Estimates             */
     @18370    f1398205    06.  /*Pop Bl/Afr Hispanic/Latino Fmle  Whole Numbers, Estimates             */
     @18376    f1391209    06.  /*Pop Am Ind/Alaska Native Male    Whole Numbers, Estimates             */
     @18382    f1391208    06.  /*Pop Am Ind/Alaska Native Male    Whole Numbers, Estimates             */
     @18388    f1391207    06.  /*Pop Am Ind/Alaska Native Male    Whole Numbers, Estimates             */
     @18394    f1391206    06.  /*Pop Am Ind/Alaska Native Male    Whole Numbers, Estimates             */
     @18400    f1391205    06.  /*Pop Am Ind/Alaska Native Male    Whole Numbers, Estimates             */
     @18406    f1391200    06.  /*Pop Am Ind/Alaska Native Male    Whole Numbers, Estimates             */
     @18412    f1391309    06.  /*Pop Am Ind/Alaska Native Female  Whole Numbers, Estimates             */
     @18418    f1391308    06.  /*Pop Am Ind/Alaska Native Female  Whole Numbers, Estimates             */
     @18424    f1391307    06.  /*Pop Am Ind/Alaska Native Female  Whole Numbers, Estimates             */
     @18430    f1391306    06.  /*Pop Am Ind/Alaska Native Female  Whole Numbers, Estimates             */
     @18436    f1391305    06.  /*Pop Am Ind/Alaska Native Female  Whole Numbers, Estimates             */
     @18442    f1391300    06.  /*Pop Am Ind/Alaska Native Female  Whole Numbers, Estimates             */
     @18448    f1391409    06.  /*Pop Asian Male                   Whole Numbers, Estimates             */
     @18454    f1391408    06.  /*Pop Asian Male                   Whole Numbers, Estimates             */
     @18460    f1391407    06.  /*Pop Asian Male                   Whole Numbers, Estimates             */
     @18466    f1391406    06.  /*Pop Asian Male                   Whole Numbers, Estimates             */
     @18472    f1391405    06.  /*Pop Asian Male                   Whole Numbers, Estimates             */
     @18478    f1391400    06.  /*Pop Asian Male                   Whole Numbers, Estimates             */
     @18484    f1391609    06.  /*Pop Nat Hawi/Oth Pac Isl Male    Whole Numbers, Estimates             */
     @18490    f1391608    06.  /*Pop Nat Hawi/Oth Pac Isl Male    Whole Numbers, Estimates             */
     @18496    f1391607    06.  /*Pop Nat Hawi/Oth Pac Isl Male    Whole Numbers, Estimates             */
     @18502    f1391606    06.  /*Pop Nat Hawi/Oth Pac Isl Male    Whole Numbers, Estimates             */
     @18508    f1391605    06.  /*Pop Nat Hawi/Oth Pac Isl Male    Whole Numbers, Estimates             */
     @18514    f1391600    06.  /*Pop Nat Hawi/Oth Pac Isl Male    Whole Numbers, Estimates             */
     @18520    f1391509    06.  /*Pop Asian Female                 Whole Numbers, Estimates             */
     @18526    f1391508    06.  /*Pop Asian Female                 Whole Numbers, Estimates             */
     @18532    f1391507    06.  /*Pop Asian Female                 Whole Numbers, Estimates             */
     @18538    f1391506    06.  /*Pop Asian Female                 Whole Numbers, Estimates             */
     @18544    f1391505    06.  /*Pop Asian Female                 Whole Numbers, Estimates             */
     @18550    f1391500    06.  /*Pop Asian Female                 Whole Numbers, Estimates             */
     @18556    f1391709    06.  /*Pop Nat Hawi/Oth Pac Isl Female  Whole Numbers, Estimates             */
     @18562    f1391708    06.  /*Pop Nat Hawi/Oth Pac Isl Female  Whole Numbers, Estimates             */
     @18568    f1391707    06.  /*Pop Nat Hawi/Oth Pac Isl Female  Whole Numbers, Estimates             */
     @18574    f1391706    06.  /*Pop Nat Hawi/Oth Pac Isl Female  Whole Numbers, Estimates             */
     @18580    f1391705    06.  /*Pop Nat Hawi/Oth Pac Isl Female  Whole Numbers, Estimates             */
     @18586    f1391700    06.  /*Pop Nat Hawi/Oth Pac Isl Female  Whole Numbers, Estimates             */
     @18592    f1391809    06.  /*Pop Two or more Races Male       Whole Numbers, Estimates             */
     @18598    f1391808    06.  /*Pop Two or more Races Male       Whole Numbers, Estimates             */
     @18604    f1391807    06.  /*Pop Two or more Races Male       Whole Numbers, Estimates             */
     @18610    f1391806    06.  /*Pop Two or more Races Male       Whole Numbers, Estimates             */
     @18616    f1391805    06.  /*Pop Two or more Races Male       Whole Numbers, Estimates             */
     @18622    f1391800    06.  /*Pop Two or more Races Male       Whole Numbers, Estimates             */
     @18628    f1391909    06.  /*Pop Two or more Races Female     Whole Numbers, Estimates             */
     @18634    f1391908    06.  /*Pop Two or more Races Female     Whole Numbers, Estimates             */
     @18640    f1391907    06.  /*Pop Two or more Races Female     Whole Numbers, Estimates             */
     @18646    f1391906    06.  /*Pop Two or more Races Female     Whole Numbers, Estimates             */
     @18652    f1391905    06.  /*Pop Two or more Races Female     Whole Numbers, Estimates             */
     @18658    f1391900    06.  /*Pop Two or more Races Female     Whole Numbers, Estimates             */
     @18664    f1392009    07.  /*Pop Tot Hispanic/Latino Male     Whole Numbers, Estimates             */
     @18671    f1392008    07.  /*Pop Tot Hispanic/Latino Male     Whole Numbers, Estimates             */
     @18678    f1392007    07.  /*Pop Tot Hispanic/Latino Male     Whole Numbers, Estimates             */
     @18685    f1392006    07.  /*Pop Tot Hispanic/Latino Male     Whole Numbers, Estimates             */
     @18692    f1392005    07.  /*Pop Tot Hispanic/Latino Male     Whole Numbers, Estimates             */
     @18699    f1392000    07.  /*Pop Tot Hispanic/Latino Male     Whole Numbers, Estimates             */
     @18706    f1392109    07.  /*Pop Tot Hispanic/Latino Female   Whole Numbers, Estimates             */
     @18713    f1392108    07.  /*Pop Tot Hispanic/Latino Female   Whole Numbers, Estimates             */
     @18720    f1392107    07.  /*Pop Tot Hispanic/Latino Female   Whole Numbers, Estimates             */
     @18727    f1392106    07.  /*Pop Tot Hispanic/Latino Female   Whole Numbers, Estimates             */
     @18734    f1392105    07.  /*Pop Tot Hispanic/Latino Female   Whole Numbers, Estimates             */
     @18741    f1392100    07.  /*Pop Tot Hispanic/Latino Female   Whole Numbers, Estimates             */
     @18748    f1392209    07.  /*Pop Tot Non-Hisp/Latino Male     Whole Numbers, Estimates             */
     @18755    f1392208    07.  /*Pop Tot Non-Hisp/Latino Male     Whole Numbers, Estimates             */
     @18762    f1392207    07.  /*Pop Tot Non-Hisp/Latino Male     Whole Numbers, Estimates             */
     @18769    f1392206    07.  /*Pop Tot Non-Hisp/Latino Male     Whole Numbers, Estimates             */
     @18776    f1392205    07.  /*Pop Tot Non-Hisp/Latino Male     Whole Numbers, Estimates             */
     @18783    f1392200    07.  /*Pop Tot Non-Hisp/Latino Male     Whole Numbers, Estimates             */
     @18790    f1392309    07.  /*Pop Tot Non-Hisp/Latino Female   Whole Numbers, Estimates             */
     @18797    f1392308    07.  /*Pop Tot Non-Hisp/Latino Female   Whole Numbers, Estimates             */
     @18804    f1392307    07.  /*Pop Tot Non-Hisp/Latino Female   Whole Numbers, Estimates             */
     @18811    f1392306    07.  /*Pop Tot Non-Hisp/Latino Female   Whole Numbers, Estimates             */
     @18818    f1392305    07.  /*Pop Tot Non-Hisp/Latino Female   Whole Numbers, Estimates             */
     @18825    f1392300    07.  /*Pop Tot Non-Hisp/Latino Female   Whole Numbers, Estimates             */
     @18832    f0670400    06.  /*Pop Male  < 5                    Table P12, Whole Numbers             */
     @18838    f0670490    06.  /*Pop Male  < 5                    Whole Numbers                        */
     @18844    f0670500    06.  /*Pop Fmle  < 5                    Table P12, Whole Numbers             */
     @18850    f0670590    06.  /*Pop Fmle  < 5                    Whole Numbers                        */
     @18856    f0670600    06.  /*Pop Male  5-9                    Table P12, Whole Numbers             */
     @18862    f0670690    06.  /*Pop Male  5-9                    Whole Numbers                        */
     @18868    f0670700    06.  /*Pop Fmle  5-9                    Table P12, Whole Numbers             */
     @18874    f0670790    06.  /*Pop Fmle  5-9                    Whole Numbers                        */
     @18880    f0670800    06.  /*Pop Male 10-14                   Table P12, Whole Numbers             */
     @18886    f0670890    06.  /*Pop Male 10-14                   Whole Numbers                        */
     @18892    f0670900    06.  /*Pop Fmle 10-14                   Table P12, Whole Numbers             */
     @18898    f0670990    06.  /*Pop Fmle 10-14                   Whole Numbers                        */
     @18904    f0671000    06.  /*Pop Male 15-19                   Table P12, Whole Numbers             */
     @18910    f0671090    06.  /*Pop Male 15-19                   Whole Numbers                        */
     @18916    f0671100    06.  /*Pop Fmle 15-19                   Table P12, Whole Numbers             */
     @18922    f0671190    06.  /*Pop Fmle 15-19                   Whole Numbers                        */
     @18928    f0671200    06.  /*Pop Male 20-24                   Table P12, Whole Numbers             */
     @18934    f0671290    06.  /*Pop Male 20-24                   Whole Numbers                        */
     @18940    f0671300    06.  /*Pop Fmle 20-24                   Table P12, Whole Numbers             */
     @18946    f0671390    06.  /*Pop Fmle 20-24                   Whole Numbers                        */
     @18952    f0671400    06.  /*Pop Male 25-29                   Table P12, Whole Numbers             */
     @18958    f0671490    06.  /*Pop Male 25-29                   Whole Numbers                        */
     @18964    f0671500    06.  /*Pop Fmle 25-29                   Table P12, Whole Numbers             */
     @18970    f0671590    06.  /*Pop Fmle 25-29                   Whole Numbers                        */
     @18976    f0671600    06.  /*Pop Male 30-34                   Table P12, Whole Numbers             */
     @18982    f0671690    06.  /*Pop Male 30-34                   Whole Numbers                        */
     @18988    f0671700    06.  /*Pop Fmle 30-34                   Table P12, Whole Numbers             */
     @18994    f0671790    06.  /*Pop Fmle 30-34                   Whole Numbers                        */
     @19000    f0671800    06.  /*Pop Male 35-44                   Table P12, Whole Numbers             */
     @19006    f0671890    06.  /*Pop Male 35-44                   Whole Numbers                        */
     @19012    f0671900    06.  /*Pop Fmle 35-44                   Table P12, Whole Numbers             */
     @19018    f0671990    06.  /*Pop Fmle 35-44                   Whole Numbers                        */
     @19024    f0672000    06.  /*Pop Male 45-54                   Table P12, Whole Numbers             */
     @19030    f0672090    06.  /*Pop Male 45-54                   Whole Numbers                        */
     @19036    f0672100    06.  /*Pop Fmle 45-54                   Table P12, Whole Numbers             */
     @19042    f0672190    06.  /*Pop Fmle 45-54                   Whole Numbers                        */
     @19048    f0672200    06.  /*Pop Male 55-59                   Table P12, Whole Numbers             */
     @19054    f0672290    06.  /*Pop Male 55-59                   Whole Numbers                        */
     @19060    f0672300    06.  /*Pop Fmle 55-59                   Table P12, Whole Numbers             */
     @19066    f0672390    06.  /*Pop Fmle 55-59                   Whole Numbers                        */
     @19072    f0672400    06.  /*Pop Male 60-64                   Table P12, Whole Numbers             */
     @19078    f0672490    06.  /*Pop Male 60-64                   Whole Numbers                        */
     @19084    f0672500    06.  /*Pop Fmle 60-64                   Table P12, Whole Numbers             */
     @19090    f0672590    06.  /*Pop Fmle 60-64                   Whole Numbers                        */
     @19096    f0672600    06.  /*Pop Male 65-74                   Table P12, Whole Numbers             */
     @19102    f0672690    06.  /*Pop Male 65-74                   Whole Numbers                        */
     @19108    f0672700    06.  /*Pop Fmle 65-74                   Table P12, Whole Numbers             */
     @19114    f0672790    06.  /*Pop Fmle 65-74                   Whole Numbers                        */
     @19120    f1164000    06.  /*Pop Male 75-84                   Table P12, Whole Numbers             */
     @19126    f1164090    06.  /*Pop Male 75-84                   Whole Numbers                        */
     @19132    f1164100    06.  /*Pop Fmle 75-84                   Table P12, Whole Numbers             */
     @19138    f1164190    06.  /*Pop Fmle 75-84                   Whole Numbers                        */
     @19144    f1164200    06.  /*Pop Male > 84                    Table P12, Whole Numbers             */
     @19150    f1164290    06.  /*Pop Male > 84                    Whole Numbers                        */
     @19156    f1164300    06.  /*Pop Fmle > 84                    Table P12, Whole Numbers             */
     @19162    f1164390    06.  /*Pop Fmle > 84                    Whole Numbers                        */
     @19168    f0852200    06.  /*Pop White Male  < 5              Table P12A, Whole Numbers            */
     @19174    f0852290    06.  /*Pop White Male  < 5              Whole Numbers                        */
     @19180    f0851700    06.  /*Pop White Fmle  < 5              Table P12A, Whole Numbers            */
     @19186    f0851790    06.  /*Pop White Fmle  < 5              Whole Numbers                        */
     @19192    f1144300    06.  /*Pop White Male  5-9              Table P12A, Whole Numbers            */
     @19198    f1144390    06.  /*Pop White Male  5-9              Whole Numbers                        */
     @19204    f1144500    06.  /*Pop White Male 10-14             Table P12A, Whole Numbers            */
     @19210    f1144590    06.  /*Pop White Male 10-14             Whole Numbers                        */
     @19216    f1144400    06.  /*Pop White Fmle  5-9              Table P12A, Whole Numbers            */
     @19222    f1144490    06.  /*Pop White Fmle  5-9              Whole Numbers                        */
     @19228    f1144600    06.  /*Pop White Fmle 10-14             Table P12A, Whole Numbers            */
     @19234    f1144690    06.  /*Pop White Fmle 10-14             Whole Numbers                        */
     @19240    f1144700    06.  /*Pop White Male 15-19             Table P12A, Whole Numbers            */
     @19246    f1144790    06.  /*Pop White Male 15-19             Whole Numbers                        */
     @19252    f1144900    06.  /*Pop White Male 20-24             Table P12A, Whole Numbers            */
     @19258    f1144990    06.  /*Pop White Male 20-24             Whole Numbers                        */
     @19264    f1145100    06.  /*Pop White Male 25-29             Table P12A, Whole Numbers            */
     @19270    f1145190    06.  /*Pop White Male 25-29             Whole Numbers                        */
     @19276    f1145300    06.  /*Pop White Male 30-34             Table P12A, Whole Numbers            */
     @19282    f1145390    06.  /*Pop White Male 30-34             Whole Numbers                        */
     @19288    f1145500    06.  /*Pop White Male 35-44             Table P12A, Whole Numbers            */
     @19294    f1145590    06.  /*Pop White Male 35-44             Whole Numbers                        */
     @19300    f1145700    06.  /*Pop White Male 45-54             Table P12A, Whole Numbers            */
     @19306    f1145790    06.  /*Pop White Male 45-54             Whole Numbers                        */
     @19312    f1145900    06.  /*Pop White Male 55-59             Table P12A, Whole Numbers            */
     @19318    f1145990    06.  /*Pop White Male 55-59             Whole Numbers                        */
     @19324    f1144800    06.  /*Pop White Fmle 15-19             Table P12A, Whole Numbers            */
     @19330    f1144890    06.  /*Pop White Fmle 15-19             Whole Numbers                        */
     @19336    f1145000    06.  /*Pop White Fmle 20-24             Table P12A, Whole Numbers            */
     @19342    f1145090    06.  /*Pop White Fmle 20-24             Whole Numbers                        */
     @19348    f1145200    06.  /*Pop White Fmle 25-29             Table P12A, Whole Numbers            */
     @19354    f1145290    06.  /*Pop White Fmle 25-29             Whole Numbers                        */
     @19360    f1145400    06.  /*Pop White Fmle 30-34             Table P12A, Whole Numbers            */
     @19366    f1145490    06.  /*Pop White Fmle 30-34             Whole Numbers                        */
     @19372    f1145600    06.  /*Pop White Fmle 35-44             Table P12A, Whole Numbers            */
     @19378    f1145690    06.  /*Pop White Fmle 35-44             Whole Numbers                        */
     @19384    f1145800    06.  /*Pop White Fmle 45-54             Table P12A, Whole Numbers            */
     @19390    f1145890    06.  /*Pop White Fmle 45-54             Whole Numbers                        */
     @19396    f1146000    06.  /*Pop White Fmle 55-59             Table P12A, Whole Numbers            */
     @19402    f1146090    06.  /*Pop White Fmle 55-59             Whole Numbers                        */
     @19408    f0852500    06.  /*Pop White Male 60-64             Table P12A, Whole Numbers            */
     @19414    f0852590    06.  /*Pop White Male 60-64             Whole Numbers                        */
     @19420    f0852000    06.  /*Pop White Fmle 60-64             Table P12A, Whole Numbers            */
     @19426    f0852090    06.  /*Pop White Fmle 60-64             Whole Numbers                        */
     @19432    f1146300    06.  /*Pop White Male 65-74             Table P12A, Whole Numbers            */
     @19438    f1146390    06.  /*Pop White Male 65-74             Whole Numbers                        */
     @19444    f1146500    06.  /*Pop White Male 75-84             Table P12A, Whole Numbers            */
     @19450    f1146590    06.  /*Pop White Male 75-84             Whole Numbers                        */
     @19456    f1164400    06.  /*Pop White Male > 84              Table P12A, Whole Numbers            */
     @19462    f1164490    06.  /*Pop White Male > 84              Whole Numbers                        */
     @19468    f1146400    06.  /*Pop White Fmle 65-74             Table P12A, Whole Numbers            */
     @19474    f1146490    06.  /*Pop White Fmle 65-74             Whole Numbers                        */
     @19480    f1146600    06.  /*Pop White Fmle 75-84             Table P12A, Whole Numbers            */
     @19486    f1146690    06.  /*Pop White Fmle 75-84             Whole Numbers                        */
     @19492    f1164500    06.  /*Pop White Fmle > 84              Table P12A, Whole Numbers            */
     @19498    f1164590    06.  /*Pop White Fmle > 84              Whole Numbers                        */
     @19504    f0853200    06.  /*Pop Black/African Am Male  < 5   Table P12B, Whole Numbers            */
     @19510    f0853290    06.  /*Pop Black Male  < 5              Whole Numbers                        */
     @19516    f0852700    06.  /*Pop Black/African Am Fmle  < 5   Table P12B, Whole Numbers            */
     @19522    f0852790    06.  /*Pop Black Fmle  < 5              Whole Numbers                        */
     @19528    f1146900    06.  /*Pop Black/African Am Male  5-9   Table P12B, Whole Numbers            */
     @19534    f1146990    06.  /*Pop Black Male  5-9              Whole Numbers                        */
     @19540    f1147100    06.  /*Pop Black/African Am Male 10-14  Table P12B, Whole Numbers            */
     @19546    f1147190    06.  /*Pop Black Male 10-14             Whole Numbers                        */
     @19552    f1147000    06.  /*Pop Black/African Am Fmle  5-9   Table P12B, Whole Numbers            */
     @19558    f1147090    06.  /*Pop Black Fmle  5-9              Whole Numbers                        */
     @19564    f1147200    06.  /*Pop Black/African Am Fmle 10-14  Table P12B, Whole Numbers            */
     @19570    f1147290    06.  /*Pop Black Fmle 10-14             Whole Numbers                        */
     @19576    f1147300    06.  /*Pop Black/African Am Male 15-19  Table P12B, Whole Numbers            */
     @19582    f1147390    06.  /*Pop Black Male 15-19             Whole Numbers                        */
     @19588    f1147500    06.  /*Pop Black/African Am Male 20-24  Table P12B, Whole Numbers            */
     @19594    f1147590    06.  /*Pop Black Male 20-24             Whole Numbers                        */
     @19600    f1147700    06.  /*Pop Black/African Am Male 25-29  Table P12B, Whole Numbers            */
     @19606    f1147790    06.  /*Pop Black Male 25-29             Whole Numbers                        */
     @19612    f1147900    06.  /*Pop Black/African Am Male 30-34  Table P12B, Whole Numbers            */
     @19618    f1147990    06.  /*Pop Black Male 30-34             Whole Numbers                        */
     @19624    f1148100    06.  /*Pop Black/African Am Male 35-44  Table P12B, Whole Numbers            */
     @19630    f1148190    06.  /*Pop Black Male 35-44             Whole Numbers                        */
     @19636    f1148300    06.  /*Pop Black/African Am Male 45-54  Table P12B, Whole Numbers            */
     @19642    f1148390    06.  /*Pop Black Male 45-54             Whole Numbers                        */
     @19648    f1148500    06.  /*Pop Black/African Am Male 55-59  Table P12B, Whole Numbers            */
     @19654    f1148590    06.  /*Pop Black Male 55-59             Whole Numbers                        */
     @19660    f1147400    06.  /*Pop Black/African Am Fmle 15-19  Table P12B, Whole Numbers            */
     @19666    f1147490    06.  /*Pop Black Fmle 15-19             Whole Numbers                        */
     @19672    f1147600    06.  /*Pop Black/African Am Fmle 20-24  Table P12B, Whole Numbers            */
     @19678    f1147690    06.  /*Pop Black Fmle 20-24             Whole Numbers                        */
     @19684    f1147800    06.  /*Pop Black/African Am Fmle 25-29  Table P12B, Whole Numbers            */
     @19690    f1147890    06.  /*Pop Black Fmle 25-29             Whole Numbers                        */
     @19696    f1148000    06.  /*Pop Black/African Am Fmle 30-34  Table P12B, Whole Numbers            */
     @19702    f1148090    06.  /*Pop Black Fmle 30-34             Whole Numbers                        */
     @19708    f1148200    06.  /*Pop Black/African Am Fmle 35-44  Table P12B, Whole Numbers            */
     @19714    f1148290    06.  /*Pop Black Fmle 35-44             Whole Numbers                        */
     @19720    f1148400    06.  /*Pop Black/African Am Fmle 45-54  Table P12B, Whole Numbers            */
     @19726    f1148490    06.  /*Pop Black Fmle 45-54             Whole Numbers                        */
     @19732    f1148600    06.  /*Pop Black/African Am Fmle 55-59  Table P12B, Whole Numbers            */
     @19738    f1148690    06.  /*Pop Black Fmle 55-59             Whole Numbers                        */
     @19744    f0853500    06.  /*Pop Black/African Am Male 60-64  Table P12B, Whole Numbers            */
     @19750    f0853590    06.  /*Pop Black Male 60-64             Whole Numbers                        */
     @19756    f0853000    06.  /*Pop Black/African Am Fmle 60-64  Table P12B, Whole Numbers            */
     @19762    f0853090    06.  /*Pop Black Fmle 60-64             Whole Numbers                        */
     @19768    f1148900    06.  /*Pop Black/African Am Male 65-74  Table P12B, Whole Numbers            */
     @19774    f1148990    06.  /*Pop Black Male 65-74             Whole Numbers                        */
     @19780    f1149100    06.  /*Pop Black/African Am Male 75-84  Table P12B, Whole Numbers            */
     @19786    f1149190    06.  /*Pop Black Male 75-84             Whole Numbers                        */
     @19792    f1164600    06.  /*Pop Black/African Am Male > 84   Table P12B, Whole Numbers            */
     @19798    f1164690    06.  /*Pop Black Male > 84              Whole Numbers                        */
     @19804    f1149000    06.  /*Pop Black/African Am Fmle 65-74  Table P12B, Whole Numbers            */
     @19810    f1149090    06.  /*Pop Black Fmle 65-74             Whole Numbers                        */
     @19816    f1149200    06.  /*Pop Black/African Am Fmle 75-84  Table P12B, Whole Numbers            */
     @19822    f1149290    06.  /*Pop Black Fmle 75-84             Whole Numbers                        */
     @19828    f1164700    06.  /*Pop Black/African Am Fmle > 84   Table P12B, Whole Numbers            */
     @19834    f1164790    06.  /*Pop Black Fmle > 84              Whole Numbers                        */
     @19840    f1149300    06.  /*Pop Am Ind/Alaska Nat Male  < 5  Table P12C, Whole Numbers            */
     @19846    f1149390    06.  /*Pop Am Ind/Esk/Aleut Male  < 5   Whole Numbers                        */
     @19852    f1149400    06.  /*Pop Am Ind/Alaska Nat Fmle  < 5  Table P12C, Whole Numbers            */
     @19858    f1149490    06.  /*Pop Am Ind/Esk/Aleut Fmle  < 5   Whole Numbers                        */
     @19864    f1149500    06.  /*Pop Am Ind/Alaska Nat Male  5-9  Table P12C, Whole Numbers            */
     @19870    f1149590    06.  /*Pop Am Ind/Esk/Aleut Male  5-9   Whole Numbers                        */
     @19876    f1149600    06.  /*Pop Am Ind/Alaska Nat Fmle  5-9  Table P12C, Whole Numbers            */
     @19882    f1149690    06.  /*Pop Am Ind/Esk/Aleut Fmle  5-9   Whole Numbers                        */
     @19888    f1149700    06.  /*Pop Am Ind/Alska Nat Male 10-14  Table P12C, Whole Numbers            */
     @19894    f1149790    06.  /*Pop Am Ind/Esk/Aleut Male 10-14  Whole Numbers                        */
     @19900    f1149800    06.  /*Pop Am Ind/Alska Nat Fmle 10-14  Table P12C, Whole Numbers            */
     @19906    f1149890    06.  /*Pop Am Ind/Esk/Aleut Fmle 10-14  Whole Numbers                        */
     @19912    f1149900    06.  /*Pop Am Ind/Alska Nat Male 15-19  Table P12C, Whole Numbers            */
     @19918    f1149990    06.  /*Pop Am Ind/Esk/Aleut Male 15-19  Whole Numbers                        */
     @19924    f1150000    06.  /*Pop Am Ind/Alska Nat Fmle 15-19  Table P12C, Whole Numbers            */
     @19930    f1150090    06.  /*Pop Am Ind/Esk/Aleut Fmle 15-19  Whole Numbers                        */
     @19936    f1150100    06.  /*Pop Am Ind/Alska Nat Male 20-24  Table P12C, Whole Numbers            */
     @19942    f1150190    06.  /*Pop Am Ind/Esk/Aleut Male 20-24  Whole Numbers                        */
     @19948    f1150200    06.  /*Pop Am Ind/Alska Nat Fmle 20-24  Table P12C, Whole Numbers            */
     @19954    f1150290    06.  /*Pop Am Ind/Esk/Aleut Fmle 20-24  Whole Numbers                        */
     @19960    f1150300    06.  /*Pop Am Ind/Alska Nat Male 25-29  Table P12C, Whole Numbers            */
     @19966    f1150390    06.  /*Pop Am Ind/Esk/Aleut Male 25-29  Whole Numbers                        */
     @19972    f1150400    06.  /*Pop Am Ind/Alska Nat Fmle 25-29  Table P12C, Whole Numbers            */
     @19978    f1150490    06.  /*Pop Am Ind/Esk/Aleut Fmle 25-29  Whole Numbers                        */
     @19984    f1150500    06.  /*Pop Am Ind/Alska Nat Male 30-34  Table P12C, Whole Numbers            */
     @19990    f1150590    06.  /*Pop Am Ind/Esk/Aleut Male 30-34  Whole Numbers                        */
     @19996    f1150600    06.  /*Pop Am Ind/Alska Nat Fmle 30-34  Table P12C, Whole Numbers            */
     @20002    f1150690    06.  /*Pop Am Ind/Esk/Aleut Fmle 30-34  Whole Numbers                        */
     @20008    f1150700    06.  /*Pop Am Ind/Alska Nat Male 35-44  Table P12C, Whole Numbers            */
     @20014    f1150790    06.  /*Pop Am Ind/Esk/Aleut Male 35-44  Whole Numbers                        */
     @20020    f1150800    06.  /*Pop Am Ind/Alska Nat Fmle 35-44  Table P12C, Whole Numbers            */
     @20026    f1150890    06.  /*Pop Am Ind/Esk/Aleut Fmle 35-44  Whole Numbers                        */
     @20032    f1150900    06.  /*Pop Am Ind/Alska Nat Male 45-54  Table P12C, Whole Numbers            */
     @20038    f1150990    06.  /*Pop Am Ind/Esk/Aleut Male 45-54  Whole Numbers                        */
     @20044    f1151000    06.  /*Pop Am Ind/Alska Nat Fmle 45-54  Table P12C, Whole Numbers            */
     @20050    f1151090    06.  /*Pop Am Ind/Esk/Aleut Fmle 45-54  Whole Numbers                        */
     @20056    f1151100    06.  /*Pop Am Ind/Alska Nat Male 55-59  Table P12C, Whole Numbers            */
     @20062    f1151190    06.  /*Pop Am Ind/Esk/Aleut Male 55-59  Whole Numbers                        */
     @20068    f1151200    06.  /*Pop Am Ind/Alska Nat Fmle 55-59  Table P12C, Whole Numbers            */
     @20074    f1151290    06.  /*Pop Am Ind/Esk/Aleut Fmle 55-59  Whole Numbers                        */
     @20080    f1151300    06.  /*Pop Am Ind/Alska Nat Male 60-64  Table P12C, Whole Numbers            */
     @20086    f1151390    06.  /*Pop Am Ind/Esk/Aleut Male 60-64  Whole Numbers                        */
     @20092    f1151400    06.  /*Pop Am Ind/Alska Nat Fmle 60-64  Table P12C, Whole Numbers            */
     @20098    f1151490    06.  /*Pop Am Ind/Esk/Aleut Fmle 60-64  Whole Numbers                        */
     @20104    f1151500    06.  /*Pop Am Ind/Alska Nat Male 65-74  Table P12C, Whole Numbers            */
     @20110    f1151590    06.  /*Pop Am Ind/Esk/Aleut Male 65-74  Whole Numbers                        */
     @20116    f1151600    06.  /*Pop Am Ind/Alska Nat Fmle 65-74  Table P12C, Whole Numbers            */
     @20122    f1151690    06.  /*Pop Am Ind/Esk/Aleut Fmle 65-74  Whole Numbers                        */
     @20128    f1151700    06.  /*Pop Am Ind/Alska Nat Male 75-84  Table P12C, Whole Numbers            */
     @20134    f1151790    06.  /*Pop Am Ind/Esk/Aleut Male 75-84  Whole Numbers                        */
     @20140    f1151800    06.  /*Pop Am Ind/Alska Nat Fmle 75-84  Table P12C, Whole Numbers            */
     @20146    f1151890    06.  /*Pop Am Ind/Esk/Aleut Fmle 75-84  Whole Numbers                        */
     @20152    f1164800    06.  /*Pop Am Ind/Alaska Nat Male > 84  Table P12C, Whole Numbers            */
     @20158    f1164890    06.  /*Pop Am Ind/Esk/Aleut Male > 84   Whole Numbers                        */
     @20164    f1164900    06.  /*Pop Am Ind/Alaska Nat Fmle > 84  Table P12C, Whole Numbers            */
     @20170    f1164990    06.  /*Pop Am Ind/Esk/Aleut Fmle > 84   Whole Numbers                        */
     @20176    f1334400    06.  /*Pop Asian Male  < 5              Table P12D, Whole Numbers            */
     @20182    f1334500    06.  /*Pop Asian Fmle  < 5              Table P12D, Whole Numbers            */
     @20188    f1334600    06.  /*Pop Asian Male  5-9              Table P12D, Whole Numbers            */
     @20194    f1334700    06.  /*Pop Asian Fmle  5-9              Table P12D, Whole Numbers            */
     @20200    f1334800    06.  /*Pop Asian Male 10-14             Table P12D, Whole Numbers            */
     @20206    f1334900    06.  /*Pop Asian Fmle 10-14             Table P12D, Whole Numbers            */
     @20212    f1335000    06.  /*Pop Asian Male 15-19             Table P12D, Whole Numbers            */
     @20218    f1335100    06.  /*Pop Asian Fmle 15-19             Table P12D, Whole Numbers            */
     @20224    f1335200    06.  /*Pop Asian Male 20-24             Table P12D, Whole Numbers            */
     @20230    f1335300    06.  /*Pop Asian Fmle 20-24             Table P12D, Whole Numbers            */
     @20236    f1335400    06.  /*Pop Asian Male 25-29             Table P12D, Whole Numbers            */
     @20242    f1335500    06.  /*Pop Asian Fmle 25-29             Table P12D, Whole Numbers            */
     @20248    f1335600    06.  /*Pop Asian Male 30-34             Table P12D, Whole Numbers            */
     @20254    f1335700    06.  /*Pop Asian Fmle 30-34             Table P12D, Whole Numbers            */
     @20260    f1335800    06.  /*Pop Asian Male 35-44             Table P12D, Whole Numbers            */
     @20266    f1335900    06.  /*Pop Asian Fmle 35-44             Table P12D, Whole Numbers            */
     @20272    f1336000    06.  /*Pop Asian Male 45-54             Table P12D, Whole Numbers            */
     @20278    f1336100    06.  /*Pop Asian Fmle 45-54             Table P12D, Whole Numbers            */
     @20284    f1336200    06.  /*Pop Asian Male 55-59             Table P12D, Whole Numbers            */
     @20290    f1336300    06.  /*Pop Asian Fmle 55-59             Table P12D, Whole Numbers            */
     @20296    f1336400    06.  /*Pop Asian Male 60-64             Table P12D, Whole Numbers            */
     @20302    f1336500    06.  /*Pop Asian Fmle 60-64             Table P12D, Whole Numbers            */
     @20308    f1336600    06.  /*Pop Asian Male 65-74             Table P12D, Whole Numbers            */
     @20314    f1336700    06.  /*Pop Asian Fmle 65-74             Table P12D, Whole Numbers            */
     @20320    f1336800    06.  /*Pop Asian Male 75-84             Table P12D, Whole Numbers            */
     @20326    f1336900    06.  /*Pop Asian Fmle 75-84             Table P12D, Whole Numbers            */
     @20332    f1337000    06.  /*Pop Asian Male > 84              Table P12D, Whole Numbers            */
     @20338    f1337100    06.  /*Pop Asian Fmle > 84              Table P12D, Whole Numbers            */
     @20344    f1337200    06.  /*Pop Nat Hawaii/Oth PI Male  < 5  Table P12E, Whole Numbers            */
     @20350    f1337300    06.  /*Pop Nat Hawaii/Oth PI Fmle  < 5  Table P12E, Whole Numbers            */
     @20356    f1337400    06.  /*Pop Nat Hawaii/Oth PI Male  5-9  Table P12E, Whole Numbers            */
     @20362    f1337500    06.  /*Pop Nat Hawaii/Oth PI Fmle  5-9  Table P12E, Whole Numbers            */
     @20368    f1337600    06.  /*Pop Nat Hawai/Oth PI Male 10-14  Table P12E, Whole Numbers            */
     @20374    f1337700    06.  /*Pop Nat Hawai/Oth PI Fmle 10-14  Table P12E, Whole Numbers            */
     @20380    f1337800    06.  /*Pop Nat Hawai/Oth PI Male 15-19  Table P12E, Whole Numbers            */
     @20386    f1337900    06.  /*Pop Nat Hawai/Oth PI Fmle 15-19  Table P12E, Whole Numbers            */
     @20392    f1338000    06.  /*Pop Nat Hawai/Oth PI Male 20-24  Table P12E, Whole Numbers            */
     @20398    f1338100    06.  /*Pop Nat Hawai/Oth PI Fmle 20-24  Table P12E, Whole Numbers            */
     @20404    f1338200    06.  /*Pop Nat Hawai/Oth PI Male 25-29  Table P12E, Whole Numbers            */
     @20410    f1338300    06.  /*Pop Nat Hawai/Oth PI Fmle 25-29  Table P12E, Whole Numbers            */
     @20416    f1338400    06.  /*Pop Nat Hawai/Oth PI Male 30-34  Table P12E, Whole Numbers            */
     @20422    f1338500    06.  /*Pop Nat Hawai/Oth PI Fmle 30-34  Table P12E, Whole Numbers            */
     @20428    f1338600    06.  /*Pop Nat Hawai/Oth PI Male 35-44  Table P12E, Whole Numbers            */
     @20434    f1338700    06.  /*Pop Nat Hawai/Oth PI Fmle 35-44  Table P12E, Whole Numbers            */
     @20440    f1338800    06.  /*Pop Nat Hawai/Oth PI Male 45-54  Table P12E, Whole Numbers            */
     @20446    f1338900    06.  /*Pop Nat Hawai/Oth PI Fmle 45-54  Table P12E, Whole Numbers            */
     @20452    f1339000    06.  /*Pop Nat Hawai/Oth PI Male 55-59  Table P12E, Whole Numbers            */
     @20458    f1339100    06.  /*Pop Nat Hawai/Oth PI Fmle 55-59  Table P12E, Whole Numbers            */
     @20464    f1339200    06.  /*Pop Nat Hawai/Oth PI Male 60-64  Table P12E, Whole Numbers            */
     @20470    f1339300    06.  /*Pop Nat Hawai/Oth PI Fmle 60-64  Table P12E, Whole Numbers            */
     @20476    f1339400    06.  /*Pop Nat Hawai/Oth PI Male 65-74  Table P12E, Whole Numbers            */
     @20482    f1339500    06.  /*Pop Nat Hawai/Oth PI Fmle 65-74  Table P12E, Whole Numbers            */
     @20488    f1339600    06.  /*Pop Nat Hawai/Oth PI Male 75-84  Table P12E, Whole Numbers            */
     @20494    f1339700    06.  /*Pop Nat Hawai/Oth PI Fmle 75-84  Table P12E, Whole Numbers            */
     @20500    f1339800    06.  /*Pop Nat Hawaii/Oth PI Male > 84  Table P12E, Whole Numbers            */
     @20506    f1339900    06.  /*Pop Nat Hawaii/Oth PI Fmle > 84  Table P12E, Whole Numbers            */
     @20512    f1151990    06.  /*Pop Asian/Pac Islndr Male  < 5   Whole Numbers                        */
     @20518    f1152090    06.  /*Pop Asian/Pac Islndr Fmle  < 5   Whole Numbers                        */
     @20524    f1152190    06.  /*Pop Asian/Pac Islndr Male  5-9   Whole Numbers                        */
     @20530    f1152290    06.  /*Pop Asian/Pac Islndr Fmle  5-9   Whole Numbers                        */
     @20536    f1152390    06.  /*Pop Asian/Pac Islndr Male 10-14  Whole Numbers                        */
     @20542    f1152490    06.  /*Pop Asian/Pac Islndr Fmle 10-14  Whole Numbers                        */
     @20548    f1152590    06.  /*Pop Asian/Pac Islndr Male 15-19  Whole Numbers                        */
     @20554    f1152690    06.  /*Pop Asian/Pac Islndr Fmle 15-19  Whole Numbers                        */
     @20560    f1152790    06.  /*Pop Asian/Pac Islndr Male 20-24  Whole Numbers                        */
     @20566    f1152890    06.  /*Pop Asian/Pac Islndr Fmle 20-24  Whole Numbers                        */
     @20572    f1152990    06.  /*Pop Asian/Pac Islndr Male 25-29  Whole Numbers                        */
     @20578    f1153090    06.  /*Pop Asian/Pac Islndr Fmle 25-29  Whole Numbers                        */
     @20584    f1153190    06.  /*Pop Asian/Pac Islndr Male 30-34  Whole Numbers                        */
     @20590    f1153290    06.  /*Pop Asian/Pac Islndr Fmle 30-34  Whole Numbers                        */
     @20596    f1153390    06.  /*Pop Asian/Pac Islndr Male 35-44  Whole Numbers                        */
     @20602    f1153490    06.  /*Pop Asian/Pac Islndr Fmle 35-44  Whole Numbers                        */
     @20608    f1153590    06.  /*Pop Asian/Pac Islndr Male 45-54  Whole Numbers                        */
     @20614    f1153690    06.  /*Pop Asian/Pac Islndr Fmle 45-54  Whole Numbers                        */
     @20620    f1153790    06.  /*Pop Asian/Pac Islndr Male 55-59  Whole Numbers                        */
     @20626    f1153890    06.  /*Pop Asian/Pac Islndr Fmle 55-59  Whole Numbers                        */
     @20632    f1153990    06.  /*Pop Asian/Pac Islndr Male 60-64  Whole Numbers                        */
     @20638    f1154090    06.  /*Pop Asian/Pac Islndr Fmle 60-64  Whole Numbers                        */
     @20644    f1154190    06.  /*Pop Asian/Pac Islndr Male 65-74  Whole Numbers                        */
     @20650    f1154290    06.  /*Pop Asian/Pac Islndr Fmle 65-74  Whole Numbers                        */
     @20656    f1154390    06.  /*Pop Asian/Pac Islndr Male 75-84  Whole Numbers                        */
     @20662    f1154490    06.  /*Pop Asian/Pac Islndr Fmle 75-84  Whole Numbers                        */
     @20668    f1165090    06.  /*Pop Asian/Pac Islndr Male > 84   Whole Numbers                        */
     @20674    f1165190    06.  /*Pop Asian/Pac Islndr Fmle > 84   Whole Numbers                        */
     @20680    f1154500    06.  /*Pop Some Other Race Male  < 5    Table P12F, Whole Numbers            */
     @20686    f1154590    06.  /*Pop Other Male  < 5              Whole Numbers                        */
     @20692    f1154600    06.  /*Pop Some Other Race Fmle  < 5    Table P12F, Whole Numbers            */
     @20698    f1154690    06.  /*Pop Other Fmle  < 5              Whole Numbers                        */
     @20704    f1154700    06.  /*Pop Some Other Race Male  5-9    Table P12F, Whole Numbers            */
     @20710    f1154790    06.  /*Pop Other Male  5-9              Whole Numbers                        */
     @20716    f1154800    06.  /*Pop Some Other Race Fmle  5-9    Table P12F, Whole Numbers            */
     @20722    f1154890    06.  /*Pop Other Fmle  5-9              Whole Numbers                        */
     @20728    f1154900    06.  /*Pop Some Other Race Male 10-14   Table P12F, Whole Numbers            */
     @20734    f1154990    06.  /*Pop Other Male 10-14             Whole Numbers                        */
     @20740    f1155000    06.  /*Pop Some Other Race Fmle 10-14   Table P12F, Whole Numbers            */
     @20746    f1155090    06.  /*Pop Other Fmle 10-14             Whole Numbers                        */
     @20752    f1155100    06.  /*Pop Some Other Race Male 15-19   Table P12F, Whole Numbers            */
     @20758    f1155190    06.  /*Pop Other Male 15-19             Whole Numbers                        */
     @20764    f1155200    06.  /*Pop Some Other Race Fmle 15-19   Table P12F, Whole Numbers            */
     @20770    f1155290    06.  /*Pop Other Fmle 15-19             Whole Numbers                        */
     @20776    f1155300    06.  /*Pop Some Other Race Male 20-24   Table P12F, Whole Numbers            */
     @20782    f1155390    06.  /*Pop Other Male 20-24             Whole Numbers                        */
     @20788    f1155400    06.  /*Pop Some Other Race Fmle 20-24   Table P12F, Whole Numbers            */
     @20794    f1155490    06.  /*Pop Other Fmle 20-24             Whole Numbers                        */
     @20800    f1155500    06.  /*Pop Some Other Race Male 25-29   Table P12F, Whole Numbers            */
     @20806    f1155590    06.  /*Pop Other Male 25-29             Whole Numbers                        */
     @20812    f1155600    06.  /*Pop Some Other Race Fmle 25-29   Table P12F, Whole Numbers            */
     @20818    f1155690    06.  /*Pop Other Fmle 25-29             Whole Numbers                        */
     @20824    f1155700    06.  /*Pop Some Other Race Male 30-34   Table P12F, Whole Numbers            */
     @20830    f1155790    06.  /*Pop Other Male 30-34             Whole Numbers                        */
     @20836    f1155800    06.  /*Pop Some Other Race Fmle 30-34   Table P12F, Whole Numbers            */
     @20842    f1155890    06.  /*Pop Other Fmle 30-34             Whole Numbers                        */
     @20848    f1155900    06.  /*Pop Some Other Race Male 35-44   Table P12F, Whole Numbers            */
     @20854    f1155990    06.  /*Pop Other Male 35-44             Whole Numbers                        */
     @20860    f1156000    06.  /*Pop Some Other Race Fmle 35-44   Table P12F, Whole Numbers            */
     @20866    f1156090    06.  /*Pop Other Fmle 35-44             Whole Numbers                        */
     @20872    f1156100    06.  /*Pop Some Other Race Male 45-54   Table P12F, Whole Numbers            */
     @20878    f1156190    06.  /*Pop Other Male 45-54             Whole Numbers                        */
     @20884    f1156200    06.  /*Pop Some Other Race Fmle 45-54   Table P12F, Whole Numbers            */
     @20890    f1156290    06.  /*Pop Other Fmle 45-54             Whole Numbers                        */
     @20896    f1156300    06.  /*Pop Some Other Race Male 55-59   Table P12F, Whole Numbers            */
     @20902    f1156390    06.  /*Pop Other Male 55-59             Whole Numbers                        */
     @20908    f1156400    06.  /*Pop Some Other Race Fmle 55-59   Table P12F, Whole Numbers            */
     @20914    f1156490    06.  /*Pop Other Fmle 55-59             Whole Numbers                        */
     @20920    f1156500    06.  /*Pop Some Other Race Male 60-64   Table P12F, Whole Numbers            */
     @20926    f1156590    06.  /*Pop Other Male 60-64             Whole Numbers                        */
     @20932    f1156600    06.  /*Pop Some Other Race Fmle 60-64   Table P12F, Whole Numbers            */
     @20938    f1156690    06.  /*Pop Other Fmle 60-64             Whole Numbers                        */
     @20944    f1156700    06.  /*Pop Some Other Race Male 65-74   Table P12F, Whole Numbers            */
     @20950    f1156790    06.  /*Pop Other Male 65-74             Whole Numbers                        */
     @20956    f1156800    06.  /*Pop Some Other Race Fmle 65-74   Table P12F, Whole Numbers            */
     @20962    f1156890    06.  /*Pop Other Fmle 65-74             Whole Numbers                        */
     @20968    f1156900    06.  /*Pop Some Other Race Male 75-84   Table P12F, Whole Numbers            */
     @20974    f1156990    06.  /*Pop Other Male 75-84             Whole Numbers                        */
     @20980    f1157000    06.  /*Pop Some Other Race Fmle 75-84   Table P12F, Whole Numbers            */
     @20986    f1157090    06.  /*Pop Other Fmle 75-84             Whole Numbers                        */
     @20992    f1165200    06.  /*Pop Some Other Race Male > 84    Table P12F, Whole Numbers            */
     @20998    f1165290    06.  /*Pop Other Male > 84              Whole Numbers                        */
     @21004    f1165300    06.  /*Pop Some Other Race Fmle > 84    Table P12F, Whole Numbers            */
     @21010    f1165390    06.  /*Pop Other Fmle > 84              Whole Numbers                        */
     @21016    f1340000    06.  /*Pop Two or more Races Male  < 5  Table P12G, Whole Numbers            */
     @21022    f1340100    06.  /*Pop Two or more Races Fmle  < 5  Table P12G, Whole Numbers            */
     @21028    f1340200    06.  /*Pop Two or more Races Male  5-9  Table P12G, Whole Numbers            */
     @21034    f1340300    06.  /*Pop Two or more Races Fmle  5-9  Table P12G, Whole Numbers            */
     @21040    f1340400    06.  /*Pop Two or more Race Male 10-14  Table P12G, Whole Numbers            */
     @21046    f1340500    06.  /*Pop Two or more Race Fmle 10-14  Table P12G, Whole Numbers            */
     @21052    f1340600    06.  /*Pop Two or more Race Male 15-19  Table P12G, Whole Numbers            */
     @21058    f1340700    06.  /*Pop Two or more Race Fmle 15-19  Table P12G, Whole Numbers            */
     @21064    f1340800    06.  /*Pop Two or more Race Male 20-24  Table P12G, Whole Numbers            */
     @21070    f1340900    06.  /*Pop Two or more Race Fmle 20-24  Table P12G, Whole Numbers            */
     @21076    f1341000    06.  /*Pop Two or more Race Male 25-29  Table P12G, Whole Numbers            */
     @21082    f1341100    06.  /*Pop Two or more Race Fmle 25-29  Table P12G, Whole Numbers            */
     @21088    f1341200    06.  /*Pop Two or more Race Male 30-34  Table P12G, Whole Numbers            */
     @21094    f1341300    06.  /*Pop Two or more Race Fmle 30-34  Table P12G, Whole Numbers            */
     @21100    f1341400    06.  /*Pop Two or more Race Male 35-44  Table P12G, Whole Numbers            */
     @21106    f1341500    06.  /*Pop Two or more Race Fmle 35-44  Table P12G, Whole Numbers            */
     @21112    f1341600    06.  /*Pop Two or more Race Male 45-54  Table P12G, Whole Numbers            */
     @21118    f1341700    06.  /*Pop Two or more Race Fmle 45-54  Table P12G, Whole Numbers            */
     @21124    f1341800    06.  /*Pop Two or more Race Male 55-59  Table P12G, Whole Numbers            */
     @21130    f1341900    06.  /*Pop Two or more Race Fmle 55-59  Table P12G, Whole Numbers            */
     @21136    f1342000    06.  /*Pop Two or more Race Male 60-64  Table P12G, Whole Numbers            */
     @21142    f1342100    06.  /*Pop Two or more Race Fmle 60-64  Table P12G, Whole Numbers            */
     @21148    f1342200    06.  /*Pop Two or more Race Male 65-74  Table P12G, Whole Numbers            */
     @21154    f1342300    06.  /*Pop Two or more Race Fmle 65-74  Table P12G, Whole Numbers            */
     @21160    f1342400    06.  /*Pop Two or more Race Male 75-84  Table P12G, Whole Numbers            */
     @21166    f1342500    06.  /*Pop Two or more Race Fmle 75-84  Table P12G, Whole Numbers            */
     @21172    f1342600    06.  /*Pop Two or more Races Male > 84  Table P12G, Whole Numbers            */
     @21178    f1342700    06.  /*Pop Two or more Races Fmle > 84  Table P12G, Whole Numbers            */
     @21184    f1342800    06.  /*Pop White Non-Hisp Male  < 5     Table P12I, Whole Numbers            */
     @21190    f1342900    06.  /*Pop White Non-Hisp Fmle  < 5     Table P12I, Whole Numbers            */
     @21196    f1343000    06.  /*Pop White Non-Hisp Male  5-9     Table P12I, Whole Numbers            */
     @21202    f1343100    06.  /*Pop White Non-Hisp Fmle  5-9     Table P12I, Whole Numbers            */
     @21208    f1343200    06.  /*Pop White Non-Hisp Male 10-14    Table P12I, Whole Numbers            */
     @21214    f1343300    06.  /*Pop White Non-Hisp Fmle 10-14    Table P12I, Whole Numbers            */
     @21220    f1343400    06.  /*Pop White Non-Hisp Male 15-19    Table P12I, Whole Numbers            */
     @21226    f1343500    06.  /*Pop White Non-Hisp Fmle 15-19    Table P12I, Whole Numbers            */
     @21232    f1343600    06.  /*Pop White Non-Hisp Male 20-24    Table P12I, Whole Numbers            */
     @21238    f1343700    06.  /*Pop White Non-Hisp Fmle 20-24    Table P12I, Whole Numbers            */
     @21244    f1343800    06.  /*Pop White Non-Hisp Male 25-29    Table P12I, Whole Numbers            */
     @21250    f1343900    06.  /*Pop White Non-Hisp Fmle 25-29    Table P12I, Whole Numbers            */
     @21256    f1344000    06.  /*Pop White Non-Hisp Male 30-34    Table P12I, Whole Numbers            */
     @21262    f1344100    06.  /*Pop White Non-Hisp Fmle 30-34    Table P12I, Whole Numbers            */
     @21268    f1344200    06.  /*Pop White Non-Hisp Male 35-44    Table P12I, Whole Numbers            */
     @21274    f1344300    06.  /*Pop White Non-Hisp Fmle 35-44    Table P12I, Whole Numbers            */
     @21280    f1344400    06.  /*Pop White Non-Hisp Male 45-54    Table P12I, Whole Numbers            */
     @21286    f1344500    06.  /*Pop White Non-Hisp Fmle 45-54    Table P12I, Whole Numbers            */
     @21292    f1344600    06.  /*Pop White Non-Hisp Male 55-59    Table P12I, Whole Numbers            */
     @21298    f1344700    06.  /*Pop White Non-Hisp Fmle 55-59    Table P12I, Whole Numbers            */
     @21304    f1344800    06.  /*Pop White Non-Hisp Male 60-64    Table P12I, Whole Numbers            */
     @21310    f1344900    06.  /*Pop White Non-Hisp Fmle 60-64    Table P12I, Whole Numbers            */
     @21316    f1345000    06.  /*Pop White Non-Hisp Male 65-74    Table P12I, Whole Numbers            */
     @21322    f1345100    06.  /*Pop White Non-Hisp Fmle 65-74    Table P12I, Whole Numbers            */
     @21328    f1345200    06.  /*Pop White Non-Hisp Male 75-84    Table P12I, Whole Numbers            */
     @21334    f1345300    06.  /*Pop White Non-Hisp Fmle 75-84    Table P12I, Whole Numbers            */
     @21340    f1345400    06.  /*Pop White Non-Hisp Male > 84     Table P12I, Whole Numbers            */
     @21346    f1345500    06.  /*Pop White Non-Hisp Fmle > 84     Table P12I, Whole Numbers            */
     @21352    f1157100    06.  /*Pop Hispanic/Latino Male  < 5    Table P12H, Whole Numbers            */
     @21358    f1157190    06.  /*Pop Hispanic Origin Male  < 5    Whole Numbers                        */
     @21364    f1157200    06.  /*Pop Hispanic/Latino Fmle  < 5    Table P12H, Whole Numbers            */
     @21370    f1157290    06.  /*Pop Hispanic Origin Fmle  < 5    Whole Numbers                        */
     @21376    f1157300    06.  /*Pop Hispanic/Latino Male  5-9    Table P12H, Whole Numbers            */
     @21382    f1157390    06.  /*Pop Hispanic Origin Male  5-9    Whole Numbers                        */
     @21388    f1157400    06.  /*Pop Hispanic/Latino Fmle  5-9    Table P12H, Whole Numbers            */
     @21394    f1157490    06.  /*Pop Hispanic Origin Fmle  5-9    Whole Numbers                        */
     @21400    f1157500    06.  /*Pop Hispanic/Latino Male 10-14   Table P12H, Whole Numbers            */
     @21406    f1157590    06.  /*Pop Hispanic Origin Male 10-14   Whole Numbers                        */
     @21412    f1157600    06.  /*Pop Hispanic/Latino Fmle 10-14   Table P12H, Whole Numbers            */
     @21418    f1157690    06.  /*Pop Hispanic Origin Fmle 10-14   Whole Numbers                        */
     @21424    f1157700    06.  /*Pop Hispanic/Latino Male 15-19   Table P12H, Whole Numbers            */
     @21430    f1157790    06.  /*Pop Hispanic Origin Male 15-19   Whole Numbers                        */
     @21436    f1157800    06.  /*Pop Hispanic/Latino Fmle 15-19   Table P12H, Whole Numbers            */
     @21442    f1157890    06.  /*Pop Hispanic Origin Fmle 15-19   Whole Numbers                        */
     @21448    f1157900    06.  /*Pop Hispanic/Latino Male 20-24   Table P12H, Whole Numbers            */
     @21454    f1157990    06.  /*Pop Hispanic Origin Male 20-24   Whole Numbers                        */
     @21460    f1158000    06.  /*Pop Hispanic/Latino Fmle 20-24   Table P12H, Whole Numbers            */
     @21466    f1158090    06.  /*Pop Hispanic Origin Fmle 20-24   Whole Numbers                        */
     @21472    f1158100    06.  /*Pop Hispanic/Latino Male 25-29   Table P12H, Whole Numbers            */
     @21478    f1158190    06.  /*Pop Hispanic Origin Male 25-29   Whole Numbers                        */
     @21484    f1158200    06.  /*Pop Hispanic/Latino Fmle 25-29   Table P12H, Whole Numbers            */
     @21490    f1158290    06.  /*Pop Hispanic Origin Fmle 25-29   Whole Numbers                        */
     @21496    f1158300    06.  /*Pop Hispanic/Latino Male 30-34   Table P12H, Whole Numbers            */
     @21502    f1158390    06.  /*Pop Hispanic Origin Male 30-34   Whole Numbers                        */
     @21508    f1158400    06.  /*Pop Hispanic/Latino Fmle 30-34   Table P12H, Whole Numbers            */
     @21514    f1158490    06.  /*Pop Hispanic Origin Fmle 30-34   Whole Numbers                        */
     @21520    f1158500    06.  /*Pop Hispanic/Latino Male 35-44   Table P12H, Whole Numbers            */
     @21526    f1158590    06.  /*Pop Hispanic Origin Male 35-44   Whole Numbers                        */
     @21532    f1158600    06.  /*Pop Hispanic/Latino Fmle 35-44   Table P12H, Whole Numbers            */
     @21538    f1158690    06.  /*Pop Hispanic Origin Fmle 35-44   Whole Numbers                        */
     @21544    f1158700    06.  /*Pop Hispanic/Latino Male 45-54   Table P12H, Whole Numbers            */
     @21550    f1158790    06.  /*Pop Hispanic Origin Male 45-54   Whole Numbers                        */
     @21556    f1158800    06.  /*Pop Hispanic/Latino Fmle 45-54   Table P12H, Whole Numbers            */
     @21562    f1158890    06.  /*Pop Hispanic Origin Fmle 45-54   Whole Numbers                        */
     @21568    f1158900    06.  /*Pop Hispanic/Latino Male 55-59   Table P12H, Whole Numbers            */
     @21574    f1158990    06.  /*Pop Hispanic Origin Male 55-59   Whole Numbers                        */
     @21580    f1159000    06.  /*Pop Hispanic/Latino Fmle 55-59   Table P12H, Whole Numbers            */
     @21586    f1159090    06.  /*Pop Hispanic Origin Fmle 55-59   Whole Numbers                        */
     @21592    f1159100    06.  /*Pop Hispanic/Latino Male 60-64   Table P12H, Whole Numbers            */
     @21598    f1159190    06.  /*Pop Hispanic Origin Male 60-64   Whole Numbers                        */
     @21604    f1159200    06.  /*Pop Hispanic/Latino Fmle 60-64   Table P12H, Whole Numbers            */
     @21610    f1159290    06.  /*Pop Hispanic Origin Fmle 60-64   Whole Numbers                        */
     @21616    f1159300    06.  /*Pop Hispanic/Latino Male 65-74   Table P12H, Whole Numbers            */
     @21622    f1159390    06.  /*Pop Hispanic Origin Male 65-74   Whole Numbers                        */
     @21628    f1159400    06.  /*Pop Hispanic/Latino Fmle 65-74   Table P12H, Whole Numbers            */
     @21634    f1159490    06.  /*Pop Hispanic Origin Fmle 65-74   Whole Numbers                        */
     @21640    f1159500    06.  /*Pop Hispanic/Latino Male 75-84   Table P12H, Whole Numbers            */
     @21646    f1159590    06.  /*Pop Hispanic Origin Male 75-84   Whole Numbers                        */
     @21652    f1159600    06.  /*Pop Hispanic/Latino Fmle 75-84   Table P12H, Whole Numbers            */
     @21658    f1159690    06.  /*Pop Hispanic Origin Fmle 75-84   Whole Numbers                        */
     @21664    f1165400    06.  /*Pop Hispanic/Latino Male > 84    Table P12H, Whole Numbers            */
     @21670    f1165490    06.  /*Pop Hispanic Origin Male > 84    Whole Numbers                        */
     @21676    f1165500    06.  /*Pop Hispanic/Latino Fmle > 84    Table P12H, Whole Numbers            */
     @21682    f1165590    06.  /*Pop Hispanic Origin Fmle > 84    Whole Numbers                        */
     @21688    f0874700    07.  /*# Females Over 15 Yrs            Table P8                             */
     @21695    f0874790    07.  /*# Females Over 15 Yrs            Table P14                            */
     @21702    f0874780    07.  /*# Females Over 15 Yrs            Table 26                             */
     @21709    f1408309    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @21716    f1408308    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @21723    f1408307    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @21730    f1408306    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @21737    f1408305    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @21744    f1408304    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @21751    f1408303    07.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @21758    f1214302    06.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @21764    f1214301    06.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @21770    f1214395    06.  /*Population Estimate 65+          Whole Numbers, Estimates             */
     @21776    f1348300    03.1 /*Median Age                       Table P13, (.1)                      */
     @21779    f1348400    03.1 /*Median Age, Male                 Table P13, (.1)                      */
     @21782    f1348500    03.1 /*Median Age, Female               Table P13, (.1)                      */
     @21785    f1348600    03.1 /*Median Age, White                Table P13A, (.1)                     */
     @21788    f1348700    03.1 /*Median Age, White Male           Table P13A, (.1)                     */
     @21791    f1348800    03.1 /*Median Age, White Female         Table P13A, (.1)                     */
     @21794    f1348900    03.1 /*Median Age, Black/African Amer   Table P13B, (.1)                     */
     @21797    f1349000    03.1 /*Median Age, Black/Afr Am Male    Table P13B, (.1)                     */
     @21800    f1349100    03.1 /*Median Age, Black/Afr Am Female  Table P13B, (.1)                     */
     @21803    f1349200    03.1 /*Median Age, Am Ind/Alaska Natve  Table P13C, (.1)                     */
     @21806    f1349300    03.1 /*Median Age, Am Ind/Alaska Male   Table P13C, (.1)                     */
     @21809    f1349400    03.1 /*Median Age, Am Ind/Alaska Fmale  Table P13C, (.1)                     */
     @21812    f1349500    03.1 /*Median Age, Asian                Table P13D, (.1)                     */
     @21815    f1349600    03.1 /*Median Age, Asian Male           Table P13D, (.1)                     */
     @21818    f1349700    03.1 /*Median Age, Asian Female         Table P13D, (.1)                     */
     @21821    f1349800    03.1 /*Median Age, Nat Hawaii/Oth PI    Table P13E, (.1)                     */
     @21824    f1349900    04.1 /*Median Age, Nat Haw/Oth PI Male  Table P13E, (.1)                     */
     @21828    f1350000    03.1 /*Median Age, Nat Haw/Oth PI Fmle  Table P13E, (.1)                     */
     @21831    f1350100    03.1 /*Median Age, Other Race           Table P13F, (.1)                     */
     @21834    f1350200    03.1 /*Median Age, Other Race Male      Table P13F, (.1)                     */
     @21837    f1350300    03.1 /*Median Age, Other Race Fmle      Table P13F, (.1)                     */
     @21840    f1350400    03.1 /*Median Age, Two or More Races    Table P13G, (.1)                     */
     @21843    f1350500    03.1 /*Median Age, Two+ Races Male      Table P13G, (.1)                     */
     @21846    f1350600    03.1 /*Median Age, Two+ Races Female    Table P13G, (.1)                     */
     @21849    f1350700    03.1 /*Median Age, Hispanic/Latino      Table P13H, (.1)                     */
     @21852    f1350800    03.1 /*Median Age, Hispanic/Lat Male    Table P13H, (.1)                     */
     @21855    f1350900    03.1 /*Median Age, Hispanic/Lat Female  Table P13H, (.1)                     */
     @21858    f1351000    03.1 /*Median Age, White Non-Hispanic   Table P13I, (.1)                     */
     @21861    f1351100    03.1 /*Median Age, White Non-Hisp Male  Table P13I, (.1)                     */
     @21864    f1351200    03.1 /*Median Age, White Non-Hisp Fmle  Table P13I, (.1)                     */
     @21867    f1345610    04.1 /*Percent Tot Population,One Race  Table P1, (.1)                       */
     @21871    f1345600    04.1 /*Percent Tot Population,One Race  Table P7, (.1)                       */
     @21875    f0453710    04.1 /*Percent White Population         Table P1, (.1), One Race Alone       */
     @21879    f0453700    04.1 /*Percent White Population         Table P7, (.1), One Race Alone       */
     @21883    f0453790    04.1 /*Percent White Population         (.1)                                 */
     @21887    f0453780    04.1 /*Percent White Population         (.1)                                 */
     @21891    f0453810    04.1 /*Percent Black/African Am Pop     Table P1, (.1), One Race Alone       */
     @21895    f0453800    04.1 /*Percent Black/African Am Pop     Table P7, (.1), One Race Alone       */
     @21899    f0453890    04.1 /*Percent Black Population         (.1)                                 */
     @21903    f0453880    04.1 /*Percent Black Population         (.1)                                 */
     @21907    f0453910    04.1 /*Percent Am Ind/Alaska Natve Pop  Table P1, (.1), One Race Alone       */
     @21911    f0453900    04.1 /*Percent Am Ind/Alaska Natve Pop  Table P7, (.1), One Race Alone       */
     @21915    f0453990    04.1 /*Percent Am Ind/Esk/Aleut Pop     (.1)                                 */
     @21919    f0453980    04.1 /*Percent Am Ind/Esk/Aleut Pop     (.1)                                 */
     @21923    f1345710    04.1 /*Percent Asian Population         Table P1, (.1), One Race Alone       */
     @21927    f1345700    04.1 /*Percent Asian Population         Table P7, (.1), One Race Alone       */
     @21931    f1345810    04.1 /*Percent Nat Hawaii/Other PI Pop  Table P1, (.1), One Race Alone       */
     @21935    f1345800    04.1 /*Percent Nat Hawaii/Other PI Pop  Table P7, (.1), One Race Alone       */
     @21939    f0454090    04.1 /*Percent Asian/Pac Islnder Pop    (.1)                                 */
     @21943    f0454080    04.1 /*Percent Asian/Pac Islnder Pop    (.1)                                 */
     @21947    f0454110    04.1 /*Percent Some Other Population    Table P1, (.1), One Race Alone       */
     @21951    f0454100    04.1 /*Percent Some Other Population    Table P7, (.1), One Race Alone       */
     @21955    f0454190    04.1 /*Percent Other Population         (.1)                                 */
     @21959    f0454180    04.1 /*Percent Other Population         (.1)                                 */
     @21963    f1345910    04.1 /*Percent Two or more Race Pop     Table P1, (.1)                       */
     @21967    f1345900    04.1 /*Percent Two or more Race Pop     Table P7, (.1)                       */
     @21971    f0454210    04.1 /*Percent Hispanic/Latino Pop      Table P2, (.1)                       */
     @21975    f0454200    04.1 /*Percent Hispanic/Latino Pop      Table P8, (.1)                       */
     @21979    f0454290    04.1 /*Percent Hispanic Origin Pop      (.1)                                 */
     @21983    f0454280    04.1 /*Percent Spanish Descent Pop      (.1)                                 */
     @21987    f1463810    04.1 /*Percent Non-Hispanic/Latino Pop  Table P2, (.1)                       */
     @21991    f1463910    04.1 /*Pct White Non-Hisp/Latino Pop    Table P2, (.1), One Race Alone       */
     @21995    f1464010    04.1 /*Pc Bl/Afr Am Non-Hisp/Lat Pop    Table P2, (.1), One Race Alone       */
     @21999    f1465610    04.1 /*Pct Am Ind/Alska Nat NonHsp Pop  Table P1, (.1), One Race Alone       */
     @22003    f1465710    04.1 /*Percent Asian Non-Hispanic Pop   Table P1, (.1), One Race Alone       */
     @22007    f1465810    04.1 /*Pct Nat Hawai/Oth PI NonHsp Pop  Table P1, (.1), One Race Alone       */
     @22011    f1465910    04.1 /*Pct Some Other Non-Hispanic Pop  Table P1, (.1), One Race Alone       */
     @22015    f1466010    04.1 /*Percent Two+ Race Non-Hisp Pop   Table P1, (.1)                       */
     @22019    f1332510    08.  /*Total Population, One Race       Whole Numbers                        */
     @22027    f1332500    08.  /*Total Population, One Race       Whole Numbers                        */
     @22035    f0453110    08.  /*White Population                 Whole Numbers; One Race Alone        */
     @22043    f0453100    08.  /*White Population                 Whole Numbers; One Race Alone        */
     @22051    f0453190    08.  /*White Population                 Whole Numbers                        */
     @22059    f0453180    08.  /*White Population                 Whole Numbers                        */
     @22067    f0453210    08.  /*Black/African American Pop       Whole Numbers; One Race Alone        */
     @22075    f0453200    08.  /*Black/African American Pop       Whole Numbers; One Race Alone        */
     @22083    f0453290    08.  /*Black Population                 Whole Numbers                        */
     @22091    f0453280    08.  /*Black Population                 Whole Numbers                        */
     @22099    f0453310    08.  /*Am Indian/Alaska Native Pop      Whole Numbers; One Race Alone        */
     @22107    f0453300    08.  /*Am Indian/Alaska Native Pop      Whole Numbers; One Race Alone        */
     @22115    f0453390    08.  /*Am Ind/Esk/Aleut Population      Whole Numbers                        */
     @22123    f0453380    08.  /*Am Ind/Esk/Aleut Population      Whole Numbers                        */
     @22131    f1332610    08.  /*Asian Population                 Whole Numbers; One Race Alone        */
     @22139    f1332600    08.  /*Asian Population                 Whole Numbers; One Race Alone        */
     @22147    f1332710    08.  /*Native Hawaii/Oth Pac Isl Pop    Whole Numbers; One Race Alone        */
     @22155    f1332700    08.  /*Native Hawaii/Oth Pac Isl Pop    Whole Numbers; One Race Alone        */
     @22163    f0453490    08.  /*Asian/Pac Islander Population    Whole Numbers                        */
     @22171    f0453480    08.  /*Asian/Pac Islander Population    Whole Numbers                        */
     @22179    f0453510    08.  /*Some Other Race Population       Whole Numbers; One Race Alone        */
     @22187    f0453500    08.  /*Some Other Race Population       Whole Numbers; One Race Alone        */
     @22195    f0453590    08.  /*Other Population                 Whole Numbers                        */
     @22203    f0453580    08.  /*Other Population                 Whole Numbers                        */
     @22211    f1332810    08.  /*Two or more Races Population     Whole Numbers                        */
     @22219    f1332800    08.  /*Two or more Races Population     Whole Numbers                        */
     @22227    f0453610    08.  /*Hispanic/Latino Population       Whole Numbers, Ethnic Designat       */
     @22235    f0453600    08.  /*Hispanic/Latino Population       Whole Numbers, Ethnic Designat       */
     @22243    f0453690    08.  /*Hispanic Origin Population       Whole Numbers, Ethnic Designat       */
     @22251    f0453680    08.  /*Spanish Descent Population       Whole Numbers, Ethnic Designat       */
     @22259    f1358700    07.  /*Hisp/Latin Origin-Mexican Pop    Table PCT11                          */
     @22266    f1163690    07.  /*Hispanic Origin-Mexican Pop      Whole Numbers                        */
     @22273    f1358800    06.  /*Hisp/Latin Orig-Puerto Ricn Pop  Table PCT11                          */
     @22279    f1163790    07.  /*Hispanic Origin-Puerto Ricn Pop  Whole Numbers                        */
     @22286    f1358900    06.  /*Hisp/Latino Origin-Cuban Pop     Table PCT11                          */
     @22292    f1163890    07.  /*Hispanic Origin-Cuban Pop        Whole Numbers                        */
     @22299    f1359100    06.  /*Hisp/Latin Orig-Centrl Amer Pop  Table PCT11                          */
     @22305    f1359200    06.  /*Hisp/Latin Orig-South Amer Pop   Table PCT11                          */
     @22311    f1359300    06.  /*Hisp/Latin Orig-Oth Hispanc Pop  Table PCT11                          */
     @22317    f1163990    07.  /*Hispanic Origin-Oth Hispanc Pop  Whole Numbers                        */
     @22324    f1463510    08.  /*Non-Hispanic/Latino Population   Whole Numbers, Ethnic Designat       */
     @22332    f1463610    08.  /*White Non-Hispanic Population    Whole Numbers, One Race Alone        */
     @22340    f1463710    08.  /*Black/Afr Amer Non-Hisp Pop      Whole Numbers, One Race Alone        */
     @22348    f1465110    08.  /*Am Ind/Alska Nat Non-Hisp Pop    Whole Numbers; One Race Alone        */
     @22356    f1465210    08.  /*Asian Non-Hispanic Population    Whole Numbers; One Race Alone        */
     @22364    f1465310    08.  /*Nat Hawaii/Oth PI Non-Hisp Pop   Whole Numbers; One Race Alone        */
     @22372    f1465410    08.  /*Some Other Race Non-Hisp Pop     Whole Numbers; One Race Alone        */
     @22380    f1465510    08.  /*Two or more Races Non-Hisp Pop   Whole Numbers                        */
     @22388    f1433505    04.1 /*Percent Foreign Born Pop         (.1) Table B05001                    */
     @22392    f1244300    04.1 /*Percent Foreign Born Pop         (.1) Table P21                       */
     @22396    f1244390    04.1 /*Percent Foreign Born Pop         (.1)                                 */
     @22400    f1433605    08.  /*Foreign Born Population          Table B05001                         */
     @22408    f1244400    08.  /*Foreign Born Population          Table DP-2                           */
     @22416    f1244490    08.  /*Foreign Born Population                                               */
     @22424    f1433705    07.  /*# Non-Eng Speaking Persons 5-17  Table B16004                         */
     @22431    f1181000    07.  /*# Non-Eng Speaking Persons 5-17  Table P19                            */
     @22438    f1181090    07.  /*# Non-Eng Speaking Persons 5-17  Table P28                            */
     @22445    f1433805    07.  /*# Non-Eng Speaking Persons 18+   Table B16004                         */
     @22452    f0874900    07.  /*# Non-Eng Speaking Persons 18+   Table P19                            */
     @22459    f0874990    07.  /*# Non-Eng Speaking Persons 18+   Table P28                            */
     @22466    f0851600    04.1 /*Percent Urban Population         (.1) Table P5                        */
     @22470    f0851690    04.1 /*Percent Urban Population         (.1) Table P6                        */
     @22474    f0851680    04.1 /*Percent Urban Population         (.1)                                 */
     @22478    f1367600    08.  /*Census Urban Population          Table P5; Whole Numbers              */
     @22486    f0851590    06.  /*Census Urban Population (100's)  Table P6; In Hundreds                */
     @22492    f0851580    06.  /*Census Urban Population (100's)  In Hundreds                          */
     @22498    f1367700    08.  /*Census Urbanized Areas Pop       Table P5                             */
     @22506    f1367800    08.  /*Census Urban Clusters Pop        Table P5                             */
     @22514    f1367900    08.  /*Census Rural Population          Table P5; Farm & Nonfarm rural       */
     @22522    f1244200    06.  /*Rural Farm Population            Table P5                             */
     @22528    f1244290    05.  /*Rural Farm Population                                                 */
     @22533    f0975580    05.  /*Rural Farm Population                                                 */
     @22538    f1368000    06.  /*Rural Nonfarm Population         Table P5                             */
     @22544    f1139610    06.  /*Veteran Population Estimate                                           */
     @22550    f1139609    06.  /*Veteran Population Estimate                                           */
     @22556    f1139608    06.  /*Veteran Population Estimate                                           */
     @22562    f1139607    06.  /*Veteran Population Estimate                                           */
     @22568    f1139606    07.  /*Veteran Population Estimate                                           */
     @22575    f1139605    07.  /*Veteran Population Estimate                                           */
     @22582    f1139600    09.  /*Veteran Population Estimate                                           */
     @22591    f1139695    09.  /*Veteran Population Estimate                                           */
     @22600    f1139690    06.  /*Veteran Population                                                    */
     @22606    f1359410    06.  /*Veteran Pop Estimate, Male                                            */
     @22612    f1359409    06.  /*Veteran Pop Estimate, Male                                            */
     @22618    f1359408    06.  /*Veteran Pop Estimate, Male                                            */
     @22624    f1359407    06.  /*Veteran Pop Estimate, Male                                            */
     @22630    f1359400    07.  /*Veteran Pop Estimate, Male                                            */
     @22637    f1359510    06.  /*Veteran Pop Estimate, Female                                          */
     @22643    f1359509    06.  /*Veteran Pop Estimate, Female                                          */
     @22649    f1359508    06.  /*Veteran Pop Estimate, Female                                          */
     @22655    f1359507    06.  /*Veteran Pop Estimate, Female                                          */
     @22661    f1359500    07.  /*Veteran Pop Estimate, Female                                          */
     @22668    f1319109    08.  /*# Eligible for Medicare                                               */
     @22676    f1319108    08.  /*# Eligible for Medicare                                               */
     @22684    f1319105    08.  /*# Eligible for Medicare                                               */
     @22692    f1319100    08.  /*# Eligible for Medicare                                               */
     @22700    f1319209    07.  /*# Medicare Advantage Enrollees                                        */
     @22707    f1319208    07.  /*# Medicare Advantage Enrollees                                        */
     @22714    f1319205    08.  /*# Medicare Advantage Enrollees                                        */
     @22722    f1319200    08.  /*# Medicare Mangd Care Enrollees                                       */
     @22730    f1319309    05.2 /*% Medcre Advantage Penetration   (.01) Enrollees/Eligibles            */
     @22735    f1319308    05.2 /*% Medcre Advantage Penetration   (.01) Enrollees/Eligibles            */
     @22740    f1319305    05.2 /*% Medcre Advantage Penetration   (.01) Enrollees/Eligibles            */
     @22745    f1319300    05.2 /*% Medcre Mangd Care Penetration  (.01) Enrollees/Eligibles            */
     @22750    f1420709    07.  /*# Medicare Presc Drug Plan Enr                                        */
     @22757    f1420708    07.  /*# Medicare Presc Drug Plan Enr                                        */
     @22764    f1420809    05.2 /*% Medcre Presc Drug Plan Penetr  (.01) Enrollees/Eligibles            */
     @22769    f1420808    05.2 /*% Medcre Presc Drug Plan Penetr  (.01) Enrollees/Eligibles            */
     @22774    f1324907    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @22784    f1324906    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @22794    f1324905    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @22804    f1324900    10.  /*Medicare Enrollment, Aged Tot    Enrolled in HI and/or SMI            */
     @22814    f1325007    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @22824    f1325006    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @22834    f1325005    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @22844    f1325000    10.  /*Medicare Enrollment, Aged HI     HI=Hospital Insurance                */
     @22854    f1325107    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @22864    f1325106    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @22874    f1325105    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @22884    f1325100    10.  /*Medicare Enrollment, Aged SMI    SMI=Supplemental Medical Ins         */
     @22894    f1332407    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @22904    f1332406    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @22914    f1332405    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @22924    f1332400    10.  /*Medicre Enrollmnt, Disabled Tot  Enrolled in HI and/or SMI            */
     @22934    f1325207    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @22944    f1325206    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @22954    f1325205    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @22964    f1325200    10.  /*Medicre Enrollmnt, Disabled HI   HI=Hospital Insurance                */
     @22974    f1325307    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @22984    f1325306    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @22994    f1325305    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @23004    f1325300    10.  /*Medicre Enrollmnt, Disabled SMI  SMI=Supplemental Medical Ins         */
     @23014    f1325407    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @23024    f1325406    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @23034    f1325405    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @23044    f1325400    10.  /*Mdcre Enrllmnt, Agd & Dsbld Tot  Enrolled in HI and/or SMI            */
     @23054    f1325507    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @23064    f1325506    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @23074    f1325505    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @23084    f1325500    10.  /*Mdcre Enrllmnt, Agd & Dsbld HI   HI=Hospital Insurance                */
     @23094    f1325607    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @23104    f1325606    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @23114    f1325605    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @23124    f1325600    10.  /*Mdcre Enrllmnt, Agd & Dsbld SMI  SMI=Supplemental Medical Ins         */
     @23134    f1419607    08.  /*Medicaid Eligibles, Total                                             */
     @23142    f1419606    08.  /*Medicaid Eligibles, Total                                             */
     @23150    f1419605    08.  /*Medicaid Eligibles, Total                                             */
     @23158    f1419604    08.  /*Medicaid Eligibles, Total                                             */
     @23166    f1419707    08.  /*Medicaid Eligibles, Male                                              */
     @23174    f1419706    08.  /*Medicaid Eligibles, Male                                              */
     @23182    f1419705    08.  /*Medicaid Eligibles, Male                                              */
     @23190    f1419704    08.  /*Medicaid Eligibles, Male                                              */
     @23198    f1419807    08.  /*Medicaid Eligibles, Females                                           */
     @23206    f1419806    08.  /*Medicaid Eligibles, Females                                           */
     @23214    f1419805    08.  /*Medicaid Eligibles, Females                                           */
     @23222    f1419804    08.  /*Medicaid Eligibles, Females                                           */
     @23230    f1419907    08.  /*Medicaid Eligibles < 21                                               */
     @23238    f1419906    08.  /*Medicaid Eligibles < 21                                               */
     @23246    f1419905    08.  /*Medicaid Eligibles < 21                                               */
     @23254    f1419904    08.  /*Medicaid Eligibles < 21                                               */
     @23262    f1420007    08.  /*Medicaid Eligibles 21-64                                              */
     @23270    f1420006    08.  /*Medicaid Eligibles 21-64                                              */
     @23278    f1420005    08.  /*Medicaid Eligibles 21-64                                              */
     @23286    f1420004    08.  /*Medicaid Eligibles 21-64                                              */
     @23294    f1420107    08.  /*Medicaid Eligibles 65+                                                */
     @23302    f1420106    08.  /*Medicaid Eligibles 65+                                                */
     @23310    f1420105    08.  /*Medicaid Eligibles 65+                                                */
     @23318    f1420104    08.  /*Medicaid Eligibles 65+                                                */
     @23326    f1420207    08.  /*Medicaid Eligibles, Children                                          */
     @23334    f1420206    08.  /*Medicaid Eligibles, Children                                          */
     @23342    f1420205    08.  /*Medicaid Eligibles, Children                                          */
     @23350    f1420204    08.  /*Medicaid Eligibles, Children                                          */
     @23358    f1420307    08.  /*Medicaid Eligibles, Adults                                            */
     @23366    f1420306    08.  /*Medicaid Eligibles, Adults                                            */
     @23374    f1420305    08.  /*Medicaid Eligibles, Adults                                            */
     @23382    f1420304    08.  /*Medicaid Eligibles, Adults                                            */
     @23390    f1420407    08.  /*Medicaid Eligibles, Aged                                              */
     @23398    f1420406    08.  /*Medicaid Eligibles, Aged                                              */
     @23406    f1420405    08.  /*Medicaid Eligibles, Aged                                              */
     @23414    f1420404    08.  /*Medicaid Eligibles, Aged                                              */
     @23422    f1420507    08.  /*Medicaid Elig, Blind/Disabled                                         */
     @23430    f1420506    08.  /*Medicaid Elig, Blind/Disabled                                         */
     @23438    f1420505    08.  /*Medicaid Elig, Blind/Disabled                                         */
     @23446    f1420504    08.  /*Medicaid Elig, Blind/Disabled                                         */
     @23454    f1420607    08.  /*Medicare/Medicaid Dually Elig                                         */
     @23462    f1420606    08.  /*Medicare/Medicaid Dually Elig                                         */
     @23470    f1420605    08.  /*Medicare/Medicaid Dually Elig                                         */
     @23478    f1420604    08.  /*Medicare/Medicaid Dually Elig                                         */
     @23486    f0874500    07.  /*Number Households                Table P15                            */
     @23493    f0874590    07.  /*Number Households                                                     */
     @23500    f0874580    07.  /*Number Households                Table 20                             */
     @23507    f1351300    03.2 /*Average Household Size           Table P17, (.01)                     */
     @23510    f0873800    06.  /*# Households w/1 Persons         Table H13                            */
     @23516    f0873890    06.  /*# Households w/1 Persons                                              */
     @23522    f0873900    06.  /*# Households w/2 Persons         Table H13                            */
     @23528    f0873990    06.  /*# Households w/2 Persons                                              */
     @23534    f0874000    06.  /*# Households w/3 Persons         Table H13                            */
     @23540    f0874090    06.  /*# Households w/3 Persons                                              */
     @23546    f0874100    06.  /*# Households w/4 Persons         Table H13                            */
     @23552    f0874190    06.  /*# Households w/4 Persons                                              */
     @23558    f0874200    06.  /*# Households w/5 Persons         Table H13                            */
     @23564    f0874290    06.  /*# Households w/5 Persons                                              */
     @23570    f0874300    06.  /*# Households w/6 or more Person  Table H13                            */
     @23576    f0874390    06.  /*# Households w/6 or more Person                                       */
     @23582    f1166100    07.  /*# White Households               Table H6                             */
     @23589    f1166190    07.  /*# White Households                                                    */
     @23596    f1166200    07.  /*# Black/Afican American Hsehlds  Table H6                             */
     @23603    f1166290    07.  /*# Black Households                                                    */
     @23610    f1166300    07.  /*# Am Ind/Alaska Native Hsehlds   Table H6                             */
     @23617    f1166390    07.  /*# Am Ind/Eskimo/Aleut Hsehlds                                         */
     @23624    f1346000    07.  /*# Asian Households               Table H6                             */
     @23631    f1346100    07.  /*# Nat Hawaii/Oth Pac Isl HHlds   Table H6                             */
     @23638    f1166490    07.  /*# Asian/Pac Islander Hsehlds                                          */
     @23645    f1166500    07.  /*# Some Other Race Households     Table H6                             */
     @23652    f1166590    07.  /*# Other Race Households                                               */
     @23659    f1346200    07.  /*# Two or more Races Households   Table H6                             */
     @23666    f1166600    07.  /*# Hispanic/Latino Households     Table H7                             */
     @23673    f1166690    07.  /*# Hispanic Origin Households                                          */
     @23680    f1346300    06.  /*# White HHld w/Married-Cple Fam  Tab P35A,Married-Couple Family       */
     @23686    f1346400    06.  /*# Bl/AA HHld w/Married-Cple Fam  Tab P35B,Married-Couple Family       */
     @23692    f1346500    06.  /*#AmInd/Al Nat w/Married-Cpl Fam  Tab P35C,Married-Couple Family       */
     @23698    f1346600    06.  /*# Asian w/Married-Couple Fam     Tab P35D,Married-Couple Family       */
     @23704    f1346700    06.  /*#Nat Haw/Oth PI w/Marrd-Cpl Fam  Tab P35E,Married-Couple Family       */
     @23710    f1346800    06.  /*#Some Oth Rc HHlds w/Mar-Cp Fam  Tab P35F,Married-Couple Family       */
     @23716    f1346900    06.  /*#Two + Races HHlds w/Mar-Cp Fam  Tab P35G,Married-Couple Family       */
     @23722    f1347000    06.  /*# Hisp/Lat HHld w/Marrd-Cpl Fam  Tab P35H,Married-Couple Family       */
     @23728    f1166790    07.  /*# White HHlds w/Trad'l Families                                       */
     @23735    f1166890    07.  /*# Black HHlds w/Trad'l Families                                       */
     @23742    f1166990    07.  /*# AmInd/Esk/Alt w/Trad Families                                       */
     @23749    f1167090    07.  /*# Asian/PacIslr w/Trad Families                                       */
     @23756    f1167190    07.  /*# Other HHlds w/Trad'l Families                                       */
     @23763    f1167290    07.  /*# Hisp Org HHlds w/Trad Famlies                                       */
     @23770    f1160300    06.  /*# Single Parent Households       Table P35                            */
     @23776    f1160390    07.  /*# Single Parent Households                                            */
     @23783    f1160400    06.  /*# Single Parent Hseholds-White   Table P35A                           */
     @23789    f1160490    07.  /*# Single Parent Hseholds-White                                        */
     @23796    f1160500    06.  /*# Single Parent Hseholds-Bl/AA   Table P35B                           */
     @23802    f1160590    07.  /*# Single Parent Hseholds-Black                                        */
     @23809    f1160600    06.  /*# Single Parent HHlds-AmInd/Al   Table P35C                           */
     @23815    f1160690    07.  /*# Single Parent Hseholds-AmInd                                        */
     @23822    f1347100    06.  /*# Single Parent Hseholds-Asian   Table P35D                           */
     @23828    f1347200    06.  /*# Single Parent HHld-Haw/Oth PI  Table P35E                           */
     @23834    f1160790    07.  /*# Single Parent HHld-Asian/PI    Asian/Pacific Islander               */
     @23841    f1347300    06.  /*# Single Parent HHld-Other Race  Table P35F                           */
     @23847    f1347400    06.  /*# Single Parent HHld-Two+ Races  Table P35G                           */
     @23853    f1160800    06.  /*# Single Parent HHld-Hisp/Latin  Table P35H                           */
     @23859    f1160890    07.  /*# Single Parent Hseholds-Hisp                                         */
     @23866    f1348000    06.  /*Unmarried-Partner HHld,Diff Sex  Table PCT14                          */
     @23872    f1348100    05.  /*Unmarried-Partner HHlds, Male    Table PCT14                          */
     @23877    f1348200    05.  /*Unmarried-Partner HHlds, Female  Table PCT14                          */
     @23882    f0524100    08.  /*Population in Households         Table H10                            */
     @23890    f0524190    08.  /*# Persons In Households                                               */
     @23898    f0524180    08.  /*# Persons In Households                                               */
     @23906    f1399909    06.  /*Pop Estimate in Group Quarters                                        */
     @23912    f1399908    06.  /*Pop Estimate in Group Quarters                                        */
     @23918    f1399907    06.  /*Pop Estimate in Group Quarters                                        */
     @23924    f1399906    06.  /*Pop Estimate in Group Quarters                                        */
     @23930    f1399905    06.  /*Pop Estimate in Group Quarters                                        */
     @23936    f0524200    06.  /*Population in Group Quarters     Table PCT16                          */
     @23942    f0524290    06.  /*# Persons In Group Quarters                                           */
     @23948    f0524280    06.  /*# Persons In Group Quarters                                           */
     @23954    f1165600    05.  /*Pop in Correctional Institutns   Table PCT16                          */
     @23959    f1165690    06.  /*Pop in Correctional Institutns                                        */
     @23965    f1165700    05.  /*Pop in Nursing Homes             Table PCT16                          */
     @23970    f1165790    06.  /*Pop in Nursing Homes                                                  */
     @23976    f1347500    04.  /*Pop in Hsp/Ward,Hspce,Hndcp Sch  Table PCT16,Exc Mental Hosps         */
     @23980    f1347600    04.  /*Pop in Mental(Psych) Hosp/Wards  Table PCT16                          */
     @23984    f1165890    06.  /*Pop in Mental Institutions                                            */
     @23990    f1347700    04.  /*Pop in Juvenile Institutions     Table PCT16                          */
     @23994    f1165990    06.  /*Pop in Juvenile Institutions                                          */
     @24000    f1347800    05.  /*Pop in Noninstitional Group Qtr  Table PCT16,Exc Group Homes          */
     @24005    f1347900    05.  /*Pop in Group Homes               Table PCT16                          */
     @24010    f1166090    06.  /*Pop in Other Institutions                                             */
     @24016    f1148890    07.  /*Pop-Homeless Shltrs/Street Locs                                       */
     @24023    f0873700    07.  /*Number Families                  Table P31                            */
     @24030    f0873790    07.  /*Number Families                                                       */
     @24037    f0873780    07.  /*Number Families                                                       */
     @24044    f1351400    03.2 /*Average Family Size              Table P33, (.01)                     */
     @24047    f0972600    08.  /*Married-Couple Families          Table P18                            */
     @24055    f0972690    08.  /*Married-Couple Families                                               */
     @24063    f0972680    08.  /*Married-Couple Families                                               */
     @24071    f0874600    04.1 /*% Families w/Female Head         Table P18, (.1)                      */
     @24075    f0874690    04.1 /*% Families w/Female Head         (.1)                                 */
     @24079    f0874680    04.1 /*% Families w/Female Head         (.1)                                 */
     @24083    f0874400    06.  /*Number Families w/Female Head    Table P18                            */
     @24089    f0874490    06.  /*Number Families w/Female Head                                         */
     @24095    f0874480    06.  /*Number Families w/Female Head                                         */
     @24101    f1255708    06.  /*Total Births                     July 1, 2008-July 1, 2009            */
     @24107    f1255707    06.  /*Total Births                     July 1, 2007-July 1, 2008            */
     @24113    f1255706    06.  /*Total Births                     July 1, 2006-July 1, 2007            */
     @24119    f1255705    06.  /*Total Births                     July 1, 2005-July 1, 2006            */
     @24125    f1255700    06.  /*Total Births                     July 1, 2000-July 1, 2001            */
     @24131    f1254604    06.  /*3-Yr Total Births                3 Year Average                       */
     @24137    f1254603    06.  /*3-Yr Total Births                3 Year Average                       */
     @24143    f1254698    06.  /*3-Yr Total Births                3 Year Average                       */
     @24149    f1360104    06.  /*3-Yr White Births                3 Year Average                       */
     @24155    f1360103    06.  /*3-Yr White Births                3 Year Average                       */
     @24161    f1360198    06.  /*3-Yr White Births                3 Year Average                       */
     @24167    f1360204    06.  /*3-Yr Black Births                3 Year Average                       */
     @24173    f1360203    06.  /*3-Yr Black Births                3 Year Average                       */
     @24179    f1360298    06.  /*3-Yr Black Births                3 Year Average                       */
     @24185    f1360304    06.  /*3-Yr Other Births                3 Year Average                       */
     @24191    f1360303    06.  /*3-Yr Other Births                3 Year Average                       */
     @24197    f1360398    06.  /*3-Yr Other Births                3 Year Average                       */
     @24203    f1360404    06.  /*3-Yr Hispanic Births             3 Year Average; incl any race        */
     @24209    f1360403    06.  /*3-Yr Hispanic Births             3 Year Average; incl any race        */
     @24215    f1360498    06.  /*3-Yr Hispanic Births             3 Year Average; incl any race        */
     @24221    f1254704    06.  /*3-Yr White Male Births           3 Year Average                       */
     @24227    f1254703    06.  /*3-Yr White Male Births           3 Year Average                       */
     @24233    f1254798    06.  /*3-Yr White Male Births           3 Year Average                       */
     @24239    f1254804    06.  /*3-Yr White Female Births         3 Year Average                       */
     @24245    f1254803    06.  /*3-Yr White Female Births         3 Year Average                       */
     @24251    f1254898    06.  /*3-Yr White Female Births         3 Year Average                       */
     @24257    f1254904    06.  /*3-Yr Black Male Births           3 Year Average                       */
     @24263    f1254903    06.  /*3-Yr Black Male Births           3 Year Average                       */
     @24269    f1254998    06.  /*3-Yr Black Male Births           3 Year Average                       */
     @24275    f1255004    06.  /*3-Yr Black Female Births         3 Year Average                       */
     @24281    f1255003    06.  /*3-Yr Black Female Births         3 Year Average                       */
     @24287    f1255098    06.  /*3-Yr Black Female Births         3 Year Average                       */
     @24293    f1255104    06.  /*3-Yr Other Male Births           3 Year Average                       */
     @24299    f1255103    06.  /*3-Yr Other Male Births           3 Year Average                       */
     @24305    f1255198    06.  /*3-Yr Other Male Births           3 Year Average                       */
     @24311    f1255204    06.  /*3-Yr Other Female Births         3 Year Average                       */
     @24317    f1255203    06.  /*3-Yr Other Female Births         3 Year Average                       */
     @24323    f1255298    06.  /*3-Yr Other Female Births         3 Year Average                       */
     @24329    f0961908    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @24335    f0961907    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @24341    f0961906    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @24347    f0961905    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @24353    f0961900    06.  /*Total Births In Hospitals        Excl Fetal Deaths;ST Gen Hosps       */
     @24359    f1255304    06.  /*3-Yr Tot Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @24365    f1255303    06.  /*3-Yr Tot Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @24371    f1255398    06.  /*3-Yr Tot Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @24377    f1360504    06.  /*3-Yr Very Low Birth Wt Births    < 1500 grams; 3 Year Average         */
     @24383    f1360503    06.  /*3-Yr Very Low Birth Wt Births    < 1500 grams; 3 Year Average         */
     @24389    f1360598    06.  /*3-Yr Very Low Birth Wt Births    < 1500 grams; 3 Year Average         */
     @24395    f1255404    06.  /*3-Yr Wht Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @24401    f1255403    06.  /*3-Yr Wht Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @24407    f1255498    06.  /*3-Yr Wht Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @24413    f1255504    06.  /*3-Yr Blk Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @24419    f1255503    06.  /*3-Yr Blk Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @24425    f1255598    06.  /*3-Yr Blk Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @24431    f1255604    06.  /*3-Yr Oth Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @24437    f1255603    06.  /*3-Yr Oth Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @24443    f1255698    06.  /*3-Yr Oth Low Birth Weight Birth  < 2500 grams; 3 Year Average         */
     @24449    f1360604    06.  /*3-Yr Births to Teens < 18 yrs    3 Year Average; under 18 years       */
     @24455    f1360603    06.  /*3-Yr Births to Teens < 18 yrs    3 Year Average; under 18 years       */
     @24461    f1360698    06.  /*3-Yr Births to Teens < 18 yrs    3 Year Average; under 18 years       */
     @24467    f1387004    06.  /*3-Yr Births to Unmarried Mother  3 Year Average                       */
     @24473    f1387003    06.  /*3-Yr Births to Unmarried Mother  3 Year Average                       */
     @24479    f1387098    06.  /*3-Yr Births to Unmarried Mother  3 Year Average                       */
     @24485    f1360804    06.  /*3-Yr Births - Preterm            3 Yr Ave; Gestation < 37 wks         */
     @24491    f1360803    06.  /*3-Yr Births - Preterm            3 Yr Ave; Gestation < 37 wks         */
     @24497    f1360898    06.  /*3-Yr Births - Preterm            3 Yr Ave; Gestation < 37 wks         */
     @24503    f1361104    06.  /*3-Yr Births - Vaginal Delivery   3 Year Average                       */
     @24509    f1361103    06.  /*3-Yr Births - Vaginal Delivery   3 Year Average                       */
     @24515    f1361198    06.  /*3-Yr Births - Vaginal Delivery   3 Year Average                       */
     @24521    f1361204    06.  /*3-Yr Births - C-Sect Delivery    3 Year Average                       */
     @24527    f1361203    06.  /*3-Yr Births - C-Sect Delivery    3 Year Average                       */
     @24533    f1361298    06.  /*3-Yr Births - C-Sect Delivery    3 Year Average                       */
     @24539    f1266902    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24545    f1266901    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24551    f1266900    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24557    f1266999    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24563    f1266998    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24569    f1266997    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24575    f1266996    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24581    f1266995    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24587    f1266994    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24593    f1266993    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24599    f1266992    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24605    f1266991    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24611    f1266990    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24617    f1266989    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24623    f0849081    06.1 /*5-Yr Infant Mortality Rate-Tot   (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24629    f1267002    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24635    f1267001    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24641    f1267000    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24647    f1267099    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24653    f1267098    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24659    f1267097    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24665    f1267096    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24671    f1267095    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24677    f1267094    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24683    f1267093    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24689    f1267092    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24695    f1267091    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24701    f1267090    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24707    f1267089    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24713    f0849181    06.1 /*5-Yr Infant Mortality Rate-Wh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24719    f1267102    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24725    f1267101    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24731    f1267100    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24737    f1267199    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24743    f1267198    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24749    f1267197    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24755    f1267196    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24761    f1267195    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24767    f1267194    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24773    f1267193    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24779    f1267192    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24785    f1267191    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24791    f1267190    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24797    f1267189    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24803    f0849281    06.1 /*5-Yr Infant Mortal Rate-Nonwh    (.1) Under 1 Yr Old; 5 Yr Avg        */
     @24809    f1192404    05.1 /*3-Yr White Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24814    f1192403    05.1 /*3-Yr White Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24819    f1192498    05.1 /*3-Yr White Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24824    f1192504    05.1 /*3-Yr White Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24829    f1192503    05.1 /*3-Yr White Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24834    f1192598    05.1 /*3-Yr White Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24839    f1192604    05.1 /*3-Yr Black Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24844    f1192603    05.1 /*3-Yr Black Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24849    f1192698    05.1 /*3-Yr Black Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24854    f1192704    05.1 /*3-Yr Black Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24859    f1192703    05.1 /*3-Yr Black Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24864    f1192798    05.1 /*3-Yr Black Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24869    f1192804    05.1 /*3-Yr Other Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24874    f1192803    05.1 /*3-Yr Other Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24879    f1192898    05.1 /*3-Yr Other Male Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24884    f1192904    05.1 /*3-Yr Other Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24889    f1192903    05.1 /*3-Yr Other Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24894    f1192998    05.1 /*3-Yr Other Fmle Infant Deaths    (.1) Total < 1 Yr; 3 Yr Avg          */
     @24899    f1193004    04.  /*3-Yr AIDS Deaths                 3 Yr Avg                             */
     @24903    f1193003    04.  /*3-Yr AIDS Deaths                 3 Yr Avg                             */
     @24907    f1193098    04.  /*3-Yr AIDS Deaths                 3 Yr Avg                             */
     @24911    f1193104    05.  /*3-Yr Infectious & Para. Disease  # Dths by Cause;incl AIDS;Avg        */
     @24916    f1193103    05.  /*3-Yr Infectious & Para. Disease  # Dths by Cause;incl AIDS;Avg        */
     @24921    f1193198    05.  /*3-Yr Infectious & Para. Disease  # Dths by Cause;incl AIDS;Avg        */
     @24926    f1193204    05.  /*3-Yr Malignant Neoplasms         # Of Deaths By Cause; 3 Yr Avg       */
     @24931    f1193203    05.  /*3-Yr Malignant Neoplasms         # Of Deaths By Cause; 3 Yr Avg       */
     @24936    f1193298    05.  /*3-Yr Malignant Neoplasms         # Of Deaths By Cause; 3 Yr Avg       */
     @24941    f1316404    05.  /*3-Yr Cerebrovascular Disease     # Of Deaths By Cause; 3 Yr Avg       */
     @24946    f1316403    05.  /*3-Yr Cerebrovascular Disease     # Of Deaths By Cause; 3 Yr Avg       */
     @24951    f1316498    05.  /*3-Yr Cerebrovascular Disease     # Of Deaths By Cause; 3 Yr Avg       */
     @24956    f1193304    05.  /*3-Yr Ischemic Heart Disease      # Of Deaths By Cause; 3 Yr Avg       */
     @24961    f1193303    05.  /*3-Yr Ischemic Heart Disease      # Of Deaths By Cause; 3 Yr Avg       */
     @24966    f1193398    05.  /*3-Yr Ischemic Heart Disease      # Of Deaths By Cause; 3 Yr Avg       */
     @24971    f1316504    05.  /*3-Yr Other Cardiovas Disease     # Of Deaths By Cause; 3 Yr Avg       */
     @24976    f1316503    05.  /*3-Yr Other Cardiovas Disease     # Of Deaths By Cause; 3 Yr Avg       */
     @24981    f1316598    05.  /*3-Yr Other Cardiovas Disease     # Of Deaths By Cause; 3 Yr Avg       */
     @24986    f1193504    05.  /*3-Yr Influenza & Pneumonia       # Of Deaths By Cause; 3 Yr Avg       */
     @24991    f1193503    05.  /*3-Yr Influenza & Pneumonia       # Of Deaths By Cause; 3 Yr Avg       */
     @24996    f1193598    05.  /*3-Yr Influenza & Pneumonia       # Of Deaths By Cause; 3 Yr Avg       */
     @25001    f1193604    05.  /*3-Yr Chronic Lower Resp Dis      # Of Deaths By Cause; 3 Yr Avg       */
     @25006    f1193603    05.  /*3-Yr Chronic Lower Resp Dis      # Of Deaths By Cause; 3 Yr Avg       */
     @25011    f1193698    05.  /*3-Yr Chronic Lower Resp Dis      # Of Deaths By Cause; 3 Yr Avg       */
     @25016    f1193704    05.  /*3-Yr Chrnic Liver Dis&Cirrhosis  # Of Deaths By Cause; 3 Yr Avg       */
     @25021    f1193703    05.  /*3-Yr Chrnic Liver Dis&Cirrhosis  # Of Deaths By Cause; 3 Yr Avg       */
     @25026    f1193798    05.  /*3-Yr Chrnic Liver Dis&Cirrhosis  # Of Deaths By Cause; 3 Yr Avg       */
     @25031    f1193804    05.  /*3-Yr Motor Vehicle Accidents     # Of Deaths By Cause; 3 Yr Avg       */
     @25036    f1193803    05.  /*3-Yr Motor Vehicle Accidents     # Of Deaths By Cause; 3 Yr Avg       */
     @25041    f1193898    05.  /*3-Yr Motor Vehicle Accidents     # Of Deaths By Cause; 3 Yr Avg       */
     @25046    f1316604    05.  /*3-Yr Suicides                    # Of Deaths By Cause; 3 Yr Avg       */
     @25051    f1316603    05.  /*3-Yr Suicides                    # Of Deaths By Cause; 3 Yr Avg       */
     @25056    f1316698    05.  /*3-Yr Suicides                    # Of Deaths By Cause; 3 Yr Avg       */
     @25061    f1316704    05.  /*3-Yr Homicides&Legal Interventn  # Of Deaths By Cause; 3 Yr Avg       */
     @25066    f1316703    05.  /*3-Yr Homicides&Legal Interventn  # Of Deaths By Cause; 3 Yr Avg       */
     @25071    f1316798    05.  /*3-Yr Homicides&Legal Interventn  # Of Deaths By Cause; 3 Yr Avg       */
     @25076    f1316804    05.  /*3-Yr Other External Causes       # Of Deaths By Cause; 3 Yr Avg       */
     @25081    f1316803    05.  /*3-Yr Other External Causes       # Of Deaths By Cause; 3 Yr Avg       */
     @25086    f1316898    05.  /*3-Yr Other External Causes       # Of Deaths By Cause; 3 Yr Avg       */
     @25091    f1316904    05.  /*3-Yr Diabetes                    # Of Deaths By Cause; 3 Yr Avg       */
     @25096    f1316903    05.  /*3-Yr Diabetes                    # Of Deaths By Cause; 3 Yr Avg       */
     @25101    f1316998    05.  /*3-Yr Diabetes                    # Of Deaths By Cause; 3 Yr Avg       */
     @25106    f1317004    05.  /*3-Yr Deaths From Other Causes    # Of Deaths By Cause; 3 Yr Avg       */
     @25111    f1317003    05.  /*3-Yr Deaths From Other Causes    # Of Deaths By Cause; 3 Yr Avg       */
     @25116    f1317098    05.  /*3-Yr Deaths From Other Causes    # Of Deaths By Cause; 3 Yr Avg       */
     @25121    f1255808    06.  /*Total Deaths                     July 1, 2008-July 1, 2009            */
     @25127    f1255807    06.  /*Total Deaths                     July 1, 2007-July 1, 2008            */
     @25133    f1255806    06.  /*Total Deaths                     July 1, 2006-July 1, 2007            */
     @25139    f1255805    06.  /*Total Deaths                     July 1, 2005-July 1, 2006            */
     @25145    f1255800    06.  /*Total Deaths                     July 1, 2000-July 1, 2001            */
     @25151    f1194104    06.  /*3-Yr Total Deaths                3 Yr Avg                             */
     @25157    f1194103    06.  /*3-Yr Total Deaths                3 Yr Avg                             */
     @25163    f1194198    06.  /*3-Yr Total Deaths                3 Yr Avg                             */
     @25169    f1194204    05.  /*3-Yr White Male Deaths           3 Yr Avg                             */
     @25174    f1194203    05.  /*3-Yr White Male Deaths           3 Yr Avg                             */
     @25179    f1194298    05.  /*3-Yr White Male Deaths           3 Yr Avg                             */
     @25184    f1194304    05.  /*3-Yr Black Male Deaths           3 Yr Avg                             */
     @25189    f1194303    05.  /*3-Yr Black Male Deaths           3 Yr Avg                             */
     @25194    f1194398    05.  /*3-Yr Black Male Deaths           3 Yr Avg                             */
     @25199    f1194404    05.  /*3-Yr Other Male Deaths           3 Yr Avg                             */
     @25204    f1194403    05.  /*3-Yr Other Male Deaths           3 Yr Avg                             */
     @25209    f1194498    05.  /*3-Yr Other Male Deaths           3 Yr Avg                             */
     @25214    f1194504    05.  /*3-Yr White Female Deaths         3 Yr Avg                             */
     @25219    f1194503    05.  /*3-Yr White Female Deaths         3 Yr Avg                             */
     @25224    f1194598    05.  /*3-Yr White Female Deaths         3 Yr Avg                             */
     @25229    f1194604    05.  /*3-Yr Black Female Deaths         3 Yr Avg                             */
     @25234    f1194603    05.  /*3-Yr Black Female Deaths         3 Yr Avg                             */
     @25239    f1194698    05.  /*3-Yr Black Female Deaths         3 Yr Avg                             */
     @25244    f1194704    05.  /*3-Yr Other Female Deaths         3 Yr Avg                             */
     @25249    f1194703    05.  /*3-Yr Other Female Deaths         3 Yr Avg                             */
     @25254    f1194798    05.  /*3-Yr Other Female Deaths         3 Yr Avg                             */
     @25259    f1194804    05.  /*3-Yr Mortality Age < 1 Year      3 Yr Avg                             */
     @25264    f1194803    05.  /*3-Yr Mortality Age < 1 Year      3 Yr Avg                             */
     @25269    f1194898    05.  /*3-Yr Mortality Age < 1 Year      3 Yr Avg                             */
     @25274    f1194904    05.  /*3-Yr Mortality Age 1-4 Years     3 Yr Avg                             */
     @25279    f1194903    05.  /*3-Yr Mortality Age 1-4 Years     3 Yr Avg                             */
     @25284    f1194998    05.  /*3-Yr Mortality Age 1-4 Years     3 Yr Avg                             */
     @25289    f1195004    05.  /*3-Yr Mortality Age 5-14 Years    3 Yr Avg                             */
     @25294    f1195003    05.  /*3-Yr Mortality Age 5-14 Years    3 Yr Avg                             */
     @25299    f1195098    05.  /*3-Yr Mortality Age 5-14 Years    3 Yr Avg                             */
     @25304    f1195104    05.  /*3-Yr Mortality Age 15-24 Years   3 Yr Avg                             */
     @25309    f1195103    05.  /*3-Yr Mortality Age 15-24 Years   3 Yr Avg                             */
     @25314    f1195198    05.  /*3-Yr Mortality Age 15-24 Years   3 Yr Avg                             */
     @25319    f1195204    05.  /*3-Yr Mortality Age 25-34 Years   3 Yr Avg                             */
     @25324    f1195203    05.  /*3-Yr Mortality Age 25-34 Years   3 Yr Avg                             */
     @25329    f1195298    05.  /*3-Yr Mortality Age 25-34 Years   3 Yr Avg                             */
     @25334    f1195304    05.  /*3-Yr Mortality Age 35-44 Years   3 Yr Avg                             */
     @25339    f1195303    05.  /*3-Yr Mortality Age 35-44 Years   3 Yr Avg                             */
     @25344    f1195398    05.  /*3-Yr Mortality Age 35-44 Years   3 Yr Avg                             */
     @25349    f1195404    05.  /*3-Yr Mortality Age 45-54 Years   3 Yr Avg                             */
     @25354    f1195403    05.  /*3-Yr Mortality Age 45-54 Years   3 Yr Avg                             */
     @25359    f1195498    05.  /*3-Yr Mortality Age 45-54 Years   3 Yr Avg                             */
     @25364    f1195504    05.  /*3-Yr Mortality Age 55-64 Years   3 Yr Avg                             */
     @25369    f1195503    05.  /*3-Yr Mortality Age 55-64 Years   3 Yr Avg                             */
     @25374    f1195598    05.  /*3-Yr Mortality Age 55-64 Years   3 Yr Avg                             */
     @25379    f1195604    05.  /*3-Yr Mortality Age 65-74 Years   3 Yr Avg                             */
     @25384    f1195603    05.  /*3-Yr Mortality Age 65-74 Years   3 Yr Avg                             */
     @25389    f1195698    05.  /*3-Yr Mortality Age 65-74 Years   3 Yr Avg                             */
     @25394    f1195704    05.  /*3-Yr Mortality Age 75-84 Years   3 Yr Avg                             */
     @25399    f1195703    05.  /*3-Yr Mortality Age 75-84 Years   3 Yr Avg                             */
     @25404    f1195798    05.  /*3-Yr Mortality Age 75-84 Years   3 Yr Avg                             */
     @25409    f1195804    05.  /*3-Yr Mortality Age 85+ Years     3 Yr Avg                             */
     @25414    f1195803    05.  /*3-Yr Mortality Age 85+ Years     3 Yr Avg                             */
     @25419    f1195898    05.  /*3-Yr Mortality Age 85+ Years     3 Yr Avg                             */
     @25424    f1195904    03.  /*3-Yr Mortality Age Unknown       3 Yr Avg                             */
     @25427    f1195903    03.  /*3-Yr Mortality Age Unknown       3 Yr Avg                             */
     @25430    f1195998    05.  /*3-Yr Mortality Age Unknown       3 Yr Avg                             */
     @25435    f0978108    06.  /*Per Capita Income                In Dollars                           */
     @25441    f0978107    06.  /*Per Capita Income                In Dollars                           */
     @25447    f0978106    06.  /*Per Capita Income                In Dollars                           */
     @25453    f0978105    05.  /*Per Capita Income                In Dollars                           */
     @25458    f0978100    05.  /*Per Capita Income                In Dollars                           */
     @25463    f0978195    05.  /*Per Capita Income                In Dollars                           */
     @25468    f0978190    05.  /*Per Capita Income                In Dollars                           */
     @25473    f0977808    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @25482    f0977807    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @25491    f0977806    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @25500    f0977805    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @25509    f0977800    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @25518    f0977895    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @25527    f0977890    09.  /*Personal Inc (by res) (1000's)   Thousands of Dollars                 */
     @25536    f1433905    06.  /*Household Income, Under $10000   Table B19001                         */
     @25542    f1366899    06.  /*Household Income, Under $10000   Table DP-3                           */
     @25548    f0859889    06.  /*Household Income, Under $5000    Table P80                            */
     @25554    f0859989    06.  /*Household Income, $5000-9999     Table P80                            */
     @25560    f1434005    06.  /*Household Income, $10,000-14999  Table B19001                         */
     @25566    f0860099    06.  /*Household Income, $10,000-14999  Table DP-3                           */
     @25572    f0860089    06.  /*Household Income, $10,000-14999  Table P80                            */
     @25578    f1434105    06.  /*Household Income, $15,000-24999  Table B19001                         */
     @25584    f0860199    06.  /*Household Income, $15,000-24999  Table DP-3                           */
     @25590    f0860189    06.  /*Household Income, $15,000-24999  Table P80                            */
     @25596    f1434205    06.  /*Household Income, $25,000-49999  Table B19001                         */
     @25602    f0860299    06.  /*Household Income, $25,000-49999  Table DP-3                           */
     @25608    f0860289    06.  /*Household Income, $25,000-49999  Table P80                            */
     @25614    f1434305    06.  /*Household Income, $50,000-99999  Table B19001                         */
     @25620    f1180399    06.  /*Household Income, $50,000-99999  Table DP-3                           */
     @25626    f1180389    06.  /*Household Income, $50,000-99999  Table P80                            */
     @25632    f1434405    06.  /*Household Income, $100,000+      Table B19001                         */
     @25638    f1180499    06.  /*Household Income, $100,000+      Table DP-3                           */
     @25644    f1180489    06.  /*Household Income, $100,000+      Table P80                            */
     @25650    f1434505    06.  /*Median Household Income          Table B19013                         */
     @25656    f1245199    06.  /*Median Household Income          Table DP-3                           */
     @25662    f1245189    06.  /*Median Household Income                                               */
     @25668    f1322609    06.  /*Median Household Income          Estimates                            */
     @25674    f1322608    06.  /*Median Household Income          Estimates                            */
     @25680    f1322607    06.  /*Median Household Income          Estimates                            */
     @25686    f1322606    06.  /*Median Household Income          Estimates                            */
     @25692    f1322605    06.  /*Median Household Income          Estimates                            */
     @25698    f1322600    06.  /*Median Household Income          Estimates                            */
     @25704    f1322695    06.  /*Median Household Income          Estimates                            */
     @25710    f1434605    06.  /*Median Family Income             Table B19113                         */
     @25716    f0859499    06.  /*Median Family Income             Table DP-3                           */
     @25722    f0859489    06.  /*Median Family Income             Table P107A                          */
     @25728    f1434705    06.  /*# Wh HHlds w/Income < $10,000    B19001A; White Households            */
     @25734    f1368199    06.  /*# Wh HHlds w/Income < $10,000    Tbl 151A; White Households           */
     @25740    f1181189    07.  /*# Wh HHlds w/ Income < $5000     Table P82; White Households          */
     @25747    f1181289    07.  /*# Wh HHlds w/Income $5000-9999   Table P82; White Households          */
     @25754    f1434805    06.  /*# Wh HHlds Inc $10,000-14,999    B19001A; White Households            */
     @25760    f1181399    06.  /*# Wh HHlds Inc $10,000-14,999    Tbl 151A; White Households           */
     @25766    f1181389    07.  /*# Wh HHlds Inc $10,000-14,999    Table P82; White Households          */
     @25773    f1434905    06.  /*# Wh HHlds Inc $15,000-24,999    B19001A; White Households            */
     @25779    f1181499    06.  /*# Wh HHlds Inc $15,000-24,999    Tbl 151A; White Households           */
     @25785    f1181489    07.  /*# Wh HHlds Inc $15,000-24,999    Table P82; White Households          */
     @25792    f1435005    06.  /*# Wh HHlds Inc $25,000-49,999    B19001A; White Households            */
     @25798    f1181599    06.  /*# Wh HHlds Inc $25,000-49,999    Tbl 151A; White Households           */
     @25804    f1181589    07.  /*# Wh HHlds Inc $25,000-49,999    Table P82; White Households          */
     @25811    f1435105    06.  /*# Wh HHlds Inc $50,000-99,999    B19001A; White Households            */
     @25817    f1181699    06.  /*# Wh HHlds Inc $50,000-99,999    Tbl 151A; White Households           */
     @25823    f1181689    07.  /*# Wh HHlds Inc $50,000-99,999    Table P82; White Households          */
     @25830    f1435205    06.  /*# Wh HHlds Inc $100,000+         B19001A; White Households            */
     @25836    f1181799    06.  /*# Wh HHlds Inc $100,000+         Tbl 151A; White Households           */
     @25842    f1181789    07.  /*# Wh HHlds Inc $100,000+         Table P82; White Households          */
     @25849    f1435305    06.  /*# Bl/AA HHld Income < $10,000    B19001B; Black/Afr Amer HHlds        */
     @25855    f1368299    06.  /*# Bl/AA HHld Income < $10,000    Tbl 151B; Black/Afr Amer HHlds       */
     @25861    f1181889    07.  /*# Bl HHlds w/Income < $5000      Table P82; Black Households          */
     @25868    f1181989    07.  /*# Bl HHlds w/Income $5000-9999   Table P82; Black Households          */
     @25875    f1435405    06.  /*# Bl/AA HHld Inc $10,000-14,999  B19001B; Black/Afr Amer HHlds        */
     @25881    f1182099    06.  /*# Bl/AA HHld Inc $10,000-14,999  Tbl 151B; Black/Afr Amer HHlds       */
     @25887    f1182089    07.  /*# Bl HHlds Inc $10,000-14,999    Table P82; Black Households          */
     @25894    f1435505    06.  /*# Bl/AA HHld Inc $15,000-24,999  B19001B; Black/Afr Amer HHlds        */
     @25900    f1182199    06.  /*# Bl/AA HHld Inc $15,000-24,999  Tbl 151B; Black/Afr Amer HHlds       */
     @25906    f1182189    07.  /*# Bl HHlds Inc $15,000-24,999    Table P82; Black Households          */
     @25913    f1435605    06.  /*# Bl/AA HHld Inc $25,000-49,999  B19001B; Black/Afr Amer HHlds        */
     @25919    f1182299    06.  /*# Bl/AA HHld Inc $25,000-49,999  Tbl 151B; Black/Afr Amer HHlds       */
     @25925    f1182289    07.  /*# Bl HHlds Inc $25,000-49,999    Table P82; Black Households          */
     @25932    f1435705    06.  /*# Bl/AA HHld Inc $50,000-99,999  B19001B; Black/Afr Amer HHlds        */
     @25938    f1182399    06.  /*# Bl/AA HHld Inc $50,000-99,999  Tbl 151B; Black/Afr Amer HHlds       */
     @25944    f1182389    07.  /*# Bl HHlds Inc $50,000-99,999    Table P82; Black Households          */
     @25951    f1435805    06.  /*# Bl/AA HHld Income $100,000+    B19001B; Black/Afr Amer HHlds        */
     @25957    f1182499    06.  /*# Bl/AA HHld Income $100,000+    Tbl 151B; Black/Afr Amer HHlds       */
     @25963    f1182489    07.  /*# Bl HHlds Inc $100,000+         Table P82; Black Households          */
     @25970    f1435905    05.  /*# AIAN HHld Income < $10,000     B19001C; AmInd/Alaska Nat HHlds      */
     @25975    f1368399    06.  /*# AIAN HHld Income < $10,000     Tbl 151C;AmInd/Alaska Nat HHlds      */
     @25981    f1436005    05.  /*#AIAN HHld Income$10,000-14,999  B19001C; AmInd/Alaska Nat HHlds      */
     @25986    f1368499    06.  /*#AIAN HHld Income$10,000-14,999  Tbl 151C;AmInd/Alaska Nat HHlds      */
     @25992    f1436105    05.  /*#AIAN HHld Income$15,000-24,999  B19001C; AmInd/Alaska Nat HHlds      */
     @25997    f1368599    06.  /*#AIAN HHld Income$15,000-24,999  Tbl 151C;AmInd/Alaska Nat HHlds      */
     @26003    f1436205    05.  /*#AIAN HHld Income$25,000-49,999  B19001C; AmInd/Alaska Nat HHlds      */
     @26008    f1368699    06.  /*#AIAN HHld Income$25,000-49,999  Tbl 151C;AmInd/Alaska Nat HHlds      */
     @26014    f1436305    05.  /*#AIAN HHld Income$50,000-99,999  B19001C; AmInd/Alaska Nat HHlds      */
     @26019    f1368799    06.  /*#AIAN HHld Income$50,000-99,999  Tbl 151C;AmInd/Alaska Nat HHlds      */
     @26025    f1436405    05.  /*# AIAN HHld Income $100,000+     B19001C; AmInd/Alaska Nat HHlds      */
     @26030    f1368899    06.  /*# AIAN HHld Income $100,000+     Tbl 151C;AmInd/Alaska Nat HHlds      */
     @26036    f1436505    06.  /*# Asian HHld Income < $10,000    B19001D; Asian Households            */
     @26042    f1368999    06.  /*# Asian HHld Income < $10,000    Tbl 151D; Asian Households           */
     @26048    f1436605    06.  /*# Asian HHld Inc $10,000-14,999  B19001D; Asian Households            */
     @26054    f1369099    06.  /*# Asian HHld Inc $10,000-14,999  Tbl 151D; Asian Households           */
     @26060    f1436705    06.  /*# Asian HHld Inc $15,000-24,999  B19001D; Asian Households            */
     @26066    f1369199    06.  /*# Asian HHld Inc $15,000-24,999  Tbl 151D; Asian Households           */
     @26072    f1436805    06.  /*# Asian HHld Inc $25,000-49,999  B19001D; Asian Households            */
     @26078    f1369299    06.  /*# Asian HHld Inc $25,000-49,999  Tbl 151D; Asian Households           */
     @26084    f1436905    06.  /*# Asian HHld Inc $50,000-99,999  B19001D; Asian Households            */
     @26090    f1369399    06.  /*# Asian HHld Inc $50,000-99,999  Tbl 151D; Asian Households           */
     @26096    f1437005    06.  /*# Asian HHld Income $100,000+    B19001D; Asian Households            */
     @26102    f1369499    06.  /*# Asian HHld Income $100,000+    Tbl 151D; Asian Households           */
     @26108    f1437105    04.  /*# NHPI HHld Income < $10,000     B19001E; Nat Haw/Oth PI HHlds        */
     @26112    f1369599    06.  /*# NHPI HHld Income < $10,000     Tbl 151E; Nat Haw/Oth PI HHlds       */
     @26118    f1437205    04.  /*# NHPI HHld Inc $10,000-14,999   B19001E; Nat Haw/Oth PI HHlds        */
     @26122    f1369699    06.  /*# NHPI HHld Inc $10,000-14,999   Tbl 151E; Nat Haw/Oth PI HHlds       */
     @26128    f1437305    04.  /*# NHPI HHld Inc $15,000-24,999   B19001E; Nat Haw/Oth PI HHlds        */
     @26132    f1369799    06.  /*# NHPI HHld Inc $15,000-24,999   Tbl 151E; Nat Haw/Oth PI HHlds       */
     @26138    f1437405    04.  /*# NHPI HHld Inc $25,000-49,999   B19001E; Nat Haw/Oth PI HHlds        */
     @26142    f1369899    06.  /*# NHPI HHld Inc $25,000-49,999   Tbl 151E; Nat Haw/Oth PI HHlds       */
     @26148    f1437505    04.  /*# NHPI HHld Inc $50,000-99,999   B19001E; Nat Haw/Oth PI HHlds        */
     @26152    f1369999    06.  /*# NHPI HHld Inc $50,000-99,999   Tbl 151E; Nat Haw/Oth PI HHlds       */
     @26158    f1437605    04.  /*# NHPI HHld Income $100,000+     B19001E; Nat Haw/Oth PI HHlds        */
     @26162    f1370099    06.  /*# NHPI HHld Income $100,000+     Tbl 151E; Nat Haw/Oth PI HHlds       */
     @26168    f1437705    06.  /*# Oth Race HHld Inc < $10,000    B19001F; Some Oth Race HHlds         */
     @26174    f1380199    06.  /*# Oth Race HHld Inc < $10,000    Tbl 151F; Some Oth Race HHlds        */
     @26180    f1437805    06.  /*#Oth Rce HHld Inc$10,000-14,999  B19001F; Some Oth Race HHlds         */
     @26186    f1380299    06.  /*#Oth Rce HHld Inc$10,000-14,999  Tbl 151F; Some Oth Race HHlds        */
     @26192    f1437905    06.  /*#Oth Rce HHld Inc$15,000-24,999  B19001F; Some Oth Race HHlds         */
     @26198    f1380399    06.  /*#Oth Rce HHld Inc$15,000-24,999  Tbl 151F; Some Oth Race HHlds        */
     @26204    f1438005    06.  /*#Oth Rce HHld Inc$25,000-49,999  B19001F; Some Oth Race HHlds         */
     @26210    f1380499    06.  /*#Oth Rce HHld Inc$25,000-49,999  Tbl 151F; Some Oth Race HHlds        */
     @26216    f1438105    06.  /*#Oth Rce HHld Inc$50,000-99,999  B19001F; Some Oth Race HHlds         */
     @26222    f1380599    06.  /*#Oth Rce HHld Inc$50,000-99,999  Tbl 151F; Some Oth Race HHlds        */
     @26228    f1438205    06.  /*#Oth Race HHld Income $100,000+  B19001F; Some Oth Race HHlds         */
     @26234    f1380699    06.  /*#Oth Race HHld Income $100,000+  Tbl 151F; Some Oth Race HHlds        */
     @26240    f1438305    05.  /*#2+ Races HHld Income < $10,000  B19001G;Two/more Races HHlds         */
     @26245    f1380799    06.  /*#2+ Races HHld Income < $10,000  Tbl 151G;Two/more Races HHlds        */
     @26251    f1438405    05.  /*#2+ Rce HHld Inc $10,000-14,999  B19001G;Two/more Races HHlds         */
     @26256    f1380899    06.  /*#2+ Rce HHld Inc $10,000-14,999  Tbl 151G;Two/more Races HHlds        */
     @26262    f1438505    05.  /*#2+ Rce HHld Inc $15,000-24,999  B19001G;Two/more Races HHlds         */
     @26267    f1380999    06.  /*#2+ Rce HHld Inc $15,000-24,999  Tbl 151G;Two/more Races HHlds        */
     @26273    f1438605    05.  /*#2+ Rce HHld Inc $25,000-49,999  B19001G;Two/more Races HHlds         */
     @26278    f1381099    06.  /*#2+ Rce HHld Inc $25,000-49,999  Tbl 151G;Two/more Races HHlds        */
     @26284    f1438705    05.  /*#2+ Rce HHld Inc $50,000-99,999  B19001G;Two/more Races HHlds         */
     @26289    f1381199    06.  /*#2+ Rce HHld Inc $50,000-99,999  Tbl 151G;Two/more Races HHlds        */
     @26295    f1438805    05.  /*#2+ Races HHld Income $100,000+  B19001G;Two/more Races HHlds         */
     @26300    f1381299    06.  /*#2+ Races HHld Income $100,000+  Tbl 151G;Two/more Races HHlds        */
     @26306    f1438905    06.  /*# Hisp/Latino HHld Inc <$10,000  B19001I; Hispanic/Latino HHld        */
     @26312    f1370199    06.  /*# Hisp/Latino HHld Inc <$10,000  Tbl 151H; Hispanic/Latino HHld       */
     @26318    f1183289    07.  /*# HO HHlds w/ Income < $5000     Table P83; Hispanic Origin           */
     @26325    f1183389    07.  /*# HO HHlds w/Income $5000-9999   Table P83; Hispanic Origin           */
     @26332    f1439005    06.  /*#Hsp/Lat HHld Inc$10,000-14,999  B19001I; Hispanic/Latino HHld        */
     @26338    f1183499    06.  /*#Hsp/Lat HHld Inc$10,000-14,999  Tbl 151H; Hispanic/Latino HHld       */
     @26344    f1183489    07.  /*# HO HHlds Inc $10,000-14,999    Table P83; Hispanic Origin           */
     @26351    f1439105    06.  /*#Hsp/Lat HHld Inc$15,000-24,999  B19001I; Hispanic/Latino HHld        */
     @26357    f1183599    06.  /*#Hsp/Lat HHld Inc$15,000-24,999  Tbl 151H; Hispanic/Latino HHld       */
     @26363    f1183589    07.  /*# HO HHlds Inc $15,000-24,999    Table P83; Hispanic Origin           */
     @26370    f1439205    06.  /*#Hsp/Lat HHld Inc$25,000-49,999  B19001I; Hispanic/Latino HHld        */
     @26376    f1183699    06.  /*#Hsp/Lat HHld Inc$25,000-49,999  Tbl 151H; Hispanic/Latino HHld       */
     @26382    f1183689    07.  /*# HO HHlds Inc $25,000-49,999    Table P83; Hispanic Origin           */
     @26389    f1439305    06.  /*#Hsp/Lat HHld Inc$50,000-99,999  B19001I; Hispanic/Latino HHld        */
     @26395    f1183799    06.  /*#Hsp/Lat HHld Inc$50,000-99,999  Tbl 151H; Hispanic/Latino HHld       */
     @26401    f1183789    07.  /*# HO HHlds Inc $50,000-99,999    Table P83; Hispanic Origin           */
     @26408    f1439405    06.  /*#Hisp/Latino HHld Inc $100,000+  B19001I; Hispanic/Latino HHld        */
     @26414    f1183899    06.  /*#Hisp/Latino HHld Inc $100,000+  Tbl 151H; Hispanic/Latino HHld       */
     @26420    f1183889    07.  /*# HO HHlds Inc $100,000+         Table P83; Hispanic Origin           */
     @26427    f1439505    06.  /*#Wh non/Hisp HHld Inc < $10,000  B19001H;White not/Hisp/Latino        */
     @26433    f1381399    06.  /*#Wh non/Hisp HHld Inc < $10,000  Tbl 151I;White not/Hisp/Latino       */
     @26439    f1439605    06.  /*#Wh n/His HHd Inc$10,000-14,999  B19001H;White not/Hisp/Latino        */
     @26445    f1381499    06.  /*#Wh n/His HHd Inc$10,000-14,999  Tbl 151I;White not/Hisp/Latino       */
     @26451    f1439705    06.  /*#Wh n/His HHd Inc$15,000-24,999  B19001H;White not/Hisp/Latino        */
     @26457    f1381599    06.  /*#Wh n/His HHd Inc$15,000-24,999  Tbl 151I;White not/Hisp/Latino       */
     @26463    f1439805    06.  /*#Wh n/His HHd Inc$25,000-49,999  B19001H;White not/Hisp/Latino        */
     @26469    f1381699    06.  /*#Wh n/His HHd Inc$25,000-49,999  Tbl 151I;White not/Hisp/Latino       */
     @26475    f1439905    06.  /*#Wh n/His HHd Inc$50,000-99,999  B19001H;White not/Hisp/Latino        */
     @26481    f1381799    06.  /*#Wh n/His HHd Inc$50,000-99,999  Tbl 151I;White not/Hisp/Latino       */
     @26487    f1440005    06.  /*#Wh non/Hisp HHld Inc $100,000+  B19001H;White not/Hisp/Latino        */
     @26493    f1381899    06.  /*#Wh non/Hisp HHld Inc $100,000+  Tbl 151I;White not/Hisp/Latino       */
     @26499    f1182589    07.  /*# NW HHlds w/Income < $5000      Table80,82; Non-White(inc Blk)       */
     @26506    f1182689    07.  /*# NW HHlds w/Income $5000-9999   Table80,82; Non-White(inc Blk)       */
     @26513    f1182789    07.  /*# NW HHlds Inc $10,000-14,999    Table80,82; Non-White(inc Blk)       */
     @26520    f1182889    07.  /*# NW HHlds Inc $15,000-24,999    Table80,82; Non-White(inc Blk)       */
     @26527    f1182989    07.  /*# NW HHlds Inc $25,000-49,999    Table80,82; Non-White(inc Blk)       */
     @26534    f1183089    07.  /*# NW HHlds Inc $50,000-99,999    Table80,82; Non-White(inc Blk)       */
     @26541    f1183189    07.  /*# NW HHlds Inc $100,000+         Table80,82; Non-White(inc Blk)       */
     @26548    f1440105    07.  /*Ratio of Inc to Pov level < 0.5  Table C17002                         */
     @26555    f1389999    07.  /*Ratio of Inc to Pov level < 0.5  Table P88                            */
     @26562    f1440205    07.  /*Ratio of Inc to Pov Lvl .5-.99   Table C17002                         */
     @26569    f1390099    07.  /*Ratio of Inc to Pov Lvl .5-.99   Table P88                            */
     @26576    f1440305    07.  /*Rtio of Inc to Pov Lvl 1.0-1.24  Table C17002                         */
     @26583    f1390199    07.  /*Rtio of Inc to Pov Lvl 1.0-1.24  Table P88                            */
     @26590    f1440405    07.  /*Rtio of Inc to Pov Lv 1.25-1.49  Table C17002                         */
     @26597    f1390299    07.  /*Rtio of Inc to Pov Lv 1.25-1.49  Table P88                            */
     @26604    f1440505    07.  /*Rtio of Inc to Pov Lvl 1.5-1.84  Table C17002                         */
     @26611    f1390399    07.  /*Rtio of Inc to Pov Lvl 1.5-1.74  Table P88                            */
     @26618    f1440605    07.  /*Rtio of Inc to Pov Lv 1.85-1.99  Table C17002                         */
     @26625    f1390499    07.  /*Rtio of Inc to Pov Lv 1.75-1.99  Table P88                            */
     @26632    f1440705    07.  /*Ratio of Inc to Pov Level 2.0+   Table C17002                         */
     @26639    f1390599    07.  /*Ratio of Inc to Pov Level 2.0+   Table P88                            */
     @26646    f1322309    08.  /*Persons in Poverty               Estimates                            */
     @26654    f1322308    08.  /*Persons in Poverty               Estimates                            */
     @26662    f1322307    08.  /*Persons in Poverty               Estimates                            */
     @26670    f1322306    08.  /*Persons in Poverty               Estimates                            */
     @26678    f1322305    08.  /*Persons in Poverty               Estimates                            */
     @26686    f1322300    08.  /*Persons in Poverty               Estimates                            */
     @26694    f1322395    08.  /*Persons in Poverty               Estimates                            */
     @26702    f1332109    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @26706    f1332108    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @26710    f1332107    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @26714    f1332106    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @26718    f1332105    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @26722    f1332100    04.1 /*Percent Persons in Poverty       (.1) Estimates                       */
     @26726    f1322409    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @26734    f1322408    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @26742    f1322407    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @26750    f1322406    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @26758    f1322405    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @26766    f1322400    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @26774    f1322495    08.  /*Persons Age 0-17 in Poverty      Estimates                            */
     @26782    f1332209    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @26786    f1332208    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @26790    f1332207    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @26794    f1332206    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @26798    f1332205    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @26802    f1332200    04.1 /*Percent Persons Age 0-17 in Pov  (.1) Estimates                       */
     @26806    f1322509    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @26814    f1322508    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @26822    f1322507    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @26830    f1322506    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @26838    f1322505    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @26846    f1322500    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @26854    f1322595    08.  /*Relat Chldrn 5-17 in Fam in Pov  Estimates                            */
     @26862    f1332309    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @26866    f1332308    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @26870    f1332307    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @26874    f1332306    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @26878    f1332305    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @26882    f1332300    04.1 /*Pct Related Chldrn 5-17 in Pov   (.1) Estimates                       */
     @26886    f1440805    04.1 /*% Persons Below Poverty Level    (.1) Table B17001                    */
     @26890    f0860699    04.1 /*% Persons Below Poverty Level    (.1) Table DP-3                      */
     @26894    f0860689    04.1 /*% Persons Below Poverty Level    (.1) Table P117                      */
     @26898    f1440905    07.  /*# Pers w/Pov Status Determined   Table B17001                         */
     @26905    f0883299    07.  /*# Pers w/Pov Status Determined   Table DP-3                           */
     @26912    f0883289    07.  /*# Pers w/Pov Status Determined   Table P117                           */
     @26919    f1441005    07.  /*White w/Pov Status Determined    B17001A; White Persons               */
     @26926    f0883499    07.  /*White w/Pov Status Determined    P159A; White Persons                 */
     @26933    f1441105    07.  /*Black/Afr Am w/Pov Status Det    B17001B; Black/Afr Amer Persons      */
     @26940    f1370299    07.  /*Black/Afr Am w/Pov Status Det    P159B; Black/Afr Amer Persons        */
     @26947    f1441205    07.  /*AIAN w/Pov Status Determined     B17001C;Am Ind/Alaska Nat Pers       */
     @26954    f1370399    07.  /*AIAN w/Pov Status Determined     P159C;Am Ind/Alaska Nat Persons      */
     @26961    f1441305    07.  /*Asian w/Pov Status Determined    B17001D; Asian Persons               */
     @26968    f1370499    07.  /*Asian w/Pov Status Determined    P159D; Asian Persons                 */
     @26975    f1441405    07.  /*NHPI w/Pov Status Determined     B17001E;Nat Haw/Oth PI Persons       */
     @26982    f1370599    07.  /*NHPI w/Pov Status Determined     P159E;Nat Haw/Oth PI Persons         */
     @26989    f1441505    07.  /*Some Oth Race w/Pov Status Det   B17001F;Some Other Race Persons      */
     @26996    f1381999    07.  /*Some Oth Race w/Pov Status Det   P159F; Some Other Race Persons       */
     @27003    f1441605    07.  /*Two + Races w/Pov Status Det     B17001G;Two or more Races Pers       */
     @27010    f1382099    07.  /*Two + Races w/Pov Status Det     P159G;Two or more Races Persons      */
     @27017    f1441705    07.  /*Hisp/Latino w/Pov Status Det     B17001I;Hispanic/Latino Persons      */
     @27024    f1370699    07.  /*Hisp/Latino w/Pov Status Det     P159H; Hispanic/Latino Persons       */
     @27031    f1441805    07.  /*White non/Hisp w/Pov Status Det  B17001H;White not/Hisp/Lat Pers      */
     @27038    f1382199    07.  /*White non/Hisp w/Pov Status Det  P159I; White not/Hisp/Lat Pers       */
     @27045    f1441905    07.  /*# Persons Below Poverty Level    Table B17001                         */
     @27052    f0883399    07.  /*# Persons Below Poverty Level    Table DP-3                           */
     @27059    f0883389    07.  /*# Persons Below Poverty Level    Table P117                           */
     @27066    f1442005    07.  /*White Below Poverty Level        B17001A; White Persons               */
     @27073    f0883599    07.  /*White Below Poverty Level        P159A; White Persons                 */
     @27080    f1442105    07.  /*Black/Afr Am Below Poverty Lvl   B17001B; Black/Afr Amer Persons      */
     @27087    f1370799    07.  /*Black/Afr Am Below Poverty Lvl   P159B; Black/Afr Amer Persons        */
     @27094    f1442205    07.  /*AIAN Below Poverty Level         B17001C;Am Ind/Alaska Nat Pers       */
     @27101    f1370899    07.  /*AIAN Below Poverty Level         P159C;Am Ind/Alaska Nat Persons      */
     @27108    f1442305    07.  /*Asian Below Poverty Level        B17001D; Asian Persons               */
     @27115    f1370999    07.  /*Asian Below Poverty Level        P159D; Asian Persons                 */
     @27122    f1442405    07.  /*NHPI Below Poverty Level         B17001E;Nat Haw/Oth PI Persons       */
     @27129    f1371099    07.  /*NHPI Below Poverty Level         P159E;Nat Haw/Oth PI Persons         */
     @27136    f1442505    07.  /*Some Oth Race Below Poverty Lvl  B17001F;Some Other Race Persons      */
     @27143    f1382299    07.  /*Some Oth Race Below Poverty Lvl  P159F; Some Other Race Persons       */
     @27150    f1442605    07.  /*Two + Races Below Poverty Level  B17001G;Two or more Races Pers       */
     @27157    f1382399    07.  /*Two + Races Below Poverty Level  P159G;Two or more Races Persons      */
     @27164    f1442705    07.  /*Hisp/Latino Below Poverty Level  B17001I;Hispanic/Latino Persons      */
     @27171    f1371199    07.  /*Hisp/Latino Below Poverty Level  P159H; Hispanic/Latino Persons       */
     @27178    f1442805    07.  /*White non/Hisp Below Povrty Lvl  B17001H;White not/Hisp/Lat Pers      */
     @27185    f1382499    07.  /*White non/Hisp Below Povrty Lvl  P159I; White not/Hisp/Lat Pers       */
     @27192    f1442905    06.  /*# Pers 65+ Below Poverty Level   Table B17001                         */
     @27198    f0883899    07.  /*# Pers 65+ Below Poverty Level   Table DP-3                           */
     @27205    f0883889    07.  /*# Pers 65+ Below Poverty Level   Table P117                           */
     @27212    f1443005    06.  /*Related Child Below Poverty Lvl  Table B17006; < 18 Yrs               */
     @27218    f0975299    06.  /*Related Child Below Poverty Lvl  Table DP-3; < 18 Yrs                 */
     @27224    f0975289    06.  /*Related Child Below Poverty Lvl  Table P126; < 18 Yrs                 */
     @27230    f1443105    07.  /*Relat Child w/Pov Status Determ  Table B17006; < 18 Yrs               */
     @27237    f0975399    07.  /*Relat Child w/Pov Status Determ  Table DP-3; < 18 Yrs                 */
     @27244    f0975389    07.  /*Relat Child w/Pov Status Determ  Table P126; < 18 Yrs                 */
     @27251    f1443205    04.1 /*% Families Below Poverty Level   (.1) Table B17010                    */
     @27255    f0860599    04.1 /*% Families Below Poverty Level   (.1) Table DP-3                      */
     @27259    f0860589    04.1 /*% Families Below Poverty Level   (.1) Table P123                      */
     @27263    f1443305    06.  /*# Families Below Poverty Level   Table B17010                         */
     @27269    f0884899    07.  /*# Families Below Poverty Level   Table DP-3                           */
     @27276    f0884889    07.  /*# Families Below Poverty Level   Table P123                           */
     @27283    f1443405    07.  /*# Fam w/Poverty Level Reported   Table B17010                         */
     @27290    f0884999    07.  /*# Fam w/Poverty Level Reported   Table DP-3                           */
     @27297    f0884989    07.  /*# Fam w/Poverty Level Reported   Table P123                           */
     @27304    f1443505    04.1 /*% Females Divorced               (.1) Table B12001                    */
     @27308    f0856300    04.1 /*% Females Divorced               (.1) Table P18                       */
     @27312    f0856390    04.1 /*% Females Divorced               (.1) Table P27                       */
     @27316    f0856380    04.1 /*% Females Divorced               (.1)                                 */
     @27320    f1443605    06.  /*# Divorced Females               Table B12001                         */
     @27326    f0874800    07.  /*# Divorced Females               Table P18                            */
     @27333    f0874890    07.  /*# Divorced Females               Table P27                            */
     @27340    f0874880    07.  /*# Divorced Females                                                    */
     @27347    f1408408    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @27354    f1408407    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @27361    f1408406    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @27368    f1408405    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @27375    f1408400    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @27382    f1408495    07.  /*Food Stamp/SNAP Recipients       Estimates                            */
     @27389    f1474809    08.  /*Persons <65 Yrs                  Estimates                            */
     @27397    f1474808    08.  /*Persons <65 Yrs                  Estimates                            */
     @27405    f1415307    08.  /*Persons <65 Yrs                  Estimates                            */
     @27413    f1415306    08.  /*Persons <65 Yrs                  Estimates                            */
     @27421    f1474909    08.  /*Pers <65 with Health Insurance   Estimates                            */
     @27429    f1474908    08.  /*Pers <65 with Health Insurance   Estimates                            */
     @27437    f1415407    08.  /*Pers <65 with Health Insurance   Estimates                            */
     @27445    f1415406    08.  /*Pers <65 with Health Insurance   Estimates                            */
     @27453    f1475009    08.  /*Pers <65 without Health Ins      Estimates                            */
     @27461    f1475008    08.  /*Pers <65 without Health Ins      Estimates                            */
     @27469    f1415507    08.  /*Pers <65 without Health Ins      Estimates                            */
     @27477    f1415506    08.  /*Pers <65 without Health Ins      Estimates                            */
     @27485    f1475109    04.1 /*% <65 without Health Insurance   (.1) Estimates                       */
     @27489    f1475108    04.1 /*% <65 without Health Insurance   (.1) Estimates                       */
     @27493    f1415607    04.1 /*% <65 without Health Insurance   (.1) Estimates                       */
     @27497    f1415606    04.1 /*% <65 without Health Insurance   (.1) Estimates                       */
     @27501    f1475209    08.  /*Males <65 Yrs                    Estimates                            */
     @27509    f1475208    08.  /*Males <65 Yrs                    Estimates                            */
     @27517    f1415707    08.  /*Males <65 Yrs                    Estimates                            */
     @27525    f1415706    08.  /*Males <65 Yrs                    Estimates                            */
     @27533    f1475309    08.  /*Males <65 with Health Insurance  Estimates                            */
     @27541    f1475308    08.  /*Males <65 with Health Insurance  Estimates                            */
     @27549    f1415807    08.  /*Males <65 with Health Insurance  Estimates                            */
     @27557    f1415806    08.  /*Males <65 with Health Insurance  Estimates                            */
     @27565    f1475409    08.  /*Males <65 without Health Ins     Estimates                            */
     @27573    f1475408    08.  /*Males <65 without Health Ins     Estimates                            */
     @27581    f1415907    08.  /*Males <65 without Health Ins     Estimates                            */
     @27589    f1415906    08.  /*Males <65 without Health Ins     Estimates                            */
     @27597    f1475509    04.1 /*% Males <65 without Health Ins   (.1) Estimates                       */
     @27601    f1475508    04.1 /*% Males <65 without Health Ins   (.1) Estimates                       */
     @27605    f1416007    04.1 /*% Males <65 without Health Ins   (.1) Estimates                       */
     @27609    f1416006    04.1 /*% Males <65 without Health Ins   (.1) Estimates                       */
     @27613    f1475609    08.  /*Females <65 Yrs                  Estimates                            */
     @27621    f1475608    08.  /*Females <65 Yrs                  Estimates                            */
     @27629    f1416107    08.  /*Females <65 Yrs                  Estimates                            */
     @27637    f1416106    08.  /*Females <65 Yrs                  Estimates                            */
     @27645    f1475709    08.  /*Females <65 with Health Ins      Estimates                            */
     @27653    f1475708    08.  /*Females <65 with Health Ins      Estimates                            */
     @27661    f1416207    08.  /*Females <65 with Health Ins      Estimates                            */
     @27669    f1416206    08.  /*Females <65 with Health Ins      Estimates                            */
     @27677    f1475809    08.  /*Females <65 without Health Ins   Estimates                            */
     @27685    f1475808    08.  /*Females <65 without Health Ins   Estimates                            */
     @27693    f1416307    08.  /*Females <65 without Health Ins   Estimates                            */
     @27701    f1416306    08.  /*Females <65 without Health Ins   Estimates                            */
     @27709    f1475909    04.1 /*% Females <65 without Hlth Ins   (.1) Estimates                       */
     @27713    f1475908    04.1 /*% Females <65 without Hlth Ins   (.1) Estimates                       */
     @27717    f1416407    04.1 /*% Females <65 without Hlth Ins   (.1) Estimates                       */
     @27721    f1416406    04.1 /*% Females <65 without Hlth Ins   (.1) Estimates                       */
     @27725    f1476009    07.  /*Persons 18-64 Yrs                Estimates                            */
     @27732    f1476008    07.  /*Persons 18-64 Yrs                Estimates                            */
     @27739    f1416507    07.  /*Persons 18-64 Yrs                Estimates                            */
     @27746    f1416506    07.  /*Persons 18-64 Yrs                Estimates                            */
     @27753    f1476109    07.  /*Pers 18-64 with Health Ins       Estimates                            */
     @27760    f1476108    07.  /*Pers 18-64 with Health Ins       Estimates                            */
     @27767    f1416607    07.  /*Pers 18-64 with Health Ins       Estimates                            */
     @27774    f1416606    07.  /*Pers 18-64 with Health Ins       Estimates                            */
     @27781    f1476209    07.  /*Pers 18-64 without Health Ins    Estimates                            */
     @27788    f1476208    07.  /*Pers 18-64 without Health Ins    Estimates                            */
     @27795    f1416707    07.  /*Pers 18-64 without Health Ins    Estimates                            */
     @27802    f1416706    07.  /*Pers 18-64 without Health Ins    Estimates                            */
     @27809    f1476309    04.1 /*% 18-64 without Health Ins       (.1) Estimates                       */
     @27813    f1476308    04.1 /*% 18-64 without Health Ins       (.1) Estimates                       */
     @27817    f1416807    04.1 /*% 18-64 without Health Ins       (.1) Estimates                       */
     @27821    f1416806    04.1 /*% 18-64 without Health Ins       (.1) Estimates                       */
     @27825    f1476409    07.  /*Males 18-64 Yrs                  Estimates                            */
     @27832    f1476408    07.  /*Males 18-64 Yrs                  Estimates                            */
     @27839    f1416907    07.  /*Males 18-64 Yrs                  Estimates                            */
     @27846    f1416906    07.  /*Males 18-64 Yrs                  Estimates                            */
     @27853    f1476509    07.  /*Males 18-64 with Health Ins      Estimates                            */
     @27860    f1476508    07.  /*Males 18-64 with Health Ins      Estimates                            */
     @27867    f1417007    07.  /*Males 18-64 with Health Ins      Estimates                            */
     @27874    f1417006    07.  /*Males 18-64 with Health Ins      Estimates                            */
     @27881    f1476609    07.  /*Males 18-64 without Health Ins   Estimates                            */
     @27888    f1476608    07.  /*Males 18-64 without Health Ins   Estimates                            */
     @27895    f1417107    07.  /*Males 18-64 without Health Ins   Estimates                            */
     @27902    f1417106    07.  /*Males 18-64 without Health Ins   Estimates                            */
     @27909    f1476709    04.1 /*% Males 18-64 without Hlth Ins   (.1) Estimates                       */
     @27913    f1476708    04.1 /*% Males 18-64 without Hlth Ins   (.1) Estimates                       */
     @27917    f1417207    04.1 /*% Males 18-64 without Hlth Ins   (.1) Estimates                       */
     @27921    f1417206    04.1 /*% Males 18-64 without Hlth Ins   (.1) Estimates                       */
     @27925    f1476809    07.  /*Females 18-64 Yrs                Estimates                            */
     @27932    f1476808    07.  /*Females 18-64 Yrs                Estimates                            */
     @27939    f1417307    07.  /*Females 18-64 Yrs                Estimates                            */
     @27946    f1417306    07.  /*Females 18-64 Yrs                Estimates                            */
     @27953    f1476909    07.  /*Females 18-64 with Health Ins    Estimates                            */
     @27960    f1476908    07.  /*Females 18-64 with Health Ins    Estimates                            */
     @27967    f1417407    07.  /*Females 18-64 with Health Ins    Estimates                            */
     @27974    f1417406    07.  /*Females 18-64 with Health Ins    Estimates                            */
     @27981    f1477009    07.  /*Females 18-64 without Hlth Ins   Estimates                            */
     @27988    f1477008    07.  /*Females 18-64 without Hlth Ins   Estimates                            */
     @27995    f1417507    07.  /*Females 18-64 without Hlth Ins   Estimates                            */
     @28002    f1417506    07.  /*Females 18-64 without Hlth Ins   Estimates                            */
     @28009    f1477109    04.1 /*% Fmles 18-64 without Hlth Ins   (.1) Estimates                       */
     @28013    f1477108    04.1 /*% Fmles 18-64 without Hlth Ins   (.1) Estimates                       */
     @28017    f1417607    04.1 /*% Fmles 18-64 without Hlth Ins   (.1) Estimates                       */
     @28021    f1417606    04.1 /*% Fmles 18-64 without Hlth Ins   (.1) Estimates                       */
     @28025    f1477209    07.  /*Persons 40-64 Yrs                Estimates                            */
     @28032    f1477208    07.  /*Persons 40-64 Yrs                Estimates                            */
     @28039    f1417707    07.  /*Persons 40-64 Yrs                Estimates                            */
     @28046    f1417706    07.  /*Persons 40-64 Yrs                Estimates                            */
     @28053    f1477309    07.  /*Pers 40-64 with Health Ins       Estimates                            */
     @28060    f1477308    07.  /*Pers 40-64 with Health Ins       Estimates                            */
     @28067    f1417807    07.  /*Pers 40-64 with Health Ins       Estimates                            */
     @28074    f1417806    07.  /*Pers 40-64 with Health Ins       Estimates                            */
     @28081    f1477409    07.  /*Pers 40-64 without Health Ins    Estimates                            */
     @28088    f1477408    07.  /*Pers 40-64 without Health Ins    Estimates                            */
     @28095    f1417907    07.  /*Pers 40-64 without Health Ins    Estimates                            */
     @28102    f1417906    07.  /*Pers 40-64 without Health Ins    Estimates                            */
     @28109    f1477509    04.1 /*% 40-64 without Health Ins       (.1) Estimates                       */
     @28113    f1477508    04.1 /*% 40-64 without Health Ins       (.1) Estimates                       */
     @28117    f1418007    04.1 /*% 40-64 without Health Ins       (.1) Estimates                       */
     @28121    f1418006    04.1 /*% 40-64 without Health Ins       (.1) Estimates                       */
     @28125    f1477609    07.  /*Males 40-64 Yrs                  Estimates                            */
     @28132    f1477608    07.  /*Males 40-64 Yrs                  Estimates                            */
     @28139    f1418107    07.  /*Males 40-64 Yrs                  Estimates                            */
     @28146    f1418106    07.  /*Males 40-64 Yrs                  Estimates                            */
     @28153    f1477709    07.  /*Males 40-64 with Health Ins      Estimates                            */
     @28160    f1477708    07.  /*Males 40-64 with Health Ins      Estimates                            */
     @28167    f1418207    07.  /*Males 40-64 with Health Ins      Estimates                            */
     @28174    f1418206    07.  /*Males 40-64 with Health Ins      Estimates                            */
     @28181    f1477809    07.  /*Males 40-64 without Health Ins   Estimates                            */
     @28188    f1477808    07.  /*Males 40-64 without Health Ins   Estimates                            */
     @28195    f1418307    07.  /*Males 40-64 without Health Ins   Estimates                            */
     @28202    f1418306    07.  /*Males 40-64 without Health Ins   Estimates                            */
     @28209    f1477909    04.1 /*% Males 40-64 without Hlth Ins   (.1) Estimates                       */
     @28213    f1477908    04.1 /*% Males 40-64 without Hlth Ins   (.1) Estimates                       */
     @28217    f1418407    04.1 /*% Males 40-64 without Hlth Ins   (.1) Estimates                       */
     @28221    f1418406    04.1 /*% Males 40-64 without Hlth Ins   (.1) Estimates                       */
     @28225    f1478009    07.  /*Females 40-64 Yrs                Estimates                            */
     @28232    f1478008    07.  /*Females 40-64 Yrs                Estimates                            */
     @28239    f1418507    07.  /*Females 40-64 Yrs                Estimates                            */
     @28246    f1418506    07.  /*Females 40-64 Yrs                Estimates                            */
     @28253    f1478109    07.  /*Females 40-64 with Health Ins    Estimates                            */
     @28260    f1478108    07.  /*Females 40-64 with Health Ins    Estimates                            */
     @28267    f1418607    07.  /*Females 40-64 with Health Ins    Estimates                            */
     @28274    f1418606    07.  /*Females 40-64 with Health Ins    Estimates                            */
     @28281    f1478209    07.  /*Females 40-64 without Hlth Ins   Estimates                            */
     @28288    f1478208    07.  /*Females 40-64 without Hlth Ins   Estimates                            */
     @28295    f1418707    07.  /*Females 40-64 without Hlth Ins   Estimates                            */
     @28302    f1418706    07.  /*Females 40-64 without Hlth Ins   Estimates                            */
     @28309    f1478309    04.1 /*% Fmles 40-64 without Hlth Ins   (.1) Estimates                       */
     @28313    f1478308    04.1 /*% Fmles 40-64 without Hlth Ins   (.1) Estimates                       */
     @28317    f1418807    04.1 /*% Fmles 40-64 without Hlth Ins   (.1) Estimates                       */
     @28321    f1418806    04.1 /*% Fmles 40-64 without Hlth Ins   (.1) Estimates                       */
     @28325    f1478409    07.  /*Persons <19 Yrs                  Estimates                            */
     @28332    f1478408    07.  /*Persons <19 Yrs                  Estimates                            */
     @28339    f1418907    07.  /*Persons <19 Yrs                  Estimates                            */
     @28346    f1418906    07.  /*Persons <19 Yrs                  Estimates                            */
     @28353    f1478509    07.  /*Pers <19 with Health Insurance   Estimates                            */
     @28360    f1478508    07.  /*Pers <19 with Health Insurance   Estimates                            */
     @28367    f1423307    07.  /*Pers <19 with Health Insurance   Estimates                            */
     @28374    f1423306    07.  /*Pers <19 with Health Insurance   Estimates                            */
     @28381    f1478609    07.  /*Pers <19 without Health Ins      Estimates                            */
     @28388    f1478608    07.  /*Pers <19 without Health Ins      Estimates                            */
     @28395    f1423407    07.  /*Pers <19 without Health Ins      Estimates                            */
     @28402    f1423406    07.  /*Pers <19 without Health Ins      Estimates                            */
     @28409    f1478709    04.1 /*% <19 without Health Insurance   (.1) Estimates                       */
     @28413    f1478708    04.1 /*% <19 without Health Insurance   (.1) Estimates                       */
     @28417    f1423507    04.1 /*% <19 without Health Insurance   (.1) Estimates                       */
     @28421    f1423506    04.1 /*% <19 without Health Insurance   (.1) Estimates                       */
     @28425    f1406000    08.  /*Persons with Health Insurance    Estimates                            */
     @28433    f1406100    08.  /*Person without Health Insurance  Estimates                            */
     @28441    f1406200    04.1 /*% without Health Insurance       (.1) Estimates                       */
     @28445    f1406300    08.  /*Pers <18 with Health Insurance   Estimates                            */
     @28453    f1406400    08.  /*Pers <18 without Hlth Insurance  Estimates                            */
     @28461    f1406500    04.1 /*% <18 without Health Insurance   (.1) Estimates                       */
     @28465    f1443705    06.  /*Hhlds w/Social Security Inc      Table B19055                         */
     @28471    f1389699    07.  /*Hhlds w/Social Security Inc      Table P62                            */
     @28478    f1443805    06.  /*Hhlds w/Suppl Security Inc(SSI)  Table B19056                         */
     @28484    f1389799    07.  /*Hhlds w/Suppl Security Inc(SSI)  Table P63                            */
     @28491    f1443905    06.  /*Hhlds w/Public Assistance Inc    Table B19057                         */
     @28497    f1389899    07.  /*Hhlds w/Public Assistance Inc    Table P64                            */
     @28504    f1244505    07.  /*# Social Security Beneficiaries  December 2005                        */
     @28511    f1244590    07.  /*# Social Security Beneficiaries  December 1990                        */
     @28518    f1433205    06.  /*Social Security Benefic Rate     December 2005; per 100,000           */
     @28524    f1244690    05.1 /*Social Security Benefic Rate     (.1) December 1990                   */
     @28529    f1244705    07.  /*# Suppl Security Inc Recipients  December 2005                        */
     @28536    f1244791    07.  /*# Suppl Security Inc Recipients  December 1991                        */
     @28543    f1444005    08.  /*Persons 25+ Yrs                  Table B15002                         */
     @28551    f0856700    08.  /*Persons 25+ Yrs                  Table DP-2                           */
     @28559    f0856790    08.  /*Persons 25+ Yrs                  Table P58                            */
     @28567    f1444105    07.  /*Persons 25+ Yrs-White            Table C15002A                        */
     @28574    f0856800    08.  /*Persons 25+ Yrs-White            Table P148A                          */
     @28582    f0856890    09.  /*Persons 25+ Yrs-White            Table P58                            */
     @28591    f1444205    07.  /*Persons 25+ Yrs-Black/Afr Am     Table C15002B                        */
     @28598    f1371200    08.  /*Persons 25+ Yrs-Black/Afr Am     Table P148B                          */
     @28606    f1444305    07.  /*Persons 25+ Yrs-AIAN             Table C15002C                        */
     @28613    f1371300    08.  /*Persons 25+ Yrs-AIAN             Table P148C                          */
     @28621    f1444405    07.  /*Persons 25+ Yrs-Asian            Table C15002D                        */
     @28628    f1371400    08.  /*Persons 25+ Yrs-Asian            Table P148D                          */
     @28636    f1444505    07.  /*Persons 25+ Yrs-NHPI             Table C15002E                        */
     @28643    f1371500    08.  /*Persons 25+ Yrs-NHPI             Table P148E                          */
     @28651    f1444605    07.  /*Persons 25+ Yrs-Some Other Race  Table C15002F                        */
     @28658    f1382500    08.  /*Persons 25+ Yrs-Some Other Race  Table P148F                          */
     @28666    f1444705    07.  /*Persons 25+ Yrs-Two + Races      Table C15002G                        */
     @28673    f1382600    08.  /*Persons 25+ Yrs-Two + Races      Table P148G                          */
     @28681    f1444805    07.  /*Persons 25+ Yrs-Hispanic/Latino  Table C15002I                        */
     @28688    f1371600    08.  /*Persons 25+ Yrs-Hispanic/Latino  Table P148H                          */
     @28696    f1444905    07.  /*Persons 25+ Yrs-White non/Hisp   Table C15002H                        */
     @28703    f1382700    08.  /*Persons 25+ Yrs-White non/Hisp   Table P148I                          */
     @28711    f0856990    09.  /*Persons 25+ Yrs-Nonwhite         Table P58                            */
     @28720    f1445005    07.  /*Persons 25+ Yrs w/<HS Diploma    Table B15002                         */
     @28727    f0856400    07.  /*Persons 25+ Yrs w/<9 Yrs School  Table DP-2                           */
     @28734    f0856490    07.  /*Persons 25+ Yrs w/<9 Yrs School  Table P58                            */
     @28741    f1445105    07.  /*Persons 25+ w/HS Dipl or More    Table B15002                         */
     @28748    f0857000    07.  /*Persons 25+ w/HS Dipl or More    Table DP-2                           */
     @28755    f0857090    07.  /*Persons 25+ w/HS Dipl or More    Table P58                            */
     @28762    f1445205    07.  /*Persons 25+ w/4+ Yrs College     Table B15002                         */
     @28769    f0857300    07.  /*Persons 25+ w/4+ Yrs College     Table DP-2                           */
     @28776    f0857390    07.  /*Persons 25+ w/4+ Yrs College     Table P58                            */
     @28783    f1445305    06.  /*Pers 25+ w/<HS Diploma-White     Table C15002A                        */
     @28789    f0856500    07.  /*Pers 25+ w/<9 Yrs School-White   Table P148A                          */
     @28796    f0856590    08.  /*Pers 25+ w/<9 Yrs School-White   Table P58                            */
     @28804    f1445405    06.  /*Pers 25+ w/<HS Diploma-Bl/AA     Table C15002B                        */
     @28810    f1371700    07.  /*Pers 25+ w/<9 Yrs School-Bl/AA   Table P148B                          */
     @28817    f1445505    06.  /*Pers 25+ w/<HS Diploma-AIAN      Table C15002C                        */
     @28823    f1371800    07.  /*Pers 25+ w/<9 Yrs School-AIAN    Table P148C                          */
     @28830    f1445605    06.  /*Pers 25+ w/<HS Diploma-Asian     Table C15002D                        */
     @28836    f1371900    07.  /*Pers 25+ w/<9 Yrs School-Asian   Table P148D                          */
     @28843    f1445705    06.  /*Pers 25+ w/<HS Diploma-NHPI      Table C15002E                        */
     @28849    f1372000    07.  /*Pers 25+ w/<9 Yrs School-NHPI    Table P148E                          */
     @28856    f1445805    06.  /*Pers 25+ w/<HS Diploma-Oth Race  Table C15002F                        */
     @28862    f1382800    07.  /*Pers 25+ w/<9 Yrs School-Oth Rc  Table P148F                          */
     @28869    f1445905    06.  /*Pers 25+ w/<HS Diploma-2+ Races  Table C15002G                        */
     @28875    f1382900    07.  /*Pers 25+ w/<9 Yrs School-2+ Rce  Table P148G                          */
     @28882    f1446005    07.  /*Pers 25+ w/<HS Diploma-Hisp/Lat  Table C15002I                        */
     @28889    f1372100    07.  /*Pers 25+ w/<9 Yrs School-Hisp/L  Table P148H                          */
     @28896    f1446105    06.  /*Pers 25+ w/<HS Dipl-Wh non/Hisp  Table C15002H                        */
     @28902    f1383000    07.  /*Pers 25+ w/<9 Yrs Sch-Wh n/Hisp  Table P148I                          */
     @28909    f0856690    08.  /*Pers 25+ w/<9 Yrs School-Nonwh   Table P58                            */
     @28917    f1446205    07.  /*Pers 25+ w/HS Dipl or more-Wh    Table C15002A                        */
     @28924    f0857100    07.  /*Pers 25+ w/HS Dipl or more-Wh    Table P148A                          */
     @28931    f0857190    08.  /*Pers 25+ w/HS Dipl or more-Wh    Table P58                            */
     @28939    f1446305    06.  /*Pers 25+ w/HS Dipl/more-Bl/AA    Table C15002B                        */
     @28945    f1372200    07.  /*Pers 25+ w/HS Dipl/more-Bl/AA    Table P148B                          */
     @28952    f1446405    06.  /*Pers 25+ w/HS Dipl or more-AIAN  Table C15002C                        */
     @28958    f1372300    07.  /*Pers 25+ w/HS Dipl or more-AIAN  Table P148C                          */
     @28965    f1446505    06.  /*Pers 25+ w/HS Dipl or more-Asia  Table C15002D                        */
     @28971    f1372400    07.  /*Pers 25+ w/HS Dipl or more-Asia  Table P148D                          */
     @28978    f1446605    06.  /*Pers 25+ w/HS Dipl or more-NHPI  Table C15002E                        */
     @28984    f1372500    07.  /*Pers 25+ w/HS Dipl or more-NHPI  Table P148E                          */
     @28991    f1446705    06.  /*Pers 25+ w/HS Dipl/more-Oth Rce  Table C15002F                        */
     @28997    f1383100    07.  /*Pers 25+ w/HS Dipl/more-Oth Rce  Table P148F                          */
     @29004    f1446805    06.  /*Pers 25+ w/HS Dipl/more-2+ Race  Table C15002G                        */
     @29010    f1383200    07.  /*Pers 25+ w/HS Dipl/more-2+ Race  Table P148G                          */
     @29017    f1446905    07.  /*Pers 25+ w/HS Dipl/more-Hisp/L   Table C15002I                        */
     @29024    f1372600    07.  /*Pers 25+ w/HS Dipl/more-Hisp/L   Table P148H                          */
     @29031    f1447005    07.  /*Per 25+ w/HS Dipl/more Wh n/His  Table C15002H                        */
     @29038    f1383300    07.  /*Per 25+ w/HS Dipl/more Wh n/His  Table P148I                          */
     @29045    f0857290    08.  /*Per 25+ w/HS Dipl or more-Nonwh  Table P58                            */
     @29053    f1447105    07.  /*Pers 25+ w/4+ Yrs College-White  Table C15002A                        */
     @29060    f0857400    07.  /*Pers 25+ w/4+ Yrs College-White  Table P148A                          */
     @29067    f0857490    07.  /*Pers 25+ w/4+ Yrs College-White  Table P58                            */
     @29074    f1447205    06.  /*Pers 25+ w/4+ Yrs College-Bl/AA  Table C15002B                        */
     @29080    f1372700    07.  /*Pers 25+ w/4+ Yrs College-Bl/AA  Table P148B                          */
     @29087    f1447305    06.  /*Pers 25+ w/4+ Yrs College-AIAN   Table C15002C                        */
     @29093    f1372800    07.  /*Pers 25+ w/4+ Yrs College-AIAN   Table P148C                          */
     @29100    f1447405    06.  /*Pers 25+ w/4+ Yrs College-Asia   Table C15002D                        */
     @29106    f1372900    07.  /*Pers 25+ w/4+ Yrs College-Asia   Table P148D                          */
     @29113    f1447505    06.  /*Pers 25+ w/4+ Yrs College-NHPI   Table C15002E                        */
     @29119    f1373000    07.  /*Pers 25+ w/4+ Yrs College-NHPI   Table P148E                          */
     @29126    f1447605    06.  /*Per 25+ w/4+ Yrs College-Oth Rc  Table C15002F                        */
     @29132    f1383400    07.  /*Per 25+ w/4+ Yrs College-Oth Rc  Table P148F                          */
     @29139    f1447705    06.  /*Per 25+ w/4+ Yrs College-2+ Rce  Table C15002G                        */
     @29145    f1383500    07.  /*Per 25+ w/4+ Yrs College-2+ Rce  Table P148G                          */
     @29152    f1447805    06.  /*Per 25+ w/4+ Yrs College-Hisp/L  Table C15002I                        */
     @29158    f1373100    07.  /*Per 25+ w/4+ Yrs College-Hisp/L  Table P148H                          */
     @29165    f1447905    07.  /*Per 25+ w/4+ Yr Collge-Wh n/His  Table C15002H                        */
     @29172    f1383600    07.  /*Per 25+ w/4+ Yr Collge-Wh n/His  Table P148I                          */
     @29179    f0857590    07.  /*Pers 25+ w/4+ Yrs College-Nonwh  Table P58                            */
     @29186    f1448005    04.1 /*% Persons 25+ w/<HS Diploma      (.1) Table B15002                    */
     @29190    f0857600    04.1 /*% Persons 25+ w/<9 Yrs Sch       (.1) Table DP-2                      */
     @29194    f0857690    04.1 /*% Persons 25+ w/<9 Yrs Sch       (.1) Table P58                       */
     @29198    f1448105    04.1 /*% Persons 25+ w/HS Dipl or more  (.1) Table B15002                    */
     @29202    f0857900    04.1 /*% Persons 25+ w/HS Dipl or more  (.1) Table DP-2                      */
     @29206    f0857990    04.1 /*% Persons 25+ w/HS Dipl or more  (.1) Table P58                       */
     @29210    f1448205    04.1 /*% Persons 25+ w/4+ Yrs College   (.1) Table B15002                    */
     @29214    f0858200    04.1 /*% Persons 25+ w/4+ Yrs College   (.1) Table DP-2                      */
     @29218    f0858290    04.1 /*% Persons 25+ w/4+ Yrs College   (.1) Table P58                       */
     @29222    f1448305    04.1 /*% Pers 25+ w/<HS Diploma-White   (.1) Table C15002A                   */
     @29226    f0857700    04.1 /*% Pers 25+ w/<9 Yrs Sch-White    (.1) Table P148A                     */
     @29230    f0857790    05.1 /*% Pers 25+ w/<9 Yrs Sch-White    (.1) Table P58                       */
     @29235    f1448405    04.1 /*% Pers 25+ w/<HS Diploma-Bl/AA   (.1) Table C15002B                   */
     @29239    f1373200    04.1 /*% Pers 25+ w/<9 Yrs Sch-Bl/AA    (.1) Table P148B                     */
     @29243    f1448505    04.1 /*% Pers 25+ w/<HS Diploma-AIAN    (.1) Table C15002C                   */
     @29247    f1373300    04.1 /*% Pers 25+ w/<9 Yrs Sch-AIAN     (.1) Table P148C                     */
     @29251    f1448605    04.1 /*% Pers 25+ w/<HS Diploma-Asian   (.1) Table C15002D                   */
     @29255    f1373400    04.1 /*% Pers 25+ w/<9 Yrs Sch-Asian    (.1) Table P148D                     */
     @29259    f1448705    04.1 /*% Pers 25+ w/<HS Diploma-NHPI    (.1) Table C15002E                   */
     @29263    f1373500    04.1 /*% Pers 25+ w/<9 Yrs Sch-NHPI     (.1) Table P148E                     */
     @29267    f1448805    04.1 /*% Pers 25+ w/<HS Dipl-Oth Race   (.1) Table C15002F                   */
     @29271    f1383700    04.1 /*% Per 25+ w/<9 Yrs Sch-Oth Race  (.1) Table P148F                     */
     @29275    f1448905    04.1 /*% Pers 25+ w/<HS Dipl-2+ Races   (.1) Table C15002G                   */
     @29279    f1383800    04.1 /*% Per 25+ w/<9 Yrs Sch-2+ Races  (.1) Table P148G                     */
     @29283    f1449005    04.1 /*% Pers 25+ w/<HS Dipl-Hisp/Lat   (.1) Table C15002I                   */
     @29287    f1373600    04.1 /*% Per 25+ w/<9 Yrs Sch-Hisp/Lat  (.1) Table P148H                     */
     @29291    f1449105    04.1 /*% Pers 25+ w/<HS Dipl-Wh n/Hisp  (.1) Table C15002H                   */
     @29295    f1383900    04.1 /*%Per 25+ w/<9 Yrs Sch-Wh n/Hisp  (.1) Table P148I                     */
     @29299    f0857890    05.1 /*% Pers 25+ w/<9 Yrs Sch-Nonwh    (.1) Table P58                       */
     @29304    f1449205    04.1 /*% Pers 25+ w/HS Dipl or more-Wh  (.1) Table C15002A                   */
     @29308    f0858000    04.1 /*% Pers 25+ w/HS Dipl or more-Wh  (.1) Table P148A                     */
     @29312    f0858090    05.1 /*% Pers 25+ w/HS Dipl or more-Wh  (.1) Table P58                       */
     @29317    f1449305    04.1 /*%Per 25+ w/HS Dip or more-Bl/AA  (.1) Table C15002B                   */
     @29321    f1373700    04.1 /*%Per 25+ w/HS Dip or more-Bl/AA  (.1) Table P148B                     */
     @29325    f1449405    04.1 /*%Per 25+ w/HS Dipl or more-AIAN  (.1) Table C15002C                   */
     @29329    f1373800    04.1 /*%Per 25+ w/HS Dipl or more-AIAN  (.1) Table P148C                     */
     @29333    f1449505    04.1 /*%Per 25+ w/HS Dip or more-Asian  (.1) Table C15002D                   */
     @29337    f1373900    04.1 /*%Per 25+ w/HS Dip or more-Asian  (.1) Table P148D                     */
     @29341    f1449605    04.1 /*%Per 25+ w/HS Dipl or more-NHPI  (.1) Table C15002E                   */
     @29345    f1374000    04.1 /*%Per 25+ w/HS Dipl or more-NHPI  (.1) Table P148E                     */
     @29349    f1449705    04.1 /*% Pers 25+ w/HS Dipl+ -Oth Race  (.1) Table C15002F                   */
     @29353    f1384000    04.1 /*% Pers 25+ w/HS Dipl+ -Oth Race  (.1) Table P148F                     */
     @29357    f1449805    04.1 /*% Pers 25+ w/HS Dipl+ -2+ Races  (.1) Table C15002G                   */
     @29361    f1384100    04.1 /*% Pers 25+ w/HS Dipl+ -2+ Races  (.1) Table P148G                     */
     @29365    f1449905    04.1 /*% Pers 25+ w/HS Dipl+ -Hisp/Lat  (.1) Table C15002I                   */
     @29369    f1374100    04.1 /*% Pers 25+ w/HS Dipl+ -Hisp/Lat  (.1) Table P148H                     */
     @29373    f1450005    04.1 /*% Pers 25+ w/HS Dipl+ -Wh n/His  (.1) Table C15002H                   */
     @29377    f1384200    04.1 /*% Pers 25+ w/HS Dipl+ -Wh n/His  (.1) Table P148I                     */
     @29381    f0858190    05.1 /*% Pers 25+ w/HS Dipl or more-NW  (.1) Table P58                       */
     @29386    f1450105    04.1 /*% Pers 25+ w/4+ Yrs Coll-White   (.1) Table C15002A                   */
     @29390    f0858300    04.1 /*% Pers 25+ w/4+ Yrs Coll-White   (.1) Table P148A                     */
     @29394    f0858390    05.1 /*% Pers 25+ w/4+ Yrs Coll-White   (.1) Table P58                       */
     @29399    f1450205    04.1 /*% Pers 25+ w/4+ Yrs Coll-Bl/AA   (.1) Table C15002B                   */
     @29403    f1374200    04.1 /*% Pers 25+ w/4+ Yrs Coll-Bl/AA   (.1) Table P148B                     */
     @29407    f1450305    04.1 /*% Pers 25+ w/4+ Yrs Coll-AIAN    (.1) Table C15002C                   */
     @29411    f1374300    04.1 /*% Pers 25+ w/4+ Yrs Coll-AIAN    (.1) Table P148C                     */
     @29415    f1450405    04.1 /*% Pers 25+ w/4+ Yrs Coll-Asian   (.1) Table C15002D                   */
     @29419    f1374400    04.1 /*% Pers 25+ w/4+ Yrs Coll-Asian   (.1) Table P148D                     */
     @29423    f1450505    04.1 /*% Pers 25+ w/4+ Yrs Coll-NHPI    (.1) Table C15002E                   */
     @29427    f1374500    04.1 /*% Pers 25+ w/4+ Yrs Coll-NHPI    (.1) Table P148E                     */
     @29431    f1450605    04.1 /*%Per 25+ w/4+ Yrs Coll-Oth Race  (.1) Table C15002F                   */
     @29435    f1384300    04.1 /*%Per 25+ w/4+ Yrs Coll-Oth Race  (.1) Table P148F                     */
     @29439    f1450705    04.1 /*%Per 25+ w/4+ Yrs Coll-2+ Races  (.1) Table C15002G                   */
     @29443    f1384400    04.1 /*%Per 25+ w/4+ Yrs Coll-2+ Races  (.1) Table P148G                     */
     @29447    f1450805    04.1 /*%Per 25+ w/4+ Yrs Coll-Hisp/Lat  (.1) Table C15002I                   */
     @29451    f1374600    04.1 /*%Per 25+ w/4+ Yrs Coll-Hisp/Lat  (.1) Table P148H                     */
     @29455    f1450905    04.1 /*%Per 25+ w/4+ Yrs Coll-WH n/His  (.1) Table C15002H                   */
     @29459    f1384500    04.1 /*%Per 25+ w/4+ Yrs Coll-WH n/His  (.1) Table P148I                     */
     @29463    f0858490    05.1 /*% Pers 25+ w/4+ Yrs Coll-Nonwh   (.1) Table P58                       */
     @29468    f1451005    07.  /*Total Civilian Labor Force       16+ Yrs.; Table B23001               */
     @29475    f1387200    07.  /*Total Civilian Labor Force       16+ Yrs.; Table P43                  */
     @29482    f1451105    07.  /*Employed in Civil Labor Force    16+ Yrs.; Table B23001               */
     @29489    f1374700    07.  /*Employed in Civil Labor Force    16+ Yrs.; Table P43                  */
     @29496    f1451205    07.  /*Unemployed in Civil Labor Force  16+ Yrs.; Table B23001               */
     @29503    f0878400    07.  /*Unemployed in Civil Labor Force  16+ Yrs.; Table P43                  */
     @29510    f0878490    07.  /*Unemployed in Civil Labor Force  16+ Yrs.; Table P70                  */
     @29517    f1451305    07.  /*Females in Civilian Labor Force  16+ Yrs.; Table B23001               */
     @29524    f1387300    07.  /*Females in Civilian Labor Force  16+ Yrs.; Table P43                  */
     @29531    f1451405    07.  /*Employed Fem in Civ Labor Force  16+ Yrs.; Table B23001               */
     @29538    f1374800    07.  /*Employed Fem in Civ Labor Force  16+ Yrs.; Table P43                  */
     @29545    f1451505    07.  /*Unemplyd Fem in Civ Labor Force  16+ Yrs.; Table B23001               */
     @29552    f1374900    07.  /*Unemplyd Fem in Civ Labor Force  16+ Yrs.; Table P43                  */
     @29559    f1451605    07.  /*White Civilian Labor Force       16+ Yrs.; Table C23002A              */
     @29566    f1375000    07.  /*White Civilian Labor Force       16+ Yrs.; Table P150A                */
     @29573    f1451705    07.  /*Wh Employed Civilian Lab Force   16+ Yrs.; Table C23002A              */
     @29580    f1375100    07.  /*Wh Employed Civilian Lab Force   16+ Yrs.; Table P150A                */
     @29587    f1451805    07.  /*Wh Unemplyd Civilian Lab Force   16+ Yrs.; Table C23002A              */
     @29594    f1375200    07.  /*Wh Unemplyd Civilian Lab Force   16+ Yrs.; Table P150A                */
     @29601    f1451905    07.  /*Wh Female Civilian Labor Force   16+ Yrs.; Table C23002A              */
     @29608    f1375300    07.  /*Wh Female Civilian Labor Force   16+ Yrs.; Table P150A                */
     @29615    f1452005    07.  /*Wh Employed Fmle Civ Lab Force   16+ Yrs.; Table C23002A              */
     @29622    f1375400    07.  /*Wh Employed Fmle Civ Lab Force   16+ Yrs.; Table P150A                */
     @29629    f1452105    07.  /*Wh Unemplyd Fmle Civ Lab Force   16+ Yrs.; Table C23002A              */
     @29636    f1375500    07.  /*Wh Unemplyd Fmle Civ Lab Force   16+ Yrs.; Table P150A                */
     @29643    f1452205    06.  /*Black/AA Civilian Labor Force    16+ Yrs.; Table C23002B              */
     @29649    f1375600    07.  /*Black/AA Civilian Labor Force    16+ Yrs.; Table P150B                */
     @29656    f1452305    06.  /*Bl/AA Employed Civil Lab Force   16+ Yrs.; Table C23002B              */
     @29662    f1375700    07.  /*Bl/AA Employed Civil Lab Force   16+ Yrs.; Table P150B                */
     @29669    f1452405    06.  /*Bl/AA Unemplyd Civil Lab Force   16+ Yrs.; Table C23002B              */
     @29675    f1375800    07.  /*Bl/AA Unemplyd Civil Lab Force   16+ Yrs.; Table P150B                */
     @29682    f1452505    06.  /*Bl/AA Fmle Civilian Lab Force    16+ Yrs.; Table C23002B              */
     @29688    f1375900    07.  /*Bl/AA Fmle Civilian Lab Force    16+ Yrs.; Table P150B                */
     @29695    f1452605    06.  /*Bl/AA Emplyd Fmle Civ Lab Force  16+ Yrs.; Table C23002B              */
     @29701    f1376000    07.  /*Bl/AA Emplyd Fmle Civ Lab Force  16+ Yrs.; Table P150B                */
     @29708    f1452705    06.  /*Bl/AA Unmplyd Fmle Civ Lab Frce  16+ Yrs.; Table C23002B              */
     @29714    f1376100    07.  /*Bl/AA Unmplyd Fmle Civ Lab Frce  16+ Yrs.; Table P150B                */
     @29721    f1452805    06.  /*AIAN Civilian Labor Force        16+ Yrs.; Table C23002C              */
     @29727    f1376200    07.  /*AIAN Civilian Labor Force        16+ Yrs.; Table P150C                */
     @29734    f1452905    06.  /*AIAN Employed Civil Labor Force  16+ Yrs.; Table C23002C              */
     @29740    f1376300    07.  /*AIAN Employed Civil Labor Force  16+ Yrs.; Table P150C                */
     @29747    f1453005    06.  /*AIAN Unemplyd Civil Labor Force  16+ Yrs.; Table C23002C              */
     @29753    f1376400    07.  /*AIAN Unemplyd Civil Labor Force  16+ Yrs.; Table P150C                */
     @29760    f1453105    06.  /*AIAN Fmle Civilian Labor Force   16+ Yrs.; Table C23002C              */
     @29766    f1376500    07.  /*AIAN Fmle Civilian Labor Force   16+ Yrs.; Table P150C                */
     @29773    f1453205    06.  /*AIAN Employd Fmle Civ Lab Force  16+ Yrs.; Table C23002C              */
     @29779    f1376600    07.  /*AIAN Employd Fmle Civ Lab Force  16+ Yrs.; Table P150C                */
     @29786    f1453305    06.  /*AIAN Unmplyd Fmle Civ Lab Force  16+ Yrs.; Table C23002C              */
     @29792    f1376700    07.  /*AIAN Unmplyd Fmle Civ Lab Force  16+ Yrs.; Table P150C                */
     @29799    f1453405    06.  /*Asian Civilian Labor Force       16+ Yrs.; Table C23002D              */
     @29805    f1376800    07.  /*Asian Civilian Labor Force       16+ Yrs.; Table P150D                */
     @29812    f1453505    06.  /*Asian Employed Civil Lab Force   16+ Yrs.; Table C23002D              */
     @29818    f1376900    07.  /*Asian Employed Civil Lab Force   16+ Yrs.; Table P150D                */
     @29825    f1453605    06.  /*Asian Unemplyd Civil Lab Force   16+ Yrs.; Table C23002D              */
     @29831    f1377000    07.  /*Asian Unemplyd Civil Lab Force   16+ Yrs.; Table P150D                */
     @29838    f1453705    06.  /*Asian Fmle Civilian Lab Force    16+ Yrs.; Table C23002D              */
     @29844    f1377100    07.  /*Asian Fmle Civilian Lab Force    16+ Yrs.; Table P150D                */
     @29851    f1453805    06.  /*Asian Emplyd Fmle Civ Lab Force  16+ Yrs.; Table C23002D              */
     @29857    f1377200    07.  /*Asian Emplyd Fmle Civ Lab Force  16+ Yrs.; Table P150D                */
     @29864    f1453905    06.  /*Asian Unmplyd Fmle Civ Lab Frce  16+ Yrs.; Table C23002D              */
     @29870    f1377300    07.  /*Asian Unmplyd Fmle Civ Lab Frce  16+ Yrs.; Table P150D                */
     @29877    f1454005    06.  /*NHPI Civilian Labor Force        16+ Yrs.; Table C23002E              */
     @29883    f1377400    07.  /*NHPI Civilian Labor Force        16+ Yrs.; Table P150E                */
     @29890    f1454105    06.  /*NHPI Employed Civil Labor Force  16+ Yrs.; Table C23002E              */
     @29896    f1377500    07.  /*NHPI Employed Civil Labor Force  16+ Yrs.; Table P150E                */
     @29903    f1454205    06.  /*NHPI Unemplyd Civil Labor Force  16+ Yrs.; Table C23002E              */
     @29909    f1377600    07.  /*NHPI Unemplyd Civil Labor Force  16+ Yrs.; Table P150E                */
     @29916    f1454305    06.  /*NHPI Fmle Civilian Labor Force   16+ Yrs.; Table C23002E              */
     @29922    f1377700    07.  /*NHPI Fmle Civilian Labor Force   16+ Yrs.; Table P150E                */
     @29929    f1454405    06.  /*NHPI Employd Fmle Civ Lab Force  16+ Yrs.; Table C23002E              */
     @29935    f1377800    07.  /*NHPI Employd Fmle Civ Lab Force  16+ Yrs.; Table P150E                */
     @29942    f1454505    06.  /*NHPI Unmplyd Fmle Civ Lab Force  16+ Yrs.; Table C23002E              */
     @29948    f1377900    07.  /*NHPI Unmplyd Fmle Civ Lab Force  16+ Yrs.; Table P150E                */
     @29955    f1454605    07.  /*Other Race Civilian Lab Force    16+ Yrs.; Table C23002F              */
     @29962    f1384600    07.  /*Other Race Civilian Lab Force    16+ Yrs.; Table P150F                */
     @29969    f1454705    07.  /*Oth Race Emplyd Civil Lab Force  16+ Yrs.; Table C23002F              */
     @29976    f1384700    07.  /*Oth Race Emplyd Civil Lab Force  16+ Yrs.; Table P150F                */
     @29983    f1454805    07.  /*Oth Race Unmplyd Civil Lab Frce  16+ Yrs.; Table C23002F              */
     @29990    f1384800    07.  /*Oth Race Unmplyd Civil Lab Frce  16+ Yrs.; Table P150F                */
     @29997    f1454905    07.  /*Oth Race Fmle Civil Labor Force  16+ Yrs.; Table C23002F              */
     @30004    f1384900    07.  /*Oth Race Fmle Civil Labor Force  16+ Yrs.; Table P150F                */
     @30011    f1455005    07.  /*Oth Rc Emplyd Fmle Civ Lab Frce  16+ Yrs.; Table C23002F              */
     @30018    f1385000    07.  /*Oth Rc Emplyd Fmle Civ Lab Frce  16+ Yrs.; Table P150F                */
     @30025    f1455105    07.  /*Oth Rc Unmplyd Fml Civ Lab Frce  16+ Yrs.; Table C23002F              */
     @30032    f1385100    07.  /*Oth Rc Unmplyd Fml Civ Lab Frce  16+ Yrs.; Table P150F                */
     @30039    f1455205    06.  /*2+ Races Civilian Labor Force    16+ Yrs.; Table C23002G              */
     @30045    f1385200    07.  /*2+ Races Civilian Labor Force    16+ Yrs.; Table P150G                */
     @30052    f1455305    06.  /*2+ Race Employd Civil Lab Force  16+ Yrs.; Table C23002G              */
     @30058    f1385300    07.  /*2+ Race Employd Civil Lab Force  16+ Yrs.; Table P150G                */
     @30065    f1455405    06.  /*2+ Race Unemplyd Civil Lab Frce  16+ Yrs.; Table C23002G              */
     @30071    f1385400    07.  /*2+ Race Unemplyd Civil Lab Frce  16+ Yrs.; Table P150G                */
     @30078    f1455505    06.  /*2+ Race Fmle Civilian Lab Force  16+ Yrs.; Table C23002G              */
     @30084    f1385500    07.  /*2+ Race Fmle Civilian Lab Force  16+ Yrs.; Table P150G                */
     @30091    f1455605    06.  /*2+ Race Emplyd Fml Civ Lab Frce  16+ Yrs.; Table C23002G              */
     @30097    f1385600    07.  /*2+ Race Emplyd Fml Civ Lab Frce  16+ Yrs.; Table P150G                */
     @30104    f1455705    06.  /*2+ Race Unmplyd Fml Civ Lab Frc  16+ Yrs.; Table C23002G              */
     @30110    f1385700    07.  /*2+ Race Unmplyd Fml Civ Lab Frc  16+ Yrs.; Table P150G                */
     @30117    f1455805    07.  /*Hisp/Latino Civil Labor Force    16+ Yrs.; Table C23002I              */
     @30124    f1378000    07.  /*Hisp/Latino Civil Labor Force    16+ Yrs.; Table P150H                */
     @30131    f1455905    07.  /*Hisp Employed Civil Labor Force  16+ Yrs.; Table C23002I              */
     @30138    f1378100    07.  /*Hisp Employed Civil Labor Force  16+ Yrs.; Table P150H                */
     @30145    f1456005    07.  /*Hisp Unemplyd Civil Labor Force  16+ Yrs.; Table C23002I              */
     @30152    f1378200    07.  /*Hisp Unemplyd Civil Labor Force  16+ Yrs.; Table P150H                */
     @30159    f1456105    07.  /*Hisp/Lat Fmle Civil Labor Force  16+ Yrs.; Table C23002I              */
     @30166    f1378300    07.  /*Hisp/Lat Fmle Civil Labor Force  16+ Yrs.; Table P150H                */
     @30173    f1456205    07.  /*Hisp Employd Fmle Civ Lab Force  16+ Yrs.; Table C23002I              */
     @30180    f1378400    07.  /*Hisp Employd Fmle Civ Lab Force  16+ Yrs.; Table P150H                */
     @30187    f1456305    07.  /*Hisp Unmplyd Fmle Civ Lab Force  16+ Yrs.; Table C23002I              */
     @30194    f1378500    07.  /*Hisp Unmplyd Fmle Civ Lab Force  16+ Yrs.; Table P150H                */
     @30201    f1456405    07.  /*Wh non/Hisp Civil Labor Force    16+ Yrs.; Table C23002H              */
     @30208    f1385800    07.  /*Wh non/Hisp Civil Labor Force    16+ Yrs.; Table P150I                */
     @30215    f1456505    07.  /*Wh n/His Employed Civ Lab Force  16+ Yrs.; Table C23002H              */
     @30222    f1385900    07.  /*Wh n/His Employed Civ Lab Force  16+ Yrs.; Table P150I                */
     @30229    f1456605    07.  /*Wh n/His Unemplyd Civ Lab Force  16+ Yrs.; Table C23002H              */
     @30236    f1386000    07.  /*Wh n/His Unemplyd Civ Lab Force  16+ Yrs.; Table P150I                */
     @30243    f1456705    07.  /*Wh n/Hisp Fmle Civil Lab Force   16+ Yrs.; Table C23002H              */
     @30250    f1386100    07.  /*Wh n/Hisp Fmle Civil Lab Force   16+ Yrs.; Table P150I                */
     @30257    f1456805    07.  /*Wh n/His Emplyd Fml Civ Lab Frc  16+ Yrs.; Table C23002H              */
     @30264    f1386200    07.  /*Wh n/His Emplyd Fml Civ Lab Frc  16+ Yrs.; Table P150I                */
     @30271    f1456905    07.  /*Wh n/His Unmplyd Fml Civ Lab Fr  16+ Yrs.; Table C23002H              */
     @30278    f1386300    07.  /*Wh n/His Unmplyd Fml Civ Lab Fr  16+ Yrs.; Table P150I                */
     @30285    f1184690    08.  /*# 16+ White Males Unemployed     Table P71                            */
     @30293    f1184790    08.  /*# 16+ White Females Unemployed   Table P71                            */
     @30301    f1184890    08.  /*# 16+ Black Males Unemployed     Table P71                            */
     @30309    f1184990    08.  /*# 16+ Black Females Unemployed   Table P71                            */
     @30317    f1185090    08.  /*# 16+ Nonwhite Males Unemployed  Table P71; Includes Black            */
     @30325    f1185190    08.  /*# 16+ Nonwhite Females Unemplyd  Table P71; Includes Black            */
     @30333    f1185290    08.  /*# 16+ Hisp Orig Males Unemployd  Table P72                            */
     @30341    f1185390    08.  /*# 16+ Hisp Orig Female Unemplyd  Table P72                            */
     @30349    f1378699    07.  /*# 16+ Pop Did Not Work in '99    Table P47                            */
     @30356    f0878899    07.  /*# 16+ Males Did Not Work in '99  Table P47                            */
     @30363    f0878889    07.  /*# 16+ Males Did Not Work in '89  Table P75                            */
     @30370    f0878999    07.  /*#16+ Fmales Did Not Work in '99  Table P47                            */
     @30377    f0878989    07.  /*#16+ Fmales Did Not Work in '89  Table P75                            */
     @30384    f1457005    07.  /*# Pop Did Not Work 16-64         Table B23022                         */
     @30391    f1457105    04.1 /*% Pop Did Not Work 16-64         (.1) Table B23022                    */
     @30395    f1378799    04.1 /*% 16+ Pop Did Not Work in '99    (.1) Table P47                       */
     @30399    f1378899    04.1 /*% 16+ Males Did Not Work in '99  (.1) Table P47                       */
     @30403    f1378999    04.1 /*%16+ Fmales Did Not Work in '99  (.1) Table P47                       */
     @30407    f1388599    07.  /*White Males Did Not Work in '99  16+ Yrs.; Table PCT71A               */
     @30414    f1388699    07.  /*White Fmles Did Not Work in '99  16+ Yrs.; Table PCT71A               */
     @30421    f1388799    07.  /*BL/AA Males Did Not Work in '99  16+ Yrs.; Table PCT71B               */
     @30428    f1388899    07.  /*BL/AA Fmals Did Not Work in '99  16+ Yrs.; Table PCT71B               */
     @30435    f1379099    07.  /*AIAN Males Did Not Work in '99   16+ Yrs.; Table PCT71C               */
     @30442    f1379199    07.  /*AIAN Fmles Did Not Work in '99   16+ Yrs.; Table PCT71C               */
     @30449    f1379299    07.  /*Asian Males Did Not Work in '99  16+ Yrs.; Table PCT71D               */
     @30456    f1379399    07.  /*Asian Fmles Did Not Work in '99  16+ Yrs.; Table PCT71D               */
     @30463    f1379499    07.  /*NHPI Males Did Not Work in '99   16+ Yrs.; Table PCT71E               */
     @30470    f1379599    07.  /*NHPI Fmles Did Not Work in '99   16+ Yrs.; Table PCT71E               */
     @30477    f1386499    07.  /*Oth Rc Male Did Not Work in '99  16+ Yrs.; Table PCT71F               */
     @30484    f1386599    07.  /*Oth Rc Fmle Did Not Work in '99  16+ Yrs.; Table PCT71F               */
     @30491    f1386699    07.  /*2+ Rc Males Did Not Work in '99  16+ Yrs.; Table PCT71G               */
     @30498    f1386799    07.  /*2+ Rc Fmles Did Not Work in '99  16+ Yrs.; Table PCT71G               */
     @30505    f1388999    07.  /*Hisp Males Did Not Work in '99   16+ Yrs.; Table PCT71H               */
     @30512    f1389099    07.  /*Hisp Fmles Did Not Work in '99   16+ Yrs.; Table PCT71H               */
     @30519    f1386899    07.  /*WH n/His Male Did Not Wrk in'99  16+ Yrs.; Table PCT71I               */
     @30526    f1386999    07.  /*WH n/His Fmle Did Not Wrk in'99  16+ Yrs.; Table PCT71I               */
     @30533    f1457205    07.  /*# Workers 16 and Over            Table B24080                         */
     @30540    f0875800    07.  /*# Workers 16 and Over            Table DP-3                           */
     @30547    f0875890    07.  /*# Workers 16 and Over            Table P79                            */
     @30554    f1457305    07.  /*# 16+ Workers Priv/Salaried      Table B24080                         */
     @30561    f0880200    07.  /*# 16+ Workers Priv/Salaried      Table DP-3                           */
     @30568    f0880290    07.  /*# 16+ Workers Priv/Salaried      Table P79                            */
     @30575    f1457405    06.  /*# 16+ Workers Govt.              Table B24080                         */
     @30581    f1366900    07.  /*# 16+ Workers Govt.              Table DP-3                           */
     @30588    f1457505    06.  /*# 16+ Workers Federal Govt.      Table B24080                         */
     @30594    f0880300    07.  /*# 16+ Workers Federal Govt.      Table P51                            */
     @30601    f0880390    07.  /*# 16+ Workers Federal Govt.      Table P79                            */
     @30608    f1457605    06.  /*# 16+ Workers State Govt.        Table B24080                         */
     @30614    f0880400    07.  /*# 16+ Workers State Govt.        Table P51                            */
     @30621    f0880490    07.  /*# 16+ Workers State Govt.        Table P79                            */
     @30628    f1457705    06.  /*# 16+ Workers Local Govt.        Table B24080                         */
     @30634    f0880500    07.  /*# 16+ Workers Local Govt.        Table P51                            */
     @30641    f0880590    07.  /*# 16+ Workers Local Govt.        Table P79                            */
     @30648    f1457805    06.  /*# 16+ Workers Self-Employed      Table B24080                         */
     @30654    f0880600    07.  /*# 16+ Workers Self-Employed      Table DP-3                           */
     @30661    f0880690    07.  /*# 16+ Workers Self-Employed      Table P79                            */
     @30668    f1457905    06.  /*# 16+ Unpaid Family Workers      Table B24080                         */
     @30674    f0880700    07.  /*# 16+ Unpaid Family Workers      Table DP-3                           */
     @30681    f0880790    07.  /*# 16+ Unpaid Family Workers      Table P79                            */
     @30688    f0679209    07.  /*Civilian Labor Force, 16+                                             */
     @30695    f0679208    07.  /*Civilian Labor Force, 16+                                             */
     @30702    f0679207    07.  /*Civilian Labor Force, 16+                                             */
     @30709    f0679206    07.  /*Civilian Labor Force, 16+                                             */
     @30716    f0679205    07.  /*Civilian Labor Force, 16+                                             */
     @30723    f0679200    07.  /*Civilian Labor Force, 16+                                             */
     @30730    f0679295    07.  /*Civilian Labor Force, 16+                                             */
     @30737    f0679290    07.  /*Civilian Labor Force, 16+                                             */
     @30744    f0679309    07.  /*Number Employed, 16+                                                  */
     @30751    f0679308    07.  /*Number Employed, 16+                                                  */
     @30758    f0679307    07.  /*Number Employed, 16+                                                  */
     @30765    f0679306    07.  /*Number Employed, 16+                                                  */
     @30772    f0679305    07.  /*Number Employed, 16+                                                  */
     @30779    f0679300    07.  /*Number Employed, 16+                                                  */
     @30786    f0679395    07.  /*Number Employed, 16+                                                  */
     @30793    f0679390    07.  /*Number Employed, 16+                                                  */
     @30800    f0679409    07.  /*Number Unemployed, 16+                                                */
     @30807    f0679408    07.  /*Number Unemployed, 16+                                                */
     @30814    f0679407    07.  /*Number Unemployed, 16+                                                */
     @30821    f0679406    07.  /*Number Unemployed, 16+                                                */
     @30828    f0679405    07.  /*Number Unemployed, 16+                                                */
     @30835    f0679400    07.  /*Number Unemployed, 16+                                                */
     @30842    f0679495    07.  /*Number Unemployed, 16+                                                */
     @30849    f0679490    07.  /*Number Unemployed, 16+                                                */
     @30856    f0679509    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @30859    f0679508    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @30862    f0679507    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @30865    f0679506    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @30868    f0679505    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @30871    f0679500    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @30874    f0679595    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @30877    f0679590    03.1 /*Unemployment Rate, 16+           (.1) Unemplyd/Civil Lab Frce         */
     @30880    f1458005    06.  /*# Agr/Frst/Fish/Hunt/Mine Work   16+ Yrs; Table C24070                */
     @30886    f1367000    07.  /*# Agr/Frst/Fish/Hunt/Mine Work   16+ Yrs; Table DP-3                  */
     @30893    f1184090    07.  /*# Agric/Forestry/Fishiers Work   16+ Yrs; Table P77                   */
     @30900    f1458105    06.  /*# Construction Workers           16+ Yrs; Table C24070                */
     @30906    f0879800    07.  /*# Construction Workers           16+ Yrs; Table DP-3                  */
     @30913    f0879890    07.  /*# Construction Workers           16+ Yrs; Table P77                   */
     @30920    f1458205    06.  /*# Educ/HlthCare/Soc Assist Work  16+ Yrs; Table C24070                */
     @30926    f1367100    07.  /*# Health/Social Service Workers  16+ Yrs; Table DP-3                  */
     @30933    f0879990    07.  /*# Health Service Workers         16+ Yrs; Table P77                   */
     @30940    f1458305    06.  /*# Manufacturing Workers          16+ Yrs; Table C24070                */
     @30946    f0858900    07.  /*# Manufacturing Workers          16+ Yrs; Table DP-3                  */
     @30953    f0858990    07.  /*# Manufacturing Workers          16+ Yrs; Table P77                   */
     @30960    f1458405    07.  /*# Workers in Other Industries    16+ Yrs; Table C24070                */
     @30967    f1462205    07.  /*# Mangmt/Prof/Related Occ Wrker  16+ Yrs; Table C24010                */
     @30974    f0859000    07.  /*# White Collar Workers           16+ Yrs; Table DP-3                  */
     @30981    f0859090    07.  /*# White Collar Workers           16+ Yrs; Table P78                   */
     @30988    f1462305    06.  /*Community/Soc Serv Workers,male  16+ Yrs; Table C24010                */
     @30994    f1462405    06.  /*Community/Soc Serv Workers,fmle  16+ Yrs; Table C24010                */
     @31000    f1462505    06.  /*HlthDiag&Treat Prct/OthTch,male  16+ Yrs; Table C24010                */
     @31006    f1462605    06.  /*HlthDiag&Treat Prct/OthTch,fmle  16+ Yrs; Table C24010                */
     @31012    f1462705    06.  /*Health Technol/Technician,male   16+ Yrs; Table C24010                */
     @31018    f1462805    06.  /*Health Technol/Technician,fmle   16+ Yrs; Table C24010                */
     @31024    f1462905    06.  /*Healthcare Support Workers,male  16+ Yrs; Table C24010                */
     @31030    f1463005    06.  /*Healthcare Support Workers,fmle  16+ Yrs; Table C24010                */
     @31036    f1462105    04.1 /*Percent Agr/Frst/Fish/Hunt/Mine  (.1) 16+ Yrs; Table C24070           */
     @31040    f1367200    04.1 /*Percent Agr/Frst/Fish/Hunt/Mine  (.1) 16+ Yrs; Table DP-3             */
     @31044    f1184190    04.1 /*Percent Agric/Forestry/Fishiers  (.1) 16+ Yrs; Table P77              */
     @31048    f1458505    04.1 /*Percent Construction             (.1) 16+ Yrs; Table C24070           */
     @31052    f0880000    04.1 /*Percent Construction             (.1) 16+ Yrs; Table DP-3             */
     @31056    f0880090    04.1 /*Percent Construction             (.1) 16+ Yrs; Table P77              */
     @31060    f1458605    04.1 /*Percent Educ/HlthCare/Soc Asst   (.1) 16+ Yrs; Table C24070           */
     @31064    f1367300    04.1 /*Percent Health/Social Services   (.1) 16+ Yrs; Table DP-3             */
     @31068    f0880190    04.1 /*Percent Health Services          (.1) 16+ Yrs; Table P77              */
     @31072    f1458705    04.1 /*Percent Manufacturing            (.1) 16+ Yrs; Table C24070           */
     @31076    f0859200    04.1 /*Percent Manufacturing            (.1) 16+ Yrs; Table DP-3             */
     @31080    f0859290    04.1 /*Percent Manufacturing            (.1) 16+ Yrs; Table P77              */
     @31084    f1458805    04.1 /*Percent Workers in Oth Industr   (.1) 16+ Yrs; Table C24070           */
     @31088    f0859300    04.1 /*Percent White Collar             (.1) 16+ Yrs; Table DP-3             */
     @31092    f0859390    04.1 /*Percent White Collar             (.1) 16+ Yrs; Table P78              */
     @31096    f1458905    07.  /*# 16+ Workers,Drive Alone        Table B08101                         */
     @31103    f0876000    07.  /*# 16+ Workers,Drive Alone        Table DP-3                           */
     @31110    f0876090    07.  /*# 16+ Workers,Drive Alone        Table P49                            */
     @31117    f1459005    06.  /*# 16+ Workers,Carpool            Table B08101                         */
     @31123    f0876100    07.  /*# 16+ Workers,Carpool            Table DP-3                           */
     @31130    f0876190    07.  /*# 16+ Workers,Carpool            Table P49                            */
     @31137    f1459105    06.  /*# 16+ Workers,Public Trans       Table B08101                         */
     @31143    f0876200    07.  /*# 16+ Workers,Public Trans       Table DP-3                           */
     @31150    f0876290    07.  /*# 16+ Workers,Public Trans       Table P49                            */
     @31157    f1459205    06.  /*# 16+ Workers,Walk to Work       Table B08101                         */
     @31163    f0876300    07.  /*# 16+ Workers,Walk to Work       Table DP-3                           */
     @31170    f0876390    07.  /*# 16+ Workers,Walk to Work       Table P49                            */
     @31177    f1459305    06.  /*# 16+ Wrkrs,Other Means of Tran  Table B08101                         */
     @31183    f0876400    07.  /*# 16+ Wrkrs,Other Means of Tran  Table DP-3                           */
     @31190    f0876490    07.  /*# 16+ Wrkrs,Other Means of Tran  Table P49                            */
     @31197    f1459405    06.  /*# 16+ Workers,Work at Home       Table B08101                         */
     @31203    f0876500    07.  /*# 16+ Workers,Work at Home       Table DP-3                           */
     @31210    f0876590    07.  /*# 16+ Workers,Work at Home       Table P49                            */
     @31217    f1459505    04.1 /*# 16+ Workers,Mean Travel Time   (.1) Tables B08012,B08013            */
     @31221    f1367400    07.1 /*# 16+ Workers,Mean Travel Time   (.1) Table DP-3                      */
     @31228    f1459605    07.  /*# 16+ Workers < 5 min to Work    Tab B08012;Worked outside home       */
     @31235    f0876600    07.  /*# 16+ Workers < 5 min to Work    Table P31                            */
     @31242    f0876690    07.  /*# 16+ Workers < 5 min to Work    Table P50                            */
     @31249    f1459705    07.  /*# 16+ Workers 5-9 min to Work    Tab B08012;Worked outside home       */
     @31256    f0876700    07.  /*# 16+ Workers 5-9 min to Work    Table P31                            */
     @31263    f0876790    07.  /*# 16+ Workers 5-9 min to Work    Table P50                            */
     @31270    f1459805    07.  /*# 16+ Workers 10-14 min to Work  Tab B08012;Worked outside home       */
     @31277    f0876800    07.  /*# 16+ Workers 10-14 min to Work  Table P31                            */
     @31284    f0876890    07.  /*# 16+ Workers 10-14 min to Work  Table P50                            */
     @31291    f1459905    07.  /*# 16+ Workers 15-19 min to Work  Tab B08012;Worked outside home       */
     @31298    f0876900    07.  /*# 16+ Workers 15-19 min to Work  Table P31                            */
     @31305    f0876990    07.  /*# 16+ Workers 15-19 min to Work  Table P50                            */
     @31312    f1460005    07.  /*# 16+ Workers 20-29 min to Work  Tab B08012;Worked outside home       */
     @31319    f0877000    07.  /*# 16+ Workers 20-29 min to Work  Table P31                            */
     @31326    f0877090    07.  /*# 16+ Workers 20-29 min to Work  Table P50                            */
     @31333    f1460105    07.  /*# 16+ Workers 30-44 min to Work  Tab B08012;Worked outside home       */
     @31340    f0877100    07.  /*# 16+ Workers 30-44 min to Work  Table P31                            */
     @31347    f0877190    07.  /*# 16+ Workers 30-44 min to Work  Table P50                            */
     @31354    f1460205    07.  /*# 16+ Workers 45-59 min to Work  Tab B08012;Worked outside home       */
     @31361    f0877200    07.  /*# 16+ Workers 45-59 min to Work  Table P31                            */
     @31368    f0877290    07.  /*# 16+ Workers 45-59 min to Work  Table P50                            */
     @31375    f1460305    07.  /*# 16+ Workers 60-89 min to Work  Tab B08012;Worked outside home       */
     @31382    f1379600    07.  /*# 16+ Workers 60-89 min to Work  Table P31                            */
     @31389    f1460405    07.  /*# 16+ Workers 90+ min to Work    Tab B08012;Worked outside home       */
     @31396    f1379700    07.  /*# 16+ Workers 90+ min to Work    Table P31                            */
     @31403    f0877390    07.  /*# 16+ Workers 60+ min to Work    Table P50                            */
     @31410    f1379800    07.  /*# 16+ Workers Worked at home     Table P31                            */
     @31417    f0877400    07.  /*# Employed w/Disability          16-64 Yrs. Noninst'l;Table P42       */
     @31424    f0877490    07.  /*# Disabled in Labor Force        16-64 Yrs. Noninst'l;Table P66       */
     @31431    f0877500    07.  /*# Not Employed w/Disability      16-64 Yrs. Noninst'l;Table P42       */
     @31438    f0877590    07.  /*# Disab Prevented from Wrkng     16-64 Yrs. Noninst'l;Table P66       */
     @31445    f0877600    07.  /*# Employed no/disability         16-64 Yrs. Noninst'l;Table P42       */
     @31452    f0877690    07.  /*# Disab Not Wrkng/Not Preventd   16-64 Yrs. Noninst'l;Table P66       */
     @31459    f0877700    07.  /*# Not employed/no disability     16-64 Yrs. Noninst'l;Table P42       */
     @31466    f0877790    07.  /*# w/no Work Disability           16-64 Yrs. Noninst'l;Table P66       */
     @31473    f1389503    03.1 /*%Worker Commuting to Metro Area  (.1) Adjacent Metro Areas            */
     @31476    f1460605    04.1 /*% Working State/County of Res    (.1) 16+ Yrs; B08007                 */
     @31480    f0875500    04.1 /*% Working State/County of Res    (.1) 16+ Yrs; Table P26              */
     @31484    f0875590    04.1 /*% Working State/County of Res    (.1) 16+ Yrs; Table P45              */
     @31488    f1460705    04.1 /*% Working State/Not Cnty of Res  (.1) 16+ Yrs; B08007                 */
     @31492    f0875600    04.1 /*% Working State/Not Cnty of Res  (.1) 16+ Yrs; Table P26              */
     @31496    f0875690    04.1 /*% Working State/Not Cnty of Res  (.1) 16+ Yrs; Table P45              */
     @31500    f1460805    04.1 /*% Working Outside State of Res   (.1) 16+ Yrs; B08007                 */
     @31504    f0875700    04.1 /*% Working Outside State of Res   (.1) 16+ Yrs; Table P26              */
     @31508    f0875790    04.1 /*% Working Outside State of Res   (.1) 16+ Yrs; Table P45              */
     @31512    f1460905    07.  /*# Working State/County of Resid  16+ Yrs; Table B08007                */
     @31519    f0875100    07.  /*# Working State/County of Resid  16+ Yrs; Table P26                   */
     @31526    f0875190    07.  /*# Working State/County of Resid  16+ Yer; Table P45                   */
     @31533    f1461005    07.  /*# Working State/Not Cnty of Res  16+ Yrs; Table B08007                */
     @31540    f0875200    07.  /*# Working State/Not Cnty of Res  16+ Yrs; Table P26                   */
     @31547    f0875290    07.  /*# Working State/Not Cnty of Res  16+ Yrs; Table P45                   */
     @31554    f1461105    07.  /*# Working Outside State of Res   16+ Yrs; Table B08007                */
     @31561    f0875300    07.  /*# Working Outside State of Res   16+ Yrs; Table P26                   */
     @31568    f0875390    07.  /*# Working Outside State of Res   16+ Yrs; Table P45                   */
     @31575    f1461205    07.  /*# Reporting Place of Work        16+ Yrs; Table B08007                */
     @31582    f0875400    07.  /*# Reporting Place of Work        16+ Yrs; Table P26                   */
     @31589    f0875490    07.  /*# Reporting Place Of Work        16+ Yrs; Table P45                   */
     @31596    f1463105    07.  /*Live in Same Metro Area 1Yr Ago  Table C07201; Metropolitan SA        */
     @31603    f1463205    07.  /*Live in Same Micro Area 1Yr Ago  Table C07202; Micropolitan SA        */
     @31610    f1185800    07.  /*# Living in Same PMSA 95 & 00    Table PCT22                          */
     @31617    f1185890    07.  /*# Living In Same PMSA 85 & 90    Table P44                            */
     @31624    f1463305    07.  /*Work in PrinCity of MetroAr Res  Table B08016; Metropolitan SA        */
     @31631    f1463405    07.  /*Work in PrinCity of MicroAr Res  Table B08017; Micropolitan SA        */
     @31638    f0875900    07.  /*# Wrkng In Cent Cty Of PMSA Res  Table P28                            */
     @31645    f0875990    07.  /*# Wrkng In Cent Cty Of PMSA Res  Table P47                            */
     @31652    f0884310    07.  /*# Occupied Housing Units         Table H1                             */
     @31659    f1467405    07.  /*# Occupied Housing Units         Table B25002                         */
     @31666    f0884300    07.  /*# Occupied Housing Units         Table H3                             */
     @31673    f1167300    04.1 /*% Owner-Occupied Housing Units   Table H4, (.1)                       */
     @31677    f0974000    04.1 /*% Units W/More Than 1 Person/Rm  (.1) Occupied Housing Units          */
     @31681    f1461305    07.  /*Median Home Value                Table B25077                         */
     @31688    f0973800    07.  /*Median Home Value                Table DP-4                           */
     @31695    f1461405    04.  /*Median Gross Rent                Table B25064                         */
     @31699    f0884500    04.  /*Median Gross Rent                Table DP-4                           */
     @31703    f1351510    07.  /*Housing Units                    Table H1                             */
     @31710    f1351500    07.  /*Housing Units                    Table H1                             */
     @31717    f1409109    07.  /*Housing Units Estimates                                               */
     @31724    f1409108    07.  /*Housing Units Estimates                                               */
     @31731    f1409107    07.  /*Housing Units Estimates                                               */
     @31738    f1409106    07.  /*Housing Units Estimates                                               */
     @31745    f1409105    07.  /*Housing Units Estimates                                               */
     @31752    f1409100    07.  /*Housing Units Estimates                                               */
     @31759    f1461505    07.  /*# Occ Hous Unit w/no Fuel Used   Table B25040                         */
     @31766    f0884000    07.  /*# Occ Hous Unit w/no Fuel Used   Table H40                            */
     @31773    f1461605    07.  /*# Occ Hous Unit w/Phone Service  Table B25043                         */
     @31780    f0884400    07.  /*# Occ Hous Unit w/Telephone      Table H43                            */
     @31787    f1461705    07.  /*# Occ Hous Unit w/out Plumbing   Table B25049                         */
     @31794    f1324800    06.  /*# Occ Hous Unit w/out Plumbing   Table H48                            */
     @31800    f1461805    04.1 /*% Occ Hous Unit w/no Fuel Used   (.1) Table B25040                    */
     @31804    f0860900    04.1 /*% Occ Hous Unit w/no Fuel Used   (.1) Table H40                       */
     @31808    f1461905    04.1 /*% Occ Hous Unit w/Phone Service  (.1) Table B25043                    */
     @31812    f0861100    04.1 /*% Occ Hous Unit w/Telephone      (.1) Table H43                       */
     @31816    f1462005    04.1 /*% Occ Hous Unit w/out Plumbing   (.1) Table B25049                    */
     @31820    f1379900    04.1 /*% Occ Hous Unit w/out Plumbing   (.1) Table H48                       */
     @31824    f1387410    08.2 /*Total Area in Square Miles       (.2) Geographic Header               */
     @31832    f1387400    08.2 /*Total Area in Square Miles       (.2) Geo Comp Table                  */
     @31840    f0972110    08.2 /*Land Area in Square Miles        (.2) Geographic Header               */
     @31848    f0972100    08.2 /*Land Area in Square Miles        (.2) Geo Comp Table                  */
     @31856    f1387510    06.2 /*Water Area in Square Miles       (.2) Geographic Header               */
     @31862    f1387500    06.2 /*Water Area in Square Miles       (.2) Geo Comp Table                  */
     @31868    f1387610    06.1 /*Population Density per Sq Mile   (.1) Geographic Header               */
     @31874    f1387600    06.1 /*Population Density per Sq Mile   (.1) Geo Comp Table                  */
     @31880    f1387710    06.1 /*Housing Unit Density per Sq Mle  (.1) Geographic Header               */
     @31886    f1387700    06.1 /*Housing Unit Density per Sq Mle  (.1) Geo Comp Table                  */
     @31892    f0081176    05.  /*Elevation Feet                                                        */
     @31897    f00547   $  01.  /*************                                                          */
;
label

f00002 ="FIPS St & Cty Code "
f00003 ="Entity of File "
f00004 ="Secondary Entity Of File "
f00005 ="Date of File "
f00006 ="Date of Creation "
f00007 ="File Length "
f00008 ="State Name "
f12424 ="State Name Abbreviation "
f00010 ="County Name "
f04437 ="County Name w/State Abbrev "
f00011 ="FIPS State Code "
f00012 ="FIPS County Code "
f04439 ="Census Region Code "
f04448 ="Census Region Name "
f04440 ="Census Division Code "
f04449 ="Census Division Name "
f00023 ="Federal Region Code "
f13156 ="SSA Beneficiary Code "
f1389109 ="Metro/Micro Stat Area Code 2009"
f1389209 ="Metro/Micro Stat Area Name 2009"
f1406709 ="Metro/Micro Indicator Code 2009"
f1419509 ="Metro/Micro County Status 2009"
f1419309 ="Metropolitan Division Code 2009"
f1419409 ="Metropolitan Division Name 2009"
f1389309 ="Combined Statistical Area Code 2009"
f1389409 ="Combined Statistical Area Name 2009"
f0002003 ="Rural/Urban Continuum Code 2003"
f1255903 ="Urban Influence Code 2003"
f1397304 ="Economic-Dependnt Typology Code 2004"
f1248104 ="Farming-Dependent Typology Code 2004"
f1248204 ="Mining-Dependent Typology Code 2004"
f1248304 ="Manufacturing-Dep Typology Code 2004"
f1248404 ="Fed/St Govt-Depdnt Typolgy Code 2004"
f1248504 ="Service-Dependent Typology Code 2004"
f1248604 ="Nonspecializd-Dep Typology Code 2004"
f1397404 ="Housing Stress Typology Code 2004"
f1397504 ="Low Education Typology Code 2004"
f1397604 ="Low Employment Typology Code 2004"
f1249004 ="Persistent Povrty Typology Code 2004"
f1397704 ="Population Loss Typology Code 2004"
f1397804 ="Nonmetro Recreation Typlgy Code 2004"
f1248704 ="Retirement Destnatn Typlgy Code 2004"
f0355304 ="BEA Economic Area Code 2004"
f1214404 ="BEA Component Economc Area Code 2004"
f0355404 ="BEA Economic Area Name 2004"
f1214604 ="BEA Component Economc Area Name 2004"
f1175088 ="Health Service Area Codes 1988"
f0970298 ="AHEC Code 1998"
f0970398 ="AHEC Name 1998"
f1319798 ="AHEC Program Year of Initiation 1998"
f1319898 ="AHEC Center Year of Initiation 1998"
f0978710 ="HPSA Code - Primary Care 12/10"
f0978709 ="HPSA Code - Primary Care 12/09"
f0978708 ="HPSA Code - Primary Care 12/08"
f0978707 ="HPSA Code - Primary Care 12/07"
f0979210 ="HPSA Code - Dentists 12/10"
f0979209 ="HPSA Code - Dentists 12/09"
f0979208 ="HPSA Code - Dentists 12/08"
f0979207 ="HPSA Code - Dentists 12/07"
f1249210 ="HPSA Code - Mental Health 12/10"
f1249209 ="HPSA Code - Mental Health 12/09"
f1249208 ="HPSA Code - Mental Health 12/08"
f1249207 ="HPSA Code - Mental Health 12/07"
f0410180 ="Contiguous County # 1 "
f0410280 ="Contiguous County # 2 "
f0410380 ="Contiguous County # 3 "
f0410480 ="Contiguous County # 4 "
f0410580 ="Contiguous County # 5 "
f0410680 ="Contiguous County # 6 "
f0410780 ="Contiguous County # 7 "
f0410880 ="Contiguous County # 8 "
f0410980 ="Contiguous County # 9 "
f0411080 ="Contiguous County # 10 "
f0411180 ="Contiguous County # 11 "
f0411280 ="Contiguous County # 12 "
f0411380 ="Contiguous County # 13 "
f0411480 ="Contiguous County # 14 "
f1467510 ="Phys,Primary Care, Patient Care 2010"
f1467610 ="Phys,Primary Care, Hsp Resident 2010"
f1467710 ="MD's,Primary Care, Patient Care 2010"
f1467810 ="MD's,Primary Care, Hsp Resident 2010"
f1467910 ="DO's,Primary Care, Patient Care 2010"
f1468010 ="DO's,Primary Care, Hsp Resident 2010"
f1212910 ="Tot Active M.D.s Non-Fed & Fed 2010"
f1212908 ="Tot Active M.D.s Non-Fed & Fed 2008"
f1212905 ="Tot Active M.D.s Non-Fed & Fed 2005"
f0885710 ="Total Active M.D.s Non-Federal 2010"
f0885708 ="Total Active M.D.s Non-Federal 2008"
f0885707 ="Total Active M.D.s Non-Federal 2007"
f0885706 ="Total Active M.D.s Non-Federal 2006"
f0885705 ="Total Active M.D.s Non-Federal 2005"
f0885704 ="Total Active M.D.s Non-Federal 2004"
f0885703 ="Total Active M.D.s Non-Federal 2003"
f0885702 ="Total Active M.D.s Non-Federal 2002"
f0885701 ="Total Active M.D.s Non-Federal 2001"
f0885700 ="Total Active M.D.s Non-Federal 2000"
f0885799 ="Total Active M.D.s Non-Federal 1999"
f0885798 ="Total Active M.D.s Non-Federal 1998"
f0885797 ="Total Active M.D.s Non-Federal 1997"
f0885796 ="Total Active M.D.s Non-Federal 1996"
f0885795 ="Total Active M.D.s Non-Federal 1995"
f0885794 ="Total Active M.D.s Non-Federal 1994"
f0885793 ="Total Active M.D.s Non-Federal 1993"
f0885792 ="Total Active M.D.s Non-Federal 1992"
f0885790 ="Total Active M.D.s Non-Federal 1990"
f0885789 ="Total Active M.D.s Non-Federal 1989"
f0885788 ="Total Active M.D.s Non-Federal 1988"
f0885786 ="Total Active M.D.s Non-Federal 1986"
f0885785 ="Total Active M.D.s Non-Federal 1985"
f0885783 ="Total Active M.D.s Non-Federal 1983"
f0885782 ="Total Active M.D.s Non-Federal 1982"
f0885781 ="Total Active M.D.s Non-Federal 1981"
f0885780 ="Total Active M.D.s Non-Federal 1980"
f0885775 ="Total Active M.D.s Non-Federal 1975"
f0885770 ="Total Active M.D.s Non-Federal 1970"
f0885760 ="Total Active M.D.s Non-Federal 1960"
f0885750 ="Total Active M.D.s Non-Federal 1950"
f0885740 ="Total Active M.D.s Non-Federal 1940"
f1212810 ="Total M.D.'s, Tot Non-Fed & Fed 2010"
f1212808 ="Total M.D.'s, Tot Non-Fed & Fed 2008"
f1212805 ="Total M.D.'s, Tot Non-Fed & Fed 2005"
f0460210 ="Total M.D.'s, Total Non-Fed 2010"
f0460208 ="Total M.D.'s, Total Non-Fed 2008"
f0460207 ="Total M.D.'s, Total Non-Fed 2007"
f0460206 ="Total M.D.'s, Total Non-Fed 2006"
f0460205 ="Total M.D.'s, Total Non-Fed 2005"
f0460204 ="Total M.D.'s, Total Non-Fed 2004"
f0460203 ="Total M.D.'s, Total Non-Fed 2003"
f0460202 ="Total M.D.'s, Total Non-Fed 2002"
f0460201 ="Total M.D.'s, Total Non-Fed 2001"
f0460200 ="Total M.D.'s, Total Non-Fed 2000"
f0460299 ="Total M.D.'s, Total Non-Fed 1999"
f0460298 ="Total M.D.'s, Total Non-Fed 1998"
f0460297 ="Total M.D.'s, Total Non-Fed 1997"
f0460296 ="Total M.D.'s, Total Non-Fed 1996"
f0460295 ="Total M.D.'s, Total Non-Fed 1995"
f0460290 ="Total M.D.'s, Total Non-Fed 1990"
f1121510 ="M.D.'s, Total Ptn Care Non-Fed 2010"
f1121508 ="M.D.'s, Total Ptn Care Non-Fed 2008"
f1121507 ="M.D.'s, Total Ptn Care Non-Fed 2007"
f1121506 ="M.D.'s, Total Ptn Care Non-Fed 2006"
f1121505 ="M.D.'s, Total Ptn Care Non-Fed 2005"
f1121504 ="M.D.'s, Total Ptn Care Non-Fed 2004"
f1121503 ="M.D.'s, Total Ptn Care Non-Fed 2003"
f1121502 ="M.D.'s, Total Ptn Care Non-Fed 2002"
f1121501 ="M.D.'s, Total Ptn Care Non-Fed 2001"
f1121500 ="M.D.'s, Total Ptn Care Non-Fed 2000"
f1121599 ="M.D.'s, Total Ptn Care Non-Fed 1999"
f1121598 ="M.D.'s, Total Ptn Care Non-Fed 1998"
f1121597 ="M.D.'s, Total Ptn Care Non-Fed 1997"
f1121596 ="M.D.'s, Total Ptn Care Non-Fed 1996"
f1121595 ="M.D.'s, Total Ptn Care Non-Fed 1995"
f1121590 ="M.D.'s, Total Ptn Care Non-Fed 1990"
f0460310 ="M.D.'s, PC, Off Based Non-Fed 2010"
f0460308 ="M.D.'s, PC, Off Based Non-Fed 2008"
f0460307 ="M.D.'s, PC, Off Based Non-Fed 2007"
f0460306 ="M.D.'s, PC, Off Based Non-Fed 2006"
f0460305 ="M.D.'s, PC, Off Based Non-Fed 2005"
f0460304 ="M.D.'s, PC, Off Based Non-Fed 2004"
f0460303 ="M.D.'s, PC, Off Based Non-Fed 2003"
f0460302 ="M.D.'s, PC, Off Based Non-Fed 2002"
f0460301 ="M.D.'s, PC, Off Based Non-Fed 2001"
f0460300 ="M.D.'s, PC, Off Based Non-Fed 2000"
f0460395 ="M.D.'s, PC, Off Based Non-Fed 1995"
f0460390 ="M.D.'s, PC, Off Based Non-Fed 1990"
f1121610 ="MDs, Tot Hosp-Based PC Non-Fed 2010"
f1121608 ="MDs, Tot Hosp-Based PC Non-Fed 2008"
f1121607 ="MDs, Tot Hosp-Based PC Non-Fed 2007"
f1121606 ="MDs, Tot Hosp-Based PC Non-Fed 2006"
f1121605 ="MDs, Tot Hosp-Based PC Non-Fed 2005"
f1121604 ="MDs, Tot Hosp-Based PC Non-Fed 2004"
f1121603 ="MDs, Tot Hosp-Based PC Non-Fed 2003"
f1121602 ="MDs, Tot Hosp-Based PC Non-Fed 2002"
f1121601 ="MDs, Tot Hosp-Based PC Non-Fed 2001"
f1121600 ="MDs, Tot Hosp-Based PC Non-Fed 2000"
f1121695 ="MDs, Tot Hosp-Based PC Non-Fed 1995"
f1121690 ="MDs, Tot Hosp-Based PC Non-Fed 1990"
f1249910 ="M.D.'s, Total PC, Hosp Resident 2010"
f1249908 ="M.D.'s, Total PC, Hosp Resident 2008"
f1249907 ="M.D.'s, Total PC, Hosp Resident 2007"
f1249906 ="M.D.'s, Total PC, Hosp Resident 2006"
f1249905 ="M.D.'s, Total PC, Hosp Resident 2005"
f1249904 ="M.D.'s, Total PC, Hosp Resident 2004"
f1249903 ="M.D.'s, Total PC, Hosp Resident 2003"
f1249902 ="M.D.'s, Total PC, Hosp Resident 2002"
f1249901 ="M.D.'s, Total PC, Hosp Resident 2001"
f1249900 ="M.D.'s, Total PC, Hosp Resident 2000"
f1249995 ="M.D.'s, Total PC, Hosp Resident 1995"
f0460490 ="M.D.'s, Total PC, Hosp Resident 1990"
f1106790 ="M.D.'s, Tot PC,Clinical Fellows 1990"
f0460510 ="M.D.'s, Total PC, Hosp FT Staff 2010"
f0460508 ="M.D.'s, Total PC, Hosp FT Staff 2008"
f0460507 ="M.D.'s, Total PC, Hosp FT Staff 2007"
f0460506 ="M.D.'s, Total PC, Hosp FT Staff 2006"
f0460505 ="M.D.'s, Total PC, Hosp FT Staff 2005"
f0460504 ="M.D.'s, Total PC, Hosp FT Staff 2004"
f0460503 ="M.D.'s, Total PC, Hosp FT Staff 2003"
f0460502 ="M.D.'s, Total PC, Hosp FT Staff 2002"
f0460501 ="M.D.'s, Total PC, Hosp FT Staff 2001"
f0460500 ="M.D.'s, Total PC, Hosp FT Staff 2000"
f0460595 ="M.D.'s, Total PC, Hosp FT Staff 1995"
f0460590 ="M.D.'s, Total PC, Hosp FT Staff 1990"
f1121710 ="M.D.'s, Total Oth Prof Activity 2010"
f1121708 ="M.D.'s, Total Oth Prof Activity 2008"
f1121707 ="M.D.'s, Total Oth Prof Activity 2007"
f1121706 ="M.D.'s, Total Oth Prof Activity 2006"
f1121705 ="M.D.'s, Total Oth Prof Activity 2005"
f1121704 ="M.D.'s, Total Oth Prof Activity 2004"
f1121703 ="M.D.'s, Total Oth Prof Activity 2003"
f1121702 ="M.D.'s, Total Oth Prof Activity 2002"
f1121701 ="M.D.'s, Total Oth Prof Activity 2001"
f1121700 ="M.D.'s, Total Oth Prof Activity 2000"
f1121795 ="M.D.'s, Total Oth Prof Activity 1995"
f1121790 ="M.D.'s, Total Oth Prof Activity 1990"
f0460610 ="M.D.'s, Total Administration 2010"
f0460608 ="M.D.'s, Total Administration 2008"
f0460607 ="M.D.'s, Total Administration 2007"
f0460606 ="M.D.'s, Total Administration 2006"
f0460605 ="M.D.'s, Total Administration 2005"
f0460604 ="M.D.'s, Total Administration 2004"
f0460603 ="M.D.'s, Total Administration 2003"
f0460602 ="M.D.'s, Total Administration 2002"
f0460601 ="M.D.'s, Total Administration 2001"
f0460600 ="M.D.'s, Total Administration 2000"
f0460695 ="M.D.'s, Total Administration 1995"
f0460690 ="M.D.'s, Total Administration 1990"
f0460710 ="M.D.'s, Total Teaching 2010"
f0460708 ="M.D.'s, Total Teaching 2008"
f0460707 ="M.D.'s, Total Teaching 2007"
f0460706 ="M.D.'s, Total Teaching 2006"
f0460705 ="M.D.'s, Total Teaching 2005"
f0460704 ="M.D.'s, Total Teaching 2004"
f0460703 ="M.D.'s, Total Teaching 2003"
f0460702 ="M.D.'s, Total Teaching 2002"
f0460701 ="M.D.'s, Total Teaching 2001"
f0460700 ="M.D.'s, Total Teaching 2000"
f0460795 ="M.D.'s, Total Teaching 1995"
f0460790 ="M.D.'s, Total Teaching 1990"
f1106810 ="M.D.'s, Total Research 2010"
f1106808 ="M.D.'s, Total Research 2008"
f1106807 ="M.D.'s, Total Research 2007"
f1106806 ="M.D.'s, Total Research 2006"
f1106805 ="M.D.'s, Total Research 2005"
f1106804 ="M.D.'s, Total Research 2004"
f1106803 ="M.D.'s, Total Research 2003"
f1106802 ="M.D.'s, Total Research 2002"
f1106801 ="M.D.'s, Total Research 2001"
f1106800 ="M.D.'s, Total Research 2000"
f1106895 ="M.D.'s, Total Research 1995"
f1106890 ="M.D.'s, Total Research 1990"
f0460910 ="M.D.'s, Total Other 2010"
f0460908 ="M.D.'s, Total Other 2008"
f0460907 ="M.D.'s, Total Other 2007"
f0460906 ="M.D.'s, Total Other 2006"
f0460905 ="M.D.'s, Total Other 2005"
f0460904 ="M.D.'s, Total Other 2004"
f0460903 ="M.D.'s, Total Other 2003"
f0460902 ="M.D.'s, Total Other 2002"
f0460901 ="M.D.'s, Total Other 2001"
f0460900 ="M.D.'s, Total Other 2000"
f0460995 ="M.D.'s, Total Other 1995"
f0460990 ="M.D.'s, Total Other 1990"
f0461010 ="MD's, Total Gen Pract, Total 2010"
f0461008 ="MD's, Total Gen Pract, Total 2008"
f0461005 ="MD's, Total Gen Pract, Total 2005"
f1106910 ="MD's, Tot Gen Pract,Tot Ptn Cr 2010"
f1106908 ="MD's, Tot Gen Pract,Tot Ptn Cr 2008"
f1106905 ="MD's, Tot Gen Pract,Tot Ptn Cr 2005"
f0886010 ="MD's, Tot Gen Pract, PC,Off Bsd 2010"
f0886008 ="MD's, Tot Gen Pract, PC,Off Bsd 2008"
f0886007 ="MD's, Tot Gen Pract, PC,Off Bsd 2007"
f0886006 ="MD's, Tot Gen Pract, PC,Off Bsd 2006"
f0886005 ="MD's, Tot Gen Pract, PC,Off Bsd 2005"
f0886000 ="MD's, Tot Gen Pract, PC,Off Bsd 2000"
f0886095 ="MD's, Tot Gen Pract, PC,Off Bsd 1995"
f0886090 ="MD's, Tot Gen Pract, PC,Off Bsd 1990"
f1250010 ="MD's, Tot Gen Pract, PC,Hsp Res 2010"
f1250008 ="MD's, Tot Gen Pract, PC,Hsp Res 2008"
f1250005 ="MD's, Tot Gen Pract, PC,Hsp Res 2005"
f0461310 ="MD's, Tot Gen Pract, PC,Hsp FT Stf 2010"
f0461308 ="MD's, Tot Gen Pract, PC,Hsp FT Stf 2008"
f0461305 ="MD's, Tot Gen Pract, PC,Hsp FT Stf 2005"
f0461410 ="MD's, Tot Gen Pract, Administ 2010"
f0461408 ="MD's, Tot Gen Pract, Administ 2008"
f0461405 ="MD's, Tot Gen Pract, Administ 2005"
f0461510 ="MD's, Tot Gen Pract, Teaching 2010"
f0461508 ="MD's, Tot Gen Pract, Teaching 2008"
f0461505 ="MD's, Tot Gen Pract, Teaching 2005"
f1107110 ="MD's, Tot Gen Pract, Research 2010"
f1107108 ="MD's, Tot Gen Pract, Research 2008"
f1107105 ="MD's, Tot Gen Pract, Research 2005"
f0461710 ="MD's, Tot Gen Pract, Other 2010"
f0461708 ="MD's, Tot Gen Pract, Other 2008"
f0461705 ="MD's, Tot Gen Pract, Other 2005"
f0994710 ="MD's, Gen Pract, Total 2010"
f0994708 ="MD's, Gen Pract, Total 2008"
f0994705 ="MD's, Gen Pract, Total 2005"
f1107210 ="MD's, Gen Pract, Total Ptn Care 2010"
f1107208 ="MD's, Gen Pract, Total Ptn Care 2008"
f1107205 ="MD's, Gen Pract, Total Ptn Care 2005"
f0994910 ="MD's, Gen Pract, PC, Office Bsd 2010"
f0994908 ="MD's, Gen Pract, PC, Office Bsd 2008"
f0994905 ="MD's, Gen Pract, PC, Office Bsd 2005"
f0995010 ="MD's, Gen Pract, PC, Hsp Rsdnt 2010"
f0995008 ="MD's, Gen Pract, PC, Hsp Rsdnt 2008"
f0995005 ="MD's, Gen Pract, PC, Hsp Rsdnt 2005"
f0995110 ="MD's, Gen Pract, PC, Hsp FT Stf 2010"
f0995108 ="MD's, Gen Pract, PC, Hsp FT Stf 2008"
f0995105 ="MD's, Gen Pract, PC, Hsp FT Stf 2005"
f0995210 ="MD's, Gen Pract, Administration 2010"
f0995208 ="MD's, Gen Pract, Administration 2008"
f0995205 ="MD's, Gen Pract, Administration 2005"
f0995310 ="MD's, Gen Pract, Teaching 2010"
f0995308 ="MD's, Gen Pract, Teaching 2008"
f0995305 ="MD's, Gen Pract, Teaching 2005"
f1107410 ="MD's, Gen Pract, Research 2010"
f1107408 ="MD's, Gen Pract, Research 2008"
f1107405 ="MD's, Gen Pract, Research 2005"
f0995510 ="MD's, Gen Pract, Other 2010"
f0995508 ="MD's, Gen Pract, Other 2008"
f0995505 ="MD's, Gen Pract, Other 2005"
f1199610 ="MD's, Fam Med Gen, Total 2010"
f1199608 ="MD's, Fam Med Gen, Total 2008"
f1199605 ="MD's, Fam Med Gen, Total 2005"
f1199710 ="MD's, Fam Med Gen, Tot Ptn Cr 2010"
f1199708 ="MD's, Fam Med Gen, Tot Ptn Cr 2008"
f1199705 ="MD's, Fam Med Gen, Tot Ptn Cr 2005"
f1199810 ="MD's, Fam Med Gen, PC,Off Bsd 2010"
f1199808 ="MD's, Fam Med Gen, PC,Off Bsd 2008"
f1199805 ="MD's, Fam Med Gen, PC,Off Bsd 2005"
f1250110 ="MD's, Fam Med Gen, PC,Hsp Rsdnt 2010"
f1250108 ="MD's, Fam Med Gen, PC,Hsp Rsdnt 2008"
f1250105 ="MD's, Fam Med Gen, PC,Hsp Rsdnt 2005"
f1200110 ="MD's, Fam Med Gen, Hsp FT Staff 2010"
f1200108 ="MD's, Fam Med Gen, Hsp FT Staff 2008"
f1200105 ="MD's, Fam Med Gen, Hsp FT Staff 2005"
f1200210 ="MD's, Fam Med Gen, Administratn 2010"
f1200208 ="MD's, Fam Med Gen, Administratn 2008"
f1200205 ="MD's, Fam Med Gen, Administratn 2005"
f1200310 ="MD's, Fam Med Gen, Teaching 2010"
f1200308 ="MD's, Fam Med Gen, Teaching 2008"
f1200305 ="MD's, Fam Med Gen, Teaching 2005"
f1200410 ="MD's, Fam Med Gen, Research 2010"
f1200408 ="MD's, Fam Med Gen, Research 2008"
f1200405 ="MD's, Fam Med Gen, Research 2005"
f1200510 ="MD's, Fam Med Gen, Other 2010"
f1200508 ="MD's, Fam Med Gen, Other 2008"
f1200505 ="MD's, Fam Med Gen, Other 2005"
f1200610 ="MD's, Fam Med Subspec, Total 2010"
f1200608 ="MD's, Fam Med Subspec, Total 2008"
f1200605 ="MD's, Fam Med Subspec, Total 2005"
f1200710 ="MD's, Fam Med Subsp,Tot Ptn Cr 2010"
f1200708 ="MD's, Fam Med Subsp,Tot Ptn Cr 2008"
f1200705 ="MD's, Fam Med Subsp,Tot Ptn Cr 2005"
f1200810 ="MD's, Fam Med Subsp,PC,Off Bsd 2010"
f1200808 ="MD's, Fam Med Subsp,PC,Off Bsd 2008"
f1200805 ="MD's, Fam Med Subsp,PC,Off Bsd 2005"
f1250210 ="MD's, Fam Med Subsp,PC,Hsp Res 2010"
f1250208 ="MD's, Fam Med Subsp,PC,Hsp Res 2008"
f1250205 ="MD's, Fam Med Subsp,PC,Hsp Res 2005"
f1201110 ="MD's, Fam Med Subsp,Hsp FT Stf 2010"
f1201108 ="MD's, Fam Med Subsp,Hsp FT Stf 2008"
f1201105 ="MD's, Fam Med Subsp,Hsp FT Stf 2005"
f1201210 ="MD's, Fam Med Subsp,Admin 2010"
f1201208 ="MD's, Fam Med Subsp,Admin 2008"
f1201205 ="MD's, Fam Med Subsp,Admin 2005"
f1201310 ="MD's, Fam Med Subsp,Teaching 2010"
f1201308 ="MD's, Fam Med Subsp,Teaching 2008"
f1201305 ="MD's, Fam Med Subsp,Teaching 2005"
f1201410 ="MD's, Fam Med Subsp,Research 2010"
f1201408 ="MD's, Fam Med Subsp,Research 2008"
f1201405 ="MD's, Fam Med Subsp,Research 2005"
f1201510 ="MD's, Fam Med Subsp,Other 2010"
f1201508 ="MD's, Fam Med Subsp,Other 2008"
f1201505 ="MD's, Fam Med Subsp,Other 2005"
f0461810 ="Med Spec Tot, Total 2010"
f0461808 ="Med Spec Tot, Total 2008"
f0461805 ="Med Spec Tot, Total 2005"
f1107810 ="Med Spec Tot, Total Patn Care 2010"
f1107808 ="Med Spec Tot, Total Patn Care 2008"
f1107805 ="Med Spec Tot, Total Patn Care 2005"
f0886110 ="Med Spec Tot, PC, Office Based 2010"
f0886108 ="Med Spec Tot, PC, Office Based 2008"
f0886107 ="Med Spec Tot, PC, Office Based 2007"
f0886106 ="Med Spec Tot, PC, Office Based 2006"
f0886105 ="Med Spec Tot, PC, Office Based 2005"
f0886100 ="Med Spec Tot, PC, Office Based 2000"
f0886195 ="Med Spec Tot, PC, Office Based 1995"
f0886190 ="Med Spec Tot, PC, Office Based 1990"
f1250310 ="Med Spec Tot, PC, Hosp Resident 2010"
f1250308 ="Med Spec Tot, PC, Hosp Resident 2008"
f1250305 ="Med Spec Tot, PC, Hosp Resident 2005"
f0462110 ="Med Spec Tot, PC, Hosp FT Staff 2010"
f0462108 ="Med Spec Tot, PC, Hosp FT Staff 2008"
f0462105 ="Med Spec Tot, PC, Hosp FT Staff 2005"
f0462210 ="Med Spec Tot, Administration 2010"
f0462208 ="Med Spec Tot, Administration 2008"
f0462205 ="Med Spec Tot, Administration 2005"
f0462310 ="Med Spec Tot, Teaching 2010"
f0462308 ="Med Spec Tot, Teaching 2008"
f0462305 ="Med Spec Tot, Teaching 2005"
f1108010 ="Med Spec Tot, Research 2010"
f1108008 ="Med Spec Tot, Research 2008"
f1108005 ="Med Spec Tot, Research 2005"
f0462510 ="Med Spec Tot, Other 2010"
f0462508 ="Med Spec Tot, Other 2008"
f0462505 ="Med Spec Tot, Other 2005"
f1167410 ="Allergy & Immunology, Total 2010"
f1167408 ="Allergy & Immunology, Total 2008"
f1167405 ="Allergy & Immunology, Total 2005"
f1167510 ="Allergy & Immunology,Tot Patn Cr 2010"
f1167508 ="Allergy & Immunology,Tot Patn Cr 2008"
f1167505 ="Allergy & Immunology,Tot Patn Cr 2005"
f1167610 ="Allergy & Immunology,PC,Off Based 2010"
f1167608 ="Allergy & Immunology,PC,Off Based 2008"
f1167605 ="Allergy & Immunology,PC,Off Based 2005"
f1250410 ="Allergy & Immunology,Hosp Resdnt 2010"
f1250408 ="Allergy & Immunology,Hosp Resdnt 2008"
f1250405 ="Allergy & Immunology,Hosp Resdnt 2005"
f1167910 ="Allergy & Immunlgy,PC,Hosp FT Stf 2010"
f1167908 ="Allergy & Immunlgy,PC,Hosp FT Stf 2008"
f1167905 ="Allergy & Immunlgy,PC,Hosp FT Stf 2005"
f1168010 ="Allergy & Immunlgy,Administration 2010"
f1168008 ="Allergy & Immunlgy,Administration 2008"
f1168005 ="Allergy & Immunlgy,Administration 2005"
f1168110 ="Allergy & Immunology, Teaching 2010"
f1168108 ="Allergy & Immunology, Teaching 2008"
f1168105 ="Allergy & Immunology, Teaching 2005"
f1168210 ="Allergy & Immunology, Research 2010"
f1168208 ="Allergy & Immunology, Research 2008"
f1168205 ="Allergy & Immunology, Research 2005"
f1168310 ="Allergy & Immunology, Other 2010"
f1168308 ="Allergy & Immunology, Other 2008"
f1168305 ="Allergy & Immunology, Other 2005"
f0463110 ="Cardiovas Dis, Total 2010"
f0463108 ="Cardiovas Dis, Total 2008"
f0463105 ="Cardiovas Dis, Total 2005"
f1108410 ="Cardiovas Dis, Total Patn Care 2010"
f1108408 ="Cardiovas Dis, Total Patn Care 2008"
f1108405 ="Cardiovas Dis, Total Patn Care 2005"
f0463310 ="Cardiovas Dis, PC, Office Based 2010"
f0463308 ="Cardiovas Dis, PC, Office Based 2008"
f0463305 ="Cardiovas Dis, PC, Office Based 2005"
f1250510 ="Cardiovas Dis, PC, Hosp Resdnt 2010"
f1250508 ="Cardiovas Dis, PC, Hosp Resdnt 2008"
f1250505 ="Cardiovas Dis, PC, Hosp Resdnt 2005"
f0463510 ="Cardiovas Dis, PC, Hosp FT Stf 2010"
f0463508 ="Cardiovas Dis, PC, Hosp FT Stf 2008"
f0463505 ="Cardiovas Dis, PC, Hosp FT Stf 2005"
f0997710 ="Cardiovas Dis, Administration 2010"
f0997708 ="Cardiovas Dis, Administration 2008"
f0997705 ="Cardiovas Dis, Administration 2005"
f0997810 ="Cardiovas Dis, Teaching 2010"
f0997808 ="Cardiovas Dis, Teaching 2008"
f0997805 ="Cardiovas Dis, Teaching 2005"
f1108610 ="Cardiovas Dis, Research 2010"
f1108608 ="Cardiovas Dis, Research 2008"
f1108605 ="Cardiovas Dis, Research 2005"
f0998010 ="Cardiovas Dis, Other 2010"
f0998008 ="Cardiovas Dis, Other 2008"
f0998005 ="Cardiovas Dis, Other 2005"
f0463610 ="Dermatology, Total 2010"
f0463608 ="Dermatology, Total 2008"
f0463605 ="Dermatology, Total 2005"
f1108710 ="Dermatology, Total Patnt Care 2010"
f1108708 ="Dermatology, Total Patnt Care 2008"
f1108705 ="Dermatology, Total Patnt Care 2005"
f0463810 ="Dermatology, PC, Office Based 2010"
f0463808 ="Dermatology, PC, Office Based 2008"
f0463805 ="Dermatology, PC, Office Based 2005"
f1250610 ="Dermatology, PC, Hosp Resident 2010"
f1250608 ="Dermatology, PC, Hosp Resident 2008"
f1250605 ="Dermatology, PC, Hosp Resident 2005"
f0464010 ="Dermatology, PC, Hosp FT Staff 2010"
f0464008 ="Dermatology, PC, Hosp FT Staff 2008"
f0464005 ="Dermatology, PC, Hosp FT Staff 2005"
f0998310 ="Dermatology, Administration 2010"
f0998308 ="Dermatology, Administration 2008"
f0998305 ="Dermatology, Administration 2005"
f0998410 ="Dermatology, Teaching 2010"
f0998408 ="Dermatology, Teaching 2008"
f0998405 ="Dermatology, Teaching 2005"
f1108910 ="Dermatology, Research 2010"
f1108908 ="Dermatology, Research 2008"
f1108905 ="Dermatology, Research 2005"
f0998610 ="Dermatology, Other 2010"
f0998608 ="Dermatology, Other 2008"
f0998605 ="Dermatology, Other 2005"
f0464110 ="Gastroenterology, Total 2010"
f0464108 ="Gastroenterology, Total 2008"
f0464105 ="Gastroenterology, Total 2005"
f1109010 ="Gastroenterology, Total Ptn Cr 2010"
f1109008 ="Gastroenterology, Total Ptn Cr 2008"
f1109005 ="Gastroenterology, Total Ptn Cr 2005"
f0464310 ="Gastroenterology, PC, Off Based 2010"
f0464308 ="Gastroenterology, PC, Off Based 2008"
f0464305 ="Gastroenterology, PC, Off Based 2005"
f1250710 ="Gastroenterology, PC, Hosp Res 2010"
f1250708 ="Gastroenterology, PC, Hosp Res 2008"
f1250705 ="Gastroenterology, PC, Hosp Res 2005"
f0464510 ="Gastroenterology, PC,Hsp FT Stf 2010"
f0464508 ="Gastroenterology, PC,Hsp FT Stf 2008"
f0464505 ="Gastroenterology, PC,Hsp FT Stf 2005"
f0998910 ="Gastroenterology, Administrat 2010"
f0998908 ="Gastroenterology, Administrat 2008"
f0998905 ="Gastroenterology, Administrat 2005"
f0999010 ="Gastroenterology, Teaching 2010"
f0999008 ="Gastroenterology, Teaching 2008"
f0999005 ="Gastroenterology, Teaching 2005"
f1109210 ="Gastroenterology, Research 2010"
f1109208 ="Gastroenterology, Research 2008"
f1109205 ="Gastroenterology, Research 2005"
f0999210 ="Gastroenterology, Other 2010"
f0999208 ="Gastroenterology, Other 2008"
f0999205 ="Gastroenterology, Other 2005"
f1120810 ="General Internal Med, Total 2010"
f1120808 ="General Internal Med, Total 2008"
f1120805 ="General Internal Med, Total 2005"
f1109310 ="Gnrl Int Med, Total Patn Care 2010"
f1109308 ="Gnrl Int Med, Total Patn Care 2008"
f1109305 ="Gnrl Int Med, Total Patn Care 2005"
f1120910 ="Gnrl Int Med, PC, Office Based 2010"
f1120908 ="Gnrl Int Med, PC, Office Based 2008"
f1120905 ="Gnrl Int Med, PC, Office Based 2005"
f1250810 ="Gnrl Int Med, PC, Hosp Resident 2010"
f1250808 ="Gnrl Int Med, PC, Hosp Resident 2008"
f1250805 ="Gnrl Int Med, PC, Hosp Resident 2005"
f1121110 ="Gnrl Int Med, PC, Hosp FT Staff 2010"
f1121108 ="Gnrl Int Med, PC, Hosp FT Staff 2008"
f1121105 ="Gnrl Int Med, PC, Hosp FT Staff 2005"
f1121210 ="General Int Med,Administration 2010"
f1121208 ="General Int Med,Administration 2008"
f1121205 ="General Int Med,Administration 2005"
f1121310 ="General Int Med, Teaching 2010"
f1121308 ="General Int Med, Teaching 2008"
f1121305 ="General Int Med, Teaching 2005"
f1109510 ="General Int Med, Research 2010"
f1109508 ="General Int Med, Research 2008"
f1109505 ="General Int Med, Research 2005"
f1121410 ="General Int Med, Other 2010"
f1121408 ="General Int Med, Other 2008"
f1121405 ="General Int Med, Other 2005"
f1172410 ="Int Med Subspecs, Total 2010"
f1172408 ="Int Med Subspecs, Total 2008"
f1172405 ="Int Med Subspecs, Total 2005"
f1172510 ="Int Med Subspecs, Tot Patn Care 2010"
f1172508 ="Int Med Subspecs, Tot Patn Care 2008"
f1172505 ="Int Med Subspecs, Tot Patn Care 2005"
f1172610 ="Int Med Subspecs, PC, Off Based 2010"
f1172608 ="Int Med Subspecs, PC, Off Based 2008"
f1172605 ="Int Med Subspecs, PC, Off Based 2005"
f1250910 ="Int Med Subspecs, PC, Hosp Res 2010"
f1250908 ="Int Med Subspecs, PC, Hosp Res 2008"
f1250905 ="Int Med Subspecs, PC, Hosp Res 2005"
f1172910 ="Int Med Subspecs,PC,Hosp FT Stf 2010"
f1172908 ="Int Med Subspecs,PC,Hosp FT Stf 2008"
f1172905 ="Int Med Subspecs,PC,Hosp FT Stf 2005"
f1173010 ="Int Med Subspecs, Administrat 2010"
f1173008 ="Int Med Subspecs, Administrat 2008"
f1173005 ="Int Med Subspecs, Administrat 2005"
f1173110 ="Int Med Subspecs, Teaching 2010"
f1173108 ="Int Med Subspecs, Teaching 2008"
f1173105 ="Int Med Subspecs, Teaching 2005"
f1173210 ="Int Med Subspecs, Research 2010"
f1173208 ="Int Med Subspecs, Research 2008"
f1173205 ="Int Med Subspecs, Research 2005"
f1173310 ="Int Med Subspecs, Other 2010"
f1173308 ="Int Med Subspecs, Other 2008"
f1173305 ="Int Med Subspecs, Other 2005"
f1170410 ="Pediatrics, General, Total 2010"
f1170408 ="Pediatrics, General, Total 2008"
f1170405 ="Pediatrics, General, Total 2005"
f1170510 ="Pediatrics,Gen,Tot Patient Care 2010"
f1170508 ="Pediatrics,Gen,Tot Patient Care 2008"
f1170505 ="Pediatrics,Gen,Tot Patient Care 2005"
f1170610 ="Pediatrics,Gen,PC, Office Based 2010"
f1170608 ="Pediatrics,Gen,PC, Office Based 2008"
f1170605 ="Pediatrics,Gen,PC, Office Based 2005"
f1251010 ="Pediatrics,Gen,PC,Hosp Resident 2010"
f1251008 ="Pediatrics,Gen,PC,Hosp Resident 2008"
f1251005 ="Pediatrics,Gen,PC,Hosp Resident 2005"
f1170910 ="Pediatrics,Gen,PC,Hosp FT Staff 2010"
f1170908 ="Pediatrics,Gen,PC,Hosp FT Staff 2008"
f1170905 ="Pediatrics,Gen,PC,Hosp FT Staff 2005"
f1171010 ="Pediatrics,Gen, Administration 2010"
f1171008 ="Pediatrics,Gen, Administration 2008"
f1171005 ="Pediatrics,Gen, Administration 2005"
f1171110 ="Pediatrics,Gen, Teaching 2010"
f1171108 ="Pediatrics,Gen, Teaching 2008"
f1171105 ="Pediatrics,Gen, Teaching 2005"
f1171210 ="Pediatrics,Gen, Research 2010"
f1171208 ="Pediatrics,Gen, Research 2008"
f1171205 ="Pediatrics,Gen, Research 2005"
f1171310 ="Pediatrics,Gen, Other 2010"
f1171308 ="Pediatrics,Gen, Other 2008"
f1171305 ="Pediatrics,Gen, Other 2005"
f1171410 ="Ped Subspecs, Total 2010"
f1171408 ="Ped Subspecs, Total 2008"
f1171405 ="Ped Subspecs, Total 2005"
f1171510 ="Ped Subspecs, Total Patn Care 2010"
f1171508 ="Ped Subspecs, Total Patn Care 2008"
f1171505 ="Ped Subspecs, Total Patn Care 2005"
f1171610 ="Ped Subspecs, PC, Office Based 2010"
f1171608 ="Ped Subspecs, PC, Office Based 2008"
f1171605 ="Ped Subspecs, PC, Office Based 2005"
f1251110 ="Ped Subspecs, PC, Hosp Resident 2010"
f1251108 ="Ped Subspecs, PC, Hosp Resident 2008"
f1251105 ="Ped Subspecs, PC, Hosp Resident 2005"
f1171910 ="Ped Subspecs, PC, Hosp FT Staff 2010"
f1171908 ="Ped Subspecs, PC, Hosp FT Staff 2008"
f1171905 ="Ped Subspecs, PC, Hosp FT Staff 2005"
f1172010 ="Ped Subspecs, Administration 2010"
f1172008 ="Ped Subspecs, Administration 2008"
f1172005 ="Ped Subspecs, Administration 2005"
f1172110 ="Ped Subspecs, Teaching 2010"
f1172108 ="Ped Subspecs, Teaching 2008"
f1172105 ="Ped Subspecs, Teaching 2005"
f1172210 ="Ped Subspecs, Research 2010"
f1172208 ="Ped Subspecs, Research 2008"
f1172205 ="Ped Subspecs, Research 2005"
f1172310 ="Ped Subspecs, Other 2010"
f1172308 ="Ped Subspecs, Other 2008"
f1172305 ="Ped Subspecs, Other 2005"
f0466110 ="Ped Cardiolgy, Total 2010"
f0466108 ="Ped Cardiolgy, Total 2008"
f0466105 ="Ped Cardiolgy, Total 2005"
f1111210 ="Ped Cardiolgy, Total Patn Care 2010"
f1111208 ="Ped Cardiolgy, Total Patn Care 2008"
f1111205 ="Ped Cardiolgy, Total Patn Care 2005"
f0466310 ="Ped Cardiolgy, PC, Office Based 2010"
f0466308 ="Ped Cardiolgy, PC, Office Based 2008"
f0466305 ="Ped Cardiolgy, PC, Office Based 2005"
f1251210 ="Ped Cardiolgy, PC, Hosp Resdnt 2010"
f1251208 ="Ped Cardiolgy, PC, Hosp Resdnt 2008"
f1251205 ="Ped Cardiolgy, PC, Hosp Resdnt 2005"
f0466510 ="Ped Cardiolgy, PC, Hosp FT Stf 2010"
f0466508 ="Ped Cardiolgy, PC, Hosp FT Stf 2008"
f0466505 ="Ped Cardiolgy, PC, Hosp FT Stf 2005"
f1001310 ="Ped Cardiolgy, Administration 2010"
f1001308 ="Ped Cardiolgy, Administration 2008"
f1001305 ="Ped Cardiolgy, Administration 2005"
f1001410 ="Ped Cardiolgy, Teaching 2010"
f1001408 ="Ped Cardiolgy, Teaching 2008"
f1001405 ="Ped Cardiolgy, Teaching 2005"
f1111410 ="Ped Cardiolgy, Research 2010"
f1111408 ="Ped Cardiolgy, Research 2008"
f1111405 ="Ped Cardiolgy, Research 2005"
f1001610 ="Ped Cardiolgy, Other 2010"
f1001608 ="Ped Cardiolgy, Other 2008"
f1001605 ="Ped Cardiolgy, Other 2005"
f0466610 ="Pulmonary Dis, Total 2010"
f0466608 ="Pulmonary Dis, Total 2008"
f0466605 ="Pulmonary Dis, Total 2005"
f1111510 ="Pulmonary Dis, Total Patn Care 2010"
f1111508 ="Pulmonary Dis, Total Patn Care 2008"
f1111505 ="Pulmonary Dis, Total Patn Care 2005"
f0466810 ="Pulmonary Dis, PC, Office Based 2010"
f0466808 ="Pulmonary Dis, PC, Office Based 2008"
f0466805 ="Pulmonary Dis, PC, Office Based 2005"
f1251310 ="Pulmonary Dis, PC, Hosp Resdnt 2010"
f1251308 ="Pulmonary Dis, PC, Hosp Resdnt 2008"
f1251305 ="Pulmonary Dis, PC, Hosp Resdnt 2005"
f0467010 ="Pulmonary Dis, PC, Hosp FT Stf 2010"
f0467008 ="Pulmonary Dis, PC, Hosp FT Stf 2008"
f0467005 ="Pulmonary Dis, PC, Hosp FT Stf 2005"
f1001910 ="Pulmonary Dis, Administration 2010"
f1001908 ="Pulmonary Dis, Administration 2008"
f1001905 ="Pulmonary Dis, Administration 2005"
f1002010 ="Pulmonary Dis, Teaching 2010"
f1002008 ="Pulmonary Dis, Teaching 2008"
f1002005 ="Pulmonary Dis, Teaching 2005"
f1111710 ="Pulmonary Dis, Research 2010"
f1111708 ="Pulmonary Dis, Research 2008"
f1111705 ="Pulmonary Dis, Research 2005"
f1002210 ="Pulmonary Dis, Other 2010"
f1002208 ="Pulmonary Dis, Other 2008"
f1002205 ="Pulmonary Dis, Other 2005"
f0467110 ="Surg Specs Tot, Total 2010"
f0467108 ="Surg Specs Tot, Total 2008"
f0467105 ="Surg Specs Tot, Total 2005"
f1111810 ="Surg Specs Tot, Total Patn Care 2010"
f1111808 ="Surg Specs Tot, Total Patn Care 2008"
f1111805 ="Surg Specs Tot, Total Patn Care 2005"
f0886210 ="Surg Specs Tot, PC, Office Bsd 2010"
f0886208 ="Surg Specs Tot, PC, Office Bsd 2008"
f0886207 ="Surg Specs Tot, PC, Office Bsd 2007"
f0886206 ="Surg Specs Tot, PC, Office Bsd 2006"
f0886205 ="Surg Specs Tot, PC, Office Bsd 2005"
f0886200 ="Surg Specs Tot, PC, Office Bsd 2000"
f0886295 ="Surg Specs Tot, PC, Office Bsd 1995"
f0886290 ="Surg Specs Tot, PC, Office Bsd 1990"
f1251410 ="Surg Specs Tot, PC, Hosp Resdnt 2010"
f1251408 ="Surg Specs Tot, PC, Hosp Resdnt 2008"
f1251405 ="Surg Specs Tot, PC, Hosp Resdnt 2005"
f0467510 ="Surg Specs Tot, PC, Hosp FT Stf 2010"
f0467508 ="Surg Specs Tot, PC, Hosp FT Stf 2008"
f0467505 ="Surg Specs Tot, PC, Hosp FT Stf 2005"
f0467610 ="Surg Specs Tot, Administration 2010"
f0467608 ="Surg Specs Tot, Administration 2008"
f0467605 ="Surg Specs Tot, Administration 2005"
f0467710 ="Surg Specs Tot, Teaching 2010"
f0467708 ="Surg Specs Tot, Teaching 2008"
f0467705 ="Surg Specs Tot, Teaching 2005"
f1112010 ="Surg Specs Tot, Research 2010"
f1112008 ="Surg Specs Tot, Research 2008"
f1112005 ="Surg Specs Tot, Research 2005"
f0467910 ="Surg Specs Tot, Other 2010"
f0467908 ="Surg Specs Tot, Other 2008"
f0467905 ="Surg Specs Tot, Other 2005"
f0468010 ="Genrl Surg, Total 2010"
f0468008 ="Genrl Surg, Total 2008"
f0468005 ="Genrl Surg, Total 2005"
f1112110 ="Genrl Surg, Total Patient Care 2010"
f1112108 ="Genrl Surg, Total Patient Care 2008"
f1112105 ="Genrl Surg, Total Patient Care 2005"
f0468210 ="Genrl Surg, PC, Office Based 2010"
f0468208 ="Genrl Surg, PC, Office Based 2008"
f0468205 ="Genrl Surg, PC, Office Based 2005"
f1251510 ="Genrl Surg, PC, Hosp Residents 2010"
f1251508 ="Genrl Surg, PC, Hosp Residents 2008"
f1251505 ="Genrl Surg, PC, Hosp Residents 2005"
f0468410 ="Genrl Surg, PC, Hosp FT Staff  2010"
f0468408 ="Genrl Surg, PC, Hosp FT Staff  2008"
f0468405 ="Genrl Surg, PC, Hosp FT Staff  2005"
f1002710 ="Genrl Surg, Administration 2010"
f1002708 ="Genrl Surg, Administration 2008"
f1002705 ="Genrl Surg, Administration 2005"
f1002810 ="Genrl Surg, Teaching 2010"
f1002808 ="Genrl Surg, Teaching 2008"
f1002805 ="Genrl Surg, Teaching 2005"
f1112310 ="Genrl Surg, Research 2010"
f1112308 ="Genrl Surg, Research 2008"
f1112305 ="Genrl Surg, Research 2005"
f1003010 ="Genrl Surg, Other 2010"
f1003008 ="Genrl Surg, Other 2008"
f1003005 ="Genrl Surg, Other 2005"
f0468510 ="Neurolgcal Surg, Total 2010"
f0468508 ="Neurolgcal Surg, Total 2008"
f0468505 ="Neurolgcal Surg, Total 2005"
f1112410 ="Neurolgcal Surg, Total Ptn Care 2010"
f1112408 ="Neurolgcal Surg, Total Ptn Care 2008"
f1112405 ="Neurolgcal Surg, Total Ptn Care 2005"
f0468710 ="Neurolgcal Surg, PC, Office Bsd 2010"
f0468708 ="Neurolgcal Surg, PC, Office Bsd 2008"
f0468705 ="Neurolgcal Surg, PC, Office Bsd 2005"
f1251610 ="Neurolgcal Surg, PC, Hosp Res 2010"
f1251608 ="Neurolgcal Surg, PC, Hosp Res 2008"
f1251605 ="Neurolgcal Surg, PC, Hosp Res 2005"
f0468910 ="Neurolgcal Surg, PC, Hsp FT Stf 2010"
f0468908 ="Neurolgcal Surg, PC, Hsp FT Stf 2008"
f0468905 ="Neurolgcal Surg, PC, Hsp FT Stf 2005"
f1003310 ="Neurolgcal Surg, Administration 2010"
f1003308 ="Neurolgcal Surg, Administration 2008"
f1003305 ="Neurolgcal Surg, Administration 2005"
f1003410 ="Neurolgcal Surg, Teaching 2010"
f1003408 ="Neurolgcal Surg, Teaching 2008"
f1003405 ="Neurolgcal Surg, Teaching 2005"
f1112610 ="Neurolgcal Surg, Research 2010"
f1112608 ="Neurolgcal Surg, Research 2008"
f1112605 ="Neurolgcal Surg, Research 2005"
f1003610 ="Neurolgcal Surg, Other 2010"
f1003608 ="Neurolgcal Surg, Other 2008"
f1003605 ="Neurolgcal Surg, Other 2005"
f1168410 ="Ob-Gyn, General, Total 2010"
f1168408 ="Ob-Gyn, General, Total 2008"
f1168405 ="Ob-Gyn, General, Total 2005"
f1168510 ="Ob-Gyn, Gen, Total Patient Care 2010"
f1168508 ="Ob-Gyn, Gen, Total Patient Care 2008"
f1168505 ="Ob-Gyn, Gen, Total Patient Care 2005"
f1168610 ="Ob-Gyn, Gen, PC, Office Based 2010"
f1168608 ="Ob-Gyn, Gen, PC, Office Based 2008"
f1168605 ="Ob-Gyn, Gen, PC, Office Based 2005"
f1251710 ="Ob-Gyn, Gen, PC, Hosp Residents 2010"
f1251708 ="Ob-Gyn, Gen, PC, Hosp Residents 2008"
f1251705 ="Ob-Gyn, Gen, PC, Hosp Residents 2005"
f1168910 ="Ob-Gyn, Gen, PC, Hosp FT Staff  2010"
f1168908 ="Ob-Gyn, Gen, PC, Hosp FT Staff  2008"
f1168905 ="Ob-Gyn, Gen, PC, Hosp FT Staff  2005"
f1169010 ="Ob-Gyn, General, Administration 2010"
f1169008 ="Ob-Gyn, General, Administration 2008"
f1169005 ="Ob-Gyn, General, Administration 2005"
f1169110 ="Ob-Gyn, General, Teaching 2010"
f1169108 ="Ob-Gyn, General, Teaching 2008"
f1169105 ="Ob-Gyn, General, Teaching 2005"
f1169210 ="Ob-Gyn, General, Research 2010"
f1169208 ="Ob-Gyn, General, Research 2008"
f1169205 ="Ob-Gyn, General, Research 2005"
f1169310 ="Ob-Gyn, General, Other 2010"
f1169308 ="Ob-Gyn, General, Other 2008"
f1169305 ="Ob-Gyn, General, Other 2005"
f1169410 ="Ob-Gyn Subspecs, Total 2010"
f1169408 ="Ob-Gyn Subspecs, Total 2008"
f1169405 ="Ob-Gyn Subspecs, Total 2005"
f1169510 ="Ob-Gyn Subspecs,Tot Patient Cr 2010"
f1169508 ="Ob-Gyn Subspecs,Tot Patient Cr 2008"
f1169505 ="Ob-Gyn Subspecs,Tot Patient Cr 2005"
f1169610 ="Ob-Gyn Subspecs,PC,Off Based 2010"
f1169608 ="Ob-Gyn Subspecs,PC,Off Based 2008"
f1169605 ="Ob-Gyn Subspecs,PC,Off Based 2005"
f1251810 ="Ob-Gyn Subspecs,PC,Hosp Residnt 2010"
f1251808 ="Ob-Gyn Subspecs,PC,Hosp Residnt 2008"
f1251805 ="Ob-Gyn Subspecs,PC,Hosp Residnt 2005"
f1169910 ="Ob-Gyn Subspecs,PC,Hosp FT Stf  2010"
f1169908 ="Ob-Gyn Subspecs,PC,Hosp FT Stf  2008"
f1169905 ="Ob-Gyn Subspecs,PC,Hosp FT Stf  2005"
f1170010 ="Ob-Gyn Subspecs, Administration 2010"
f1170008 ="Ob-Gyn Subspecs, Administration 2008"
f1170005 ="Ob-Gyn Subspecs, Administration 2005"
f1170110 ="Ob-Gyn Subspecs, Teaching 2010"
f1170108 ="Ob-Gyn Subspecs, Teaching 2008"
f1170105 ="Ob-Gyn Subspecs, Teaching 2005"
f1170210 ="Ob-Gyn Subspecs, Research 2010"
f1170208 ="Ob-Gyn Subspecs, Research 2008"
f1170205 ="Ob-Gyn Subspecs, Research 2005"
f1170310 ="Ob-Gyn Subspecs, Other 2010"
f1170308 ="Ob-Gyn Subspecs, Other 2008"
f1170305 ="Ob-Gyn Subspecs, Other 2005"
f0469510 ="Ophthalmolgy, Total 2010"
f0469508 ="Ophthalmolgy, Total 2008"
f0469505 ="Ophthalmolgy, Total 2005"
f1113010 ="Ophthalmolgy, Total Patn Care 2010"
f1113008 ="Ophthalmolgy, Total Patn Care 2008"
f1113005 ="Ophthalmolgy, Total Patn Care 2005"
f0469710 ="Ophthalmolgy, PC, Office Based 2010"
f0469708 ="Ophthalmolgy, PC, Office Based 2008"
f0469705 ="Ophthalmolgy, PC, Office Based 2005"
f1251910 ="Ophthalmolgy, PC, Hosp Resdnts 2010"
f1251908 ="Ophthalmolgy, PC, Hosp Resdnts 2008"
f1251905 ="Ophthalmolgy, PC, Hosp Resdnts 2005"
f0469910 ="Ophthalmolgy, PC, Hosp FT Staff 2010"
f0469908 ="Ophthalmolgy, PC, Hosp FT Staff 2008"
f0469905 ="Ophthalmolgy, PC, Hosp FT Staff 2005"
f1004510 ="Ophthalmolgy, Administration 2010"
f1004508 ="Ophthalmolgy, Administration 2008"
f1004505 ="Ophthalmolgy, Administration 2005"
f1004610 ="Ophthalmolgy, Teaching 2010"
f1004608 ="Ophthalmolgy, Teaching 2008"
f1004605 ="Ophthalmolgy, Teaching 2005"
f1113210 ="Ophthalmolgy, Research 2010"
f1113208 ="Ophthalmolgy, Research 2008"
f1113205 ="Ophthalmolgy, Research 2005"
f1004810 ="Ophthalmolgy, Other 2010"
f1004808 ="Ophthalmolgy, Other 2008"
f1004805 ="Ophthalmolgy, Other 2005"
f0470010 ="Orthopedic Surg, Total 2010"
f0470008 ="Orthopedic Surg, Total 2008"
f0470005 ="Orthopedic Surg, Total 2005"
f1113310 ="Orthopedic Surg, Total Ptn Care 2010"
f1113308 ="Orthopedic Surg, Total Ptn Care 2008"
f1113305 ="Orthopedic Surg, Total Ptn Care 2005"
f0470210 ="Orthopedic Surg, PC, Off Based 2010"
f0470208 ="Orthopedic Surg, PC, Off Based 2008"
f0470205 ="Orthopedic Surg, PC, Off Based 2005"
f1252010 ="Orthopedic Surg, PC, Hosp Res 2010"
f1252008 ="Orthopedic Surg, PC, Hosp Res 2008"
f1252005 ="Orthopedic Surg, PC, Hosp Res 2005"
f0470410 ="Orthopedic Surg, PC, Hsp FT Stf 2010"
f0470408 ="Orthopedic Surg, PC, Hsp FT Stf 2008"
f0470405 ="Orthopedic Surg, PC, Hsp FT Stf 2005"
f1005110 ="Orthopedic Surg, Administration 2010"
f1005108 ="Orthopedic Surg, Administration 2008"
f1005105 ="Orthopedic Surg, Administration 2005"
f1005210 ="Orthopedic Surg, Teaching 2010"
f1005208 ="Orthopedic Surg, Teaching 2008"
f1005205 ="Orthopedic Surg, Teaching 2005"
f1113510 ="Orthopedic Surg, Research 2010"
f1113508 ="Orthopedic Surg, Research 2008"
f1113505 ="Orthopedic Surg, Research 2005"
f1005410 ="Orthopedic Surg, Other 2010"
f1005408 ="Orthopedic Surg, Other 2008"
f1005405 ="Orthopedic Surg, Other 2005"
f0470510 ="Otolaryngolgy, Total 2010"
f0470508 ="Otolaryngolgy, Total 2008"
f0470505 ="Otolaryngolgy, Total 2005"
f1113610 ="Otolaryngolgy, Total Ptn Care 2010"
f1113608 ="Otolaryngolgy, Total Ptn Care 2008"
f1113605 ="Otolaryngolgy, Total Ptn Care 2005"
f0470710 ="Otolaryngolgy, PC, Office Based 2010"
f0470708 ="Otolaryngolgy, PC, Office Based 2008"
f0470705 ="Otolaryngolgy, PC, Office Based 2005"
f1252110 ="Otolaryngolgy, PC, Hosp Resdnt 2010"
f1252108 ="Otolaryngolgy, PC, Hosp Resdnt 2008"
f1252105 ="Otolaryngolgy, PC, Hosp Resdnt 2005"
f0470910 ="Otolaryngolgy, PC, Hosp FT Stf 2010"
f0470908 ="Otolaryngolgy, PC, Hosp FT Stf 2008"
f0470905 ="Otolaryngolgy, PC, Hosp FT Stf 2005"
f1005710 ="Otolaryngolgy, Administration 2010"
f1005708 ="Otolaryngolgy, Administration 2008"
f1005705 ="Otolaryngolgy, Administration 2005"
f1005810 ="Otolaryngolgy, Teaching 2010"
f1005808 ="Otolaryngolgy, Teaching 2008"
f1005805 ="Otolaryngolgy, Teaching 2005"
f1113810 ="Otolaryngolgy, Research 2010"
f1113808 ="Otolaryngolgy, Research 2008"
f1113805 ="Otolaryngolgy, Research 2005"
f1006010 ="Otolaryngolgy, Other 2010"
f1006008 ="Otolaryngolgy, Other 2008"
f1006005 ="Otolaryngolgy, Other 2005"
f0471010 ="Plastic Surg, Total 2010"
f0471008 ="Plastic Surg, Total 2008"
f0471005 ="Plastic Surg, Total 2005"
f1113910 ="Plastic Surg, Total Patn Care 2010"
f1113908 ="Plastic Surg, Total Patn Care 2008"
f1113905 ="Plastic Surg, Total Patn Care 2005"
f0471210 ="Plastic Surg, PC, Office Based 2010"
f0471208 ="Plastic Surg, PC, Office Based 2008"
f0471205 ="Plastic Surg, PC, Office Based 2005"
f1252210 ="Plastic Surg, PC, Hosp Resident 2010"
f1252208 ="Plastic Surg, PC, Hosp Resident 2008"
f1252205 ="Plastic Surg, PC, Hosp Resident 2005"
f0471410 ="Plastic Surg, PC, Hosp FT Staff 2010"
f0471408 ="Plastic Surg, PC, Hosp FT Staff 2008"
f0471405 ="Plastic Surg, PC, Hosp FT Staff 2005"
f1006310 ="Plastic Surg, Administration 2010"
f1006308 ="Plastic Surg, Administration 2008"
f1006305 ="Plastic Surg, Administration 2005"
f1006410 ="Plastic Surg, Teaching 2010"
f1006408 ="Plastic Surg, Teaching 2008"
f1006405 ="Plastic Surg, Teaching 2005"
f1114110 ="Plastic Surg, Research 2010"
f1114108 ="Plastic Surg, Research 2008"
f1114105 ="Plastic Surg, Research 2005"
f1006610 ="Plastic Surg, Other 2010"
f1006608 ="Plastic Surg, Other 2008"
f1006605 ="Plastic Surg, Other 2005"
f0471510 ="Colon/Rectal Srg, Total 2010"
f0471508 ="Colon/Rectal Srg, Total 2008"
f0471505 ="Colon/Rectal Srg, Total 2005"
f1114210 ="Colon/Rectal Srg, Total Ptn Cr 2010"
f1114208 ="Colon/Rectal Srg, Total Ptn Cr 2008"
f1114205 ="Colon/Rectal Srg, Total Ptn Cr 2005"
f0471710 ="Colon/Rectal Srg, PC, Off Based 2010"
f0471708 ="Colon/Rectal Srg, PC, Off Based 2008"
f0471705 ="Colon/Rectal Srg, PC, Off Based 2005"
f1252310 ="Colon/Rectal Srg, PC, Hosp Res 2010"
f1252308 ="Colon/Rectal Srg, PC, Hosp Res 2008"
f1252305 ="Colon/Rectal Srg, PC, Hosp Res 2005"
f0471910 ="Colon/Rectal Srg, PC,Hsp FT Stf 2010"
f0471908 ="Colon/Rectal Srg, PC,Hsp FT Stf 2008"
f0471905 ="Colon/Rectal Srg, PC,Hsp FT Stf 2005"
f1006910 ="Colon/Rectal Srg, Administrat 2010"
f1006908 ="Colon/Rectal Srg, Administrat 2008"
f1006905 ="Colon/Rectal Srg, Administrat 2005"
f1007010 ="Colon/Rectal Srg, Teaching 2010"
f1007008 ="Colon/Rectal Srg, Teaching 2008"
f1007005 ="Colon/Rectal Srg, Teaching 2005"
f1114410 ="Colon/Rectal Srg, Research 2010"
f1114408 ="Colon/Rectal Srg, Research 2008"
f1114405 ="Colon/Rectal Srg, Research 2005"
f1007210 ="Colon/Rectal Srg, Other 2010"
f1007208 ="Colon/Rectal Srg, Other 2008"
f1007205 ="Colon/Rectal Srg, Other 2005"
f0472010 ="Thoracic Surg, Total 2010"
f0472008 ="Thoracic Surg, Total 2008"
f0472005 ="Thoracic Surg, Total 2005"
f1114510 ="Thoracic Surg, Total Patn Care 2010"
f1114508 ="Thoracic Surg, Total Patn Care 2008"
f1114505 ="Thoracic Surg, Total Patn Care 2005"
f0472210 ="Thoracic Surg, PC, Office Based 2010"
f0472208 ="Thoracic Surg, PC, Office Based 2008"
f0472205 ="Thoracic Surg, PC, Office Based 2005"
f1252410 ="Thoracic Surg, PC, Hosp Resdnt 2010"
f1252408 ="Thoracic Surg, PC, Hosp Resdnt 2008"
f1252405 ="Thoracic Surg, PC, Hosp Resdnt 2005"
f0472410 ="Thoracic Surg, PC, Hosp FT Stf 2010"
f0472408 ="Thoracic Surg, PC, Hosp FT Stf 2008"
f0472405 ="Thoracic Surg, PC, Hosp FT Stf 2005"
f1007510 ="Thoracic Surg, Administration 2010"
f1007508 ="Thoracic Surg, Administration 2008"
f1007505 ="Thoracic Surg, Administration 2005"
f1007610 ="Thoracic Surg, Teaching 2010"
f1007608 ="Thoracic Surg, Teaching 2008"
f1007605 ="Thoracic Surg, Teaching 2005"
f1114710 ="Thoracic Surg, Research 2010"
f1114708 ="Thoracic Surg, Research 2008"
f1114705 ="Thoracic Surg, Research 2005"
f1007810 ="Thoracic Surg, Other 2010"
f1007808 ="Thoracic Surg, Other 2008"
f1007805 ="Thoracic Surg, Other 2005"
f0472510 ="Urology, Total 2010"
f0472508 ="Urology, Total 2008"
f0472505 ="Urology, Total 2005"
f1114810 ="Urology, Total Patient Care 2010"
f1114808 ="Urology, Total Patient Care 2008"
f1114805 ="Urology, Total Patient Care 2005"
f0472710 ="Urology, PC, Office Based 2010"
f0472708 ="Urology, PC, Office Based 2008"
f0472705 ="Urology, PC, Office Based 2005"
f1252510 ="Urology, PC, Hosp Residents 2010"
f1252508 ="Urology, PC, Hosp Residents 2008"
f1252505 ="Urology, PC, Hosp Residents 2005"
f0472910 ="Urology, PC, Hosp FT Staff 2010"
f0472908 ="Urology, PC, Hosp FT Staff 2008"
f0472905 ="Urology, PC, Hosp FT Staff 2005"
f1008110 ="Urology, Administration 2010"
f1008108 ="Urology, Administration 2008"
f1008105 ="Urology, Administration 2005"
f1008210 ="Urology, Teaching 2010"
f1008208 ="Urology, Teaching 2008"
f1008205 ="Urology, Teaching 2005"
f1115010 ="Urology, Research 2010"
f1115008 ="Urology, Research 2008"
f1115005 ="Urology, Research 2005"
f1008410 ="Urology, Other 2010"
f1008408 ="Urology, Other 2008"
f1008405 ="Urology, Other 2005"
f0473010 ="Other Spec, Tot, Total 2010"
f0473008 ="Other Spec, Tot, Total 2008"
f0473005 ="Other Spec, Tot, Total 2005"
f1115110 ="Other Spec, Tot, Total Ptn Care 2010"
f1115108 ="Other Spec, Tot, Total Ptn Care 2008"
f1115105 ="Other Spec, Tot, Total Ptn Care 2005"
f0886310 ="Other Spec, Tot, PC, Off Based 2010"
f0886308 ="Other Spec, Tot, PC, Off Based 2008"
f0886307 ="Other Spec, Tot, PC, Off Based 2007"
f0886306 ="Other Spec, Tot, PC, Off Based 2006"
f0886305 ="Other Spec, Tot, PC, Off Based 2005"
f0886300 ="Other Spec, Tot, PC, Off Based 2000"
f0886395 ="Other Spec, Tot, PC, Off Based 1995"
f0886390 ="Other Spec, Tot, PC, Off Based 1990"
f1252610 ="Other Spec, Tot, PC, Hosp Res 2010"
f1252608 ="Other Spec, Tot, PC, Hosp Res 2008"
f1252605 ="Other Spec, Tot, PC, Hosp Res 2005"
f0473310 ="Other Spec, Tot, PC, Hsp FT Stf 2010"
f0473308 ="Other Spec, Tot, PC, Hsp FT Stf 2008"
f0473305 ="Other Spec, Tot, PC, Hsp FT Stf 2005"
f0473410 ="Other Spec, Tot, Administration 2010"
f0473408 ="Other Spec, Tot, Administration 2008"
f0473405 ="Other Spec, Tot, Administration 2005"
f0473510 ="Other Spec, Tot, Teaching 2010"
f0473508 ="Other Spec, Tot, Teaching 2008"
f0473505 ="Other Spec, Tot, Teaching 2005"
f1115310 ="Other Spec, Tot, Research 2010"
f1115308 ="Other Spec, Tot, Research 2008"
f1115305 ="Other Spec, Tot, Research 2005"
f0473710 ="Other Spec, Tot, Other 2010"
f0473708 ="Other Spec, Tot, Other 2008"
f0473705 ="Other Spec, Tot, Other 2005"
f0473810 ="Aerospace Med, Total 2010"
f0473808 ="Aerospace Med, Total 2008"
f0473805 ="Aerospace Med, Total 2005"
f1115410 ="Aerospace Med, Total Patn Care 2010"
f1115408 ="Aerospace Med, Total Patn Care 2008"
f1115405 ="Aerospace Med, Total Patn Care 2005"
f0474010 ="Aerospace Med, PC, Office Based 2010"
f0474008 ="Aerospace Med, PC, Office Based 2008"
f0474005 ="Aerospace Med, PC, Office Based 2005"
f1252710 ="Aerospace Med, PC, Hosp Resdnt 2010"
f1252708 ="Aerospace Med, PC, Hosp Resdnt 2008"
f1252705 ="Aerospace Med, PC, Hosp Resdnt 2005"
f0474210 ="Aerospace Med, PC, Hosp FT Stf 2010"
f0474208 ="Aerospace Med, PC, Hosp FT Stf 2008"
f0474205 ="Aerospace Med, PC, Hosp FT Stf 2005"
f1008910 ="Aerospace Med, Administration 2010"
f1008908 ="Aerospace Med, Administration 2008"
f1008905 ="Aerospace Med, Administration 2005"
f1009010 ="Aerospace Med, Teaching 2010"
f1009008 ="Aerospace Med, Teaching 2008"
f1009005 ="Aerospace Med, Teaching 2005"
f1115610 ="Aerospace Med, Research 2010"
f1115608 ="Aerospace Med, Research 2008"
f1115605 ="Aerospace Med, Research 2005"
f1009210 ="Aerospace Med, Other 2010"
f1009208 ="Aerospace Med, Other 2008"
f1009205 ="Aerospace Med, Other 2005"
f0474310 ="Anesthesiolgy, Total 2010"
f0474308 ="Anesthesiolgy, Total 2008"
f0474305 ="Anesthesiolgy, Total 2005"
f1115710 ="Anesthesiolgy, Total Patn Care 2010"
f1115708 ="Anesthesiolgy, Total Patn Care 2008"
f1115705 ="Anesthesiolgy, Total Patn Care 2005"
f0474510 ="Anesthesiolgy, PC, Office Based 2010"
f0474508 ="Anesthesiolgy, PC, Office Based 2008"
f0474505 ="Anesthesiolgy, PC, Office Based 2005"
f1252810 ="Anesthesiolgy, PC, Hosp Resdnt 2010"
f1252808 ="Anesthesiolgy, PC, Hosp Resdnt 2008"
f1252805 ="Anesthesiolgy, PC, Hosp Resdnt 2005"
f0474710 ="Anesthesiolgy, PC, Hosp FT Stf 2010"
f0474708 ="Anesthesiolgy, PC, Hosp FT Stf 2008"
f0474705 ="Anesthesiolgy, PC, Hosp FT Stf 2005"
f1009510 ="Anesthesiolgy, Administration 2010"
f1009508 ="Anesthesiolgy, Administration 2008"
f1009505 ="Anesthesiolgy, Administration 2005"
f1009610 ="Anesthesiolgy, Teaching 2010"
f1009608 ="Anesthesiolgy, Teaching 2008"
f1009605 ="Anesthesiolgy, Teaching 2005"
f1115910 ="Anesthesiolgy, Research 2010"
f1115908 ="Anesthesiolgy, Research 2008"
f1115905 ="Anesthesiolgy, Research 2005"
f1009810 ="Anesthesiolgy, Other 2010"
f1009808 ="Anesthesiolgy, Other 2008"
f1009805 ="Anesthesiolgy, Other 2005"
f0474810 ="Child Psych, Total 2010"
f0474808 ="Child Psych, Total 2008"
f0474805 ="Child Psych, Total 2005"
f1116010 ="Child Psych, Total Patn Care 2010"
f1116008 ="Child Psych, Total Patn Care 2008"
f1116005 ="Child Psych, Total Patn Care 2005"
f0475010 ="Child Psych, PC, Office Based 2010"
f0475008 ="Child Psych, PC, Office Based 2008"
f0475005 ="Child Psych, PC, Office Based 2005"
f1252910 ="Child Psych, PC, Hosp Residents 2010"
f1252908 ="Child Psych, PC, Hosp Residents 2008"
f1252905 ="Child Psych, PC, Hosp Residents 2005"
f0475210 ="Child Psych, PC, Hosp FT Staff 2010"
f0475208 ="Child Psych, PC, Hosp FT Staff 2008"
f0475205 ="Child Psych, PC, Hosp FT Staff 2005"
f1010110 ="Child Psych, Administration 2010"
f1010108 ="Child Psych, Administration 2008"
f1010105 ="Child Psych, Administration 2005"
f1010210 ="Child Psych, Teaching 2010"
f1010208 ="Child Psych, Teaching 2008"
f1010205 ="Child Psych, Teaching 2005"
f1116210 ="Child Psych, Research 2010"
f1116208 ="Child Psych, Research 2008"
f1116205 ="Child Psych, Research 2005"
f1010410 ="Child Psych, Other 2010"
f1010408 ="Child Psych, Other 2008"
f1010405 ="Child Psych, Other 2005"
f0475310 ="Diag Radiolgy, Total 2010"
f0475308 ="Diag Radiolgy, Total 2008"
f0475305 ="Diag Radiolgy, Total 2005"
f1116310 ="Diag Radiolgy, Total Patn Care 2010"
f1116308 ="Diag Radiolgy, Total Patn Care 2008"
f1116305 ="Diag Radiolgy, Total Patn Care 2005"
f0475510 ="Diag Radiolgy, PC, Office Based 2010"
f0475508 ="Diag Radiolgy, PC, Office Based 2008"
f0475505 ="Diag Radiolgy, PC, Office Based 2005"
f1253010 ="Diag Radiolgy, PC, Hosp Resdnt 2010"
f1253008 ="Diag Radiolgy, PC, Hosp Resdnt 2008"
f1253005 ="Diag Radiolgy, PC, Hosp Resdnt 2005"
f0475710 ="Diag Radiolgy, PC, Hosp FT Stf 2010"
f0475708 ="Diag Radiolgy, PC, Hosp FT Stf 2008"
f0475705 ="Diag Radiolgy, PC, Hosp FT Stf 2005"
f1010710 ="Diag Radiolgy, Administration 2010"
f1010708 ="Diag Radiolgy, Administration 2008"
f1010705 ="Diag Radiolgy, Administration 2005"
f1010810 ="Diag Radiolgy, Teaching 2010"
f1010808 ="Diag Radiolgy, Teaching 2008"
f1010805 ="Diag Radiolgy, Teaching 2005"
f1116510 ="Diag Radiolgy, Research 2010"
f1116508 ="Diag Radiolgy, Research 2008"
f1116505 ="Diag Radiolgy, Research 2005"
f1011010 ="Diag Radiolgy, Other 2010"
f1011008 ="Diag Radiolgy, Other 2008"
f1011005 ="Diag Radiolgy, Other 2005"
f0982610 ="Emergency Med, Total 2010"
f0982608 ="Emergency Med, Total 2008"
f0982605 ="Emergency Med, Total 2005"
f1116610 ="Emergency Med, Total Patn Care 2010"
f1116608 ="Emergency Med, Total Patn Care 2008"
f1116605 ="Emergency Med, Total Patn Care 2005"
f0982810 ="Emergency Med, PC, Office Based 2010"
f0982808 ="Emergency Med, PC, Office Based 2008"
f0982805 ="Emergency Med, PC, Office Based 2005"
f1253110 ="Emergency Med, PC, Hosp Resdnt 2010"
f1253108 ="Emergency Med, PC, Hosp Resdnt 2008"
f1253105 ="Emergency Med, PC, Hosp Resdnt 2005"
f0983010 ="Emergency Med, PC, Hosp FT Stf 2010"
f0983008 ="Emergency Med, PC, Hosp FT Stf 2008"
f0983005 ="Emergency Med, PC, Hosp FT Stf 2005"
f1018510 ="Emergency Med, Administration 2010"
f1018508 ="Emergency Med, Administration 2008"
f1018505 ="Emergency Med, Administration 2005"
f1018610 ="Emergency Med, Teaching 2010"
f1018608 ="Emergency Med, Teaching 2008"
f1018605 ="Emergency Med, Teaching 2005"
f1116810 ="Emergency Med, Research 2010"
f1116808 ="Emergency Med, Research 2008"
f1116805 ="Emergency Med, Research 2005"
f1018810 ="Emergency Med, Other 2010"
f1018808 ="Emergency Med, Other 2008"
f1018805 ="Emergency Med, Other 2005"
f0475810 ="Forensic Path, Total 2010"
f0475808 ="Forensic Path, Total 2008"
f0475805 ="Forensic Path, Total 2005"
f1116910 ="Forensic Path, Total Patn Care 2010"
f1116908 ="Forensic Path, Total Patn Care 2008"
f1116905 ="Forensic Path, Total Patn Care 2005"
f0476010 ="Forensic Path, PC, Office Based 2010"
f0476008 ="Forensic Path, PC, Office Based 2008"
f0476005 ="Forensic Path, PC, Office Based 2005"
f1253210 ="Forensic Path, PC, Hosp Resdnt 2010"
f1253208 ="Forensic Path, PC, Hosp Resdnt 2008"
f1253205 ="Forensic Path, PC, Hosp Resdnt 2005"
f0476210 ="Forensic Path, PC, Hosp FT Stf 2010"
f0476208 ="Forensic Path, PC, Hosp FT Stf 2008"
f0476205 ="Forensic Path, PC, Hosp FT Stf 2005"
f1011310 ="Forensic Path, Administration 2010"
f1011308 ="Forensic Path, Administration 2008"
f1011305 ="Forensic Path, Administration 2005"
f1011410 ="Forensic Path, Teaching 2010"
f1011408 ="Forensic Path, Teaching 2008"
f1011405 ="Forensic Path, Teaching 2005"
f1117110 ="Forensic Path, Research 2010"
f1117108 ="Forensic Path, Research 2008"
f1117105 ="Forensic Path, Research 2005"
f1011610 ="Forensic Path, Other 2010"
f1011608 ="Forensic Path, Other 2008"
f1011605 ="Forensic Path, Other 2005"
f1242510 ="Medical Genetics, Total 2010"
f1242508 ="Medical Genetics, Total 2008"
f1242505 ="Medical Genetics, Total 2005"
f1243210 ="Medical Genetics,Tot Patnt Care 2010"
f1243208 ="Medical Genetics,Tot Patnt Care 2008"
f1243205 ="Medical Genetics,Tot Patnt Care 2005"
f1243310 ="Medical Genetics,PC,Off Based 2010"
f1243308 ="Medical Genetics,PC,Off Based 2008"
f1243305 ="Medical Genetics,PC,Off Based 2005"
f1253310 ="Medical Genetics,PC,Hosp Resdnt 2010"
f1253308 ="Medical Genetics,PC,Hosp Resdnt 2008"
f1253305 ="Medical Genetics,PC,Hosp Resdnt 2005"
f1243610 ="Medical Genetics,PC,Hosp FT Stf 2010"
f1243608 ="Medical Genetics,PC,Hosp FT Stf 2008"
f1243605 ="Medical Genetics,PC,Hosp FT Stf 2005"
f1243710 ="Medical Genetics,Administration 2010"
f1243708 ="Medical Genetics,Administration 2008"
f1243705 ="Medical Genetics,Administration 2005"
f1243810 ="Medical Genetics, Teaching 2010"
f1243808 ="Medical Genetics, Teaching 2008"
f1243805 ="Medical Genetics, Teaching 2005"
f1243910 ="Medical Genetics, Research 2010"
f1243908 ="Medical Genetics, Research 2008"
f1243905 ="Medical Genetics, Research 2005"
f1244010 ="Medical Genetics, Other 2010"
f1244008 ="Medical Genetics, Other 2008"
f1244005 ="Medical Genetics, Other 2005"
f0476310 ="Neurology, Total 2010"
f0476308 ="Neurology, Total 2008"
f0476305 ="Neurology, Total 2005"
f1117210 ="Neurology, Total Patient Care 2010"
f1117208 ="Neurology, Total Patient Care 2008"
f1117205 ="Neurology, Total Patient Care 2005"
f0476510 ="Neurology, PC, Office Based 2010"
f0476508 ="Neurology, PC, Office Based 2008"
f0476505 ="Neurology, PC, Office Based 2005"
f1253410 ="Neurology, PC, Hosp Residents 2010"
f1253408 ="Neurology, PC, Hosp Residents 2008"
f1253405 ="Neurology, PC, Hosp Residents 2005"
f0476710 ="Neurology, PC, Hosp FT Staff 2010"
f0476708 ="Neurology, PC, Hosp FT Staff 2008"
f0476705 ="Neurology, PC, Hosp FT Staff 2005"
f1011910 ="Neurology, Administration 2010"
f1011908 ="Neurology, Administration 2008"
f1011905 ="Neurology, Administration 2005"
f1012010 ="Neurology, Teaching 2010"
f1012008 ="Neurology, Teaching 2008"
f1012005 ="Neurology, Teaching 2005"
f1117410 ="Neurology, Research 2010"
f1117408 ="Neurology, Research 2008"
f1117405 ="Neurology, Research 2005"
f1012210 ="Neurology, Other 2010"
f1012208 ="Neurology, Other 2008"
f1012205 ="Neurology, Other 2005"
f0981610 ="Nuclear Med, Total 2010"
f0981608 ="Nuclear Med, Total 2008"
f0981605 ="Nuclear Med, Total 2005"
f1117510 ="Nuclear Med, Total Patient Care 2010"
f1117508 ="Nuclear Med, Total Patient Care 2008"
f1117505 ="Nuclear Med, Total Patient Care 2005"
f0981810 ="Nuclear Med, PC, Office Based 2010"
f0981808 ="Nuclear Med, PC, Office Based 2008"
f0981805 ="Nuclear Med, PC, Office Based 2005"
f1253510 ="Nuclear Med, PC, Hosp Residnts 2010"
f1253508 ="Nuclear Med, PC, Hosp Residnts 2008"
f1253505 ="Nuclear Med, PC, Hosp Residnts 2005"
f0982010 ="Nuclear Med, PC, Hosp FT Staff 2010"
f0982008 ="Nuclear Med, PC, Hosp FT Staff 2008"
f0982005 ="Nuclear Med, PC, Hosp FT Staff 2005"
f1016710 ="Nuclear Med, Administration 2010"
f1016708 ="Nuclear Med, Administration 2008"
f1016705 ="Nuclear Med, Administration 2005"
f1016810 ="Nuclear Med, Teaching 2010"
f1016808 ="Nuclear Med, Teaching 2008"
f1016805 ="Nuclear Med, Teaching 2005"
f1117710 ="Nuclear Med, Research 2010"
f1117708 ="Nuclear Med, Research 2008"
f1117705 ="Nuclear Med, Research 2005"
f1017010 ="Nuclear Med, Other 2010"
f1017008 ="Nuclear Med, Other 2008"
f1017005 ="Nuclear Med, Other 2005"
f0476810 ="Occupat Med, Total 2010"
f0476808 ="Occupat Med, Total 2008"
f0476805 ="Occupat Med, Total 2005"
f1117810 ="Occupat Med, Total Patnt Care 2010"
f1117808 ="Occupat Med, Total Patnt Care 2008"
f1117805 ="Occupat Med, Total Patnt Care 2005"
f0477010 ="Occupat Med, PC, Office Based 2010"
f0477008 ="Occupat Med, PC, Office Based 2008"
f0477005 ="Occupat Med, PC, Office Based 2005"
f1253610 ="Occupat Med, PC, Hosp Residents 2010"
f1253608 ="Occupat Med, PC, Hosp Residents 2008"
f1253605 ="Occupat Med, PC, Hosp Residents 2005"
f0477210 ="Occupat Med, PC, Hosp FT Staff 2010"
f0477208 ="Occupat Med, PC, Hosp FT Staff 2008"
f0477205 ="Occupat Med, PC, Hosp FT Staff 2005"
f1012510 ="Occupat Med, Administration 2010"
f1012508 ="Occupat Med, Administration 2008"
f1012505 ="Occupat Med, Administration 2005"
f1012610 ="Occupat Med, Teaching 2010"
f1012608 ="Occupat Med, Teaching 2008"
f1012605 ="Occupat Med, Teaching 2005"
f1118010 ="Occupat Med, Research 2010"
f1118008 ="Occupat Med, Research 2008"
f1118005 ="Occupat Med, Research 2005"
f1012810 ="Occupat Med, Other 2010"
f1012808 ="Occupat Med, Other 2008"
f1012805 ="Occupat Med, Other 2005"
f0477310 ="Psychiatry, Total 2010"
f0477308 ="Psychiatry, Total 2008"
f0477305 ="Psychiatry, Total 2005"
f1118110 ="Psychiatry, Total Patient Care 2010"
f1118108 ="Psychiatry, Total Patient Care 2008"
f1118105 ="Psychiatry, Total Patient Care 2005"
f0477510 ="Psychiatry, PC, Office Based 2010"
f0477508 ="Psychiatry, PC, Office Based 2008"
f0477505 ="Psychiatry, PC, Office Based 2005"
f1253710 ="Psychiatry, PC, Hosp Residents 2010"
f1253708 ="Psychiatry, PC, Hosp Residents 2008"
f1253705 ="Psychiatry, PC, Hosp Residents 2005"
f0477710 ="Psychiatry, PC, Hosp FT Staff  2010"
f0477708 ="Psychiatry, PC, Hosp FT Staff  2008"
f0477705 ="Psychiatry, PC, Hosp FT Staff  2005"
f1013110 ="Psychiatry, Administration 2010"
f1013108 ="Psychiatry, Administration 2008"
f1013105 ="Psychiatry, Administration 2005"
f1013210 ="Psychiatry, Teaching 2010"
f1013208 ="Psychiatry, Teaching 2008"
f1013205 ="Psychiatry, Teaching 2005"
f1118310 ="Psychiatry, Research 2010"
f1118308 ="Psychiatry, Research 2008"
f1118305 ="Psychiatry, Research 2005"
f1013410 ="Psychiatry, Other 2010"
f1013408 ="Psychiatry, Other 2008"
f1013405 ="Psychiatry, Other 2005"
f0477810 ="Path,Anat/Clinic,Total 2010"
f0477808 ="Path,Anat/Clinic,Total 2008"
f0477805 ="Path,Anat/Clinic,Total 2005"
f1118410 ="Path,Anat/Clinic,Tot Patient Cr 2010"
f1118408 ="Path,Anat/Clinic,Tot Patient Cr 2008"
f1118405 ="Path,Anat/Clinic,Tot Patient Cr 2005"
f0478010 ="Path,Anat/Clinic,PC,Off Based 2010"
f0478008 ="Path,Anat/Clinic,PC,Off Based 2008"
f0478005 ="Path,Anat/Clinic,PC,Off Based 2005"
f1253810 ="Path,Anat/Clinic,PC,Hosp Resdnt 2010"
f1253808 ="Path,Anat/Clinic,PC,Hosp Resdnt 2008"
f1253805 ="Path,Anat/Clinic,PC,Hosp Resdnt 2005"
f0478210 ="Path,Anat/Clinic,PC,Hosp FT Stf 2010"
f0478208 ="Path,Anat/Clinic,PC,Hosp FT Stf 2008"
f0478205 ="Path,Anat/Clinic,PC,Hosp FT Stf 2005"
f1013710 ="Path,Anat/Clinic,Administration 2010"
f1013708 ="Path,Anat/Clinic,Administration 2008"
f1013705 ="Path,Anat/Clinic,Administration 2005"
f1013810 ="Path,Anat/Clinic,Teaching 2010"
f1013808 ="Path,Anat/Clinic,Teaching 2008"
f1013805 ="Path,Anat/Clinic,Teaching 2005"
f1118610 ="Path,Anat/Clinic,Research 2010"
f1118608 ="Path,Anat/Clinic,Research 2008"
f1118605 ="Path,Anat/Clinic,Research 2005"
f1014010 ="Path,Anat/Clinic,Other 2010"
f1014008 ="Path,Anat/Clinic,Other 2008"
f1014005 ="Path,Anat/Clinic,Other 2005"
f0478310 ="Phys Med/Rehab, Total 2010"
f0478308 ="Phys Med/Rehab, Total 2008"
f0478305 ="Phys Med/Rehab, Total 2005"
f1118710 ="Phys Med/Rehab, Total Patnt Cr 2010"
f1118708 ="Phys Med/Rehab, Total Patnt Cr 2008"
f1118705 ="Phys Med/Rehab, Total Patnt Cr 2005"
f0478510 ="Phys Med/Rehab, PC, Office Base 2010"
f0478508 ="Phys Med/Rehab, PC, Office Base 2008"
f0478505 ="Phys Med/Rehab, PC, Office Base 2005"
f1253910 ="Phys Med/Rehab, PC, Hosp Resdnt 2010"
f1253908 ="Phys Med/Rehab, PC, Hosp Resdnt 2008"
f1253905 ="Phys Med/Rehab, PC, Hosp Resdnt 2005"
f0478710 ="Phys Med/Rehab, PC, Hosp FT Stf 2010"
f0478708 ="Phys Med/Rehab, PC, Hosp FT Stf 2008"
f0478705 ="Phys Med/Rehab, PC, Hosp FT Stf 2005"
f1014310 ="Phys Med/Rehab, Administration 2010"
f1014308 ="Phys Med/Rehab, Administration 2008"
f1014305 ="Phys Med/Rehab, Administration 2005"
f1014410 ="Phys Med/Rehab, Teaching 2010"
f1014408 ="Phys Med/Rehab, Teaching 2008"
f1014405 ="Phys Med/Rehab, Teaching 2005"
f1118910 ="Phys Med/Rehab, Research 2010"
f1118908 ="Phys Med/Rehab, Research 2008"
f1118905 ="Phys Med/Rehab, Research 2005"
f1014610 ="Phys Med/Rehab, Other 2010"
f1014608 ="Phys Med/Rehab, Other 2008"
f1014605 ="Phys Med/Rehab, Other 2005"
f0478810 ="Gen Prev Med, Total 2010"
f0478808 ="Gen Prev Med, Total 2008"
f0478805 ="Gen Prev Med, Total 2005"
f1119010 ="Gen Prev Med, Total Patnt Care 2010"
f1119008 ="Gen Prev Med, Total Patnt Care 2008"
f1119005 ="Gen Prev Med, Total Patnt Care 2005"
f0479010 ="Gen Prev Med, PC, Office Based 2010"
f0479008 ="Gen Prev Med, PC, Office Based 2008"
f0479005 ="Gen Prev Med, PC, Office Based 2005"
f1254010 ="Gen Prev Med, PC, Hosp Resident 2010"
f1254008 ="Gen Prev Med, PC, Hosp Resident 2008"
f1254005 ="Gen Prev Med, PC, Hosp Resident 2005"
f0479210 ="Gen Prev Med, PC, Hosp FT Staff 2010"
f0479208 ="Gen Prev Med, PC, Hosp FT Staff 2008"
f0479205 ="Gen Prev Med, PC, Hosp FT Staff 2005"
f1014910 ="Gen Prev Med, Administration 2010"
f1014908 ="Gen Prev Med, Administration 2008"
f1014905 ="Gen Prev Med, Administration 2005"
f1015010 ="Gen Prev Med, Teaching 2010"
f1015008 ="Gen Prev Med, Teaching 2008"
f1015005 ="Gen Prev Med, Teaching 2005"
f1119210 ="Gen Prev Med, Research 2010"
f1119208 ="Gen Prev Med, Research 2008"
f1119205 ="Gen Prev Med, Research 2005"
f1015210 ="Gen Prev Med, Other 2010"
f1015208 ="Gen Prev Med, Other 2008"
f1015205 ="Gen Prev Med, Other 2005"
f0479310 ="Public Health, Total 2010"
f0479308 ="Public Health, Total 2008"
f0479305 ="Public Health, Total 2005"
f1119310 ="Public Health, Total Patnt Care 2010"
f1119308 ="Public Health, Total Patnt Care 2008"
f1119305 ="Public Health, Total Patnt Care 2005"
f0479510 ="Public Health, PC, Office Based 2010"
f0479508 ="Public Health, PC, Office Based 2008"
f0479505 ="Public Health, PC, Office Based 2005"
f1254110 ="Public Health, PC, Hosp Residnt 2010"
f1254108 ="Public Health, PC, Hosp Residnt 2008"
f1254105 ="Public Health, PC, Hosp Residnt 2005"
f0479710 ="Public Health, PC, Hosp FT Stf 2010"
f0479708 ="Public Health, PC, Hosp FT Stf 2008"
f0479705 ="Public Health, PC, Hosp FT Stf 2005"
f1015510 ="Public Health, Administration 2010"
f1015508 ="Public Health, Administration 2008"
f1015505 ="Public Health, Administration 2005"
f1015610 ="Public Health, Teaching 2010"
f1015608 ="Public Health, Teaching 2008"
f1015605 ="Public Health, Teaching 2005"
f1119510 ="Public Health, Research 2010"
f1119508 ="Public Health, Research 2008"
f1119505 ="Public Health, Research 2005"
f1015810 ="Public Health, Other 2010"
f1015808 ="Public Health, Other 2008"
f1015805 ="Public Health, Other 2005"
f0981110 ="Radiology, Total 2010"
f0981108 ="Radiology, Total 2008"
f0981105 ="Radiology, Total 2005"
f1119610 ="Radiology, Total Patient Care 2010"
f1119608 ="Radiology, Total Patient Care 2008"
f1119605 ="Radiology, Total Patient Care 2005"
f0981310 ="Radiology, PC, Office Based 2010"
f0981308 ="Radiology, PC, Office Based 2008"
f0981305 ="Radiology, PC, Office Based 2005"
f1254210 ="Radiology, PC, Hosp Residents 2010"
f1254208 ="Radiology, PC, Hosp Residents 2008"
f1254205 ="Radiology, PC, Hosp Residents 2005"
f0981510 ="Radiology, PC, Hosp FT Staff 2010"
f0981508 ="Radiology, PC, Hosp FT Staff 2008"
f0981505 ="Radiology, PC, Hosp FT Staff 2005"
f1016110 ="Radiology, Administration 2010"
f1016108 ="Radiology, Administration 2008"
f1016105 ="Radiology, Administration 2005"
f1016210 ="Radiology, Teaching 2010"
f1016208 ="Radiology, Teaching 2008"
f1016205 ="Radiology, Teaching 2005"
f1119810 ="Radiology, Research 2010"
f1119808 ="Radiology, Research 2008"
f1119805 ="Radiology, Research 2005"
f1016410 ="Radiology, Other 2010"
f1016408 ="Radiology, Other 2008"
f1016405 ="Radiology, Other 2005"
f0480310 ="Rad Oncology, Total 2010"
f0480308 ="Rad Oncology, Total 2008"
f0480305 ="Rad Oncology, Total 2005"
f1119910 ="Rad Oncology, Total Patnt Care 2010"
f1119908 ="Rad Oncology, Total Patnt Care 2008"
f1119905 ="Rad Oncology, Total Patnt Care 2005"
f0480510 ="Rad Oncology, PC, Office Based 2010"
f0480508 ="Rad Oncology, PC, Office Based 2008"
f0480505 ="Rad Oncology, PC, Office Based 2005"
f1254310 ="Rad Oncology, PC, Hosp Resident 2010"
f1254308 ="Rad Oncology, PC, Hosp Resident 2008"
f1254305 ="Rad Oncology, PC, Hosp Resident 2005"
f0480710 ="Rad Oncology, PC, Hosp FT Staff 2010"
f0480708 ="Rad Oncology, PC, Hosp FT Staff 2008"
f0480705 ="Rad Oncology, PC, Hosp FT Staff 2005"
f1017310 ="Rad Oncology, Administration 2010"
f1017308 ="Rad Oncology, Administration 2008"
f1017305 ="Rad Oncology, Administration 2005"
f1017410 ="Rad Oncology, Teaching 2010"
f1017408 ="Rad Oncology, Teaching 2008"
f1017405 ="Rad Oncology, Teaching 2005"
f1120110 ="Rad Oncology, Research 2010"
f1120108 ="Rad Oncology, Research 2008"
f1120105 ="Rad Oncology, Research 2005"
f1017610 ="Rad Oncology, Other 2010"
f1017608 ="Rad Oncology, Other 2008"
f1017605 ="Rad Oncology, Other 2005"
f1365010 ="Transplant Surg, Total 2010"
f1365008 ="Transplant Surg, Total 2008"
f1365005 ="Transplant Surg, Total 2005"
f1365110 ="Transplant Surg, Tot Patn Care 2010"
f1365108 ="Transplant Surg, Tot Patn Care 2008"
f1365105 ="Transplant Surg, Tot Patn Care 2005"
f1365210 ="Transplant Surg, PC, Office Bsd 2010"
f1365208 ="Transplant Surg, PC, Office Bsd 2008"
f1365205 ="Transplant Surg, PC, Office Bsd 2005"
f1365310 ="Transplant Surg, PC,Hosp Resdnt 2010"
f1365308 ="Transplant Surg, PC,Hosp Resdnt 2008"
f1365305 ="Transplant Surg, PC,Hosp Resdnt 2005"
f1365410 ="Transplant Surg, PC,Hosp FT Stf 2010"
f1365408 ="Transplant Surg, PC,Hosp FT Stf 2008"
f1365405 ="Transplant Surg, PC,Hosp FT Stf 2005"
f1365510 ="Transplant Surg, Administration 2010"
f1365508 ="Transplant Surg, Administration 2008"
f1365505 ="Transplant Surg, Administration 2005"
f1365610 ="Transplant Surg, Teaching 2010"
f1365608 ="Transplant Surg, Teaching 2008"
f1365605 ="Transplant Surg, Teaching 2005"
f1365710 ="Transplant Surg, Research 2010"
f1365708 ="Transplant Surg, Research 2008"
f1365705 ="Transplant Surg, Research 2005"
f1365810 ="Transplant Surg, Other 2010"
f1365808 ="Transplant Surg, Other 2008"
f1365805 ="Transplant Surg, Other 2005"
f1363510 ="Vascular Med, Total 2010"
f1363508 ="Vascular Med, Total 2008"
f1363505 ="Vascular Med, Total 2005"
f1363610 ="Vascular Med, Total Patn Care 2010"
f1363608 ="Vascular Med, Total Patn Care 2008"
f1363605 ="Vascular Med, Total Patn Care 2005"
f1363710 ="Vascular Med, PC, Office Based 2010"
f1363708 ="Vascular Med, PC, Office Based 2008"
f1363705 ="Vascular Med, PC, Office Based 2005"
f1363810 ="Vascular Med, PC, Hosp Resdnt 2010"
f1363808 ="Vascular Med, PC, Hosp Resdnt 2008"
f1363805 ="Vascular Med, PC, Hosp Resdnt 2005"
f1363910 ="Vascular Med, PC, Hosp FT Stf 2010"
f1363908 ="Vascular Med, PC, Hosp FT Stf 2008"
f1363905 ="Vascular Med, PC, Hosp FT Stf 2005"
f1364010 ="Vascular Med, Administration 2010"
f1364008 ="Vascular Med, Administration 2008"
f1364005 ="Vascular Med, Administration 2005"
f1364110 ="Vascular Med, Teaching 2010"
f1364108 ="Vascular Med, Teaching 2008"
f1364105 ="Vascular Med, Teaching 2005"
f1364210 ="Vascular Med, Research 2010"
f1364208 ="Vascular Med, Research 2008"
f1364205 ="Vascular Med, Research 2005"
f1364310 ="Vascular Med, Other 2010"
f1364308 ="Vascular Med, Other 2008"
f1364305 ="Vascular Med, Other 2005"
f0982110 ="Other Specs, Total 2010"
f0982108 ="Other Specs, Total 2008"
f0982105 ="Other Specs, Total 2005"
f1120210 ="Other Specs, Total Patnt Care 2010"
f1120208 ="Other Specs, Total Patnt Care 2008"
f1120205 ="Other Specs, Total Patnt Care 2005"
f0982310 ="Other Specs, PC, Office Based 2010"
f0982308 ="Other Specs, PC, Office Based 2008"
f0982305 ="Other Specs, PC, Office Based 2005"
f1254410 ="Other Specs, PC, Hosp Residents 2010"
f1254408 ="Other Specs, PC, Hosp Residents 2008"
f1254405 ="Other Specs, PC, Hosp Residents 2005"
f0982510 ="Other Specs, PC, Hosp FT Staff 2010"
f0982508 ="Other Specs, PC, Hosp FT Staff 2008"
f0982505 ="Other Specs, PC, Hosp FT Staff 2005"
f1017910 ="Other Specs, Administration 2010"
f1017908 ="Other Specs, Administration 2008"
f1017905 ="Other Specs, Administration 2005"
f1018010 ="Other Specs, Teaching 2010"
f1018008 ="Other Specs, Teaching 2008"
f1018005 ="Other Specs, Teaching 2005"
f1120410 ="Other Specs, Research 2010"
f1120408 ="Other Specs, Research 2008"
f1120405 ="Other Specs, Research 2005"
f1018210 ="Other Specs, Other 2010"
f1018208 ="Other Specs, Other 2008"
f1018205 ="Other Specs, Other 2005"
f0481310 ="Unspecified, Total 2010"
f0481308 ="Unspecified, Total 2008"
f0481305 ="Unspecified, Total 2005"
f1120510 ="Unspecified, Total Patient Care 2010"
f1120508 ="Unspecified, Total Patient Care 2008"
f1120505 ="Unspecified, Total Patient Care 2005"
f0481510 ="Unspecified, PC, Office Based 2010"
f0481508 ="Unspecified, PC, Office Based 2008"
f0481505 ="Unspecified, PC, Office Based 2005"
f1254510 ="Unspecified, PC, Hosp Residents 2010"
f1254508 ="Unspecified, PC, Hosp Residents 2008"
f1254505 ="Unspecified, PC, Hosp Residents 2005"
f0481710 ="Unspecified, PC, Hosp FT Staff 2010"
f0481708 ="Unspecified, PC, Hosp FT Staff 2008"
f0481705 ="Unspecified, PC, Hosp FT Staff 2005"
f1019110 ="Unspecified, Administration 2010"
f1019108 ="Unspecified, Administration 2008"
f1019105 ="Unspecified, Administration 2005"
f1019210 ="Unspecified, Teaching 2010"
f1019208 ="Unspecified, Teaching 2008"
f1019205 ="Unspecified, Teaching 2005"
f1120710 ="Unspecified, Research 2010"
f1120708 ="Unspecified, Research 2008"
f1120705 ="Unspecified, Research 2005"
f1019410 ="Unspecified, Other 2010"
f1019408 ="Unspecified, Other 2008"
f1019405 ="Unspecified, Other 2005"
f0481810 ="MD's Inactive, Total 2010"
f0481808 ="MD's Inactive, Total 2008"
f0481805 ="MD's Inactive, Total 2005"
f0481910 ="MD's Not Classified, Total 2010"
f0481908 ="MD's Not Classified, Total 2008"
f0481905 ="MD's Not Classified, Total 2005"
f1468110 ="Physicians,Tot Ptn Care,Tot Graduates 2010"
f1468210 ="Physicians,Tot Ptn Care, US Graduates 2010"
f1468310 ="Physicians,Tot Ptn Care,Canadian Grad 2010"
f1468410 ="Physicians,Tot Ptn Care, IMG Grads 2010"
f1468510 ="MD's,Tot Ptn Care,Tot Graduates 2010"
f1468610 ="MD's,Tot Ptn Care, US Graduates 2010"
f1468710 ="MD's,Tot Ptn Care,Canadian Grad 2010"
f1468810 ="MD's,Tot Ptn Care, IMG Grads 2010"
f1468910 ="DO's,Tot Ptn Care,Tot Graduates 2010"
f1469010 ="DO's,Tot Ptn Care, US Graduates 2010"
f1126910 ="M.D.'s, Tot PC, Hosp Residents (Fed) 2010"
f1126908 ="M.D.'s, Tot PC, Hosp Residents (Fed) 2008"
f1126905 ="M.D.'s, Tot PC, Hosp Residents (Fed) 2005"
f1127010 ="M.D.'s, Total PC, Hosp FT Staff (Fed) 2010"
f1127008 ="M.D.'s, Total PC, Hosp FT Staff (Fed) 2008"
f1127005 ="M.D.'s, Total PC, Hosp FT Staff (Fed) 2005"
f1127110 ="M.D.'s, Total Oth Prof Activity (Fed) 2010"
f1127108 ="M.D.'s, Total Oth Prof Activity (Fed) 2008"
f1127105 ="M.D.'s, Total Oth Prof Activity (Fed) 2005"
f1387810 ="M.D.'s, Total, Inactive (Fed) 2010"
f1387808 ="M.D.'s, Total, Inactive (Fed) 2008"
f1387805 ="M.D.'s, Total, Inactive (Fed) 2005"
f1127310 ="MD's,Tot Gen Prac,PC,Hosp Res (Fed) 2010"
f1127308 ="MD's,Tot Gen Prac,PC,Hosp Res (Fed) 2008"
f1127305 ="MD's,Tot Gen Prac,PC,Hosp Res (Fed) 2005"
f1127410 ="MD's,Tot Gen Prac,PC,Hsp FT Stf (Fed) 2010"
f1127408 ="MD's,Tot Gen Prac,PC,Hsp FT Stf (Fed) 2008"
f1127405 ="MD's,Tot Gen Prac,PC,Hsp FT Stf (Fed) 2005"
f1127510 ="MD's,Tot Gen Prac,Oth Prof Act (Fed) 2010"
f1127508 ="MD's,Tot Gen Prac,Oth Prof Act (Fed) 2008"
f1127505 ="MD's,Tot Gen Prac,Oth Prof Act (Fed) 2005"
f1127710 ="Gen Int Med, PC, Hosp Residents (Fed) 2010"
f1127708 ="Gen Int Med, PC, Hosp Residents (Fed) 2008"
f1127705 ="Gen Int Med, PC, Hosp Residents (Fed) 2005"
f1127810 ="Gen Int Med, PC, Hosp FT Staff (Fed) 2010"
f1127808 ="Gen Int Med, PC, Hosp FT Staff (Fed) 2008"
f1127805 ="Gen Int Med, PC, Hosp FT Staff (Fed) 2005"
f1127910 ="Gen Internal Med, Oth Prof Act (Fed) 2010"
f1127908 ="Gen Internal Med, Oth Prof Act (Fed) 2008"
f1127905 ="Gen Internal Med, Oth Prof Act (Fed) 2005"
f1173510 ="Pediatrics,Gen,PC,Hosp Resident (Fed) 2010"
f1173508 ="Pediatrics,Gen,PC,Hosp Resident (Fed) 2008"
f1173505 ="Pediatrics,Gen,PC,Hosp Resident (Fed) 2005"
f1173610 ="Pediatrics,Gen,PC,Hosp FT Staff (Fed) 2010"
f1173608 ="Pediatrics,Gen,PC,Hosp FT Staff (Fed) 2008"
f1173605 ="Pediatrics,Gen,PC,Hosp FT Staff (Fed) 2005"
f1173710 ="Pediatrics, Gen, Oth Prof Act (Fed) 2010"
f1173708 ="Pediatrics, Gen, Oth Prof Act (Fed) 2008"
f1173705 ="Pediatrics, Gen, Oth Prof Act (Fed) 2005"
f1173910 ="Other Med, PC, Hosp Residents (Fed) 2010"
f1173908 ="Other Med, PC, Hosp Residents (Fed) 2008"
f1173905 ="Other Med, PC, Hosp Residents (Fed) 2005"
f1174010 ="Other Med, PC, Hosp FT Staff (Fed) 2010"
f1174008 ="Other Med, PC, Hosp FT Staff (Fed) 2008"
f1174005 ="Other Med, PC, Hosp FT Staff (Fed) 2005"
f1174110 ="Other Med, Other Prof Activity (Fed) 2010"
f1174108 ="Other Med, Other Prof Activity (Fed) 2008"
f1174105 ="Other Med, Other Prof Activity (Fed) 2005"
f1128910 ="Genrl Surg, PC, Hosp Residents (Fed) 2010"
f1128908 ="Genrl Surg, PC, Hosp Residents (Fed) 2008"
f1128905 ="Genrl Surg, PC, Hosp Residents (Fed) 2005"
f1129010 ="Genrl Surg, PC, Hosp FT Staff (Fed) 2010"
f1129008 ="Genrl Surg, PC, Hosp FT Staff (Fed) 2008"
f1129005 ="Genrl Surg, PC, Hosp FT Staff (Fed) 2005"
f1129110 ="Genrl Surg, Other Prof Activity (Fed) 2010"
f1129108 ="Genrl Surg, Other Prof Activity (Fed) 2008"
f1129105 ="Genrl Surg, Other Prof Activity (Fed) 2005"
f1174310 ="Ob-Gyn, Gen, PC,Hosp Residents (Fed) 2010"
f1174308 ="Ob-Gyn, Gen, PC,Hosp Residents (Fed) 2008"
f1174305 ="Ob-Gyn, Gen, PC,Hosp Residents (Fed) 2005"
f1174410 ="Ob-Gyn, Gen, PC, Hosp FT Staff (Fed) 2010"
f1174408 ="Ob-Gyn, Gen, PC, Hosp FT Staff (Fed) 2008"
f1174405 ="Ob-Gyn, Gen, PC, Hosp FT Staff (Fed) 2005"
f1174510 ="Ob-Gyn, Gen, Oth Prof Activity (Fed) 2010"
f1174508 ="Ob-Gyn, Gen, Oth Prof Activity (Fed) 2008"
f1174505 ="Ob-Gyn, Gen, Oth Prof Activity (Fed) 2005"
f1174710 ="Ob-Gyn Subspecs,PC,Hosp Resdnt (Fed) 2010"
f1174708 ="Ob-Gyn Subspecs,PC,Hosp Resdnt (Fed) 2008"
f1174705 ="Ob-Gyn Subspecs,PC,Hosp Resdnt (Fed) 2005"
f1174810 ="Ob-Gyn Subspecs,PC,Hosp FT Stf (Fed) 2010"
f1174808 ="Ob-Gyn Subspecs,PC,Hosp FT Stf (Fed) 2008"
f1174805 ="Ob-Gyn Subspecs,PC,Hosp FT Stf (Fed) 2005"
f1174910 ="Ob-Gyn Subspecs, Oth Prof Act (Fed) 2010"
f1174908 ="Ob-Gyn Subspecs, Oth Prof Act (Fed) 2008"
f1174905 ="Ob-Gyn Subspecs, Oth Prof Act (Fed) 2005"
f1129710 ="Other Surg, PC, Hosp Residents (Fed) 2010"
f1129708 ="Other Surg, PC, Hosp Residents (Fed) 2008"
f1129705 ="Other Surg, PC, Hosp Residents (Fed) 2005"
f1129810 ="Other Surg, PC, Hosp FT Staff (Fed) 2010"
f1129808 ="Other Surg, PC, Hosp FT Staff (Fed) 2008"
f1129805 ="Other Surg, PC, Hosp FT Staff (Fed) 2005"
f1129910 ="Other Surg, Other Prof Activity (Fed) 2010"
f1129908 ="Other Surg, Other Prof Activity (Fed) 2008"
f1129905 ="Other Surg, Other Prof Activity (Fed) 2005"
f1130110 ="Psychiatry, PC, Hosp Residents (Fed) 2010"
f1130108 ="Psychiatry, PC, Hosp Residents (Fed) 2008"
f1130105 ="Psychiatry, PC, Hosp Residents (Fed) 2005"
f1130210 ="Psychiatry, PC, Hosp FT Staff (Fed) 2010"
f1130208 ="Psychiatry, PC, Hosp FT Staff (Fed) 2008"
f1130205 ="Psychiatry, PC, Hosp FT Staff (Fed) 2005"
f1130310 ="Psychiatry, Other Prof Activity (Fed) 2010"
f1130308 ="Psychiatry, Other Prof Activity (Fed) 2008"
f1130305 ="Psychiatry, Other Prof Activity (Fed) 2005"
f1130510 ="Oth Oth Spec, PC, Hosp Resident (Fed) 2010"
f1130508 ="Oth Oth Spec, PC, Hosp Resident (Fed) 2008"
f1130505 ="Oth Oth Spec, PC, Hosp Resident (Fed) 2005"
f1130610 ="Oth Oth Spec, PC, Hosp FT Staff (Fed) 2010"
f1130608 ="Oth Oth Spec, PC, Hosp FT Staff (Fed) 2008"
f1130605 ="Oth Oth Spec, PC, Hosp FT Staff (Fed) 2005"
f1130710 ="Other Other Spec, Oth Prof Act (Fed) 2010"
f1130708 ="Other Other Spec, Oth Prof Act (Fed) 2008"
f1130705 ="Other Other Spec, Oth Prof Act (Fed) 2005"
f0482010 ="Total M.D.'s, Male 2010"
f0482008 ="Total M.D.'s, Male 2008"
f0482005 ="Total M.D.'s, Male 2005"
f0482110 ="Total M.D.'s, Female 2010"
f0482108 ="Total M.D.'s, Female 2008"
f0482105 ="Total M.D.'s, Female 2005"
f0490010 ="MD's, Inactive, Male 2010"
f0490008 ="MD's, Inactive, Male 2008"
f0490005 ="MD's, Inactive, Male 2005"
f0490110 ="MD's, Inactive, Female 2010"
f0490108 ="MD's, Inactive, Female 2008"
f0490105 ="MD's, Inactive, Female 2005"
f0490410 ="Total M.D.'s, < 35 2010"
f0490408 ="Total M.D.'s, < 35 2008"
f0490405 ="Total M.D.'s, < 35 2005"
f0490510 ="Total M.D.'s, 35-44 2010"
f0490508 ="Total M.D.'s, 35-44 2008"
f0490505 ="Total M.D.'s, 35-44 2005"
f0490610 ="Total M.D.'s, 45-54 2010"
f0490608 ="Total M.D.'s, 45-54 2008"
f0490605 ="Total M.D.'s, 45-54 2005"
f0490710 ="Total M.D.'s, 55-64 2010"
f0490708 ="Total M.D.'s, 55-64 2008"
f0490705 ="Total M.D.'s, 55-64 2005"
f1201610 ="Total M.D.'s, 65-74 2010"
f1201608 ="Total M.D.'s, 65-74 2008"
f1201605 ="Total M.D.'s, 65-74 2005"
f1201710 ="Total M.D.'s, 75+ 2010"
f1201708 ="Total M.D.'s, 75+ 2008"
f1201705 ="Total M.D.'s, 75+ 2005"
f0491010 ="MD's, Tot General Pract, < 35 2010"
f0491008 ="MD's, Tot General Pract, < 35 2008"
f0491005 ="MD's, Tot General Pract, < 35 2005"
f0491110 ="MD's, Tot General Pract, 35-44 2010"
f0491108 ="MD's, Tot General Pract, 35-44 2008"
f0491105 ="MD's, Tot General Pract, 35-44 2005"
f0491210 ="MD's, Tot General Pract, 45-54 2010"
f0491208 ="MD's, Tot General Pract, 45-54 2008"
f0491205 ="MD's, Tot General Pract, 45-54 2005"
f0491310 ="MD's, Tot General Pract, 55-64 2010"
f0491308 ="MD's, Tot General Pract, 55-64 2008"
f0491305 ="MD's, Tot General Pract, 55-64 2005"
f1201810 ="MD's, Tot General Pract, 65-74 2010"
f1201808 ="MD's, Tot General Pract, 65-74 2008"
f1201805 ="MD's, Tot General Pract, 65-74 2005"
f1201910 ="MD's, Tot General Pract, 75+ 2010"
f1201908 ="MD's, Tot General Pract, 75+ 2008"
f1201905 ="MD's, Tot General Pract, 75+ 2005"
f1074910 ="MD's, General Pract, < 35 2010"
f1074908 ="MD's, General Pract, < 35 2008"
f1074905 ="MD's, General Pract, < 35 2005"
f1075010 ="MD's, General Pract, 35-44 2010"
f1075008 ="MD's, General Pract, 35-44 2008"
f1075005 ="MD's, General Pract, 35-44 2005"
f1075110 ="MD's, General Pract, 45-54 2010"
f1075108 ="MD's, General Pract, 45-54 2008"
f1075105 ="MD's, General Pract, 45-54 2005"
f1075210 ="MD's, General Pract, 55-64 2010"
f1075208 ="MD's, General Pract, 55-64 2008"
f1075205 ="MD's, General Pract, 55-64 2005"
f1202010 ="MD's, General Pract, 65-74 2010"
f1202008 ="MD's, General Pract, 65-74 2008"
f1202005 ="MD's, General Pract, 65-74 2005"
f1202110 ="MD's, General Pract, 75+ 2010"
f1202108 ="MD's, General Pract, 75+ 2008"
f1202105 ="MD's, General Pract, 75+ 2005"
f1202210 ="MD's, Family Med Gen, < 35 2010"
f1202208 ="MD's, Family Med Gen, < 35 2008"
f1202205 ="MD's, Family Med Gen, < 35 2005"
f1202310 ="MD's, Family Med Gen, 35-44 2010"
f1202308 ="MD's, Family Med Gen, 35-44 2008"
f1202305 ="MD's, Family Med Gen, 35-44 2005"
f1202410 ="MD's, Family Med Gen, 45-54 2010"
f1202408 ="MD's, Family Med Gen, 45-54 2008"
f1202405 ="MD's, Family Med Gen, 45-54 2005"
f1202510 ="MD's, Family Med Gen, 55-64 2010"
f1202508 ="MD's, Family Med Gen, 55-64 2008"
f1202505 ="MD's, Family Med Gen, 55-64 2005"
f1202610 ="MD's, Family Med Gen, 65-74 2010"
f1202608 ="MD's, Family Med Gen, 65-74 2008"
f1202605 ="MD's, Family Med Gen, 65-74 2005"
f1202710 ="MD's, Family Med Gen, 75+ 2010"
f1202708 ="MD's, Family Med Gen, 75+ 2008"
f1202705 ="MD's, Family Med Gen, 75+ 2005"
f1202810 ="MD's, Family Prac Subsp, < 35 2010"
f1202808 ="MD's, Family Prac Subsp, < 35 2008"
f1202805 ="MD's, Family Prac Subsp, < 35 2005"
f1202910 ="MD's, Family Prac Subsp, 35-44 2010"
f1202908 ="MD's, Family Prac Subsp, 35-44 2008"
f1202905 ="MD's, Family Prac Subsp, 35-44 2005"
f1203010 ="MD's, Family Prac Subsp, 45-54 2010"
f1203008 ="MD's, Family Prac Subsp, 45-54 2008"
f1203005 ="MD's, Family Prac Subsp, 45-54 2005"
f1203110 ="MD's, Family Prac Subsp, 55-64 2010"
f1203108 ="MD's, Family Prac Subsp, 55-64 2008"
f1203105 ="MD's, Family Prac Subsp, 55-64 2005"
f1203210 ="MD's, Family Prac Subsp, 65-74 2010"
f1203208 ="MD's, Family Prac Subsp, 65-74 2008"
f1203205 ="MD's, Family Prac Subsp, 65-74 2005"
f1203310 ="MD's, Family Prac Subsp, 75+ 2010"
f1203308 ="MD's, Family Prac Subsp, 75+ 2008"
f1203305 ="MD's, Family Prac Subsp, 75+ 2005"
f0491610 ="Medical Specs, Total, < 35 2010"
f0491608 ="Medical Specs, Total, < 35 2008"
f0491605 ="Medical Specs, Total, < 35 2005"
f0491710 ="Medical Specs, Total, 35-44 2010"
f0491708 ="Medical Specs, Total, 35-44 2008"
f0491705 ="Medical Specs, Total, 35-44 2005"
f0491810 ="Medical Specs, Total, 45-54 2010"
f0491808 ="Medical Specs, Total, 45-54 2008"
f0491805 ="Medical Specs, Total, 45-54 2005"
f0491910 ="Medical Specs, Total, 55-64 2010"
f0491908 ="Medical Specs, Total, 55-64 2008"
f0491905 ="Medical Specs, Total, 55-64 2005"
f1203410 ="Medical Specs, Total, 65-74 2010"
f1203408 ="Medical Specs, Total, 65-74 2008"
f1203405 ="Medical Specs, Total, 65-74 2005"
f1203510 ="Medical Specs, Total, 75+ 2010"
f1203508 ="Medical Specs, Total, 75+ 2008"
f1203505 ="Medical Specs, Total, 75+ 2005"
f1185910 ="Allergy & Immunology, < 35 2010"
f1185908 ="Allergy & Immunology, < 35 2008"
f1185905 ="Allergy & Immunology, < 35 2005"
f1186010 ="Allergy & Immunology, 35-44 2010"
f1186008 ="Allergy & Immunology, 35-44 2008"
f1186005 ="Allergy & Immunology, 35-44 2005"
f1186110 ="Allergy & Immunology, 45-54 2010"
f1186108 ="Allergy & Immunology, 45-54 2008"
f1186105 ="Allergy & Immunology, 45-54 2005"
f1186210 ="Allergy & Immunology, 55-64 2010"
f1186208 ="Allergy & Immunology, 55-64 2008"
f1186205 ="Allergy & Immunology, 55-64 2005"
f1203610 ="Allergy & Immunology, 65-74 2010"
f1203608 ="Allergy & Immunology, 65-74 2008"
f1203605 ="Allergy & Immunology, 65-74 2005"
f1203710 ="Allergy & Immunology, 75+ 2010"
f1203708 ="Allergy & Immunology, 75+ 2008"
f1203705 ="Allergy & Immunology, 75+ 2005"
f0492810 ="Cardiovascular Diseases, < 35 2010"
f0492808 ="Cardiovascular Diseases, < 35 2008"
f0492805 ="Cardiovascular Diseases, < 35 2005"
f0492910 ="Cardiovascular Diseases, 35-44 2010"
f0492908 ="Cardiovascular Diseases, 35-44 2008"
f0492905 ="Cardiovascular Diseases, 35-44 2005"
f0493010 ="Cardiovascular Diseases, 45-54 2010"
f0493008 ="Cardiovascular Diseases, 45-54 2008"
f0493005 ="Cardiovascular Diseases, 45-54 2005"
f0493110 ="Cardiovascular Diseases, 55-64 2010"
f0493108 ="Cardiovascular Diseases, 55-64 2008"
f0493105 ="Cardiovascular Diseases, 55-64 2005"
f1203810 ="Cardiovascular Diseases, 65-74 2010"
f1203808 ="Cardiovascular Diseases, 65-74 2008"
f1203805 ="Cardiovascular Diseases, 65-74 2005"
f1203910 ="Cardiovascular Diseases, 75+ 2010"
f1203908 ="Cardiovascular Diseases, 75+ 2008"
f1203905 ="Cardiovascular Diseases, 75+ 2005"
f0493410 ="Dermatology, < 35 2010"
f0493408 ="Dermatology, < 35 2008"
f0493405 ="Dermatology, < 35 2005"
f0493510 ="Dermatology, 35-44 2010"
f0493508 ="Dermatology, 35-44 2008"
f0493505 ="Dermatology, 35-44 2005"
f0493610 ="Dermatology, 45-54 2010"
f0493608 ="Dermatology, 45-54 2008"
f0493605 ="Dermatology, 45-54 2005"
f0493710 ="Dermatology, 55-64 2010"
f0493708 ="Dermatology, 55-64 2008"
f0493705 ="Dermatology, 55-64 2005"
f1204010 ="Dermatology, 65-74 2010"
f1204008 ="Dermatology, 65-74 2008"
f1204005 ="Dermatology, 65-74 2005"
f1204110 ="Dermatology, 75+ 2010"
f1204108 ="Dermatology, 75+ 2008"
f1204105 ="Dermatology, 75+ 2005"
f0494010 ="Gastroenterology, < 35 2010"
f0494008 ="Gastroenterology, < 35 2008"
f0494005 ="Gastroenterology, < 35 2005"
f0494110 ="Gastroenterology, 35-44 2010"
f0494108 ="Gastroenterology, 35-44 2008"
f0494105 ="Gastroenterology, 35-44 2005"
f0494210 ="Gastroenterology, 45-54 2010"
f0494208 ="Gastroenterology, 45-54 2008"
f0494205 ="Gastroenterology, 45-54 2005"
f0494310 ="Gastroenterology, 55-64 2010"
f0494308 ="Gastroenterology, 55-64 2008"
f0494305 ="Gastroenterology, 55-64 2005"
f1204210 ="Gastroenterology, 65-74 2010"
f1204208 ="Gastroenterology, 65-74 2008"
f1204205 ="Gastroenterology, 65-74 2005"
f1204310 ="Gastroenterology, 75+ 2010"
f1204308 ="Gastroenterology, 75+ 2008"
f1204305 ="Gastroenterology, 75+ 2005"
f1186410 ="General Internal Med, < 35 2010"
f1186408 ="General Internal Med, < 35 2008"
f1186405 ="General Internal Med, < 35 2005"
f1186510 ="General Internal Med, 35-44 2010"
f1186508 ="General Internal Med, 35-44 2008"
f1186505 ="General Internal Med, 35-44 2005"
f1186610 ="General Internal Med, 45-54 2010"
f1186608 ="General Internal Med, 45-54 2008"
f1186605 ="General Internal Med, 45-54 2005"
f1186710 ="General Internal Med, 55-64 2010"
f1186708 ="General Internal Med, 55-64 2008"
f1186705 ="General Internal Med, 55-64 2005"
f1204410 ="General Internal Med, 65-74 2010"
f1204408 ="General Internal Med, 65-74 2008"
f1204405 ="General Internal Med, 65-74 2005"
f1204510 ="General Internal Med, 75+ 2010"
f1204508 ="General Internal Med, 75+ 2008"
f1204505 ="General Internal Med, 75+ 2005"
f1186910 ="Internal Med Subspecs, < 35 2010"
f1186908 ="Internal Med Subspecs, < 35 2008"
f1186905 ="Internal Med Subspecs, < 35 2005"
f1187010 ="Internal Med Subspecs, 35-44 2010"
f1187008 ="Internal Med Subspecs, 35-44 2008"
f1187005 ="Internal Med Subspecs, 35-44 2005"
f1187110 ="Internal Med Subspecs, 45-54 2010"
f1187108 ="Internal Med Subspecs, 45-54 2008"
f1187105 ="Internal Med Subspecs, 45-54 2005"
f1187210 ="Internal Med Subspecs, 55-64 2010"
f1187208 ="Internal Med Subspecs, 55-64 2008"
f1187205 ="Internal Med Subspecs, 55-64 2005"
f1204610 ="Internal Med Subspecs, 65-74 2010"
f1204608 ="Internal Med Subspecs, 65-74 2008"
f1204605 ="Internal Med Subspecs, 65-74 2005"
f1204710 ="Internal Med Subspecs, 75+ 2010"
f1204708 ="Internal Med Subspecs, 75+ 2008"
f1204705 ="Internal Med Subspecs, 75+ 2005"
f1187410 ="Pediatrics, General, < 35 2010"
f1187408 ="Pediatrics, General, < 35 2008"
f1187405 ="Pediatrics, General, < 35 2005"
f1187510 ="Pediatrics, General, 35-44 2010"
f1187508 ="Pediatrics, General, 35-44 2008"
f1187505 ="Pediatrics, General, 35-44 2005"
f1187610 ="Pediatrics, General, 45-54 2010"
f1187608 ="Pediatrics, General, 45-54 2008"
f1187605 ="Pediatrics, General, 45-54 2005"
f1187710 ="Pediatrics, General, 55-64 2010"
f1187708 ="Pediatrics, General, 55-64 2008"
f1187705 ="Pediatrics, General, 55-64 2005"
f1204810 ="Pediatrics, General, 65-74 2010"
f1204808 ="Pediatrics, General, 65-74 2008"
f1204805 ="Pediatrics, General, 65-74 2005"
f1204910 ="Pediatrics, General, 75+ 2010"
f1204908 ="Pediatrics, General, 75+ 2008"
f1204905 ="Pediatrics, General, 75+ 2005"
f1187910 ="Pediatric Subspecs, < 35 2010"
f1187908 ="Pediatric Subspecs, < 35 2008"
f1187905 ="Pediatric Subspecs, < 35 2005"
f1188010 ="Pediatric Subspecs, 35-44 2010"
f1188008 ="Pediatric Subspecs, 35-44 2008"
f1188005 ="Pediatric Subspecs, 35-44 2005"
f1188110 ="Pediatric Subspecs, 45-54 2010"
f1188108 ="Pediatric Subspecs, 45-54 2008"
f1188105 ="Pediatric Subspecs, 45-54 2005"
f1188210 ="Pediatric Subspecs, 55-64 2010"
f1188208 ="Pediatric Subspecs, 55-64 2008"
f1188205 ="Pediatric Subspecs, 55-64 2005"
f1205010 ="Pediatric Subspecs, 65-74 2010"
f1205008 ="Pediatric Subspecs, 65-74 2008"
f1205005 ="Pediatric Subspecs, 65-74 2005"
f1205110 ="Pediatric Subspecs, 75+ 2010"
f1205108 ="Pediatric Subspecs, 75+ 2008"
f1205105 ="Pediatric Subspecs, 75+ 2005"
f0496410 ="Pediatric Cardiology, < 35 2010"
f0496408 ="Pediatric Cardiology, < 35 2008"
f0496405 ="Pediatric Cardiology, < 35 2005"
f0496510 ="Pediatric Cardiology, 35-44 2010"
f0496508 ="Pediatric Cardiology, 35-44 2008"
f0496505 ="Pediatric Cardiology, 35-44 2005"
f0496610 ="Pediatric Cardiology, 45-54 2010"
f0496608 ="Pediatric Cardiology, 45-54 2008"
f0496605 ="Pediatric Cardiology, 45-54 2005"
f0496710 ="Pediatric Cardiology, 55-64 2010"
f0496708 ="Pediatric Cardiology, 55-64 2008"
f0496705 ="Pediatric Cardiology, 55-64 2005"
f1205210 ="Pediatric Cardiology, 65-74 2010"
f1205208 ="Pediatric Cardiology, 65-74 2008"
f1205205 ="Pediatric Cardiology, 65-74 2005"
f1205310 ="Pediatric Cardiology, 75+ 2010"
f1205308 ="Pediatric Cardiology, 75+ 2008"
f1205305 ="Pediatric Cardiology, 75+ 2005"
f0497010 ="Pulmonary Diseases, < 35 2010"
f0497008 ="Pulmonary Diseases, < 35 2008"
f0497005 ="Pulmonary Diseases, < 35 2005"
f0497110 ="Pulmonary Diseases, 35-44 2010"
f0497108 ="Pulmonary Diseases, 35-44 2008"
f0497105 ="Pulmonary Diseases, 35-44 2005"
f0497210 ="Pulmonary Diseases, 45-54 2010"
f0497208 ="Pulmonary Diseases, 45-54 2008"
f0497205 ="Pulmonary Diseases, 45-54 2005"
f0497310 ="Pulmonary Diseases, 55-64 2010"
f0497308 ="Pulmonary Diseases, 55-64 2008"
f0497305 ="Pulmonary Diseases, 55-64 2005"
f1205410 ="Pulmonary Diseases, 65-74 2010"
f1205408 ="Pulmonary Diseases, 65-74 2008"
f1205405 ="Pulmonary Diseases, 65-74 2005"
f1205510 ="Pulmonary Diseases, 75+ 2010"
f1205508 ="Pulmonary Diseases, 75+ 2008"
f1205505 ="Pulmonary Diseases, 75+ 2005"
f0497610 ="Surgical Specs, Total, < 35 2010"
f0497608 ="Surgical Specs, Total, < 35 2008"
f0497605 ="Surgical Specs, Total, < 35 2005"
f0497710 ="Surgical Specs, Total, 35-44 2010"
f0497708 ="Surgical Specs, Total, 35-44 2008"
f0497705 ="Surgical Specs, Total, 35-44 2005"
f0497810 ="Surgical Specs, Total, 45-54 2010"
f0497808 ="Surgical Specs, Total, 45-54 2008"
f0497805 ="Surgical Specs, Total, 45-54 2005"
f0497910 ="Surgical Specs, Total, 55-64 2010"
f0497908 ="Surgical Specs, Total, 55-64 2008"
f0497905 ="Surgical Specs, Total, 55-64 2005"
f1205610 ="Surgical Specs, Total, 65-74 2010"
f1205608 ="Surgical Specs, Total, 65-74 2008"
f1205605 ="Surgical Specs, Total, 65-74 2005"
f1205710 ="Surgical Specs, Total, 75+ 2010"
f1205708 ="Surgical Specs, Total, 75+ 2008"
f1205705 ="Surgical Specs, Total, 75+ 2005"
f0498210 ="General Surgery, < 35 2010"
f0498208 ="General Surgery, < 35 2008"
f0498205 ="General Surgery, < 35 2005"
f0498310 ="General Surgery, 35-44 2010"
f0498308 ="General Surgery, 35-44 2008"
f0498305 ="General Surgery, 35-44 2005"
f0498410 ="General Surgery, 45-54 2010"
f0498408 ="General Surgery, 45-54 2008"
f0498405 ="General Surgery, 45-54 2005"
f0498510 ="General Surgery, 55-64 2010"
f0498508 ="General Surgery, 55-64 2008"
f0498505 ="General Surgery, 55-64 2005"
f1205810 ="General Surgery, 65-74 2010"
f1205808 ="General Surgery, 65-74 2008"
f1205805 ="General Surgery, 65-74 2005"
f1205910 ="General Surgery, 75+ 2010"
f1205908 ="General Surgery, 75+ 2008"
f1205905 ="General Surgery, 75+ 2005"
f0498810 ="Neurological Surgery, < 35 2010"
f0498808 ="Neurological Surgery, < 35 2008"
f0498805 ="Neurological Surgery, < 35 2005"
f0498910 ="Neurological Surgery, 35-44 2010"
f0498908 ="Neurological Surgery, 35-44 2008"
f0498905 ="Neurological Surgery, 35-44 2005"
f0499010 ="Neurological Surgery, 45-54 2010"
f0499008 ="Neurological Surgery, 45-54 2008"
f0499005 ="Neurological Surgery, 45-54 2005"
f0499110 ="Neurological Surgery, 55-64 2010"
f0499108 ="Neurological Surgery, 55-64 2008"
f0499105 ="Neurological Surgery, 55-64 2005"
f1206010 ="Neurological Surgery, 65-74 2010"
f1206008 ="Neurological Surgery, 65-74 2008"
f1206005 ="Neurological Surgery, 65-74 2005"
f1206110 ="Neurological Surgery, 75+ 2010"
f1206108 ="Neurological Surgery, 75+ 2008"
f1206105 ="Neurological Surgery, 75+ 2005"
f1188410 ="Ob-Gyn, General, < 35 2010"
f1188408 ="Ob-Gyn, General, < 35 2008"
f1188405 ="Ob-Gyn, General, < 35 2005"
f1188510 ="Ob-Gyn, General, 35-44 2010"
f1188508 ="Ob-Gyn, General, 35-44 2008"
f1188505 ="Ob-Gyn, General, 35-44 2005"
f1188610 ="Ob-Gyn, General, 45-54 2010"
f1188608 ="Ob-Gyn, General, 45-54 2008"
f1188605 ="Ob-Gyn, General, 45-54 2005"
f1188710 ="Ob-Gyn, General, 55-64 2010"
f1188708 ="Ob-Gyn, General, 55-64 2008"
f1188705 ="Ob-Gyn, General, 55-64 2005"
f1206210 ="Ob-Gyn, General, 65-74 2010"
f1206208 ="Ob-Gyn, General, 65-74 2008"
f1206205 ="Ob-Gyn, General, 65-74 2005"
f1206310 ="Ob-Gyn, General, 75+ 2010"
f1206308 ="Ob-Gyn, General, 75+ 2008"
f1206305 ="Ob-Gyn, General, 75+ 2005"
f1188910 ="Ob-Gyn Subspecs, < 35 2010"
f1188908 ="Ob-Gyn Subspecs, < 35 2008"
f1188905 ="Ob-Gyn Subspecs, < 35 2005"
f1189010 ="Ob-Gyn Subspecs, 35-44 2010"
f1189008 ="Ob-Gyn Subspecs, 35-44 2008"
f1189005 ="Ob-Gyn Subspecs, 35-44 2005"
f1189110 ="Ob-Gyn Subspecs, 45-54 2010"
f1189108 ="Ob-Gyn Subspecs, 45-54 2008"
f1189105 ="Ob-Gyn Subspecs, 45-54 2005"
f1189210 ="Ob-Gyn Subspecs, 55-64 2010"
f1189208 ="Ob-Gyn Subspecs, 55-64 2008"
f1189205 ="Ob-Gyn Subspecs, 55-64 2005"
f1206410 ="Ob-Gyn Subspecs, 65-74 2010"
f1206408 ="Ob-Gyn Subspecs, 65-74 2008"
f1206405 ="Ob-Gyn Subspecs, 65-74 2005"
f1206510 ="Ob-Gyn Subspecs, 75+ 2010"
f1206508 ="Ob-Gyn Subspecs, 75+ 2008"
f1206505 ="Ob-Gyn Subspecs, 75+ 2005"
f0500010 ="Ophthalmology, < 35 2010"
f0500008 ="Ophthalmology, < 35 2008"
f0500005 ="Ophthalmology, < 35 2005"
f0500110 ="Ophthalmology, 35-44 2010"
f0500108 ="Ophthalmology, 35-44 2008"
f0500105 ="Ophthalmology, 35-44 2005"
f0500210 ="Ophthalmology, 45-54 2010"
f0500208 ="Ophthalmology, 45-54 2008"
f0500205 ="Ophthalmology, 45-54 2005"
f0500310 ="Ophthalmology, 55-64 2010"
f0500308 ="Ophthalmology, 55-64 2008"
f0500305 ="Ophthalmology, 55-64 2005"
f1206610 ="Ophthalmology, 65-74 2010"
f1206608 ="Ophthalmology, 65-74 2008"
f1206605 ="Ophthalmology, 65-74 2005"
f1206710 ="Ophthalmology, 75+ 2010"
f1206708 ="Ophthalmology, 75+ 2008"
f1206705 ="Ophthalmology, 75+ 2005"
f0500610 ="Orthopedic Surgery, < 35 2010"
f0500608 ="Orthopedic Surgery, < 35 2008"
f0500605 ="Orthopedic Surgery, < 35 2005"
f0500710 ="Orthopedic Surgery, 35-44 2010"
f0500708 ="Orthopedic Surgery, 35-44 2008"
f0500705 ="Orthopedic Surgery, 35-44 2005"
f0500810 ="Orthopedic Surgery, 45-54 2010"
f0500808 ="Orthopedic Surgery, 45-54 2008"
f0500805 ="Orthopedic Surgery, 45-54 2005"
f0500910 ="Orthopedic Surgery, 55-64 2010"
f0500908 ="Orthopedic Surgery, 55-64 2008"
f0500905 ="Orthopedic Surgery, 55-64 2005"
f1206810 ="Orthopedic Surgery, 65-74 2010"
f1206808 ="Orthopedic Surgery, 65-74 2008"
f1206805 ="Orthopedic Surgery, 65-74 2005"
f1206910 ="Orthopedic Surgery, 75+ 2010"
f1206908 ="Orthopedic Surgery, 75+ 2008"
f1206905 ="Orthopedic Surgery, 75+ 2005"
f0501210 ="Otolaryngology, < 35 2010"
f0501208 ="Otolaryngology, < 35 2008"
f0501205 ="Otolaryngology, < 35 2005"
f0501310 ="Otolaryngology, 35-44 2010"
f0501308 ="Otolaryngology, 35-44 2008"
f0501305 ="Otolaryngology, 35-44 2005"
f0501410 ="Otolaryngology, 45-54 2010"
f0501408 ="Otolaryngology, 45-54 2008"
f0501405 ="Otolaryngology, 45-54 2005"
f0501510 ="Otolaryngology, 55-64 2010"
f0501508 ="Otolaryngology, 55-64 2008"
f0501505 ="Otolaryngology, 55-64 2005"
f1207010 ="Otolaryngology, 65-74 2010"
f1207008 ="Otolaryngology, 65-74 2008"
f1207005 ="Otolaryngology, 65-74 2005"
f1207110 ="Otolaryngology, 75+ 2010"
f1207108 ="Otolaryngology, 75+ 2008"
f1207105 ="Otolaryngology, 75+ 2005"
f0501810 ="Plastic Surgery, < 35 2010"
f0501808 ="Plastic Surgery, < 35 2008"
f0501805 ="Plastic Surgery, < 35 2005"
f0501910 ="Plastic Surgery, 35-44 2010"
f0501908 ="Plastic Surgery, 35-44 2008"
f0501905 ="Plastic Surgery, 35-44 2005"
f0502010 ="Plastic Surgery, 45-54 2010"
f0502008 ="Plastic Surgery, 45-54 2008"
f0502005 ="Plastic Surgery, 45-54 2005"
f0502110 ="Plastic Surgery, 55-64 2010"
f0502108 ="Plastic Surgery, 55-64 2008"
f0502105 ="Plastic Surgery, 55-64 2005"
f1207210 ="Plastic Surgery, 65-74 2010"
f1207208 ="Plastic Surgery, 65-74 2008"
f1207205 ="Plastic Surgery, 65-74 2005"
f1207310 ="Plastic Surgery, 75+ 2010"
f1207308 ="Plastic Surgery, 75+ 2008"
f1207305 ="Plastic Surgery, 75+ 2005"
f0502410 ="Colon & Rectal Surgery, < 35 2010"
f0502408 ="Colon & Rectal Surgery, < 35 2008"
f0502405 ="Colon & Rectal Surgery, < 35 2005"
f0502510 ="Colon & Rectal Surgery, 35-44 2010"
f0502508 ="Colon & Rectal Surgery, 35-44 2008"
f0502505 ="Colon & Rectal Surgery, 35-44 2005"
f0502610 ="Colon & Rectal Surgery, 45-54 2010"
f0502608 ="Colon & Rectal Surgery, 45-54 2008"
f0502605 ="Colon & Rectal Surgery, 45-54 2005"
f0502710 ="Colon & Rectal Surgery, 55-64 2010"
f0502708 ="Colon & Rectal Surgery, 55-64 2008"
f0502705 ="Colon & Rectal Surgery, 55-64 2005"
f1207410 ="Colon & Rectal Surgery, 65-74 2010"
f1207408 ="Colon & Rectal Surgery, 65-74 2008"
f1207405 ="Colon & Rectal Surgery, 65-74 2005"
f1207510 ="Colon & Rectal Surgery, 75+ 2010"
f1207508 ="Colon & Rectal Surgery, 75+ 2008"
f1207505 ="Colon & Rectal Surgery, 75+ 2005"
f0503010 ="Thoracic Surgery, < 35 2010"
f0503008 ="Thoracic Surgery, < 35 2008"
f0503005 ="Thoracic Surgery, < 35 2005"
f0503110 ="Thoracic Surgery, 35-44 2010"
f0503108 ="Thoracic Surgery, 35-44 2008"
f0503105 ="Thoracic Surgery, 35-44 2005"
f0503210 ="Thoracic Surgery, 45-54 2010"
f0503208 ="Thoracic Surgery, 45-54 2008"
f0503205 ="Thoracic Surgery, 45-54 2005"
f0503310 ="Thoracic Surgery, 55-64 2010"
f0503308 ="Thoracic Surgery, 55-64 2008"
f0503305 ="Thoracic Surgery, 55-64 2005"
f1207610 ="Thoracic Surgery, 65-74 2010"
f1207608 ="Thoracic Surgery, 65-74 2008"
f1207605 ="Thoracic Surgery, 65-74 2005"
f1207710 ="Thoracic Surgery, 75+ 2010"
f1207708 ="Thoracic Surgery, 75+ 2008"
f1207705 ="Thoracic Surgery, 75+ 2005"
f0503610 ="Urology, < 35 2010"
f0503608 ="Urology, < 35 2008"
f0503605 ="Urology, < 35 2005"
f0503710 ="Urology, 35-44 2010"
f0503708 ="Urology, 35-44 2008"
f0503705 ="Urology, 35-44 2005"
f0503810 ="Urology, 45-54 2010"
f0503808 ="Urology, 45-54 2008"
f0503805 ="Urology, 45-54 2005"
f0503910 ="Urology, 55-64 2010"
f0503908 ="Urology, 55-64 2008"
f0503905 ="Urology, 55-64 2005"
f1207810 ="Urology, 65-74 2010"
f1207808 ="Urology, 65-74 2008"
f1207805 ="Urology, 65-74 2005"
f1207910 ="Urology, 75+ 2010"
f1207908 ="Urology, 75+ 2008"
f1207905 ="Urology, 75+ 2005"
f0504210 ="Other Specs, Total, < 35 2010"
f0504208 ="Other Specs, Total, < 35 2008"
f0504205 ="Other Specs, Total, < 35 2005"
f0504310 ="Other Specs, Total, 35-44 2010"
f0504308 ="Other Specs, Total, 35-44 2008"
f0504305 ="Other Specs, Total, 35-44 2005"
f0504410 ="Other Specs, Total, 45-54 2010"
f0504408 ="Other Specs, Total, 45-54 2008"
f0504405 ="Other Specs, Total, 45-54 2005"
f0504510 ="Other Specs, Total, 55-64 2010"
f0504508 ="Other Specs, Total, 55-64 2008"
f0504505 ="Other Specs, Total, 55-64 2005"
f1208010 ="Other Specs, Total, 65-74 2010"
f1208008 ="Other Specs, Total, 65-74 2008"
f1208005 ="Other Specs, Total, 65-74 2005"
f1208110 ="Other Specs, Total, 75+ 2010"
f1208108 ="Other Specs, Total, 75+ 2008"
f1208105 ="Other Specs, Total, 75+ 2005"
f0504810 ="Aerospace Medicine, < 35 2010"
f0504808 ="Aerospace Medicine, < 35 2008"
f0504805 ="Aerospace Medicine, < 35 2005"
f0504910 ="Aerospace Medicine, 35-44 2010"
f0504908 ="Aerospace Medicine, 35-44 2008"
f0504905 ="Aerospace Medicine, 35-44 2005"
f0505010 ="Aerospace Medicine, 45-54 2010"
f0505008 ="Aerospace Medicine, 45-54 2008"
f0505005 ="Aerospace Medicine, 45-54 2005"
f0505110 ="Aerospace Medicine, 55-64 2010"
f0505108 ="Aerospace Medicine, 55-64 2008"
f0505105 ="Aerospace Medicine, 55-64 2005"
f1208210 ="Aerospace Medicine, 65-74 2010"
f1208208 ="Aerospace Medicine, 65-74 2008"
f1208205 ="Aerospace Medicine, 65-74 2005"
f1208310 ="Aerospace Medicine, 75+ 2010"
f1208308 ="Aerospace Medicine, 75+ 2008"
f1208305 ="Aerospace Medicine, 75+ 2005"
f0505410 ="Anesthesiology, < 35 2010"
f0505408 ="Anesthesiology, < 35 2008"
f0505405 ="Anesthesiology, < 35 2005"
f0505510 ="Anesthesiology, 35-44 2010"
f0505508 ="Anesthesiology, 35-44 2008"
f0505505 ="Anesthesiology, 35-44 2005"
f0505610 ="Anesthesiology, 45-54 2010"
f0505608 ="Anesthesiology, 45-54 2008"
f0505605 ="Anesthesiology, 45-54 2005"
f0505710 ="Anesthesiology, 55-64 2010"
f0505708 ="Anesthesiology, 55-64 2008"
f0505705 ="Anesthesiology, 55-64 2005"
f1208410 ="Anesthesiology, 65-74 2010"
f1208408 ="Anesthesiology, 65-74 2008"
f1208405 ="Anesthesiology, 65-74 2005"
f1208510 ="Anesthesiology, 75+ 2010"
f1208508 ="Anesthesiology, 75+ 2008"
f1208505 ="Anesthesiology, 75+ 2005"
f0506010 ="Child Psychiatry, < 35 2010"
f0506008 ="Child Psychiatry, < 35 2008"
f0506005 ="Child Psychiatry, < 35 2005"
f0506110 ="Child Psychiatry, 35-44 2010"
f0506108 ="Child Psychiatry, 35-44 2008"
f0506105 ="Child Psychiatry, 35-44 2005"
f0506210 ="Child Psychiatry, 45-54 2010"
f0506208 ="Child Psychiatry, 45-54 2008"
f0506205 ="Child Psychiatry, 45-54 2005"
f0506310 ="Child Psychiatry, 55-64 2010"
f0506308 ="Child Psychiatry, 55-64 2008"
f0506305 ="Child Psychiatry, 55-64 2005"
f1208610 ="Child Psychiatry, 65-74 2010"
f1208608 ="Child Psychiatry, 65-74 2008"
f1208605 ="Child Psychiatry, 65-74 2005"
f1208710 ="Child Psychiatry, 75+ 2010"
f1208708 ="Child Psychiatry, 75+ 2008"
f1208705 ="Child Psychiatry, 75+ 2005"
f0506610 ="Diagnostic Radiology, < 35 2010"
f0506608 ="Diagnostic Radiology, < 35 2008"
f0506605 ="Diagnostic Radiology, < 35 2005"
f0506710 ="Diagnostic Radiology, 35-44 2010"
f0506708 ="Diagnostic Radiology, 35-44 2008"
f0506705 ="Diagnostic Radiology, 35-44 2005"
f0506810 ="Diagnostic Radiology, 45-54 2010"
f0506808 ="Diagnostic Radiology, 45-54 2008"
f0506805 ="Diagnostic Radiology, 45-54 2005"
f0506910 ="Diagnostic Radiology, 55-64 2010"
f0506908 ="Diagnostic Radiology, 55-64 2008"
f0506905 ="Diagnostic Radiology, 55-64 2005"
f1208810 ="Diagnostic Radiology, 65-74 2010"
f1208808 ="Diagnostic Radiology, 65-74 2008"
f1208805 ="Diagnostic Radiology, 65-74 2005"
f1208910 ="Diagnostic Radiology, 75+ 2010"
f1208908 ="Diagnostic Radiology, 75+ 2008"
f1208905 ="Diagnostic Radiology, 75+ 2005"
f1075910 ="Emergency Medicine, < 35 2010"
f1075908 ="Emergency Medicine, < 35 2008"
f1075905 ="Emergency Medicine, < 35 2005"
f1076010 ="Emergency Medicine, 35-44 2010"
f1076008 ="Emergency Medicine, 35-44 2008"
f1076005 ="Emergency Medicine, 35-44 2005"
f1076110 ="Emergency Medicine, 45-54 2010"
f1076108 ="Emergency Medicine, 45-54 2008"
f1076105 ="Emergency Medicine, 45-54 2005"
f1076210 ="Emergency Medicine, 55-64 2010"
f1076208 ="Emergency Medicine, 55-64 2008"
f1076205 ="Emergency Medicine, 55-64 2005"
f1209010 ="Emergency Medicine, 65-74 2010"
f1209008 ="Emergency Medicine, 65-74 2008"
f1209005 ="Emergency Medicine, 65-74 2005"
f1209110 ="Emergency Medicine, 75+ 2010"
f1209108 ="Emergency Medicine, 75+ 2008"
f1209105 ="Emergency Medicine, 75+ 2005"
f0507210 ="Forensic Pathology, < 35 2010"
f0507208 ="Forensic Pathology, < 35 2008"
f0507205 ="Forensic Pathology, < 35 2005"
f0507310 ="Forensic Pathology, 35-44 2010"
f0507308 ="Forensic Pathology, 35-44 2008"
f0507305 ="Forensic Pathology, 35-44 2005"
f0507410 ="Forensic Pathology, 45-54 2010"
f0507408 ="Forensic Pathology, 45-54 2008"
f0507405 ="Forensic Pathology, 45-54 2005"
f0507510 ="Forensic Pathology, 55-64 2010"
f0507508 ="Forensic Pathology, 55-64 2008"
f0507505 ="Forensic Pathology, 55-64 2005"
f1209210 ="Forensic Pathology, 65-74 2010"
f1209208 ="Forensic Pathology, 65-74 2008"
f1209205 ="Forensic Pathology, 65-74 2005"
f1209310 ="Forensic Pathology, 75+ 2010"
f1209308 ="Forensic Pathology, 75+ 2008"
f1209305 ="Forensic Pathology, 75+ 2005"
f1242610 ="Medical Genetics, < 35 2010"
f1242608 ="Medical Genetics, < 35 2008"
f1242605 ="Medical Genetics, < 35 2005"
f1242710 ="Medical Genetics, 35-44 2010"
f1242708 ="Medical Genetics, 35-44 2008"
f1242705 ="Medical Genetics, 35-44 2005"
f1242810 ="Medical Genetics, 45-54 2010"
f1242808 ="Medical Genetics, 45-54 2008"
f1242805 ="Medical Genetics, 45-54 2005"
f1242910 ="Medical Genetics, 55-64 2010"
f1242908 ="Medical Genetics, 55-64 2008"
f1242905 ="Medical Genetics, 55-64 2005"
f1243010 ="Medical Genetics, 65-74 2010"
f1243008 ="Medical Genetics, 65-74 2008"
f1243005 ="Medical Genetics, 65-74 2005"
f1243110 ="Medical Genetics, 75+ 2010"
f1243108 ="Medical Genetics, 75+ 2008"
f1243105 ="Medical Genetics, 75+ 2005"
f0507810 ="Neurology, < 35 2010"
f0507808 ="Neurology, < 35 2008"
f0507805 ="Neurology, < 35 2005"
f0507910 ="Neurology, 35-44 2010"
f0507908 ="Neurology, 35-44 2008"
f0507905 ="Neurology, 35-44 2005"
f0508010 ="Neurology, 45-54 2010"
f0508008 ="Neurology, 45-54 2008"
f0508005 ="Neurology, 45-54 2005"
f0508110 ="Neurology, 55-64 2010"
f0508108 ="Neurology, 55-64 2008"
f0508105 ="Neurology, 55-64 2005"
f1209410 ="Neurology, 65-74 2010"
f1209408 ="Neurology, 65-74 2008"
f1209405 ="Neurology, 65-74 2005"
f1209510 ="Neurology, 75+ 2010"
f1209508 ="Neurology, 75+ 2008"
f1209505 ="Neurology, 75+ 2005"
f1076410 ="Nuclear Medicine, < 35 2010"
f1076408 ="Nuclear Medicine, < 35 2008"
f1076405 ="Nuclear Medicine, < 35 2005"
f1076510 ="Nuclear Medicine, 35-44 2010"
f1076508 ="Nuclear Medicine, 35-44 2008"
f1076505 ="Nuclear Medicine, 35-44 2005"
f1076610 ="Nuclear Medicine, 45-54 2010"
f1076608 ="Nuclear Medicine, 45-54 2008"
f1076605 ="Nuclear Medicine, 45-54 2005"
f1076710 ="Nuclear Medicine, 55-64 2010"
f1076708 ="Nuclear Medicine, 55-64 2008"
f1076705 ="Nuclear Medicine, 55-64 2005"
f1209610 ="Nuclear Medicine, 65-74 2010"
f1209608 ="Nuclear Medicine, 65-74 2008"
f1209605 ="Nuclear Medicine, 65-74 2005"
f1209710 ="Nuclear Medicine, 75+ 2010"
f1209708 ="Nuclear Medicine, 75+ 2008"
f1209705 ="Nuclear Medicine, 75+ 2005"
f0508410 ="Occupational Medicine, < 35 2010"
f0508408 ="Occupational Medicine, < 35 2008"
f0508405 ="Occupational Medicine, < 35 2005"
f0508510 ="Occupational Medicine, 35-44 2010"
f0508508 ="Occupational Medicine, 35-44 2008"
f0508505 ="Occupational Medicine, 35-44 2005"
f0508610 ="Occupational Medicine, 45-54 2010"
f0508608 ="Occupational Medicine, 45-54 2008"
f0508605 ="Occupational Medicine, 45-54 2005"
f0508710 ="Occupational Medicine, 55-64 2010"
f0508708 ="Occupational Medicine, 55-64 2008"
f0508705 ="Occupational Medicine, 55-64 2005"
f1209810 ="Occupational Medicine, 65-74 2010"
f1209808 ="Occupational Medicine, 65-74 2008"
f1209805 ="Occupational Medicine, 65-74 2005"
f1209910 ="Occupational Medicine, 75+ 2010"
f1209908 ="Occupational Medicine, 75+ 2008"
f1209905 ="Occupational Medicine, 75+ 2005"
f0509010 ="Psychiatry, < 35 2010"
f0509008 ="Psychiatry, < 35 2008"
f0509005 ="Psychiatry, < 35 2005"
f0509110 ="Psychiatry, 35-44 2010"
f0509108 ="Psychiatry, 35-44 2008"
f0509105 ="Psychiatry, 35-44 2005"
f0509210 ="Psychiatry, 45-54 2010"
f0509208 ="Psychiatry, 45-54 2008"
f0509205 ="Psychiatry, 45-54 2005"
f0509310 ="Psychiatry, 55-64 2010"
f0509308 ="Psychiatry, 55-64 2008"
f0509305 ="Psychiatry, 55-64 2005"
f1210010 ="Psychiatry, 65-74 2010"
f1210008 ="Psychiatry, 65-74 2008"
f1210005 ="Psychiatry, 65-74 2005"
f1210110 ="Psychiatry, 75+ 2010"
f1210108 ="Psychiatry, 75+ 2008"
f1210105 ="Psychiatry, 75+ 2005"
f0509610 ="Pathology, Anat/Clinic, < 35 2010"
f0509608 ="Pathology, Anat/Clinic, < 35 2008"
f0509605 ="Pathology, Anat/Clinic, < 35 2005"
f0509710 ="Pathology, Anat/Clinic, 35-44 2010"
f0509708 ="Pathology, Anat/Clinic, 35-44 2008"
f0509705 ="Pathology, Anat/Clinic, 35-44 2005"
f0509810 ="Pathology, Anat/Clinic, 45-54 2010"
f0509808 ="Pathology, Anat/Clinic, 45-54 2008"
f0509805 ="Pathology, Anat/Clinic, 45-54 2005"
f0509910 ="Pathology, Anat/Clinic, 55-64 2010"
f0509908 ="Pathology, Anat/Clinic, 55-64 2008"
f0509905 ="Pathology, Anat/Clinic, 55-64 2005"
f1210210 ="Pathology, Anat/Clinic, 65-74 2010"
f1210208 ="Pathology, Anat/Clinic, 65-74 2008"
f1210205 ="Pathology, Anat/Clinic, 65-74 2005"
f1210310 ="Pathology, Anat/Clinic, 75+ 2010"
f1210308 ="Pathology, Anat/Clinic, 75+ 2008"
f1210305 ="Pathology, Anat/Clinic, 75+ 2005"
f0510210 ="Physical Med & Rehab, < 35 2010"
f0510208 ="Physical Med & Rehab, < 35 2008"
f0510205 ="Physical Med & Rehab, < 35 2005"
f0510310 ="Physical Med & Rehab, 35-44 2010"
f0510308 ="Physical Med & Rehab, 35-44 2008"
f0510305 ="Physical Med & Rehab, 35-44 2005"
f0510410 ="Physical Med & Rehab, 45-54 2010"
f0510408 ="Physical Med & Rehab, 45-54 2008"
f0510405 ="Physical Med & Rehab, 45-54 2005"
f0510510 ="Physical Med & Rehab, 55-64 2010"
f0510508 ="Physical Med & Rehab, 55-64 2008"
f0510505 ="Physical Med & Rehab, 55-64 2005"
f1210410 ="Physical Med & Rehab, 65-74 2010"
f1210408 ="Physical Med & Rehab, 65-74 2008"
f1210405 ="Physical Med & Rehab, 65-74 2005"
f1210510 ="Physical Med & Rehab, 75+ 2010"
f1210508 ="Physical Med & Rehab, 75+ 2008"
f1210505 ="Physical Med & Rehab, 75+ 2005"
f0510810 ="General Preventive Med, < 35 2010"
f0510808 ="General Preventive Med, < 35 2008"
f0510805 ="General Preventive Med, < 35 2005"
f0510910 ="General Preventive Med, 35-44 2010"
f0510908 ="General Preventive Med, 35-44 2008"
f0510905 ="General Preventive Med, 35-44 2005"
f0511010 ="General Preventive Med, 45-54 2010"
f0511008 ="General Preventive Med, 45-54 2008"
f0511005 ="General Preventive Med, 45-54 2005"
f0511110 ="General Preventive Med, 55-64 2010"
f0511108 ="General Preventive Med, 55-64 2008"
f0511105 ="General Preventive Med, 55-64 2005"
f1210610 ="General Preventive Med, 65-74 2010"
f1210608 ="General Preventive Med, 65-74 2008"
f1210605 ="General Preventive Med, 65-74 2005"
f1210710 ="General Preventive Med, 75+ 2010"
f1210708 ="General Preventive Med, 75+ 2008"
f1210705 ="General Preventive Med, 75+ 2005"
f0511410 ="Public Health, < 35 2010"
f0511408 ="Public Health, < 35 2008"
f0511405 ="Public Health, < 35 2005"
f0511510 ="Public Health, 35-44 2010"
f0511508 ="Public Health, 35-44 2008"
f0511505 ="Public Health, 35-44 2005"
f0511610 ="Public Health, 45-54 2010"
f0511608 ="Public Health, 45-54 2008"
f0511605 ="Public Health, 45-54 2005"
f0511710 ="Public Health, 55-64 2010"
f0511708 ="Public Health, 55-64 2008"
f0511705 ="Public Health, 55-64 2005"
f1210810 ="Public Health, 65-74 2010"
f1210808 ="Public Health, 65-74 2008"
f1210805 ="Public Health, 65-74 2005"
f1210910 ="Public Health, 75+ 2010"
f1210908 ="Public Health, 75+ 2008"
f1210905 ="Public Health, 75+ 2005"
f1077310 ="Radiology, < 35 2010"
f1077308 ="Radiology, < 35 2008"
f1077305 ="Radiology, < 35 2005"
f1077410 ="Radiology, 35-44 2010"
f1077408 ="Radiology, 35-44 2008"
f1077405 ="Radiology, 35-44 2005"
f1077510 ="Radiology, 45-54 2010"
f1077508 ="Radiology, 45-54 2008"
f1077505 ="Radiology, 45-54 2005"
f1077610 ="Radiology, 55-64 2010"
f1077608 ="Radiology, 55-64 2008"
f1077605 ="Radiology, 55-64 2005"
f1211010 ="Radiology, 65-74 2010"
f1211008 ="Radiology, 65-74 2008"
f1211005 ="Radiology, 65-74 2005"
f1211110 ="Radiology, 75+ 2010"
f1211108 ="Radiology, 75+ 2008"
f1211105 ="Radiology, 75+ 2005"
f0512610 ="Radiation Oncology, < 35 2010"
f0512608 ="Radiation Oncology, < 35 2008"
f0512605 ="Radiation Oncology, < 35 2005"
f0512710 ="Radiation Oncology, 35-44 2010"
f0512708 ="Radiation Oncology, 35-44 2008"
f0512705 ="Radiation Oncology, 35-44 2005"
f0512810 ="Radiation Oncology, 45-54 2010"
f0512808 ="Radiation Oncology, 45-54 2008"
f0512805 ="Radiation Oncology, 45-54 2005"
f0512910 ="Radiation Oncology, 55-64 2010"
f0512908 ="Radiation Oncology, 55-64 2008"
f0512905 ="Radiation Oncology, 55-64 2005"
f1211210 ="Radiation Oncology, 65-74 2010"
f1211208 ="Radiation Oncology, 65-74 2008"
f1211205 ="Radiation Oncology, 65-74 2005"
f1211310 ="Radiation Oncology, 75+ 2010"
f1211308 ="Radiation Oncology, 75+ 2008"
f1211305 ="Radiation Oncology, 75+ 2005"
f1365910 ="Transplantation Surgery, < 35 2010"
f1365908 ="Transplantation Surgery, < 35 2008"
f1365905 ="Transplantation Surgery, < 35 2005"
f1366010 ="Transplantation Surgery, 35-44 2010"
f1366008 ="Transplantation Surgery, 35-44 2008"
f1366005 ="Transplantation Surgery, 35-44 2005"
f1366110 ="Transplantation Surgery, 45-54 2010"
f1366108 ="Transplantation Surgery, 45-54 2008"
f1366105 ="Transplantation Surgery, 45-54 2005"
f1366210 ="Transplantation Surgery, 55-64 2010"
f1366208 ="Transplantation Surgery, 55-64 2008"
f1366205 ="Transplantation Surgery, 55-64 2005"
f1366310 ="Transplantation Surgery, 65-74 2010"
f1366308 ="Transplantation Surgery, 65-74 2008"
f1366305 ="Transplantation Surgery, 65-74 2005"
f1366410 ="Transplantation Surgery, 75+ 2010"
f1366408 ="Transplantation Surgery, 75+ 2008"
f1366405 ="Transplantation Surgery, 75+ 2005"
f1364410 ="Vascular Medicine, < 35 2010"
f1364408 ="Vascular Medicine, < 35 2008"
f1364405 ="Vascular Medicine, < 35 2005"
f1364510 ="Vascular Medicine, 35-44 2010"
f1364508 ="Vascular Medicine, 35-44 2008"
f1364505 ="Vascular Medicine, 35-44 2005"
f1364610 ="Vascular Medicine, 45-54 2010"
f1364608 ="Vascular Medicine, 45-54 2008"
f1364605 ="Vascular Medicine, 45-54 2005"
f1364710 ="Vascular Medicine, 55-64 2010"
f1364708 ="Vascular Medicine, 55-64 2008"
f1364705 ="Vascular Medicine, 55-64 2005"
f1364810 ="Vascular Medicine, 65-74 2010"
f1364808 ="Vascular Medicine, 65-74 2008"
f1364805 ="Vascular Medicine, 65-74 2005"
f1364910 ="Vascular Medicine, 75+ 2010"
f1364908 ="Vascular Medicine, 75+ 2008"
f1364905 ="Vascular Medicine, 75+ 2005"
f1077710 ="Other Specialty, < 35 2010"
f1077708 ="Other Specialty, < 35 2008"
f1077705 ="Other Specialty, < 35 2005"
f1077810 ="Other Specialty, 35-44 2010"
f1077808 ="Other Specialty, 35-44 2008"
f1077805 ="Other Specialty, 35-44 2005"
f1077910 ="Other Specialty, 45-54 2010"
f1077908 ="Other Specialty, 45-54 2008"
f1077905 ="Other Specialty, 45-54 2005"
f1078010 ="Other Specialty, 55-64 2010"
f1078008 ="Other Specialty, 55-64 2008"
f1078005 ="Other Specialty, 55-64 2005"
f1211410 ="Other Specialty, 65-74 2010"
f1211408 ="Other Specialty, 65-74 2008"
f1211405 ="Other Specialty, 65-74 2005"
f1211510 ="Other Specialty, 75+ 2010"
f1211508 ="Other Specialty, 75+ 2008"
f1211505 ="Other Specialty, 75+ 2005"
f0513810 ="Unspecified, < 35 2010"
f0513808 ="Unspecified, < 35 2008"
f0513805 ="Unspecified, < 35 2005"
f0513910 ="Unspecified, 35-44 2010"
f0513908 ="Unspecified, 35-44 2008"
f0513905 ="Unspecified, 35-44 2005"
f0514010 ="Unspecified, 45-54 2010"
f0514008 ="Unspecified, 45-54 2008"
f0514005 ="Unspecified, 45-54 2005"
f0514110 ="Unspecified, 55-64 2010"
f0514108 ="Unspecified, 55-64 2008"
f0514105 ="Unspecified, 55-64 2005"
f1211610 ="Unspecified, 65-74 2010"
f1211608 ="Unspecified, 65-74 2008"
f1211605 ="Unspecified, 65-74 2005"
f1211710 ="Unspecified, 75+ 2010"
f1211708 ="Unspecified, 75+ 2008"
f1211705 ="Unspecified, 75+ 2005"
f0514410 ="MD's, Inactive, < 35 2010"
f0514408 ="MD's, Inactive, < 35 2008"
f0514405 ="MD's, Inactive, < 35 2005"
f0514510 ="MD's, Inactive, 35-44 2010"
f0514508 ="MD's, Inactive, 35-44 2008"
f0514505 ="MD's, Inactive, 35-44 2005"
f0514610 ="MD's, Inactive, 45-54 2010"
f0514608 ="MD's, Inactive, 45-54 2008"
f0514605 ="MD's, Inactive, 45-54 2005"
f0514710 ="MD's, Inactive, 55-64 2010"
f0514708 ="MD's, Inactive, 55-64 2008"
f0514705 ="MD's, Inactive, 55-64 2005"
f1211810 ="MD's, Inactive, 65-74 2010"
f1211808 ="MD's, Inactive, 65-74 2008"
f1211805 ="MD's, Inactive, 65-74 2005"
f1211910 ="MD's, Inactive, 75+ 2010"
f1211908 ="MD's, Inactive, 75+ 2008"
f1211905 ="MD's, Inactive, 75+ 2005"
f0515010 ="MD's, Not Classified, < 35 2010"
f0515008 ="MD's, Not Classified, < 35 2008"
f0515005 ="MD's, Not Classified, < 35 2005"
f0515110 ="MD's, Not Classified, 35-44 2010"
f0515107 ="MD's, Not Classified, 35-44 2007"
f0515105 ="MD's, Not Classified, 35-44 2005"
f0515210 ="MD's, Not Classified, 45-54 2010"
f0515208 ="MD's, Not Classified, 45-54 2008"
f0515205 ="MD's, Not Classified, 45-54 2005"
f0515310 ="MD's, Not Classified, 55-64 2010"
f0515308 ="MD's, Not Classified, 55-64 2008"
f0515305 ="MD's, Not Classified, 55-64 2005"
f1212010 ="MD's, Not Classified, 65-74 2010"
f1212008 ="MD's, Not Classified, 65-74 2008"
f1212005 ="MD's, Not Classified, 65-74 2005"
f1212110 ="MD's, Not Classified, 75+ 2010"
f1212108 ="MD's, Not Classified, 75+ 2008"
f1212105 ="MD's, Not Classified, 75+ 2005"
f0861200 ="Physicians and Surgeons 2000"
f0861290 ="Physicians, M.D.'s & D.O.'s 1990"
f0861280 ="Physicians, M.D.'s & D.O.'s 1980"
f1387910 ="Total D.O.'s, Tot Non-Fed & Fed 2010"
f1387908 ="Total D.O.'s, Tot Non-Fed & Fed 2008"
f1387906 ="Total D.O.'s, Tot Non-Fed & Fed 2006"
f1387905 ="Total D.O.'s, Tot Non-Fed & Fed 2005"
f1388010 ="Total D.O.'s, Total Non-Fed 2010"
f1388008 ="Total D.O.'s, Total Non-Fed 2008"
f1388006 ="Total D.O.'s, Total Non-Fed 2006"
f1388005 ="Total D.O.'s, Total Non-Fed 2005"
f1388110 ="Total D.O.'s, Total Federal 2010"
f1388108 ="Total D.O.'s, Total Federal 2008"
f1388106 ="Total D.O.'s, Total Federal 2006"
f1388105 ="Total D.O.'s, Total Federal 2005"
f1388210 ="Tot Active D.O.s Non-Fed & Fed 2010"
f1388208 ="Tot Active D.O.s Non-Fed & Fed 2008"
f1388206 ="Tot Active D.O.s Non-Fed & Fed 2006"
f1388205 ="Tot Active D.O.s Non-Fed & Fed 2005"
f1388310 ="Total Active D.O.s Non-Federal 2010"
f1388308 ="Total Active D.O.s Non-Federal 2008"
f1388306 ="Total Active D.O.s Non-Federal 2006"
f1388305 ="Total Active D.O.s Non-Federal 2005"
f1388410 ="Total Active D.O.s Federal 2010"
f1388408 ="Total Active D.O.s Federal 2008"
f1388406 ="Total Active D.O.s Federal 2006"
f1388405 ="Total Active D.O.s Federal 2005"
f1469310 ="D.O.'s, Total Ptn Care Non-Fed 2010"
f1469410 ="D.O.'s, PC, Off Based Non-Fed 2010"
f1469510 ="D.O.'s, Total PC, Hosp Resident 2010"
f1469610 ="D.O.'s, Total PC, Hosp FT Staff 2010"
f1469710 ="D.O.'s, Total Oth Prof Activity 2010"
f1469810 ="DO's Inactive, Total 2010"
f1469910 ="DO's Not Classified, Total 2010"
f1470010 ="Total D.O.'s, Male 2010"
f1470110 ="Total D.O.'s, Female 2010"
f1470210 ="DO's, Inactive, Male 2010"
f1470310 ="DO's, Inactive, Female 2010"
f1470410 ="Total D.O.'s, < 35 2010"
f1470510 ="Total D.O.'s, 35-44 2010"
f1470610 ="Total D.O.'s, 45-54 2010"
f1470710 ="Total D.O.'s, 55-64 2010"
f1470810 ="Total D.O.'s, 65-74 2010"
f1470910 ="Total D.O.'s, 75+ 2010"
f1471010 ="DO's, Inactive, < 35 2010"
f1471110 ="DO's, Inactive, 35-44 2010"
f1471210 ="DO's, Inactive, 45-54 2010"
f1471310 ="DO's, Inactive, 55-64 2010"
f1471410 ="DO's, Inactive, 65-74 2010"
f1471510 ="DO's, Inactive, 75+ 2010"
f1471610 ="DO's, Gen Pract, Total 2010"
f1471710 ="DO's, Gen Pract, Total Ptn Care 2010"
f1471810 ="DO's, Fam Med Gen, Total 2010"
f1471910 ="DO's, Fam Med Gen, Tot Ptn Cr 2010"
f1472010 ="DO's, Fam Med Subspec, Total 2010"
f1472110 ="DO's, Fam Med Subsp,Tot Ptn Cr 2010"
f1472210 ="DO's, Gnrl Int Med, Total 2010"
f1472310 ="DO's, Gnrl Int Med, Tot Ptn Cr 2010"
f1472410 ="DO's, Int Med Subspecs, Total 2010"
f1472510 ="DO's, IntMed Subspcs,Tot Ptn Cr 2010"
f1472610 ="DO's, Pediatrics, General, Tot 2010"
f1472710 ="DO's, Pediatrics,Gen,Tot Ptn Cr 2010"
f1472810 ="DO's, Ped Subspecs, Total 2010"
f1472910 ="DO's, Ped Subspecs, Tot Patn Cr 2010"
f1473010 ="DO's, Ob-Gyn, General, Total 2010"
f1473110 ="DO's, Ob-Gyn, Gen, Tot Patn Cr 2010"
f1473210 ="DO's, Ob-Gyn Subspecs, Total 2010"
f1473310 ="DO's, Ob-Gyn Subspcs,Tot Ptn Cr 2010"
f1473410 ="DO's, Genrl Surg, Total 2010"
f1473510 ="DO's, Genrl Surg, Tot Ptnt Care 2010"
f1473610 ="DO's, Orthopedic Surg, Total 2010"
f1473710 ="DO's, Orthopedic Srg,Tot Ptn Cr 2010"
f1473810 ="DO's, Anesthesiolgy, Total 2010"
f1473910 ="DO's, Anesthesiolgy, Tot Ptn Cr 2010"
f1474010 ="DO's, Emergency Med, Total 2010"
f1474110 ="DO's, Emergency Med, Tot Ptn Cr 2010"
f1474210 ="DO's, Psychiatry, Total 2010"
f1474310 ="DO's, Psychiatry, Tot Patnt Cr 2010"
f1474410 ="DO's, Phys Med/Rehab, Total 2010"
f1474510 ="DO's, Phys Med/Rehab,Tot Ptn Cr 2010"
f1474610 ="DO's, Other Specs, Total 2010"
f1474710 ="DO's, Other Specs, Tot Patnt Cr 2010"
f1359907 ="D.O. Total Active Non-Fed & Fed 2007"
f1359904 ="D.O. Total Active Non-Fed & Fed 2004"
f1359903 ="D.O. Total Active Non-Fed & Fed 2003"
f1359901 ="D.O. Total Active Non-Fed & Fed 2001"
f1359607 ="D.O. Total Non-Federal 2007"
f1359604 ="D.O. Total Non-Federal 2004"
f1359603 ="D.O. Total Non-Federal 2003"
f1359601 ="D.O. Total Non-Federal 2001"
f1325707 ="D.O. Total Active Non-Federal 2007"
f1325704 ="D.O. Total Active Non-Federal 2004"
f1325703 ="D.O. Total Active Non-Federal 2003"
f1325701 ="D.O. Total Active Non-Federal 2001"
f1325798 ="D.O. Total Active Non-Federal 1998"
f1398507 ="D.O. Total Patient Care 2007"
f1398504 ="D.O. Patient Care 2004"
f1398503 ="D.O. Patient Care 2003"
f1325801 ="D.O. Patient Care 2001"
f1325898 ="D.O. Patient Care 1998"
f1412307 ="D.O. Office Based, Patient Care 2007"
f1412407 ="D.O. Hospital Staff, Patn Care 2007"
f1412507 ="D.O. Postdoc Train, Patn Care 2007"
f1325901 ="D.O. Internship/Residency 2001"
f1325998 ="D.O. Internship/Residency 1998"
f1398607 ="D.O. Administration 2007"
f1398604 ="D.O. Administration 2004"
f1398603 ="D.O. Administration 2003"
f1326001 ="D.O. Administration 2001"
f1326098 ="D.O. Administration 1998"
f1398707 ="D.O. Teaching 2007"
f1398704 ="D.O. Teaching 2004"
f1398703 ="D.O. Teaching 2003"
f1326101 ="D.O. Teaching 2001"
f1326198 ="D.O. Teaching 1998"
f1398807 ="D.O. Research 2007"
f1398804 ="D.O. Research 2004"
f1398803 ="D.O. Research 2003"
f1326201 ="D.O. Research 2001"
f1326298 ="D.O. Research 1998"
f1398907 ="D.O. Other Major Prof Activity 2007"
f1398904 ="D.O. Other Major Prof Activity 2004"
f1398903 ="D.O. Other Major Prof Activity 2003"
f1326301 ="D.O. Other Practice Type 2001"
f1326398 ="D.O. Other Practice Type 1998"
f1399007 ="D.O. Inactive/Retired 2007"
f1399004 ="D.O. Inactive/Retired 2004"
f1399003 ="D.O. Inactive/Retired 2003"
f1359701 ="D.O. Inactive/Retired 2001"
f1412607 ="D.O. Major Prof Activity Unknwn 2007"
f1326407 ="D.O. Total Male 2007"
f1326404 ="D.O. Total Male 2004"
f1326403 ="D.O. Total Male 2003"
f1326401 ="D.O. Total Male 2001"
f1326498 ="D.O. Total Male 1998"
f1326507 ="D.O. Total Female 2007"
f1326504 ="D.O. Total Female 2004"
f1326503 ="D.O. Total Female 2003"
f1326501 ="D.O. Total Female 2001"
f1326598 ="D.O. Total Female 1998"
f1359803 ="D.O. Gender Unknown 2003"
f1359801 ="D.O. Gender Unknown 2001"
f1326607 ="D.O. Board Certified 2007"
f1326604 ="D.O. Board Certified 2004"
f1326603 ="D.O. Board Certified 2003"
f1326601 ="D.O. Board Certified 2001"
f1326698 ="D.O. Board Certified 1998"
f1326707 ="D.O. Not Board Certified 2007"
f1326704 ="D.O. Not Board Certified 2004"
f1326703 ="D.O. Not Board Certified 2003"
f1326701 ="D.O. Not Board Certified 2001"
f1326798 ="D.O. Not Board Certified 1998"
f1326807 ="D.O. < 35 2007"
f1326804 ="D.O. < 35 2004"
f1326803 ="D.O. < 35 2003"
f1326801 ="D.O. < 35 2001"
f1326898 ="D.O. < 35 1998"
f1326907 ="D.O. 35-44 2007"
f1326904 ="D.O. 35-44 2004"
f1326903 ="D.O. 35-44 2003"
f1326901 ="D.O. 35-44 2001"
f1326998 ="D.O. 35-44 1998"
f1327007 ="D.O. 45-54 2007"
f1327004 ="D.O. 45-54 2004"
f1327003 ="D.O. 45-54 2003"
f1327001 ="D.O. 45-54 2001"
f1327098 ="D.O. 45-54 1998"
f1327107 ="D.O. 55-64 2007"
f1327104 ="D.O. 55-64 2004"
f1327103 ="D.O. 55-64 2003"
f1327101 ="D.O. 55-64 2001"
f1327198 ="D.O. 55-64 1998"
f1327207 ="D.O. 65-74 2007"
f1327204 ="D.O. 65-74 2004"
f1327203 ="D.O. 65-74 2003"
f1327201 ="D.O. 65-74 2001"
f1327298 ="D.O. 65-74 1998"
f1327307 ="D.O. > 74 2007"
f1327304 ="D.O. > 74 2004"
f1327303 ="D.O. > 74 2003"
f1327301 ="D.O. > 74 2001"
f1327398 ="D.O. > 74 1998"
f1327407 ="D.O. Age Unknown 2007"
f1327404 ="D.O. Age Unknown 2004"
f1327403 ="D.O. Age Unknown 2003"
f1327401 ="D.O. Age Unknown 2001"
f1327498 ="D.O. Age Unknown 1998"
f1399107 ="D.O. General/Family Practice 2007"
f1399104 ="D.O. General/Family Practice 2004"
f1399103 ="D.O. General/Family Practice 2003"
f1327501 ="D.O. General/Family Practice 2001"
f1327598 ="D.O. General/Family Practice 1998"
f1399207 ="D.O. General Pediatrics 2007"
f1399204 ="D.O. General Pediatrics 2004"
f1399203 ="D.O. General Pediatrics 2003"
f1327601 ="D.O. General Pediatrics 2001"
f1327698 ="D.O. General Pediatrics 1998"
f1399307 ="D.O. General Internal Medicine 2007"
f1399304 ="D.O. General Internal Medicine 2004"
f1399303 ="D.O. General Internal Medicine 2003"
f1327701 ="D.O. General Internal Medicine 2001"
f1327798 ="D.O. General Internal Medicine 1998"
f1399407 ="D.O. Obstetrics and Gynecology 2007"
f1399404 ="D.O. Obstetrics and Gynecology 2004"
f1399403 ="D.O. Obstetrics and Gynecology 2003"
f1327801 ="D.O. Obstetrics and Gynecology 2001"
f1327898 ="D.O. Obstetrics and Gynecology 1998"
f1399507 ="D.O. Osteopathic Specialties 2007"
f1399504 ="D.O. Osteopathic Specialties 2004"
f1399503 ="D.O. Osteopathic Specialties 2003"
f1327901 ="D.O. Osteo Manipulative Treatmt 2001"
f1327998 ="D.O. Osteo Manipulative Treatmt 1998"
f1328001 ="D.O. Non Primary Care 2001"
f1328098 ="D.O. Non Primary Care 1998"
f1399607 ="D.O. Other Specialty 2007"
f1399604 ="D.O. Other Specialty 2004"
f1399603 ="D.O. Other Specialty 2003"
f1399707 ="D.O. Presumed in Postdoc Train 2007"
f1399704 ="D.O. Presumed in Postdoc Train 2004"
f1399703 ="D.O. Presumed in Postdoc Train 2003"
f1399807 ="D.O. Specialty Unknown 2007"
f1399804 ="D.O. Specialty Unknown 2004"
f1399803 ="D.O. Specialty Unknown 2003"
f1328101 ="D.O. Primary Cre Status Unknown 2001"
f1328198 ="D.O. Primary Cre Status Unknown 1998"
f1465010 ="Dentists w/NPI 2010"
f1467009 ="Dentists from State Boards 2009"
f1318307 ="Dentists, Total Prof Active 2007"
f1318398 ="Dentists, Total Prof Active 1998"
f1318395 ="Dentists, Total Prof Active 1995"
f1317791 ="Dentists, Total Prof Active 1991"
f1317107 ="Dentists, Total Priv Practice 2007"
f1317198 ="Dentists, Total Priv Practice 1998"
f1317195 ="Dentists, Total Priv Practice 1995"
f1317891 ="Dentists, Total Priv Practice 1991"
f1317907 ="Dentists, State or Local Govt 2007"
f1317998 ="Dentists, State or Local Govt 1998"
f1317995 ="Dentists, State or Local Govt 1995"
f1328207 ="Dent,Staff, Fac & Staf,Hlth Org 2007"
f1328298 ="Dent,Staff, Fac & Staf,Hlth Org 1998"
f1318095 ="Dentists, Hosp Stf or Other Org 1995"
f1318107 ="Dentists, Intern/Resident 2007"
f1318198 ="Dentists, Intern/Resident 1998"
f1318195 ="Dentists, Graduate Student 1995"
f1318407 ="Dent,Armed Forces & Oth Fed Srv 2007"
f1318498 ="Dent,Armed Forces & Oth Fed Srv 1998"
f1318495 ="Dent,Armed Forces & Oth Fed Srv 1995"
f1328607 ="Dentists, Faculty 2007"
f1328698 ="Dentists, Faculty 1998"
f1409207 ="Dentists,PT Faculty/PT Practice 2007"
f1409307 ="Dentists, Seeking Employment 2007"
f1328307 ="Dentists, Other 2007"
f1328398 ="Dentists, Other 1998"
f1328407 ="Dentists, No Longer in Practice 2007"
f1328498 ="Dentists, Retired 1998"
f1409407 ="Dentists, Occup Type Unknown 2007"
f1050607 ="Dentists, Total, Priv Pract, FT 2007"
f1050698 ="Dentists, Total, Priv Pract, FT 1998"
f1050695 ="Dentists, Total, Priv Pract, FT 1995"
f1050707 ="Dentists, Total, Priv Pract, PT 2007"
f1050798 ="Dentists, Total, Priv Pract, PT 1998"
f1050795 ="Dentists, Total, Priv Pract, PT 1995"
f1317207 ="Dent, Total Male, Priv Pract 2007"
f1317298 ="Dent, Total Male, Priv Pract 1998"
f1317295 ="Dent, Total Male, Priv Pract 1995"
f1317307 ="Dent, Total Female, Priv Pract 2007"
f1317398 ="Dent, Total Female, Priv Pract 1998"
f1317395 ="Dent, Total Female, Priv Pract 1995"
f1409507 ="Dent, Gender Unknown,Priv Pract 2007"
f0861300 ="Dentists 2000"
f0861390 ="Dentists 1990"
f0861380 ="Dentists 1980"
f0350687 ="Dentists, Total Active 1987"
f0350681 ="Dentists, Total Active 1981"
f1317407 ="Dent, Priv Pract,Tot GPs & Ped 2007"
f1317498 ="Dent, Priv Pract,Tot GPs & Ped 1998"
f1317495 ="Dent, Priv Pract,Tot GPs & Ped 1995"
f1317507 ="Dent, Priv Pract,Tot Other Spec 2007"
f1317598 ="Dent, Priv Pract,Tot Other Spec 1998"
f1317595 ="Dent, Priv Pract,Tot Other Spec 1995"
f1049807 ="# Active Dentists < 35 2007"
f1049898 ="# Active Dentists < 35 1998"
f1049895 ="# Active Dentists < 35 1995"
f1049887 ="# Active Dentists < 35 1987"
f1049881 ="# Active Dentists < 35 1981"
f1131807 ="# Active Dentists 35-44 2007"
f1131898 ="# Active Dentists 35-44 1998"
f1131895 ="# Active Dentists 35-44 1995"
f1131887 ="# Active Dentists 35-44 1987"
f1049981 ="# Active Dentists 35-39 1981"
f1050081 ="# Active Dentists 40-44 1981"
f1131907 ="# Active Dentists 45-54 2007"
f1131998 ="# Active Dentists 45-54 1998"
f1131995 ="# Active Dentists 45-54 1995"
f1131987 ="# Active Dentists 45-54 1987"
f1050181 ="# Active Dentists 45-49 1981"
f1050281 ="# Active Dentists 50-54 1981"
f1317607 ="# Active Dentists 55-64 2007"
f1317698 ="# Active Dentists 55-64 1998"
f1317695 ="# Active Dentists 55-64 1995"
f1050387 ="# Active Dentists 55-59 1987"
f1050381 ="# Active Dentists 55-59 1981"
f1050487 ="# Active Dentists 60-64 1987"
f1050481 ="# Active Dentists 60-64 1981"
f1050507 ="# Active Dentists 65+ 2007"
f1050598 ="# Active Dentists 65+ 1998"
f1050595 ="# Active Dentists 65+ 1995"
f1050587 ="# Active Dentists 65+ 1987"
f1050581 ="# Active Dentists 65+ 1981"
f1328507 ="# Active Dentists Age Unknown 2007"
f1328598 ="# Active Dentists Age Unknown 1998"
f1466909 ="Licensed Dental Hygienists 2009"
f0862800 ="Dental Hygienists 2000"
f0862890 ="Dental Hygienists 1990"
f0862880 ="Dental Hygienists 1980"
f0863300 ="Dental Assistants 2000"
f0863390 ="Dental Assistants 1990"
f0863380 ="Dental Assistants 1980"
f0864190 ="Dental Lab/Med Appl. Technician 1990"
f0864180 ="Dental Lab/Med Appl. Technician 1980"
f1464110 ="Physician Assistants w/NPI 2010"
f1322810 ="Physician Assistants 2010"
f1322807 ="Physician Assistants 2007"
f1322803 ="Physician Assistants 2003"
f1322801 ="Physician Assistants 2001"
f1322899 ="Physician Assistants 1999"
f1322898 ="Physician Assistants 1998"
f1322910 ="Physician Assistants, Female 2010"
f1322907 ="Physician Assistants, Female 2007"
f1322903 ="Physician Assistants, Female 2003"
f1322901 ="Physician Assistants, Female 2001"
f1322999 ="Physician Assistants, Female 1999"
f1322998 ="Physician Assistants, Female 1998"
f1323010 ="Physician Assistants, Male 2010"
f1323007 ="Physician Assistants, Male 2007"
f1323003 ="Physician Assistants, Male 2003"
f1323001 ="Physician Assistants, Male 2001"
f1323099 ="Physician Assistants, Male 1999"
f1323098 ="Physician Assistants, Male 1998"
f1366510 ="Physician Assist,Gender Unknown 2010"
f1366507 ="Physician Assist,Gender Unknown 2007"
f1366503 ="Physician Assist,Gender Unknown 2003"
f1366501 ="Physician Assist,Gender Unknown 2001"
f1366610 ="Physician Assistants, Active 2010"
f1366607 ="Physician Assistants, Active 2007"
f1366603 ="Physician Assistants, Active 2003"
f1366601 ="Physician Assistants, Active 2001"
f1395810 ="Physician Assistants, Inactive 2010"
f1395807 ="Physician Assistants, Inactive 2007"
f1395803 ="Physician Assistants, Inactive 2003"
f1395903 ="Physician Assistants, Prim Care 2003"
f1396003 ="Physician Assistants, Surg Spec 2003"
f1396103 ="Physician Assistants,Other Spec 2003"
f1396203 ="Physician Assistants, Unk Spec 2003"
f0862600 ="Physician Assistants 2000"
f0862690 ="Physician Assistants 1990"
f0862680 ="Physician Assistants 1980"
f1464610 ="Adv Practice Regist Nurse w/NPI 2010"
f1464210 ="Nurse Practitioners w/NPI 2010"
f1367501 ="Nurse Practitioners 2001"
f1464310 ="Clinical Nurse Specialist w/NPI 2010"
f1464410 ="Cert Regist Nurs Anesthet w/NPI 2010"
f1423709 ="Cert Regist Nurse Anesthetists 2009"
f1464510 ="Adv Pract Nurse Midwives w/NPI 2010"
f1396311 ="Certified Nurse Midwives 2011"
f1396303 ="Certified Nurse Midwives 2003"
f1396403 ="Certified Nurse Midwives, FT 2003"
f1396503 ="Certified Nurse Midwives, PT 2003"
f1396603 ="Cert Nurse Midwvs,Retrd/Not Emp 2003"
f1396703 ="Cert Nurse Midwve,Unk Emp Stat 2003"
f1396803 ="Cert Nurse Midwvs,FT Hosp/Med 2003"
f1396903 ="Cert Nurse Midwvs,FT Mid/PhysPr 2003"
f1397003 ="Cert Nurse Midwvs,FT Educ Inst 2003"
f1397103 ="Cert Nurse Midwvs,FT Oth EmpTyp 2003"
f1397203 ="Cert Nurse Midwvs,FT Unk EmpTyp 2003"
f0861900 ="Registered Nurses 2000"
f0861990 ="Registered Nurses 1990"
f0861980 ="Registered Nurses 1980"
f0863100 ="LPNs/LVNs 2000"
f0863190 ="Licensed Practical Nurses 1990"
f0863180 ="Licensed Practical Nurses 1980"
f1464810 ="Chiropractors w/NPI 2010"
f1466809 ="Licensed Chiropractors 2009"
f1366701 ="Chiropractors 2001"
f1393800 ="Chiropractors 2000"
f1393900 ="Dieticians and Nutritionists 2000"
f0862090 ="Dieticians 1990"
f0862080 ="Dieticians 1980"
f1464910 ="Optometrists w/NPI 2010"
f1423909 ="Licensed Optometrists 2009"
f0861500 ="Optometrists 2000"
f0861590 ="Optometrists 1990"
f0861580 ="Optometrists 1980"
f1424009 ="Licensed Pharmacists 2009"
f0861800 ="Pharmacists 2000"
f0861890 ="Pharmacists 1990"
f0861880 ="Pharmacists 1980"
f1464710 ="Podiatrists w/NPI 2010"
f1424209 ="Licensed Podiatrists 2009"
f0861400 ="Podiatrists 2000"
f0861490 ="Podiatrists 1990"
f0861480 ="Podiatrists 1980"
f1423609 ="Licensed Audiologists 2009"
f1394000 ="Audiologists 2000"
f0862200 ="Occupational Therapists 2000"
f0862290 ="Occupational Therapists 1990"
f0862280 ="Occupational Therapists 1980"
f1467109 ="Licensed Physical Therapists 2009"
f0862300 ="Physical Therapists 2000"
f0862390 ="Physical Therapists 1990"
f0862380 ="Physical Therapists 1980"
f1394100 ="Radiation Therapists 2000"
f1394200 ="Recreational Therapists 2000"
f0862100 ="Respiratory Therapists 2000"
f0862190 ="Respiratory Therapists 1990"
f0862180 ="Inhalation Therapists 1980"
f1424409 ="Licensed Speech-Language Path 2009"
f0862400 ="Speech-Language Pathologists 2000"
f0862490 ="Speech Therapists 1990"
f0862480 ="Speech Therapists 1980"
f1394300 ="Therapists, All Other 2000"
f0862590 ="Therapists,N.E.C. 1990"
f0862580 ="Therapists,N.E.C. 1980"
f0861600 ="Veterinarians 2000"
f0861690 ="Veterinarians 1990"
f0861680 ="Veterinarians 1980"
f1394400 ="Hlth Diag & Treat Practioners,Oth 2000"
f0861790 ="Health Diag Practitioners,N.E.C 1990"
f0861780 ="Health Diag Practitioners,N.E.C 1980"
f1395700 ="Healthcare Practitioner Prof 2000"
f0862700 ="Clinic Lab Technlgsts & Techncns 2000"
f0862790 ="Clinical Laboratory Technicians 1990"
f0862780 ="Clinical Laboratory Technicians 1980"
f1394500 ="Diag Relatd Technlgsts & Techncns 2000"
f1394600 ="Emerg Med Technicns & Paramedics 2000"
f1394700 ="Hlth Diag & Treat Practr SuppTech 2000"
f0862900 ="Med Records & Health Info Techs 2000"
f0862990 ="Health Record Technicians 1990"
f0862980 ="Health Record Technicians 1980"
f0864000 ="Opticians, Dispensing 2000"
f0864090 ="Optical Goods Workers 1990"
f0864080 ="Optical Goods Workers 1980"
f1394800 ="Misc Hlth Technlgsts & Techncns 2000"
f1394900 ="Oth Hlthcare Practr & Tech Occp 2000"
f1395000 ="Nursing,Psych, & Home Hlth Aides 2000"
f0863590 ="Nurs Aides Orderlies/Attendents 1990"
f0863580 ="Nurs Aides Orderlies/Attendents 1980"
f0863490 ="Health Aides Except Nursing 1990"
f0863480 ="Health Aides Except Nursing 1980"
f1395100 ="Occuptn Therapist Assists/Aides 2000"
f1395200 ="Physical Therapst Assists/Aides 2000"
f1395300 ="Massage Therapists 2000"
f1395400 ="Med Asst & Oth Hlthcare Supp Occp 2000"
f0863900 ="Medical Scientists 2000"
f0863990 ="Medical Scientists 1990"
f0863980 ="Medical Scientists 1980"
f1424309 ="Licensed Psychologists 2009"
f1249500 ="Psychologists 2000"
f1249590 ="Psychologists 1990"
f1249690 ="Sociologists 1990"
f1395500 ="Misc Social Scientist,Sociolgst 2000"
f1249800 ="Social Workers 2000"
f1249890 ="Social Workers 1990"
f1395600 ="Misc Comm & Social Serv Speclsts 2000"
f0863090 ="Radiologic Technicians 1990"
f0863080 ="Radiologic Technicians 1980"
f0863290 ="Health Tech N.E.C. 1990"
f0863280 ="Health Tech N.E.C. 1980"
f0863690 ="Managers Medicine/Health 1990"
f0863680 ="Managers Medicine/Health 1980"
f0863790 ="Medical Science Teachers 1990"
f0863780 ="Medical Science Teachers 1980"
f0863890 ="Health Specialties Teachers 1990"
f0863880 ="Health Specialties Teachers 1980"
f1249390 ="Psychology Teachers 1990"
f1249490 ="Social Work Teachers 1990"
f0886808 ="Total Number Hospitals 2008"
f0886807 ="Total Number Hospitals 2007"
f0886806 ="Total Number Hospitals 2006"
f0886805 ="Total Number Hospitals 2005"
f0886800 ="Total Number Hospitals 2000"
f0886908 ="# Short Term General Hosps 2008"
f0886907 ="# Short Term General Hosps 2007"
f0886906 ="# Short Term General Hosps 2006"
f0886905 ="# Short Term General Hosps 2005"
f0886900 ="# Short Term General Hosps 2000"
f0887008 ="# Short Term Non-General Hosps 2008"
f0887007 ="# Short Term Non-General Hosps 2007"
f0887006 ="# Short Term Non-General Hosps 2006"
f0887005 ="# Short Term Non-General Hosps 2005"
f0887000 ="# Short Term Non-General Hosps 2000"
f0887108 ="# Long Term Hospitals 2008"
f0887107 ="# Long Term Hospitals 2007"
f0887106 ="# Long Term Hospitals 2006"
f0887105 ="# Long Term Hospitals 2005"
f0887100 ="# Long Term Hospitals 2000"
f1318508 ="# Psychiatric Short Term Hosps 2008"
f1318608 ="# Rehabilitation ST Hosps 2008"
f1466608 ="# Children's Gen Med/Srg ST Hsp 2008"
f1318708 ="# Children's Psych ST Hosps 2008"
f1411808 ="# Acute Long-Term Care ST Hosps 2008"
f1067708 ="# Gen Medical/Surgical LT Hosps 2008"
f1067808 ="# Psychiatric LT Hosps 2008"
f1067908 ="# Rehabilitation LT Hosps 2008"
f1068008 ="# Chronic Disease LT Hosps 2008"
f1068208 ="# Instn/Mentally Retrd LT Hosps 2008"
f1068308 ="# Children's Psych LT Hosps 2008"
f1411908 ="# Acute Long-Term Care LT Hosps 2008"
f0887208 ="# Short Term Community Hosps 2008"
f0887205 ="# Short Term Community Hosps 2005"
f0887200 ="# Short Term Community Hosps 2000"
f0887608 ="# Veterans' Hospitals 2008"
f1403108 ="# Critical Access Hospitals 2008"
f1403208 ="# Critical Access ST Gen Hosps 2008"
f1403308 ="# Rural Referral Centers 2008"
f1403408 ="# Sole Community Providers 2008"
f1241708 ="# Hosp Participating in Network 2008"
f0887708 ="# Hosp W/JCAHO Accreditation ST Gen Hosps 2008"
f0887808 ="# Hosp W/JCAHO Accreditation STNG/LT Hosps 2008"
f0887908 ="# Hosp W/Residency Training ST Gen Hosps 2008"
f0888008 ="# Hosp W/Residency Training STNG/LT Hosps 2008"
f0888108 ="# Hosp W/Medical School Affiln ST Gen Hosps 2008"
f0888208 ="# Hosp W/Medical School Affiln STNG/LT Hosps 2008"
f0888308 ="# Hosp W/Medical School Affiln Vet Hosps 2008"
f0888608 ="# Hosp W/Prof Nursing School ST Gen Hosps 2008"
f0888708 ="# Hosp W/Prof Nursing School ST Community 2008"
f0888908 ="# Hosp W/Prof Nursing School STNG/LT Hosps 2008"
f0889008 ="# Member Council Teaching Hosp ST Gen Hosps 2008"
f0889108 ="# Member Council Teaching Hosp Vet Hosps 2008"
f0889208 ="# Member Council Teaching Hosp ST Community 2008"
f0889408 ="# Member Council Teaching Hosp STNG/LT Hosps 2008"
f0889508 ="# Hsp W/Amer Osteo Assoc Accred ST Gen Hosps 2008"
f0889608 ="# Hsp W/Amer Osteo Assoc Accred STNG/LT Hosps 2008"
f0889708 ="# Hsp W/Amer Osteo Assoc Intern ST Gen Hosps 2008"
f0889808 ="# Hsp W/Amer Osteo Assoc Intern STNG/LT Hosps 2008"
f0889908 ="# Hsp W/Amer Osteo Assoc Residn ST Gen Hosps 2008"
f0890008 ="# Hsp W/Amer Osteo Assoc Residn STNG/LT Hosps 2008"
f0890308 ="#Hsp W/Blue Crss Contrct/Partcn ST Gen Hosps 2008"
f0890408 ="#Hsp W/Blue Crss Contrct/Partcn STNG/LT Hosps 2008"
f0890508 ="# Hosp W/Medicare Certification ST Gen Hosps 2008"
f0890608 ="# Hosp W/Medicare Certification STNG/LT Hosps 2008"
f0890908 ="Hospital Admissions 2008"
f0890907 ="Hospital Admissions 2007"
f0890906 ="Hospital Admissions 2006"
f0890905 ="Hospital Admissions 2005"
f0890900 ="Hospital Admissions 2000"
f0891008 ="Short Term Gen Hosp Admissions 2008"
f0891007 ="Short Term Gen Hosp Admissions 2007"
f0891006 ="Short Term Gen Hosp Admissions 2006"
f0891005 ="Short Term Gen Hosp Admissions 2005"
f0891000 ="Short Term Gen Hosp Admissions 2000"
f0891108 ="STNG/LT, Hosp Admissions 2008"
f0891107 ="STNG/LT, Hosp Admissions 2007"
f0891106 ="STNG/LT, Hosp Admissions 2006"
f0891105 ="STNG/LT, Hosp Admissions 2005"
f0891100 ="STNG/LT, Hosp Admissions 2000"
f0891208 ="Short Term Community Hosp Admis 2008"
f0891205 ="Short Term Community Hosp Admis 2005"
f0891200 ="Short Term Community Hosp Admis 2000"
f0892008 ="Veterans' Hospital Admissions 2008"
f1405308 ="Nurs Home Admissions, Tot Hosp 2008"
f1405307 ="Nurs Home Admissions, Tot Hosp 2007"
f1405306 ="Nurs Home Admissions, Tot Hosp 2006"
f1405305 ="Nurs Home Admissions, Tot Hosp 2005"
f1405408 ="Nurs Home Admissions,STGEN Hosp 2008"
f1405407 ="Nurs Home Admissions,STGEN Hosp 2007"
f1405406 ="Nurs Home Admissions,STGEN Hosp 2006"
f1405405 ="Nurs Home Admissions,STGEN Hosp 2005"
f1405508 ="Nurs Home Admissions, STNG/LT 2008"
f1405507 ="Nurs Home Admissions, STNG/LT 2007"
f1405506 ="Nurs Home Admissions, STNG/LT 2006"
f1405505 ="Nurs Home Admissions, STNG/LT 2005"
f0892108 ="Hospital Beds 2008"
f0892107 ="Hospital Beds 2007"
f0892106 ="Hospital Beds 2006"
f0892105 ="Hospital Beds 2005"
f0892100 ="Hospital Beds 2000"
f0892208 ="Short Term General Hosp Beds 2008"
f0892207 ="Short Term General Hosp Beds 2007"
f0892206 ="Short Term General Hosp Beds 2006"
f0892205 ="Short Term General Hosp Beds 2005"
f0892200 ="Short Term General Hosp Beds 2000"
f0892308 ="Short Term Non-Gen Hosp Beds 2008"
f0892307 ="Short Term Non-Gen Hosp Beds 2007"
f0892306 ="Short Term Non-Gen Hosp Beds 2006"
f0892305 ="Short Term Non-Gen Hosp Beds 2005"
f0892300 ="Short Term Non-Gen Hosp Beds 2000"
f0892408 ="Long Term Hosp Beds 2008"
f0892407 ="Long Term Hosp Beds 2007"
f0892406 ="Long Term Hosp Beds 2006"
f0892405 ="Long Term Hosp Beds 2005"
f0892400 ="Long Term Hosp Beds 2000"
f0892508 ="Short Term Community Hosp Beds 2008"
f0892505 ="Short Term Community Hosp Beds 2005"
f0892500 ="Short Term Community Hosp Beds 2000"
f0892908 ="Veterans' Hospital Beds 2008"
f1404908 ="Nursing Home Beds, Total Hosp 2008"
f1404907 ="Nursing Home Beds, Total Hosp 2007"
f1404906 ="Nursing Home Beds, Total Hosp 2006"
f1404905 ="Nursing Home Beds, Total Hosp 2005"
f1405008 ="Nursing Home Beds, ST Gen Hosp 2008"
f1405007 ="Nursing Home Beds, ST Gen Hosp 2007"
f1405006 ="Nursing Home Beds, ST Gen Hosp 2006"
f1405005 ="Nursing Home Beds, ST Gen Hosp 2005"
f1405108 ="Nursing Home Beds, STNG Hosp 2008"
f1405107 ="Nursing Home Beds, STNG Hosp 2007"
f1405106 ="Nursing Home Beds, STNG Hosp 2006"
f1405105 ="Nursing Home Beds, STNG Hosp 2005"
f1405208 ="Nursing Home Beds,Long Term Hsp 2008"
f1405207 ="Nursing Home Beds,Long Term Hsp 2007"
f1405206 ="Nursing Home Beds,Long Term Hsp 2006"
f1405205 ="Nursing Home Beds,Long Term Hsp 2005"
f1404108 ="Licensed Beds, Total Hospital 2008"
f1404107 ="Licensed Beds, Total Hospital 2007"
f1404106 ="Licensed Beds, Total Hospital 2006"
f1404105 ="Licensed Beds, Total Hospital 2005"
f1404208 ="Licensed Beds, Short Term Hosp 2008"
f1404207 ="Licensed Beds, Short Term Hosp 2007"
f1404206 ="Licensed Beds, Short Term Hosp 2006"
f1404205 ="Licensed Beds, Short Term Hosp 2005"
f1404308 ="Licensed Beds,Short Non-Gen Hsp 2008"
f1404307 ="Licensed Beds,Short Non-Gen Hsp 2007"
f1404306 ="Licensed Beds,Short Non-Gen Hsp 2006"
f1404305 ="Licensed Beds,Short Non-Gen Hsp 2005"
f1404408 ="Licensed Beds, Long Term Hosp 2008"
f1404407 ="Licensed Beds, Long Term Hosp 2007"
f1404406 ="Licensed Beds, Long Term Hosp 2006"
f1404405 ="Licensed Beds, Long Term Hosp 2005"
f1404508 ="Licensed Nursing Home Beds 2008"
f1404507 ="Licensed Nursing Home Beds 2007"
f1404506 ="Licensed Nursing Home Beds 2006"
f1404505 ="Licensed Nursing Home Beds 2005"
f1404608 ="Licensed Nurs Home Beds, STGEN 2008"
f1404607 ="Licensed Nurs Home Beds, STGEN 2007"
f1404606 ="Licensed Nurs Home Beds, STGEN 2006"
f1404605 ="Licensed Nurs Home Beds, STGEN 2005"
f1404708 ="Licensed Nurs Home Beds, STNG 2008"
f1404707 ="Licensed Nurs Home Beds, STNG 2007"
f1404706 ="Licensed Nurs Home Beds, STNG 2006"
f1404705 ="Licensed Nurs Home Beds, STNG 2005"
f1404808 ="Licensed Nurs Home Beds, LT 2008"
f1404807 ="Licensed Nurs Home Beds, LT 2007"
f1404806 ="Licensed Nurs Home Beds, LT 2006"
f1404805 ="Licensed Nurs Home Beds, LT 2005"
f0893008 ="Bassinets Set Up & Staffed ST Gen Hosps 2008"
f0893005 ="Bassinets Set Up & Staffed ST Gen Hosps 2005"
f0893000 ="Bassinets Set Up & Staffed ST Gen Hosps 2000"
f0893108 ="Bassinets Set Up & Staffed STNG/LT Hosps 2008"
f0893105 ="Bassinets Set Up & Staffed STNG/LT Hosps 2005"
f0893100 ="Bassinets Set Up & Staffed STNG/LT Hosps 2000"
f1138608 ="# ST Gen Hosp, 006-049 Beds 2008"
f1138605 ="# ST Gen Hosp, 006-049 Beds 2005"
f1138600 ="# ST Gen Hosp, 006-049 Beds 2000"
f1138708 ="# ST Gen Hosp, 050-099 Beds 2008"
f1138705 ="# ST Gen Hosp, 050-099 Beds 2005"
f1138700 ="# ST Gen Hosp, 050-099 Beds 2000"
f1138808 ="# ST Gen Hosp, 100-199 Beds 2008"
f1138805 ="# ST Gen Hosp, 100-199 Beds 2005"
f1138800 ="# ST Gen Hosp, 100-199 Beds 2000"
f1138908 ="# ST Gen Hosp, 200-299 Beds 2008"
f1138905 ="# ST Gen Hosp, 200-299 Beds 2005"
f1138900 ="# ST Gen Hosp, 200-299 Beds 2000"
f1139008 ="# ST Gen Hosp, 300+ Beds 2008"
f1139005 ="# ST Gen Hosp, 300+ Beds 2005"
f1139000 ="# ST Gen Hosp, 300+ Beds 2000"
f1139908 ="# STNG/LT Hosps,006-049 Beds 2008"
f1140008 ="# STNG/LT Hosps,050-099 Beds 2008"
f1140108 ="# STNG/LT Hosps,100-199 Beds 2008"
f1140208 ="# STNG/LT Hosps,200-299 Beds 2008"
f1140308 ="# STNG/LT Hosps,300+ Beds 2008"
f1140408 ="# Veteran Hosp, 006-049 Beds 2008"
f1140508 ="# Veteran Hosp, 050-099 Beds 2008"
f1140608 ="# Veteran Hosp, 100-199 Beds 2008"
f1140708 ="# Veteran Hosp, 200-299 Beds 2008"
f1140808 ="# Veteran Hosp, 300+ Beds 2008"
f1256208 ="# Hosp W/Gen Med/Surg Cr, Adult ST Gen Hosps 2008"
f1256308 ="# Hosp W/Gen Med/Surg Care, Ped ST Gen Hosps 2008"
f1256408 ="# Hosp W/Obstetric Care ST Gen Hosps 2008"
f1256508 ="# Hosp W/Medical/Surg Intens Cr ST Gen Hosps 2008"
f1256608 ="# Hosp W/Cardiac Intensive Care ST Gen Hosps 2008"
f1256708 ="# Hosp W/Neonatal Intens Care ST Gen Hosps 2008"
f1256808 ="# Hosp W/Neonatal Intermed Care ST Gen Hosps 2008"
f1256908 ="# Hosp W/Pediatric Intens Care ST Gen Hosps 2008"
f1257008 ="# Hosp W/Burn Care ST Gen Hosps 2008"
f1257108 ="# Hosp W/Other Special Care ST Gen Hosps 2008"
f1331008 ="# Hosp W/Other Intensive Care ST Gen Hosps 2008"
f1257208 ="# Hosp W/Physical Rehab Care ST Gen Hosps 2008"
f1257308 ="# Hosp W/Alc/Drug Abuse IP Care ST Gen Hosps 2008"
f1257408 ="# Hosp W/Psychiatric Care ST Gen Hosps 2008"
f1257508 ="# Hosp W/Skilled Nursing Care ST Gen Hosps 2008"
f1257608 ="# Hosp W/Intermediate Nurs Care ST Gen Hosps 2008"
f1331208 ="# Hosp W/Acute Long-Term Care ST Gen Hosps 2008"
f1257708 ="# Hosp W/Other Long-Term Care ST Gen Hosps 2008"
f1257808 ="# Hosp W/Other Care ST Gen Hosps 2008"
f1257908 ="# Hosp W/Adult Day Care Program ST Gen Hosps 2008"
f1392808 ="# Hosp W/Airborne Inf Isol Room ST Gen Hosps 2008"
f1258008 ="# Hosp W/Alc/Drug Abuse OP Serv ST Gen Hosps 2008"
f1400008 ="# Hosp W/Alzheimer Center ST Gen Hosps 2008"
f1361308 ="# Hosp W/Ambulance Services ST Gen Hosps 2008"
f1412708 ="# Hosp W/Ambulatory Surgery Ctr ST Gen Hosps 2008"
f1258208 ="# Hosp W/Arthritis Treatmt Cntr ST Gen Hosps 2008"
f1258308 ="# Hosp W/Assisted Living ST Gen Hosps 2008"
f1331308 ="# Hosp W/Auxiliary Services ST Gen Hosps 2008"
f1393008 ="# Hosp W/Bariart/Wgt Cntrl Serv ST Gen Hosps 2008"
f1258408 ="# Hsp W/Birth Rm/LDR Rm/LDRP Rm ST Gen Hosps 2008"
f1409608 ="# Hosp W/Blood Donor Center ST Gen Hosps 2008"
f1258508 ="# Hosp W/Breast Cancer Scrn/Mam ST Gen Hosps 2008"
f1406808 ="#Hsp W/Adlt Diagn/Invasive Cath ST Gen Hosps 2008"
f1406908 ="# Hsp W/Ped Diagn/Invasive Cath ST Gen Hosps 2008"
f1407008 ="#Hsp W/Adlt Intervntnl Card Cth ST Gen Hosps 2008"
f1407108 ="#Hsp W/Ped Intervntnl Card Cath ST Gen Hosps 2008"
f1407208 ="# Hosp W/Adult Cardiac Surgery ST Gen Hosps 2008"
f1407308 ="# Hosp W/Ped Cardiac Surgery ST Gen Hosps 2008"
f1466108 ="#Hsp W/Adult Cardiac Electrophy ST Gen Hosps 2008"
f1466208 ="# Hosp W/Ped Cardiac Electrophy ST Gen Hosps 2008"
f1409708 ="# Hosp W/Cardiac Rehabilitation ST Gen Hosps 2008"
f1258708 ="# Hosp W/Case Management ST Gen ST Gen Hosps 2008"
f1410908 ="# Hosp W/Case Management STNG/LT ST Gen Hosps 2008"
f1393108 ="# Hosp W/Chapl/Pastor Care Serv ST Gen Hosps 2008"
f1400208 ="# Hosp W/Chemotherapy ST Gen Hosps 2008"
f1258808 ="# Hosp W/Child Wellness Program ST Gen Hosps 2008"
f1331408 ="# Hosp W/Chiropractic Services ST Gen Hosps 2008"
f1258908 ="# Hosp W/Community Outreach ST Gen Hosps 2008"
f1331508 ="#Hsp W/Complmnt/Altern Med Serv ST Gen Hosps 2008"
f1409808 ="# Hosp W/Computer Asst Orth Srg ST Gen Hosps 2008"
f1259008 ="# Hosp W/Crisis Prevention ST Gen Hosps 2008"
f1259108 ="# Hosp W/Dental Services ST Gen Hosps 2008"
f1259208 ="# Hosp W/Emergency Department ST Gen Hosps 2008"
f1409908 ="#Hsp W/Freestnd/Satllt Emer Dpt ST Gen Hosps 2008"
f1259308 ="# Hosp W/Certified Trauma Cntr ST Gen Hosps 2008"
f1361408 ="# Hosp W/Enabling Services ST Gen Hosps 2008"
f1260308 ="# Hosp W/Hospice ST Gen Hosps 2008"
f1331708 ="# Hosp W/Pain Management Pgm ST Gen Hosps 2008"
f1361508 ="# Hosp W/Palliative Care Pgm ST Gen Hosps 2008"
f1420908 ="# Hosp W/IP Palliative Cre Unit ST Gen Hosps 2008"
f1466308 ="# Hosp W/Optical Colonoscopy ST Gen Hosps 2008"
f1421008 ="# Hosp W/Endoscopic Ultrasound ST Gen Hosps 2008"
f1421108 ="# Hosp W/Ablat of Barrets Esoph ST Gen Hosps 2008"
f1421208 ="# Hosp W/Esoph Impedance Study ST Gen Hosps 2008"
f1421308 ="# Hosp W/ECRP ST Gen Hosps 2008"
f1361608 ="# Hosp W/Enrollment Assist Pgm ST Gen Hosps 2008"
f1259408 ="# Hosp W/Extracorporeal Shock ST Gen Hosps 2008"
f1259508 ="# Hosp W/Fitness Center ST Gen Hosps 2008"
f1259608 ="# Hosp W/Freestandng Outpat Ctr ST Gen Hosps 2008"
f1259708 ="# Hosp W/Geriatric Services ST Gen Hosps 2008"
f1411008 ="# Hosp W/Geriatric Services STNG/LT Hosps 2008"
f1259808 ="# Hosp W/Health Fair ST Gen Hosps 2008"
f1259908 ="# Hosp W/Community Health Educ ST Gen Hosps 2008"
f1260008 ="# Hosp W/Health Screenings ST Gen Hosps 2008"
f1421408 ="# Hosp W/Health Research ST Gen Hosps 2008"
f1361708 ="# Hosp W/Hemodialysis ST Gen Hosps 2008"
f1260108 ="# Hosp W/HIV-AIDS Services ST Gen Hosps 2008"
f1260208 ="# Hosp W/Home Health Services ST Gen Hosps 2008"
f1260408 ="#Hsp W/Hsp-Bsd Outpat Cr Ctr/Sv ST Gen Hosps 2008"
f1421508 ="# Hosp W/Immunization Program ST Gen Hosps 2008"
f1410008 ="# Hosp W/Indigent Care Clinic ST Gen Hosps 2008"
f1393208 ="# Hosp W/Ling/Translation Serv ST Gen Hosps 2008"
f1411108 ="# Hosp W/Ling/Translation Serv STNG/LT Hosps 2008"
f1260508 ="# Hosp W/Meals On Wheels ST Gen Hosps 2008"
f1410108 ="# Hosp W/Mobile Health Services ST Gen Hosps 2008"
f1393308 ="# Hosp W/Neurological Services ST Gen Hosps 2008"
f1260608 ="# Hosp W/Nutrition Programs ST Gen Hosps 2008"
f1411208 ="# Hosp W/Nutrition Programs STNG/LT Hosps 2008"
f1260708 ="# Hosp W/Occupational Hlth Serv ST Gen Hosps 2008"
f1411308 ="# Hosp W/Occupational Hlth Serv STNG/LT Hosps 2008"
f1260808 ="# Hosp W/Oncology Services ST Gen Hosps 2008"
f1393408 ="# Hosp W/Orthopedic Services ST Gen Hosps 2008"
f1261108 ="# Hosp W/Outpatient Surgery ST Gen Hosps 2008"
f1407408 ="# Hosp W/Patient Ctrl Analgesia ST Gen Hosps 2008"
f1261208 ="# Hosp W/Patient Education Cntr ST Gen Hosps 2008"
f1261308 ="# Hosp W/Patient Repr Services ST Gen Hosps 2008"
f1411408 ="# Hosp W/Patient Repr Services STNG/LT Hosps 2008"
f1261408 ="# Hosp W/Physical Rehab OP Serv ST Gen Hosps 2008"
f1411508 ="# Hosp W/Physical Rehab OP Serv STNG/LT Hosps 2008"
f1466408 ="# Hosp W/Robot-Asst Walk Therap ST Gen Hosps 2008"
f1466508 ="# Hosp W/Simulated Rehab Enviro ST Gen Hosps 2008"
f1261508 ="# Hosp W/Primary Care Dept ST Gen Hosps 2008"
f1261608 ="# Hosp W/Psych Child/Adoles Ser ST Gen Hosps 2008"
f1261708 ="# Hosp W/Psych Consl/Liaisn Ser ST Gen Hosps 2008"
f1261808 ="# Hosp W/Psych Consl/Liaisn Ser STNG/LT Hosps 2008"
f1261908 ="# Hosp W/Psych Educational Serv ST Gen Hosps 2008"
f1262008 ="# Hosp W/Psych Emergency Serv ST Gen Hosps 2008"
f1262108 ="# Hosp W/Psych Geriatric Serv ST Gen Hosps 2008"
f1262208 ="# Hosp W/Psych Outpatient Serv ST Gen Hosps 2008"
f1262308 ="# Hosp W/Psych Part Hosp Prog ST Gen Hosps 2008"
f1410208 ="# Hosp W/Image-guided Rad Ther ST Gen Hosps 2008"
f1400408 ="#Hsp W/Intens-Modulatd Rad Ther ST Gen Hosps 2008"
f1421608 ="# Hosp W/Proton Therapy ST Gen Hosps 2008"
f1407508 ="# Hosp W/Shaped Beam Rad System ST Gen Hosps 2008"
f1410708 ="# Hosp W/Stereotactic Radiosurg ST Gen Hosps 2008"
f1262508 ="# Hosp W/C.T. Scanner ST Gen Hosps 2008"
f1262608 ="# Hosp W/Diag Radioisotope Fac ST Gen Hosps 2008"
f1400508 ="#Hsp W/Electrn Beam Comp Tomogr ST Gen Hosps 2008"
f1410308 ="# Hsp W/Full-field Digit Mammog ST Gen Hosps 2008"
f1262708 ="# Hosp W/Mag Resonance Imaging ST Gen Hosps 2008"
f1262808 ="# Hosp W/Mag Resonance Imaging STNG/LT Hosps 2008"
f1421708 ="# Hosp W/Intraoperative MRI ST Gen Hosps 2008"
f1400608 ="#Hsp W/Multislce Sp Com Tom <64 ST Gen Hosps 2008"
f1410408 ="#Hsp W/Multislce Sp Com Tom 64+ ST Gen Hosps 2008"
f1262908 ="# Hosp W/Positron Emission Tom ST Gen Hosps 2008"
f1410508 ="# Hosp W/Positron Emiss Tom/CT ST Gen Hosps 2008"
f1263008 ="# Hsp W/Singl Photon Emis Tomog ST Gen Hosps 2008"
f1263108 ="# Hosp W/Ultrasound ST Gen Hosps 2008"
f1400708 ="# Hosp W/Fertility Clinic ST Gen Hosps 2008"
f1400808 ="#Hosp W/Genetic Test/Counseling ST Gen Hosps 2008"
f1263308 ="# Hosp W/Retirement Housing ST Gen Hosps 2008"
f1410608 ="# Hosp W/Robotic Surgery ST Gen Hosps 2008"
f1361808 ="# Hosp W/Sleep Center ST Gen Hosps 2008"
f1263408 ="# Hosp W/Social Work Services ST Gen Hosps 2008"
f1411608 ="# Hosp W/Social Work Services STNG/LT Hosps 2008"
f1263508 ="# Hosp W/Sports Medicine ST Gen Hosps 2008"
f1263608 ="# Hosp W/Support Groups ST Gen Hosps 2008"
f1411708 ="# Hosp W/Support Groups STNG/LT Hosps 2008"
f1393508 ="# Hosp W/Swing Bed Services ST Gen Hosps 2008"
f1263708 ="# Hosp W/Teen Outreach Services ST Gen Hosps 2008"
f1361908 ="# Hosp W/Tobacco Treatment Serv ST Gen Hosps 2008"
f1407608 ="#Hsp W/Bone Marrow Transplt Ser ST Gen Hosps 2008"
f1407708 ="# Hosp W/Heart Transplant ST Gen Hosps 2008"
f1407808 ="# Hosp W/Kidney Transplant ST Gen Hosps 2008"
f1407908 ="# Hosp W/Liver Transplant ST Gen Hosps 2008"
f1408008 ="# Hosp W/Lung Transplant ST Gen Hosps 2008"
f1408108 ="# Hosp W/Tissue Transplant ST Gen Hosps 2008"
f1408208 ="# Hosp W/Oth Transplant Service ST Gen Hosps 2008"
f1263908 ="# Hosp W/Transport to Hlth Fac ST Gen Hosps 2008"
f1264008 ="# Hosp W/Urgent Care Center ST Gen Hosps 2008"
f1410808 ="# Hosp W/Virtual Colonoscopy ST Gen Hosps 2008"
f1264108 ="# Hosp W/Volunteer Serv Dept ST Gen Hosps 2008"
f1264208 ="# Hosp W/Women's Hlth Cntr/Serv ST Gen Hosps 2008"
f1393608 ="# Hosp W/Wound Mngmnt Services ST Gen Hosps 2008"
f1403508 ="# Hosp w/Hospitalists Care ST Gen Hosps 2008"
f1403608 ="# Hosp w/Hospitalists Care STNG/LT Hosps 2008"
f1264308 ="# Hsp Participtn in Phys Arrang ST Gen Hosps 2008"
f1264408 ="# Hsp Developmnt of Ins Product ST Gen Hosps 2008"
f0907108 ="Gen Med/Surg, Adult, Bed Set Up ST Gen Hosps 2008"
f0907708 ="Gen Med/Surg, Ped, Beds Set Up ST Gen Hosps 2008"
f0908308 ="Obstetrics Care, Beds Set Up ST Gen Hosps 2008"
f0913908 ="Med/Surg Intens Cr, Beds Set Up ST Gen Hosps 2008"
f0913308 ="Cardiac Intens Cr, Beds Set Up ST Gen Hosps 2008"
f0914508 ="Neonatal Intens Cr, Beds Set Up ST Gen Hosps 2008"
f0915108 ="Neonat Intermed Cr, Beds Set Up ST Gen Hosps 2008"
f0916308 ="Pediatric Intens Cr, Bed Set Up ST Gen Hosps 2008"
f0912708 ="Burn Care, Beds Set Up ST Gen Hosps 2008"
f0910308 ="Oth Special Care, Beds Set Up ST Gen Hosps 2008"
f1330908 ="Other Intensive Cr, Bed Set Up ST Gen Hosps 2008"
f0921508 ="Rehabilitation Care, Bed Set Up ST Gen Hosps 2008"
f1143908 ="Alchl/Chem Depend Cr,Bed Set Up ST Gen Hosps 2008"
f1143708 ="Psychiatric Care, Beds Set Up ST Gen Hosps 2008"
f1133708 ="Skilled Nurs Care, Beds Set Up ST Gen Hosps 2008"
f1133908 ="Intermediate Care, Beds Set Up ST Gen Hosps 2008"
f1331108 ="Acute LT Care, Beds Set Up ST Gen Hosps 2008"
f1256008 ="Other LT Care, Beds Set Up ST Gen Hosps 2008"
f1256108 ="Other Care, Beds Set Up ST Gen Hosps 2008"
f0904708 ="Total Inpatient, Beds Set Up ST Gen Hosps 2008"
f0930708 ="# FTE Total Facility Personnel (Incl Nurs Homes; ST Gen Hosps) 2008"
f0930705 ="# FTE Total Facility Personnel (Incl Nurs Homes; ST Gen Hosps) 2005"
f0930700 ="# FTE Total Facility Personnel (Incl Nurs Homes; ST Gen Hosps) 2000"
f0930808 ="# FTE Total Facility Personnel (Incl Nurs Homes; STNG/LT Hosps) 2008"
f0930805 ="# FTE Total Facility Personnel (Incl Nurs Homes; STNG/LT Hosps) 2005"
f0930800 ="# FTE Total Facility Personnel (Incl Nurs Homes; STNG/LT Hosps) 2000"
f1130808 ="# FTE Physicians & Dentists (Incl Nurs Homes; ST Gen Hosps) 2008"
f1130805 ="# FTE Physicians & Dentists (Incl Nurs Homes; ST Gen Hosps) 2005"
f1130800 ="# FTE Physicians & Dentists (Incl Nurs Homes; ST Gen Hosps) 2000"
f1130908 ="# FTE Physicians & Dentists (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1130905 ="# FTE Physicians & Dentists (Incl Nurs Homes; STNG/LT Hosps) 2005"
f1130900 ="# FTE Physicians & Dentists (Incl Nurs Homes; STNG/LT Hosps) 2000"
f0931108 ="# FTE Physicians & Dentists (Incl Nurs Homes;Veterans Hosps) 2008"
f1266308 ="# FTE Medical & Dental Residnts (Incl Nurs Homes; ST Gen Hosps) 2008"
f1266305 ="# FTE Medical & Dental Residnts (Incl Nurs Homes; ST Gen Hosps) 2005"
f1266300 ="# FTE Medical & Dental Residnts (Incl Nurs Homes; ST Gen Hosps) 2000"
f1266408 ="# FTE Medical & Dental Residnts (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1266405 ="# FTE Medical & Dental Residnts (Incl Nurs Homes; STNG/LT Hosps) 2005"
f1266400 ="# FTE Medical & Dental Residnts (Incl Nurs Homes; STNG/LT Hosps) 2000"
f0931408 ="# FTE Other Trainees (Incl Nurs Homes; ST Gen Hosps) 2008"
f0931405 ="# FTE Other Trainees (Incl Nurs Homes; ST Gen Hosps) 2005"
f0931400 ="# FTE Other Trainees (Incl Nurs Homes; ST Gen Hosps) 2000"
f0931508 ="# FTE Other Trainees (Incl Nurs Homes; STNG/LT Hosps) 2008"
f0931505 ="# FTE Other Trainees (Incl Nurs Homes; STNG/LT Hosps) 2005"
f0931500 ="# FTE Other Trainees (Incl Nurs Homes; STNG/LT Hosps) 2000"
f1266508 ="# FTE Total Trainees (Incl Nurs Homes; ST Gen Hosps) 2008"
f1266505 ="# FTE Total Trainees (Incl Nurs Homes; ST Gen Hosps) 2005"
f1266500 ="# FTE Total Trainees (Incl Nurs Homes; ST Gen Hosps) 2000"
f1266608 ="# FTE Total Trainees (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1266605 ="# FTE Total Trainees (Incl Nurs Homes; STNG/LT Hosps) 2005"
f1266600 ="# FTE Total Trainees (Incl Nurs Homes; STNG/LT Hosps) 2000"
f0931608 ="# FTE R.N.s (Incl Nurs Homes; ST Gen Hosps) 2008"
f0931605 ="# FTE R.N.s (Incl Nurs Homes; ST Gen Hosps) 2005"
f0931600 ="# FTE R.N.s (Incl Nurs Homes; ST Gen Hosps) 2000"
f0931708 ="# FTE R.N.s (Incl Nurs Homes; STNG/LT Hosps) 2008"
f0931705 ="# FTE R.N.s (Incl Nurs Homes; STNG/LT Hosps) 2005"
f0931700 ="# FTE R.N.s (Incl Nurs Homes; STNG/LT Hosps) 2000"
f0931808 ="# FTE R.N.s (Incl Nurs Homes;Veterans Hosps) 2008"
f0931908 ="# FTE L.P.N.s & L.V.N.s (Incl Nurs Homes; ST Gen Hosps) 2008"
f0931905 ="# FTE L.P.N.s & L.V.N.s (Incl Nurs Homes; ST Gen Hosps) 2005"
f0931900 ="# FTE L.P.N.s & L.V.N.s (Incl Nurs Homes; ST Gen Hosps) 2000"
f0932008 ="# FTE L.P.N.s & L.V.N.s (Incl Nurs Homes; STNG/LT Hosps) 2008"
f0932005 ="# FTE L.P.N.s & L.V.N.s (Incl Nurs Homes; STNG/LT Hosps) 2005"
f0932000 ="# FTE L.P.N.s & L.V.N.s (Incl Nurs Homes; STNG/LT Hosps) 2000"
f1266108 ="# FTE Other Personnel (Incl Nurs Homes; ST Gen Hosps) 2008"
f1266105 ="# FTE Other Personnel (Incl Nurs Homes; ST Gen Hosps) 2005"
f1266100 ="# FTE Other Personnel (Incl Nurs Homes; ST Gen Hosps) 2000"
f1266208 ="# FTE Other Personnel (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1266205 ="# FTE Other Personnel (Incl Nurs Homes; STNG/LT Hosps) 2005"
f1266200 ="# FTE Other Personnel (Incl Nurs Homes; STNG/LT Hosps) 2000"
f0932308 ="# FTE All Oth Personnel,VA Hosp 2008"
f1266708 ="# FTE Total Hospital Personnel (ST Gen Hosps) 2008"
f1266705 ="# FTE Total Hospital Personnel (ST Gen Hosps) 2005"
f1266700 ="# FTE Total Hospital Personnel (ST Gen Hosps) 2000"
f1266808 ="# FTE Total Hospital Personnel (STNG/LT Hosps) 2008"
f1266805 ="# FTE Total Hospital Personnel (STNG/LT Hosps) 2005"
f1266800 ="# FTE Total Hospital Personnel (STNG/LT Hosps) 2000"
f0962308 ="# FTE Tot Nurs Home Personnel (ST Gen Hosps) 2008"
f0962305 ="# FTE Tot Nurs Home Personnel (ST Gen Hosps) 2005"
f0962300 ="# FTE Tot Nurs Home Personnel (ST Gen Hosps) 2000"
f0962408 ="# FTE Tot Nurs Home Personnel (STNG/LT Hosps) 2008"
f0962405 ="# FTE Tot Nurs Home Personnel (STNG/LT Hosps) 2005"
f0962400 ="# FTE Tot Nurs Home Personnel (STNG/LT Hosps) 2000"
f1033708 ="Total Facility Personnel, FT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1033705 ="Total Facility Personnel, FT (Incl Nurs Homes; ST Gen Hosps) 2005"
f1033700 ="Total Facility Personnel, FT (Incl Nurs Homes; ST Gen Hosps) 2000"
f1033808 ="Total Facility Personnel, FT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1033805 ="Total Facility Personnel, FT (Incl Nurs Homes; STNG/LT Hosps) 2005"
f1033800 ="Total Facility Personnel, FT (Incl Nurs Homes; STNG/LT Hosps) 2000"
f1033908 ="Total Facility Personnel, PT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1033905 ="Total Facility Personnel, PT (Incl Nurs Homes; ST Gen Hosps) 2005"
f1033900 ="Total Facility Personnel, PT (Incl Nurs Homes; ST Gen Hosps) 2000"
f1034008 ="Total Facility Personnel, PT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1034005 ="Total Facility Personnel, PT (Incl Nurs Homes; STNG/LT Hosps) 2005"
f1034000 ="Total Facility Personnel, PT (Incl Nurs Homes; STNG/LT Hosps) 2000"
f1264508 ="Physicians & Dentists, FT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1264608 ="Physicians & Dentists, FT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1265308 ="Physicians & Dentists, PT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1265408 ="Physicians & Dentists, PT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1197308 ="Medical/Dental Res/Interns, FT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1197808 ="Medical/Dental Res/Interns, FT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1197408 ="Medical/Dental Res/Interns, PT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1197908 ="Medical/Dental Res/Interns, PT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1213008 ="Other Trainees, Full-Time (See User Doc for Def;ST Gen Hs) 2008"
f1213108 ="Other Trainees, Full-Time (See User Doc for Def;STNG/LT) 2008"
f1213208 ="Other Trainees, Part-Time (See User Doc for Def;ST Gen Hs) 2008"
f1213308 ="Other Trainees, Part-Time (See User Doc for Def;STNG/LT) 2008"
f1264708 ="Registered Nurses, Full-Time (Incl Nurs Homes; ST Gen Hosps) 2008"
f1264808 ="Registered Nurses, Full-Time (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1265508 ="Registered Nurses, Part-Time (Incl Nurs Homes; ST Gen Hosps) 2008"
f1265608 ="Registered Nurses, Part-Time (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1264908 ="LPN/LVNs, Full-Time (Incl Nurs Homes; ST Gen Hosps) 2008"
f1265008 ="LPN/LVNs, Full-Time (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1265708 ="LPN/LVNs, Part-Time (Incl Nurs Homes; ST Gen Hosps) 2008"
f1265808 ="LPN/LVNs, Part-Time (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1400908 ="Nursing Assistive Personnel, FT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1401008 ="Nursing Assistive Personnel, FT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1401108 ="Nursing Assistive Personnel, PT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1401208 ="Nursing Assistive Personnel, PT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1412908 ="Radiology Technicians, FT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1413008 ="Radiology Technicians, FT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1413108 ="Radiology Technicians, PT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1413208 ="Radiology Technicians, PT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1413308 ="Laboratory Technicians, FT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1413408 ="Laboratory Technicians, FT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1413508 ="Laboratory Technicians, PT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1413608 ="Laboratory Technicians, PT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1413708 ="Pharmacists, Licensed, FT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1413808 ="Pharmacists, Licensed, FT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1413908 ="Pharmacists, Licensed, PT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1414008 ="Pharmacists, Licensed, PT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1414108 ="Pharmacy Technicians, FT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1414208 ="Pharmacy Technicians, FT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1414308 ="Pharmacy Technicians, PT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1414408 ="Pharmacy Technicians, PT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1421908 ="Respiratory Therapists, FT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1422008 ="Respiratory Therapists, FT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1422108 ="Respiratory Therapists, PT (Incl Nurs Homes; ST Gen Hosps) 2008"
f1422208 ="Respiratory Therapists, PT (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1265108 ="All Other Personnel, Full-Time (Incl Nurs Homes; ST Gen Hosps) 2008"
f1265208 ="All Other Personnel, Full-Time (Incl Nurs Homes; STNG/LT Hosps) 2008"
f1265908 ="All Other Personnel, Part-Time (Incl Nurs Homes; ST Gen Hosps) 2008"
f1266008 ="All Other Personnel, Part-Time (Incl Nurs Homes; STNG/LT Hosps) 2008"
f0932408 ="Total Hosp Personnel, Full-Time (ST Gen Hosps) 2008"
f0932405 ="Total Hosp Personnel, Full-Time (ST Gen Hosps) 2005"
f0932400 ="Total Hosp Personnel, Full-Time (ST Gen Hosps) 2000"
f0932508 ="Total Hosp Personnel, Full-Time (STNG/LT Hosps) 2008"
f0932505 ="Total Hosp Personnel, Full-Time (STNG/LT Hosps) 2005"
f0932500 ="Total Hosp Personnel, Full-Time (STNG/LT Hosps) 2000"
f0932608 ="Total Hosp Personnel, Part-Time (ST Gen Hosps) 2008"
f0932605 ="Total Hosp Personnel, Part-Time (ST Gen Hosps) 2005"
f0932600 ="Total Hosp Personnel, Part-Time (ST Gen Hosps) 2000"
f0932708 ="Total Hosp Personnel, Part-Time (STNG/LT Hosps) 2008"
f0932705 ="Total Hosp Personnel, Part-Time (STNG/LT Hosps) 2005"
f0932700 ="Total Hosp Personnel, Part-Time (STNG/LT Hosps) 2000"
f0941508 ="Nursing Home Personnel Tot, FT (ST Gen Hosps) 2008"
f0941505 ="Nursing Home Personnel Tot, FT (ST Gen Hosps) 2005"
f0941500 ="Nursing Home Personnel Tot, FT (ST Gen Hosps) 2000"
f0941608 ="Nursing Home Personnel Tot, FT (STNG/LT Hosps) 2008"
f0941605 ="Nursing Home Personnel Tot, FT (STNG/LT Hosps) 2005"
f0941600 ="Nursing Home Personnel Tot, FT (STNG/LT Hosps) 2000"
f0941708 ="Nursing Home Personnel Tot, PT (ST Gen Hosps) 2008"
f0941705 ="Nursing Home Personnel Tot, PT (ST Gen Hosps) 2005"
f0941700 ="Nursing Home Personnel Tot, PT (ST Gen Hosps) 2000"
f0941808 ="Nursing Home Personnel Tot, PT (STNG/LT Hosps) 2008"
f0941805 ="Nursing Home Personnel Tot, PT (STNG/LT Hosps) 2005"
f0941800 ="Nursing Home Personnel Tot, PT (STNG/LT Hosps) 2000"
f1403708 ="Hospitalists, Full-Time (ST Gen Hosps) 2008"
f1403705 ="Hospitalists, Full-Time (ST Gen Hosps) 2005"
f1403808 ="Hospitalists, Full-Time (STNG/LT Hosps) 2008"
f1403805 ="Hospitalists, Full-Time (STNG/LT Hosps) 2005"
f1403908 ="Hospitalists, Part-Time (ST Gen Hosps) 2008"
f1403905 ="Hospitalists, Part-Time (ST Gen Hosps) 2005"
f1404008 ="Hospitalists, Part-Time (STNG/LT Hosps) 2008"
f1404005 ="Hospitalists, Part-Time (STNG/LT Hosps) 2005"
f0953708 ="Dist Hosp By 00 - 04 Services (ST Gen Hosps) 2008"
f0953705 ="Dist Hosp By 00 - 04 Services (ST Gen Hosps) 2005"
f0953700 ="Dist Hosp By 00 - 04 Services (ST Gen Hosps) 2000"
f0953808 ="Dist Hosp By 00 - 04 Services (STNG/LT Hosps) 2008"
f0953805 ="Dist Hosp By 00 - 04 Services (STNG/LT Hosps) 2005"
f0953800 ="Dist Hosp By 00 - 04 Services (STNG/LT Hosps) 2000"
f0953908 ="Dist Hosp By 05 - 14 Services (ST Gen Hosps) 2008"
f0953905 ="Dist Hosp By 05 - 14 Services (ST Gen Hosps) 2005"
f0953900 ="Dist Hosp By 05 - 14 Services (ST Gen Hosps) 2000"
f0954008 ="Dist Hosp By 05 - 14 Services (STNG/LT Hosps) 2008"
f0954005 ="Dist Hosp By 05 - 14 Services (STNG/LT Hosps) 2005"
f0954000 ="Dist Hosp By 05 - 14 Services (STNG/LT Hosps) 2000"
f0954108 ="Dist Hosp By 15 - 24 Services (ST Gen Hosps) 2008"
f0954105 ="Dist Hosp By 15 - 24 Services (ST Gen Hosps) 2005"
f0954100 ="Dist Hosp By 15 - 24 Services (ST Gen Hosps) 2000"
f0954208 ="Dist Hosp By 15 - 24 Services (STNG/LT Hosps) 2008"
f0954205 ="Dist Hosp By 15 - 24 Services (STNG/LT Hosps) 2005"
f0954200 ="Dist Hosp By 15 - 24 Services (STNG/LT Hosps) 2000"
f0954308 ="Dist Hosp By 25+ Services (ST Gen Hosps) 2008"
f0954305 ="Dist Hosp By 25+ Services (ST Gen Hosps) 2005"
f0954300 ="Dist Hosp By 25+ Services (ST Gen Hosps) 2000"
f0954408 ="Dist Hosp By 25+ Services (STNG/LT Hosps) 2008"
f0954405 ="Dist Hosp By 25+ Services (STNG/LT Hosps) 2005"
f0954400 ="Dist Hosp By 25+ Services (STNG/LT Hosps) 2000"
f1321109 ="# Skilled Nursing Facilities 2009"
f1321108 ="# Skilled Nursing Facilities 2008"
f1321107 ="# Skilled Nursing Facilities 2007"
f1321106 ="# Skilled Nursing Facilities 2006"
f1321105 ="# Skilled Nursing Facilities 2005"
f1321100 ="# Skilled Nursing Facilities 2000"
f1321209 ="Skilled Nurs Fac Total Beds 2009"
f1321208 ="Skilled Nurs Fac Total Beds 2008"
f1321207 ="Skilled Nurs Fac Total Beds 2007"
f1321206 ="Skilled Nurs Fac Total Beds 2006"
f1321205 ="Skilled Nurs Fac Total Beds 2005"
f1321200 ="Skilled Nurs Fac Total Beds 2000"
f1321309 ="Skilled Nurs Fac Certified Beds 2009"
f1321308 ="Skilled Nurs Fac Certified Beds 2008"
f1321307 ="Skilled Nurs Fac Certified Beds 2007"
f1321306 ="Skilled Nurs Fac Certified Beds 2006"
f1321305 ="Skilled Nurs Fac Certified Beds 2005"
f1321300 ="Skilled Nurs Fac Certified Beds 2000"
f1321509 ="# Nursing Facilities 2009"
f1321508 ="# Nursing Facilities 2008"
f1321507 ="# Nursing Facilities 2007"
f1321506 ="# Nursing Facilities 2006"
f1321505 ="# Nursing Facilities 2005"
f1321500 ="# Nursing Facilities 2000"
f1321609 ="Nursing Facilities Total Beds 2009"
f1321608 ="Nursing Facilities Total Beds 2008"
f1321607 ="Nursing Facilities Total Beds 2007"
f1321606 ="Nursing Facilities Total Beds 2006"
f1321605 ="Nursing Facilities Total Beds 2005"
f1321600 ="Nursing Facilities Total Beds 2000"
f1321709 ="Nursing Facilities Cert Beds 2009"
f1321708 ="Nursing Facilities Cert Beds 2008"
f1321707 ="Nursing Facilities Cert Beds 2007"
f1321706 ="Nursing Facilities Cert Beds 2006"
f1321705 ="Nursing Facilities Cert Beds 2005"
f1321700 ="Nursing Facilities Cert Beds 2000"
f1321409 ="# Home Health Agencies 2009"
f1321408 ="# Home Health Agencies 2008"
f1321407 ="# Home Health Agencies 2007"
f1321406 ="# Home Health Agencies 2006"
f1321405 ="# Home Health Agencies 2005"
f1321400 ="# Home Health Agencies 2000"
f1321809 ="# Rural Health Clinics 2009"
f1321808 ="# Rural Health Clinics 2008"
f1321807 ="# Rural Health Clinics 2007"
f1321806 ="# Rural Health Clinics 2006"
f1321805 ="# Rural Health Clinics 2005"
f1321800 ="# Rural Health Clinics 2000"
f1321909 ="# Ambulatory Surgery Centers 2009"
f1321908 ="# Ambulatory Surgery Centers 2008"
f1321907 ="# Ambulatory Surgery Centers 2007"
f1321906 ="# Ambulatory Surgery Centers 2006"
f1321905 ="# Ambulatory Surgery Centers 2005"
f1321900 ="# Ambulatory Surgery Centers 2000"
f1322009 ="# Hospices 2009"
f1322008 ="# Hospices 2008"
f1322007 ="# Hospices 2007"
f1322006 ="# Hospices 2006"
f1322005 ="# Hospices 2005"
f1322000 ="# Hospices 2000"
f1322109 ="# Community Mental Health Ctrs 2009"
f1322108 ="# Community Mental Health Ctrs 2008"
f1322107 ="# Community Mental Health Ctrs 2007"
f1322106 ="# Community Mental Health Ctrs 2006"
f1322105 ="# Community Mental Health Ctrs 2005"
f1322100 ="# Community Mental Health Ctrs 2000"
f1332009 ="# Fed Qualified Health Centers 2009"
f1332008 ="# Fed Qualified Health Centers 2008"
f1332007 ="# Fed Qualified Health Centers 2007"
f1332006 ="# Fed Qualified Health Centers 2006"
f1332005 ="# Fed Qualified Health Centers 2005"
f1332000 ="# Fed Qualified Health Centers 2000"
f0954508 ="Inpatient Days 2008"
f0954507 ="Inpatient Days 2007"
f0954506 ="Inpatient Days 2006"
f0954505 ="Inpatient Days 2005"
f0954608 ="Inpatient Days in ST Gen Hosp 2008"
f0954607 ="Inpatient Days in ST Gen Hosp 2007"
f0954606 ="Inpatient Days in ST Gen Hosp 2006"
f0954605 ="Inpatient Days in ST Gen Hosp 2005"
f0954600 ="Inpatient Days in ST Gen Hosp 2000"
f0954708 ="Inptn Days in STNG/LT Hosp 2008"
f0954707 ="Inptn Days in STNG/LT Hosp 2007"
f0954706 ="Inptn Days in STNG/LT Hosp 2006"
f0954705 ="Inptn Days in STNG/LT Hosp 2005"
f0954700 ="Inptn Days in STNG/LT Hosp 2000"
f1318808 ="Inptn Days in ST Psychiatric 2008"
f1318908 ="Inptn Days in ST Rehabilitation 2008"
f1466708 ="Inptn Days in ST Chldrn's Gen 2008"
f1319008 ="Inptn Days in ST Chldrn's Psych 2008"
f1412008 ="Inptn Days in ST Acute LT Care 2008"
f1068408 ="Inptn Days in LT Gen Med/Surg 2008"
f1068508 ="Inptn Days in LT Psychiatric 2008"
f1068608 ="Inptn Days in LT Rehabilitation 2008"
f1068708 ="Inptn Day in LT Chronic Disease 2008"
f1068908 ="Inptn Day in LT Inst/Ment Retrd 2008"
f1069008 ="Inptn Days in LT Chldrn's Psych 2008"
f1412108 ="Inptn Days in LT Acute LT Care 2008"
f0954808 ="Inptn Days in Short Term Comm 2008"
f0954805 ="Inptn Days in Short Term Comm 2005"
f0954800 ="Inptn Days in Short Term Comm 2000"
f0955208 ="Inpatient Days in VA Hosps 2008"
f1405608 ="Nurs Home Inpatient Days 2008"
f1405607 ="Nurs Home Inpatient Days 2007"
f1405606 ="Nurs Home Inpatient Days 2006"
f1405605 ="Nurs Home Inpatient Days 2005"
f1405708 ="Nurs Home Inpatient Days, STGEN 2008"
f1405707 ="Nurs Home Inpatient Days, STGEN 2007"
f1405706 ="Nurs Home Inpatient Days, STGEN 2006"
f1405705 ="Nurs Home Inpatient Days, STGEN 2005"
f1405808 ="Nurs Home Inptn Days, STNG/LT 2008"
f1405807 ="Nurs Home Inptn Days, STNG/LT 2007"
f1405806 ="Nurs Home Inptn Days, STNG/LT 2006"
f1405805 ="Nurs Home Inptn Days, STNG/LT 2005"
f1031308 ="# Tot Fac Medicare Inpat Dchrg ST Gen Hosps 2008"
f1031305 ="# Tot Fac Medicare Inpat Dchrg ST Gen Hosps 2005"
f1031300 ="# Tot Fac Medicare Inpat Dchrg ST Gen Hosps 2000"
f1031408 ="# Tot Fac Medicare Inpat Dchrg STNG/LT Hosps 2008"
f1031405 ="# Tot Fac Medicare Inpat Dchrg STNG/LT Hosps 2005"
f1031400 ="# Tot Fac Medicare Inpat Dchrg STNG/LT Hosps 2000"
f1031508 ="# Tot Fac Medicaid Inpat Dchrg ST Gen Hosps 2008"
f1031505 ="# Tot Fac Medicaid Inpat Dchrg ST Gen Hosps 2005"
f1031500 ="# Tot Fac Medicaid Inpat Dchrg ST Gen Hosps 2000"
f1031608 ="# Tot Fac Medicaid Inpat Dchrg STNG/LT Hosps 2008"
f1031605 ="# Tot Fac Medicaid Inpat Dchrg STNG/LT Hosps 2005"
f1031600 ="# Tot Fac Medicaid Inpat Dchrg STNG/LT Hosps 2000"
f1139108 ="Dist Hosp By 00 - 39% Util Rate STGEN 2008"
f1139105 ="Dist Hosp By 00 - 39% Util Rate STGEN 2005"
f1139100 ="Dist Hosp By 00 - 39% Util Rate STGEN 2000"
f1139208 ="Dist Hosp By 40 - 59% Util Rate STGEN 2008"
f1139205 ="Dist Hosp By 40 - 59% Util Rate STGEN 2005"
f1139200 ="Dist Hosp By 40 - 59% Util Rate STGEN 2000"
f1139308 ="Dist Hosp By 60 - 79% Util Rate STGEN 2008"
f1139305 ="Dist Hosp By 60 - 79% Util Rate STGEN 2005"
f1139300 ="Dist Hosp By 60 - 79% Util Rate STGEN 2000"
f1139408 ="Dist Hosp By 80+% Util Rate STGEN 2008"
f1139405 ="Dist Hosp By 80+% Util Rate STGEN 2005"
f1139400 ="Dist Hosp By 80+% Util Rate STGEN 2000"
f0956608 ="Outpat Visits in ST Gen Hosp 2008"
f0956607 ="Outpat Visits in ST Gen Hosp 2007"
f0956606 ="Outpat Visits in ST Gen Hosp 2006"
f0956605 ="Outpat Visits in ST Gen Hosp 2005"
f0956600 ="Outpat Visits in ST Gen Hosp 2000"
f0956708 ="Outpat Visits in ST Non-Gen Hsp 2008"
f0956707 ="Outpat Visits in ST Non-Gen Hsp 2007"
f0956706 ="Outpat Visits in ST Non-Gen Hsp 2006"
f0956705 ="Outpat Visits in ST Non-Gen Hsp 2005"
f0956700 ="Outpat Visits in ST Non-Gen Hsp 2000"
f0956808 ="Outpat Visits in Long Term Hosp 2008"
f0956807 ="Outpat Visits in Long Term Hosp 2007"
f0956806 ="Outpat Visits in Long Term Hosp 2006"
f0956805 ="Outpat Visits in Long Term Hosp 2005"
f0956800 ="Outpat Visits in Long Term Hosp 2000"
f0957108 ="Outpatient Visits in VA Hosp 2008"
f0957208 ="Emergency Department Visits (ST Gen Hosps) 2008"
f0957207 ="Emergency Department Visits (ST Gen Hosps) 2007"
f0957206 ="Emergency Department Visits (ST Gen Hosps) 2006"
f0957205 ="Emergency Room Visits (ST Gen Hosps) 2005"
f0957200 ="Emergency Room Visits (ST Gen Hosps) 2000"
f0957408 ="Emergency Department Visits (STNG/LT Hosps) 2008"
f0957407 ="Emergency Department Visits (STNG/LT Hosps) 2007"
f0957406 ="Emergency Department Visits (STNG/LT Hosps) 2006"
f0957405 ="Emergency Room Visits (STNG/LT Hosps) 2005"
f0957400 ="Emergency Room Visits (STNG/LT Hosps) 2000"
f0957508 ="Outpatient Visits - Other (ST Gen Hosps) 2008"
f0957505 ="Outpatient Visits - Other (ST Gen Hosps) 2005"
f0957500 ="Outpatient Visits - Other (ST Gen Hosps) 2000"
f0957608 ="Outpatient Visits - Other (STNG/LT Hosps) 2008"
f0957605 ="Outpatient Visits - Other (STNG/LT Hosps) 2005"
f0957600 ="Outpatient Visits - Other (STNG/LT Hosps) 2000"
f0957708 ="Total Medicare Inpatient Days (ST Gen Hosps) 2008"
f0957705 ="Total Medicare Inpatient Days (ST Gen Hosps) 2005"
f0957700 ="Total Medicare Inpatient Days (ST Gen Hosps) 2000"
f0957808 ="Total Medicare Inpatient Days (STNG/LT Hosps) 2008"
f0957805 ="Total Medicare Inpatient Days (STNG/LT Hosps) 2005"
f0957800 ="Total Medicare Inpatient Days (STNG/LT Hosps) 2000"
f0970608 ="Total Medicaid Inpatient Days (ST Gen Hosps) 2008"
f0970605 ="Total Medicaid Inpatient Days (ST Gen Hosps) 2005"
f0970600 ="Total Medicaid Inpatient Days (ST Gen Hosps) 2000"
f0958008 ="Total Medicaid Inpatient Days (STNG/LT Hosps) 2008"
f0958005 ="Total Medicaid Inpatient Days (STNG/LT Hosps) 2005"
f0958000 ="Total Medicaid Inpatient Days (STNG/LT Hosps) 2000"
f0958308 ="# Surgical Operations, Inpatnt (ST Gen Hosps) 2008"
f0958305 ="# Surgical Operations, Inpatnt (ST Gen Hosps) 2005"
f0958300 ="# Surgical Operations, Inpatnt (ST Gen Hosps) 2000"
f0958408 ="# Surgical Operations, Inpatnt (STNG/LT Hosps) 2008"
f0958405 ="# Surgical Operations, Inpatnt (STNG/LT Hosps) 2005"
f0958400 ="# Surgical Operations, Inpatnt (STNG/LT Hosps) 2000"
f0970708 ="# Surgical Operations, Outpatnt (ST Gen Hosps) 2008"
f0970705 ="# Surgical Operations, Outpatnt (ST Gen Hosps) 2005"
f0970700 ="# Surgical Operations, Outpatnt (ST Gen Hosps) 2000"
f0958608 ="# Surgical Operations, Outpatnt (STNG/LT Hosps) 2008"
f0958605 ="# Surgical Operations, Outpatnt (STNG/LT Hosps) 2005"
f0958600 ="# Surgical Operations, Outpatnt (STNG/LT Hosps) 2000"
f0958708 ="# Surgical Operations, Total (ST Gen Hosps) 2008"
f0958705 ="# Surgical Operations, Total (ST Gen Hosps) 2005"
f0958700 ="# Surgical Operations, Total (ST Gen Hosps) 2000"
f0958908 ="# Surgical Operations, Total (STNG/LT Hosps) 2008"
f0958905 ="# Surgical Operations, Total (STNG/LT Hosps) 2005"
f0958900 ="# Surgical Operations, Total (STNG/LT Hosps) 2000"
f0959208 ="# Surgical Operations, Total (Veterans Hosps) 2008"
f1331808 ="# Operating Rooms (ST Gen Hosps) 2008"
f1331805 ="# Operating Rooms (ST Gen Hosps) 2005"
f1331800 ="# Operating Rooms (ST Gen Hosps) 2000"
f1331908 ="# Operating Rooms (STNG/LT Hosps) 2008"
f1331905 ="# Operating Rooms (STNG/LT Hosps) 2005"
f1331900 ="# Operating Rooms (STNG/LT Hosps) 2000"
f1392908 ="# Airborne Infection Isol Rooms (ST Gen Hosps) 2008"
f1392905 ="# Airborne Infection Isol Rooms (ST Gen Hosps) 2005"
f1393708 ="# Airborne Infection Isol Rooms (STNG/LT Hosps) 2008"
f1393705 ="# Airborne Infection Isol Rooms (STNG/LT Hosps) 2005"
f0959308 ="# Facilities Reporting Expenses (ST Gen Hosps) 2008"
f0959305 ="# Facilities Reporting Expenses (ST Gen Hosps) 2005"
f0959300 ="# Facilities Reporting Expenses (ST Gen Hosps) 2000"
f0959408 ="# Facilities Reporting Expenses (STNG/LT Hosps) 2008"
f0959405 ="# Facilities Reporting Expenses (STNG/LT Hosps) 2005"
f0959400 ="# Facilities Reporting Expenses (STNG/LT Hosps) 2000"
f0959508 ="# Facilities Reporting Expenses (Veterans Hospitals) 2008"
f0959608 ="Total Rep Facility Exp (1000's) ST Gen Hosps 2008"
f0959605 ="Total Rep Facility Exp (1000's) ST Gen Hosps 2005"
f0959600 ="Total Rep Facility Exp (1000's) ST Gen Hosps 2000"
f0959708 ="Total Rep Facility Exp (1000's) STNG/LT Hosps 2008"
f0959705 ="Total Rep Facility Exp (1000's) STNG/LT Hosps 2005"
f0959700 ="Total Rep Facility Exp (1000's) STNG/LT Hosps 2000"
f0959808 ="Total Rep Facility Exp (1000's) Vet Hosps 2008"
f0960708 ="# Facs Reporting Payroll Expens ST Gen Hosps 2008"
f0960705 ="# Facs Reporting Payroll Expens ST Gen Hosps 2005"
f0960700 ="# Facs Reporting Payroll Expens ST Gen Hosps 2000"
f0960808 ="# Facs Reporting Payroll Expens (STNG/LT Hosps) 2008"
f0960805 ="# Facs Reporting Payroll Expens (STNG/LT Hosps) 2005"
f0960800 ="# Facs Reporting Payroll Expens (STNG/LT Hosps) 2000"
f0960908 ="Tot Rep Payroll Expense(1000's) (ST Gen Hosps) 2008"
f0960905 ="Tot Rep Payroll Expense(1000's) (ST Gen Hosps) 2005"
f0960900 ="Tot Rep Payroll Expense(1000's) (ST Gen Hosps) 2000"
f0961008 ="Tot Rep Payroll Expense(1000's) (STNG/LT Hosps) 2008"
f0961005 ="Tot Rep Payroll Expense(1000's) (STNG/LT Hosps) 2005"
f0961000 ="Tot Rep Payroll Expense(1000's) (STNG/LT Hosps) 2000"
f1319410 ="Medicare Adv PtA Aged Pymt Rate 2010"
f1319409 ="Medicare Adv PtA Aged Pymt Rate 2009"
f1319408 ="Medicare Adv PtA Aged Pymt Rate 2008"
f1319407 ="Medicare Adv PtA Aged Pymt Rate 2007"
f1319406 ="Medicare Adv PtA Aged Pymt Rate 2006"
f1319405 ="Medicare Adv PtA Aged Pymt Rate 2005"
f1319400 ="Medcre+Choice PtA Aged Pmt Rate 2000"
f1319510 ="Medicare Adv PtB Aged Pymt Rate 2010"
f1319509 ="Medicare Adv PtB Aged Pymt Rate 2009"
f1319508 ="Medicare Adv PtB Aged Pymt Rate 2008"
f1319507 ="Medicare Adv PtB Aged Pymt Rate 2007"
f1319506 ="Medicare Adv PtB Aged Pymt Rate 2006"
f1319505 ="Medicare Adv PtB Aged Pymt Rate 2005"
f1319500 ="Medcre+Choice PtB Aged Pmt Rate 2000"
f0453010 ="Census Population 2010"
f1198409 ="Population Estimate 2009"
f1198408 ="Population Estimate 2008"
f1198407 ="Population Estimate 2007"
f1198406 ="Population Estimate 2006"
f1198405 ="Population Estimate 2005"
f1198404 ="Population Estimate 2004"
f1198403 ="Population Estimate 2003"
f1198402 ="Population Estimate 2002"
f1198401 ="Population Estimate 2001"
f0453000 ="Census Population 2000"
f1198499 ="Population Estimate 1999"
f1198498 ="Population Estimate 1998"
f1198497 ="Population Estimate 1997"
f1198496 ="Population Estimate 1996"
f1198495 ="Population Estimate 1995"
f1198494 ="Population Estimate 1994"
f1198493 ="Population Estimate 1993"
f1198492 ="Population Estimate 1992"
f1198491 ="Population Estimate 1991"
f1139790 ="Census Population (100's) 1990"
f0403988 ="Population Estimate (100's) 1988"
f0403987 ="Population Estimate (100's) 1987"
f0403986 ="Population Estimate (100's) 1986"
f0403985 ="Population Estimate (100's) 1985"
f0403984 ="Population Estimate (100's) 1984"
f0403983 ="Population Estimate (100's) 1983"
f0403982 ="Population Estimate (100's) 1982"
f1139780 ="Census Population (100's) 1980"
f0017970 ="Census Population (100's) 1970"
f1139860 ="Census Population (100's) 1960"
f1139850 ="Census Population (100's) 1950"
f1139840 ="Census Population (100's) 1940"
f1318208 ="Persons/Quasi-individual 2008"
f1318207 ="Persons/Quasi-individual 2007"
f1318206 ="Persons/Quasi-individual 2006"
f1318205 ="Persons/Quasi-individual 2005"
f1318200 ="Persons/Quasi-individual 2000"
f1318295 ="Persons/Quasi-individual 1995"
f1390609 ="Pop Total Male 2009"
f1390608 ="Pop Total Male 2008"
f1390607 ="Pop Total Male 2007"
f1390606 ="Pop Total Male 2006"
f1390605 ="Pop Total Male 2005"
f1390600 ="Pop Total Male 2000"
f1390709 ="Pop Total Female 2009"
f1390708 ="Pop Total Female 2008"
f1390707 ="Pop Total Female 2007"
f1390706 ="Pop Total Female 2006"
f1390705 ="Pop Total Female 2005"
f1390700 ="Pop Total Female 2000"
f1390809 ="Pop White Male 2009"
f1390808 ="Pop White Male 2008"
f1390807 ="Pop White Male 2007"
f1390806 ="Pop White Male 2006"
f1390805 ="Pop White Male 2005"
f1390800 ="Pop White Male 2000"
f1390909 ="Pop White Female 2009"
f1390908 ="Pop White Female 2008"
f1390907 ="Pop White Female 2007"
f1390906 ="Pop White Female 2006"
f1390905 ="Pop White Female 2005"
f1390900 ="Pop White Female 2000"
f1392609 ="Pop White Non-Hisp/Latino Male 2009"
f1392608 ="Pop White Non-Hisp/Latino Male 2008"
f1392607 ="Pop White Non-Hisp/Latino Male 2007"
f1392606 ="Pop White Non-Hisp/Latino Male 2006"
f1392605 ="Pop White Non-Hisp/Latino Male 2005"
f1392600 ="Pop White Non-Hisp/Latino Male 2000"
f1392709 ="Pop White Non-Hisp/Latino Femle 2009"
f1392708 ="Pop White Non-Hisp/Latino Femle 2008"
f1392707 ="Pop White Non-Hisp/Latino Femle 2007"
f1392706 ="Pop White Non-Hisp/Latino Femle 2006"
f1392705 ="Pop White Non-Hisp/Latino Femle 2005"
f1392700 ="Pop White Non-Hisp/Latino Femle 2000"
f1392409 ="Pop White Hispanic/Latino Male 2009"
f1392408 ="Pop White Hispanic/Latino Male 2008"
f1392407 ="Pop White Hispanic/Latino Male 2007"
f1392406 ="Pop White Hispanic/Latino Male 2006"
f1392405 ="Pop White Hispanic/Latino Male 2005"
f1392400 ="Pop White Hispanic/Latino Male 2000"
f1392509 ="Pop White Hispanic/Latino Femle 2009"
f1392508 ="Pop White Hispanic/Latino Femle 2008"
f1392507 ="Pop White Hispanic/Latino Femle 2007"
f1392506 ="Pop White Hispanic/Latino Femle 2006"
f1392505 ="Pop White Hispanic/Latino Femle 2005"
f1392500 ="Pop White Hispanic/Latino Femle 2000"
f1391009 ="Pop Black/African Amer Male 2009"
f1391008 ="Pop Black/African Amer Male 2008"
f1391007 ="Pop Black/African Amer Male 2007"
f1391006 ="Pop Black/African Amer Male 2006"
f1391005 ="Pop Black/African Amer Male 2005"
f1391000 ="Pop Black/African Amer Male 2000"
f1391109 ="Pop Black/African Amer Female 2009"
f1391108 ="Pop Black/African Amer Female 2008"
f1391107 ="Pop Black/African Amer Female 2007"
f1391106 ="Pop Black/African Amer Female 2006"
f1391105 ="Pop Black/African Amer Female 2005"
f1391100 ="Pop Black/African Amer Female 2000"
f1397909 ="Pop Bl/Afr Am Non-Hisp/Lat Male 2009"
f1397908 ="Pop Bl/Afr Am Non-Hisp/Lat Male 2008"
f1397907 ="Pop Bl/Afr Am Non-Hisp/Lat Male 2007"
f1397906 ="Pop Bl/Afr Am Non-Hisp/Lat Male 2006"
f1397905 ="Pop Bl/Afr Am Non-Hisp/Lat Male 2005"
f1398009 ="Pop Bl/Afr Am Non-Hisp/Lat Fmle 2009"
f1398008 ="Pop Bl/Afr Am Non-Hisp/Lat Fmle 2008"
f1398007 ="Pop Bl/Afr Am Non-Hisp/Lat Fmle 2007"
f1398006 ="Pop Bl/Afr Am Non-Hisp/Lat Fmle 2006"
f1398005 ="Pop Bl/Afr Am Non-Hisp/Lat Fmle 2005"
f1398109 ="Pop Bl/Afr Hispanic/Latino Male 2009"
f1398108 ="Pop Bl/Afr Hispanic/Latino Male 2008"
f1398107 ="Pop Bl/Afr Hispanic/Latino Male 2007"
f1398106 ="Pop Bl/Afr Hispanic/Latino Male 2006"
f1398105 ="Pop Bl/Afr Hispanic/Latino Male 2005"
f1398209 ="Pop Bl/Afr Hispanic/Latino Fmle 2009"
f1398208 ="Pop Bl/Afr Hispanic/Latino Fmle 2008"
f1398207 ="Pop Bl/Afr Hispanic/Latino Fmle 2007"
f1398206 ="Pop Bl/Afr Hispanic/Latino Fmle 2006"
f1398205 ="Pop Bl/Afr Hispanic/Latino Fmle 2005"
f1391209 ="Pop Am Ind/Alaska Native Male 2009"
f1391208 ="Pop Am Ind/Alaska Native Male 2008"
f1391207 ="Pop Am Ind/Alaska Native Male 2007"
f1391206 ="Pop Am Ind/Alaska Native Male 2006"
f1391205 ="Pop Am Ind/Alaska Native Male 2005"
f1391200 ="Pop Am Ind/Alaska Native Male 2000"
f1391309 ="Pop Am Ind/Alaska Native Female 2009"
f1391308 ="Pop Am Ind/Alaska Native Female 2008"
f1391307 ="Pop Am Ind/Alaska Native Female 2007"
f1391306 ="Pop Am Ind/Alaska Native Female 2006"
f1391305 ="Pop Am Ind/Alaska Native Female 2005"
f1391300 ="Pop Am Ind/Alaska Native Female 2000"
f1391409 ="Pop Asian Male 2009"
f1391408 ="Pop Asian Male 2008"
f1391407 ="Pop Asian Male 2007"
f1391406 ="Pop Asian Male 2006"
f1391405 ="Pop Asian Male 2005"
f1391400 ="Pop Asian Male 2000"
f1391609 ="Pop Nat Hawi/Oth Pac Isl Male 2009"
f1391608 ="Pop Nat Hawi/Oth Pac Isl Male 2008"
f1391607 ="Pop Nat Hawi/Oth Pac Isl Male 2007"
f1391606 ="Pop Nat Hawi/Oth Pac Isl Male 2006"
f1391605 ="Pop Nat Hawi/Oth Pac Isl Male 2005"
f1391600 ="Pop Nat Hawi/Oth Pac Isl Male 2000"
f1391509 ="Pop Asian Female 2009"
f1391508 ="Pop Asian Female 2008"
f1391507 ="Pop Asian Female 2007"
f1391506 ="Pop Asian Female 2006"
f1391505 ="Pop Asian Female 2005"
f1391500 ="Pop Asian Female 2000"
f1391709 ="Pop Nat Hawi/Oth Pac Isl Female 2009"
f1391708 ="Pop Nat Hawi/Oth Pac Isl Female 2008"
f1391707 ="Pop Nat Hawi/Oth Pac Isl Female 2007"
f1391706 ="Pop Nat Hawi/Oth Pac Isl Female 2006"
f1391705 ="Pop Nat Hawi/Oth Pac Isl Female 2005"
f1391700 ="Pop Nat Hawi/Oth Pac Isl Female 2000"
f1391809 ="Pop Two or more Races Male 2009"
f1391808 ="Pop Two or more Races Male 2008"
f1391807 ="Pop Two or more Races Male 2007"
f1391806 ="Pop Two or more Races Male 2006"
f1391805 ="Pop Two or more Races Male 2005"
f1391800 ="Pop Two or more Races Male 2000"
f1391909 ="Pop Two or more Races Female 2009"
f1391908 ="Pop Two or more Races Female 2008"
f1391907 ="Pop Two or more Races Female 2007"
f1391906 ="Pop Two or more Races Female 2006"
f1391905 ="Pop Two or more Races Female 2005"
f1391900 ="Pop Two or more Races Female 2000"
f1392009 ="Pop Tot Hispanic/Latino Male 2009"
f1392008 ="Pop Tot Hispanic/Latino Male 2008"
f1392007 ="Pop Tot Hispanic/Latino Male 2007"
f1392006 ="Pop Tot Hispanic/Latino Male 2006"
f1392005 ="Pop Tot Hispanic/Latino Male 2005"
f1392000 ="Pop Tot Hispanic/Latino Male 2000"
f1392109 ="Pop Tot Hispanic/Latino Female 2009"
f1392108 ="Pop Tot Hispanic/Latino Female 2008"
f1392107 ="Pop Tot Hispanic/Latino Female 2007"
f1392106 ="Pop Tot Hispanic/Latino Female 2006"
f1392105 ="Pop Tot Hispanic/Latino Female 2005"
f1392100 ="Pop Tot Hispanic/Latino Female 2000"
f1392209 ="Pop Tot Non-Hisp/Latino Male 2009"
f1392208 ="Pop Tot Non-Hisp/Latino Male 2008"
f1392207 ="Pop Tot Non-Hisp/Latino Male 2007"
f1392206 ="Pop Tot Non-Hisp/Latino Male 2006"
f1392205 ="Pop Tot Non-Hisp/Latino Male 2005"
f1392200 ="Pop Tot Non-Hisp/Latino Male 2000"
f1392309 ="Pop Tot Non-Hisp/Latino Female 2009"
f1392308 ="Pop Tot Non-Hisp/Latino Female 2008"
f1392307 ="Pop Tot Non-Hisp/Latino Female 2007"
f1392306 ="Pop Tot Non-Hisp/Latino Female 2006"
f1392305 ="Pop Tot Non-Hisp/Latino Female 2005"
f1392300 ="Pop Tot Non-Hisp/Latino Female 2000"
f0670400 ="Pop Male < 5 2000"
f0670490 ="Pop Male < 5 1990"
f0670500 ="Pop Fmle < 5 2000"
f0670590 ="Pop Fmle < 5 1990"
f0670600 ="Pop Male 5-9 2000"
f0670690 ="Pop Male 5-9 1990"
f0670700 ="Pop Fmle 5-9 2000"
f0670790 ="Pop Fmle 5-9 1990"
f0670800 ="Pop Male 10-14 2000"
f0670890 ="Pop Male 10-14 1990"
f0670900 ="Pop Fmle 10-14 2000"
f0670990 ="Pop Fmle 10-14 1990"
f0671000 ="Pop Male 15-19 2000"
f0671090 ="Pop Male 15-19 1990"
f0671100 ="Pop Fmle 15-19 2000"
f0671190 ="Pop Fmle 15-19 1990"
f0671200 ="Pop Male 20-24 2000"
f0671290 ="Pop Male 20-24 1990"
f0671300 ="Pop Fmle 20-24 2000"
f0671390 ="Pop Fmle 20-24 1990"
f0671400 ="Pop Male 25-29 2000"
f0671490 ="Pop Male 25-29 1990"
f0671500 ="Pop Fmle 25-29 2000"
f0671590 ="Pop Fmle 25-29 1990"
f0671600 ="Pop Male 30-34 2000"
f0671690 ="Pop Male 30-34 1990"
f0671700 ="Pop Fmle 30-34 2000"
f0671790 ="Pop Fmle 30-34 1990"
f0671800 ="Pop Male 35-44 2000"
f0671890 ="Pop Male 35-44 1990"
f0671900 ="Pop Fmle 35-44 2000"
f0671990 ="Pop Fmle 35-44 1990"
f0672000 ="Pop Male 45-54 2000"
f0672090 ="Pop Male 45-54 1990"
f0672100 ="Pop Fmle 45-54 2000"
f0672190 ="Pop Fmle 45-54 1990"
f0672200 ="Pop Male 55-59 2000"
f0672290 ="Pop Male 55-59 1990"
f0672300 ="Pop Fmle 55-59 2000"
f0672390 ="Pop Fmle 55-59 1990"
f0672400 ="Pop Male 60-64 2000"
f0672490 ="Pop Male 60-64 1990"
f0672500 ="Pop Fmle 60-64 2000"
f0672590 ="Pop Fmle 60-64 1990"
f0672600 ="Pop Male 65-74 2000"
f0672690 ="Pop Male 65-74 1990"
f0672700 ="Pop Fmle 65-74 2000"
f0672790 ="Pop Fmle 65-74 1990"
f1164000 ="Pop Male 75-84 2000"
f1164090 ="Pop Male 75-84 1990"
f1164100 ="Pop Fmle 75-84 2000"
f1164190 ="Pop Fmle 75-84 1990"
f1164200 ="Pop Male > 84 2000"
f1164290 ="Pop Male > 84 1990"
f1164300 ="Pop Fmle > 84 2000"
f1164390 ="Pop Fmle > 84 1990"
f0852200 ="Pop White Male < 5 2000"
f0852290 ="Pop White Male < 5 1990"
f0851700 ="Pop White Fmle < 5 2000"
f0851790 ="Pop White Fmle < 5 1990"
f1144300 ="Pop White Male 5-9 2000"
f1144390 ="Pop White Male 5-9 1990"
f1144500 ="Pop White Male 10-14 2000"
f1144590 ="Pop White Male 10-14 1990"
f1144400 ="Pop White Fmle 5-9 2000"
f1144490 ="Pop White Fmle 5-9 1990"
f1144600 ="Pop White Fmle 10-14 2000"
f1144690 ="Pop White Fmle 10-14 1990"
f1144700 ="Pop White Male 15-19 2000"
f1144790 ="Pop White Male 15-19 1990"
f1144900 ="Pop White Male 20-24 2000"
f1144990 ="Pop White Male 20-24 1990"
f1145100 ="Pop White Male 25-29 2000"
f1145190 ="Pop White Male 25-29 1990"
f1145300 ="Pop White Male 30-34 2000"
f1145390 ="Pop White Male 30-34 1990"
f1145500 ="Pop White Male 35-44 2000"
f1145590 ="Pop White Male 35-44 1990"
f1145700 ="Pop White Male 45-54 2000"
f1145790 ="Pop White Male 45-54 1990"
f1145900 ="Pop White Male 55-59 2000"
f1145990 ="Pop White Male 55-59 1990"
f1144800 ="Pop White Fmle 15-19 2000"
f1144890 ="Pop White Fmle 15-19 1990"
f1145000 ="Pop White Fmle 20-24 2000"
f1145090 ="Pop White Fmle 20-24 1990"
f1145200 ="Pop White Fmle 25-29 2000"
f1145290 ="Pop White Fmle 25-29 1990"
f1145400 ="Pop White Fmle 30-34 2000"
f1145490 ="Pop White Fmle 30-34 1990"
f1145600 ="Pop White Fmle 35-44 2000"
f1145690 ="Pop White Fmle 35-44 1990"
f1145800 ="Pop White Fmle 45-54 2000"
f1145890 ="Pop White Fmle 45-54 1990"
f1146000 ="Pop White Fmle 55-59 2000"
f1146090 ="Pop White Fmle 55-59 1990"
f0852500 ="Pop White Male 60-64 2000"
f0852590 ="Pop White Male 60-64 1990"
f0852000 ="Pop White Fmle 60-64 2000"
f0852090 ="Pop White Fmle 60-64 1990"
f1146300 ="Pop White Male 65-74 2000"
f1146390 ="Pop White Male 65-74 1990"
f1146500 ="Pop White Male 75-84 2000"
f1146590 ="Pop White Male 75-84 1990"
f1164400 ="Pop White Male > 84 2000"
f1164490 ="Pop White Male > 84 1990"
f1146400 ="Pop White Fmle 65-74 2000"
f1146490 ="Pop White Fmle 65-74 1990"
f1146600 ="Pop White Fmle 75-84 2000"
f1146690 ="Pop White Fmle 75-84 1990"
f1164500 ="Pop White Fmle > 84 2000"
f1164590 ="Pop White Fmle > 84 1990"
f0853200 ="Pop Black/African Am Male < 5 2000"
f0853290 ="Pop Black Male < 5 1990"
f0852700 ="Pop Black/African Am Fmle < 5 2000"
f0852790 ="Pop Black Fmle < 5 1990"
f1146900 ="Pop Black/African Am Male 5-9 2000"
f1146990 ="Pop Black Male 5-9 1990"
f1147100 ="Pop Black/African Am Male 10-14 2000"
f1147190 ="Pop Black Male 10-14 1990"
f1147000 ="Pop Black/African Am Fmle 5-9 2000"
f1147090 ="Pop Black Fmle 5-9 1990"
f1147200 ="Pop Black/African Am Fmle 10-14 2000"
f1147290 ="Pop Black Fmle 10-14 1990"
f1147300 ="Pop Black/African Am Male 15-19 2000"
f1147390 ="Pop Black Male 15-19 1990"
f1147500 ="Pop Black/African Am Male 20-24 2000"
f1147590 ="Pop Black Male 20-24 1990"
f1147700 ="Pop Black/African Am Male 25-29 2000"
f1147790 ="Pop Black Male 25-29 1990"
f1147900 ="Pop Black/African Am Male 30-34 2000"
f1147990 ="Pop Black Male 30-34 1990"
f1148100 ="Pop Black/African Am Male 35-44 2000"
f1148190 ="Pop Black Male 35-44 1990"
f1148300 ="Pop Black/African Am Male 45-54 2000"
f1148390 ="Pop Black Male 45-54 1990"
f1148500 ="Pop Black/African Am Male 55-59 2000"
f1148590 ="Pop Black Male 55-59 1990"
f1147400 ="Pop Black/African Am Fmle 15-19 2000"
f1147490 ="Pop Black Fmle 15-19 1990"
f1147600 ="Pop Black/African Am Fmle 20-24 2000"
f1147690 ="Pop Black Fmle 20-24 1990"
f1147800 ="Pop Black/African Am Fmle 25-29 2000"
f1147890 ="Pop Black Fmle 25-29 1990"
f1148000 ="Pop Black/African Am Fmle 30-34 2000"
f1148090 ="Pop Black Fmle 30-34 1990"
f1148200 ="Pop Black/African Am Fmle 35-44 2000"
f1148290 ="Pop Black Fmle 35-44 1990"
f1148400 ="Pop Black/African Am Fmle 45-54 2000"
f1148490 ="Pop Black Fmle 45-54 1990"
f1148600 ="Pop Black/African Am Fmle 55-59 2000"
f1148690 ="Pop Black Fmle 55-59 1990"
f0853500 ="Pop Black/African Am Male 60-64 2000"
f0853590 ="Pop Black Male 60-64 1990"
f0853000 ="Pop Black/African Am Fmle 60-64 2000"
f0853090 ="Pop Black Fmle 60-64 1990"
f1148900 ="Pop Black/African Am Male 65-74 2000"
f1148990 ="Pop Black Male 65-74 1990"
f1149100 ="Pop Black/African Am Male 75-84 2000"
f1149190 ="Pop Black Male 75-84 1990"
f1164600 ="Pop Black/African Am Male > 84 2000"
f1164690 ="Pop Black Male > 84 1990"
f1149000 ="Pop Black/African Am Fmle 65-74 2000"
f1149090 ="Pop Black Fmle 65-74 1990"
f1149200 ="Pop Black/African Am Fmle 75-84 2000"
f1149290 ="Pop Black Fmle 75-84 1990"
f1164700 ="Pop Black/African Am Fmle > 84 2000"
f1164790 ="Pop Black Fmle > 84 1990"
f1149300 ="Pop Am Ind/Alaska Nat Male < 5 2000"
f1149390 ="Pop Am Ind/Esk/Aleut Male < 5 1990"
f1149400 ="Pop Am Ind/Alaska Nat Fmle < 5 2000"
f1149490 ="Pop Am Ind/Esk/Aleut Fmle < 5 1990"
f1149500 ="Pop Am Ind/Alaska Nat Male 5-9 2000"
f1149590 ="Pop Am Ind/Esk/Aleut Male 5-9 1990"
f1149600 ="Pop Am Ind/Alaska Nat Fmle 5-9 2000"
f1149690 ="Pop Am Ind/Esk/Aleut Fmle 5-9 1990"
f1149700 ="Pop Am Ind/Alska Nat Male 10-14 2000"
f1149790 ="Pop Am Ind/Esk/Aleut Male 10-14 1990"
f1149800 ="Pop Am Ind/Alska Nat Fmle 10-14 2000"
f1149890 ="Pop Am Ind/Esk/Aleut Fmle 10-14 1990"
f1149900 ="Pop Am Ind/Alska Nat Male 15-19 2000"
f1149990 ="Pop Am Ind/Esk/Aleut Male 15-19 1990"
f1150000 ="Pop Am Ind/Alska Nat Fmle 15-19 2000"
f1150090 ="Pop Am Ind/Esk/Aleut Fmle 15-19 1990"
f1150100 ="Pop Am Ind/Alska Nat Male 20-24 2000"
f1150190 ="Pop Am Ind/Esk/Aleut Male 20-24 1990"
f1150200 ="Pop Am Ind/Alska Nat Fmle 20-24 2000"
f1150290 ="Pop Am Ind/Esk/Aleut Fmle 20-24 1990"
f1150300 ="Pop Am Ind/Alska Nat Male 25-29 2000"
f1150390 ="Pop Am Ind/Esk/Aleut Male 25-29 1990"
f1150400 ="Pop Am Ind/Alska Nat Fmle 25-29 2000"
f1150490 ="Pop Am Ind/Esk/Aleut Fmle 25-29 1990"
f1150500 ="Pop Am Ind/Alska Nat Male 30-34 2000"
f1150590 ="Pop Am Ind/Esk/Aleut Male 30-34 1990"
f1150600 ="Pop Am Ind/Alska Nat Fmle 30-34 2000"
f1150690 ="Pop Am Ind/Esk/Aleut Fmle 30-34 1990"
f1150700 ="Pop Am Ind/Alska Nat Male 35-44 2000"
f1150790 ="Pop Am Ind/Esk/Aleut Male 35-44 1990"
f1150800 ="Pop Am Ind/Alska Nat Fmle 35-44 2000"
f1150890 ="Pop Am Ind/Esk/Aleut Fmle 35-44 1990"
f1150900 ="Pop Am Ind/Alska Nat Male 45-54 2000"
f1150990 ="Pop Am Ind/Esk/Aleut Male 45-54 1990"
f1151000 ="Pop Am Ind/Alska Nat Fmle 45-54 2000"
f1151090 ="Pop Am Ind/Esk/Aleut Fmle 45-54 1990"
f1151100 ="Pop Am Ind/Alska Nat Male 55-59 2000"
f1151190 ="Pop Am Ind/Esk/Aleut Male 55-59 1990"
f1151200 ="Pop Am Ind/Alska Nat Fmle 55-59 2000"
f1151290 ="Pop Am Ind/Esk/Aleut Fmle 55-59 1990"
f1151300 ="Pop Am Ind/Alska Nat Male 60-64 2000"
f1151390 ="Pop Am Ind/Esk/Aleut Male 60-64 1990"
f1151400 ="Pop Am Ind/Alska Nat Fmle 60-64 2000"
f1151490 ="Pop Am Ind/Esk/Aleut Fmle 60-64 1990"
f1151500 ="Pop Am Ind/Alska Nat Male 65-74 2000"
f1151590 ="Pop Am Ind/Esk/Aleut Male 65-74 1990"
f1151600 ="Pop Am Ind/Alska Nat Fmle 65-74 2000"
f1151690 ="Pop Am Ind/Esk/Aleut Fmle 65-74 1990"
f1151700 ="Pop Am Ind/Alska Nat Male 75-84 2000"
f1151790 ="Pop Am Ind/Esk/Aleut Male 75-84 1990"
f1151800 ="Pop Am Ind/Alska Nat Fmle 75-84 2000"
f1151890 ="Pop Am Ind/Esk/Aleut Fmle 75-84 1990"
f1164800 ="Pop Am Ind/Alaska Nat Male > 84 2000"
f1164890 ="Pop Am Ind/Esk/Aleut Male > 84 1990"
f1164900 ="Pop Am Ind/Alaska Nat Fmle > 84 2000"
f1164990 ="Pop Am Ind/Esk/Aleut Fmle > 84 1990"
f1334400 ="Pop Asian Male < 5 2000"
f1334500 ="Pop Asian Fmle < 5 2000"
f1334600 ="Pop Asian Male 5-9 2000"
f1334700 ="Pop Asian Fmle 5-9 2000"
f1334800 ="Pop Asian Male 10-14 2000"
f1334900 ="Pop Asian Fmle 10-14 2000"
f1335000 ="Pop Asian Male 15-19 2000"
f1335100 ="Pop Asian Fmle 15-19 2000"
f1335200 ="Pop Asian Male 20-24 2000"
f1335300 ="Pop Asian Fmle 20-24 2000"
f1335400 ="Pop Asian Male 25-29 2000"
f1335500 ="Pop Asian Fmle 25-29 2000"
f1335600 ="Pop Asian Male 30-34 2000"
f1335700 ="Pop Asian Fmle 30-34 2000"
f1335800 ="Pop Asian Male 35-44 2000"
f1335900 ="Pop Asian Fmle 35-44 2000"
f1336000 ="Pop Asian Male 45-54 2000"
f1336100 ="Pop Asian Fmle 45-54 2000"
f1336200 ="Pop Asian Male 55-59 2000"
f1336300 ="Pop Asian Fmle 55-59 2000"
f1336400 ="Pop Asian Male 60-64 2000"
f1336500 ="Pop Asian Fmle 60-64 2000"
f1336600 ="Pop Asian Male 65-74 2000"
f1336700 ="Pop Asian Fmle 65-74 2000"
f1336800 ="Pop Asian Male 75-84 2000"
f1336900 ="Pop Asian Fmle 75-84 2000"
f1337000 ="Pop Asian Male > 84 2000"
f1337100 ="Pop Asian Fmle > 84 2000"
f1337200 ="Pop Nat Hawaii/Oth PI Male < 5 2000"
f1337300 ="Pop Nat Hawaii/Oth PI Fmle < 5 2000"
f1337400 ="Pop Nat Hawaii/Oth PI Male 5-9 2000"
f1337500 ="Pop Nat Hawaii/Oth PI Fmle 5-9 2000"
f1337600 ="Pop Nat Hawai/Oth PI Male 10-14 2000"
f1337700 ="Pop Nat Hawai/Oth PI Fmle 10-14 2000"
f1337800 ="Pop Nat Hawai/Oth PI Male 15-19 2000"
f1337900 ="Pop Nat Hawai/Oth PI Fmle 15-19 2000"
f1338000 ="Pop Nat Hawai/Oth PI Male 20-24 2000"
f1338100 ="Pop Nat Hawai/Oth PI Fmle 20-24 2000"
f1338200 ="Pop Nat Hawai/Oth PI Male 25-29 2000"
f1338300 ="Pop Nat Hawai/Oth PI Fmle 25-29 2000"
f1338400 ="Pop Nat Hawai/Oth PI Male 30-34 2000"
f1338500 ="Pop Nat Hawai/Oth PI Fmle 30-34 2000"
f1338600 ="Pop Nat Hawai/Oth PI Male 35-44 2000"
f1338700 ="Pop Nat Hawai/Oth PI Fmle 35-44 2000"
f1338800 ="Pop Nat Hawai/Oth PI Male 45-54 2000"
f1338900 ="Pop Nat Hawai/Oth PI Fmle 45-54 2000"
f1339000 ="Pop Nat Hawai/Oth PI Male 55-59 2000"
f1339100 ="Pop Nat Hawai/Oth PI Fmle 55-59 2000"
f1339200 ="Pop Nat Hawai/Oth PI Male 60-64 2000"
f1339300 ="Pop Nat Hawai/Oth PI Fmle 60-64 2000"
f1339400 ="Pop Nat Hawai/Oth PI Male 65-74 2000"
f1339500 ="Pop Nat Hawai/Oth PI Fmle 65-74 2000"
f1339600 ="Pop Nat Hawai/Oth PI Male 75-84 2000"
f1339700 ="Pop Nat Hawai/Oth PI Fmle 75-84 2000"
f1339800 ="Pop Nat Hawaii/Oth PI Male > 84 2000"
f1339900 ="Pop Nat Hawaii/Oth PI Fmle > 84 2000"
f1151990 ="Pop Asian/Pac Islndr Male < 5 1990"
f1152090 ="Pop Asian/Pac Islndr Fmle < 5 1990"
f1152190 ="Pop Asian/Pac Islndr Male 5-9 1990"
f1152290 ="Pop Asian/Pac Islndr Fmle 5-9 1990"
f1152390 ="Pop Asian/Pac Islndr Male 10-14 1990"
f1152490 ="Pop Asian/Pac Islndr Fmle 10-14 1990"
f1152590 ="Pop Asian/Pac Islndr Male 15-19 1990"
f1152690 ="Pop Asian/Pac Islndr Fmle 15-19 1990"
f1152790 ="Pop Asian/Pac Islndr Male 20-24 1990"
f1152890 ="Pop Asian/Pac Islndr Fmle 20-24 1990"
f1152990 ="Pop Asian/Pac Islndr Male 25-29 1990"
f1153090 ="Pop Asian/Pac Islndr Fmle 25-29 1990"
f1153190 ="Pop Asian/Pac Islndr Male 30-34 1990"
f1153290 ="Pop Asian/Pac Islndr Fmle 30-34 1990"
f1153390 ="Pop Asian/Pac Islndr Male 35-44 1990"
f1153490 ="Pop Asian/Pac Islndr Fmle 35-44 1990"
f1153590 ="Pop Asian/Pac Islndr Male 45-54 1990"
f1153690 ="Pop Asian/Pac Islndr Fmle 45-54 1990"
f1153790 ="Pop Asian/Pac Islndr Male 55-59 1990"
f1153890 ="Pop Asian/Pac Islndr Fmle 55-59 1990"
f1153990 ="Pop Asian/Pac Islndr Male 60-64 1990"
f1154090 ="Pop Asian/Pac Islndr Fmle 60-64 1990"
f1154190 ="Pop Asian/Pac Islndr Male 65-74 1990"
f1154290 ="Pop Asian/Pac Islndr Fmle 65-74 1990"
f1154390 ="Pop Asian/Pac Islndr Male 75-84 1990"
f1154490 ="Pop Asian/Pac Islndr Fmle 75-84 1990"
f1165090 ="Pop Asian/Pac Islndr Male > 84 1990"
f1165190 ="Pop Asian/Pac Islndr Fmle > 84 1990"
f1154500 ="Pop Some Other Race Male < 5 2000"
f1154590 ="Pop Other Male < 5 1990"
f1154600 ="Pop Some Other Race Fmle < 5 2000"
f1154690 ="Pop Other Fmle < 5 1990"
f1154700 ="Pop Some Other Race Male 5-9 2000"
f1154790 ="Pop Other Male 5-9 1990"
f1154800 ="Pop Some Other Race Fmle 5-9 2000"
f1154890 ="Pop Other Fmle 5-9 1990"
f1154900 ="Pop Some Other Race Male 10-14 2000"
f1154990 ="Pop Other Male 10-14 1990"
f1155000 ="Pop Some Other Race Fmle 10-14 2000"
f1155090 ="Pop Other Fmle 10-14 1990"
f1155100 ="Pop Some Other Race Male 15-19 2000"
f1155190 ="Pop Other Male 15-19 1990"
f1155200 ="Pop Some Other Race Fmle 15-19 2000"
f1155290 ="Pop Other Fmle 15-19 1990"
f1155300 ="Pop Some Other Race Male 20-24 2000"
f1155390 ="Pop Other Male 20-24 1990"
f1155400 ="Pop Some Other Race Fmle 20-24 2000"
f1155490 ="Pop Other Fmle 20-24 1990"
f1155500 ="Pop Some Other Race Male 25-29 2000"
f1155590 ="Pop Other Male 25-29 1990"
f1155600 ="Pop Some Other Race Fmle 25-29 2000"
f1155690 ="Pop Other Fmle 25-29 1990"
f1155700 ="Pop Some Other Race Male 30-34 2000"
f1155790 ="Pop Other Male 30-34 1990"
f1155800 ="Pop Some Other Race Fmle 30-34 2000"
f1155890 ="Pop Other Fmle 30-34 1990"
f1155900 ="Pop Some Other Race Male 35-44 2000"
f1155990 ="Pop Other Male 35-44 1990"
f1156000 ="Pop Some Other Race Fmle 35-44 2000"
f1156090 ="Pop Other Fmle 35-44 1990"
f1156100 ="Pop Some Other Race Male 45-54 2000"
f1156190 ="Pop Other Male 45-54 1990"
f1156200 ="Pop Some Other Race Fmle 45-54 2000"
f1156290 ="Pop Other Fmle 45-54 1990"
f1156300 ="Pop Some Other Race Male 55-59 2000"
f1156390 ="Pop Other Male 55-59 1990"
f1156400 ="Pop Some Other Race Fmle 55-59 2000"
f1156490 ="Pop Other Fmle 55-59 1990"
f1156500 ="Pop Some Other Race Male 60-64 2000"
f1156590 ="Pop Other Male 60-64 1990"
f1156600 ="Pop Some Other Race Fmle 60-64 2000"
f1156690 ="Pop Other Fmle 60-64 1990"
f1156700 ="Pop Some Other Race Male 65-74 2000"
f1156790 ="Pop Other Male 65-74 1990"
f1156800 ="Pop Some Other Race Fmle 65-74 2000"
f1156890 ="Pop Other Fmle 65-74 1990"
f1156900 ="Pop Some Other Race Male 75-84 2000"
f1156990 ="Pop Other Male 75-84 1990"
f1157000 ="Pop Some Other Race Fmle 75-84 2000"
f1157090 ="Pop Other Fmle 75-84 1990"
f1165200 ="Pop Some Other Race Male > 84 2000"
f1165290 ="Pop Other Male > 84 1990"
f1165300 ="Pop Some Other Race Fmle > 84 2000"
f1165390 ="Pop Other Fmle > 84 1990"
f1340000 ="Pop Two or more Races Male < 5 2000"
f1340100 ="Pop Two or more Races Fmle < 5 2000"
f1340200 ="Pop Two or more Races Male 5-9 2000"
f1340300 ="Pop Two or more Races Fmle 5-9 2000"
f1340400 ="Pop Two or more Race Male 10-14 2000"
f1340500 ="Pop Two or more Race Fmle 10-14 2000"
f1340600 ="Pop Two or more Race Male 15-19 2000"
f1340700 ="Pop Two or more Race Fmle 15-19 2000"
f1340800 ="Pop Two or more Race Male 20-24 2000"
f1340900 ="Pop Two or more Race Fmle 20-24 2000"
f1341000 ="Pop Two or more Race Male 25-29 2000"
f1341100 ="Pop Two or more Race Fmle 25-29 2000"
f1341200 ="Pop Two or more Race Male 30-34 2000"
f1341300 ="Pop Two or more Race Fmle 30-34 2000"
f1341400 ="Pop Two or more Race Male 35-44 2000"
f1341500 ="Pop Two or more Race Fmle 35-44 2000"
f1341600 ="Pop Two or more Race Male 45-54 2000"
f1341700 ="Pop Two or more Race Fmle 45-54 2000"
f1341800 ="Pop Two or more Race Male 55-59 2000"
f1341900 ="Pop Two or more Race Fmle 55-59 2000"
f1342000 ="Pop Two or more Race Male 60-64 2000"
f1342100 ="Pop Two or more Race Fmle 60-64 2000"
f1342200 ="Pop Two or more Race Male 65-74 2000"
f1342300 ="Pop Two or more Race Fmle 65-74 2000"
f1342400 ="Pop Two or more Race Male 75-84 2000"
f1342500 ="Pop Two or more Race Fmle 75-84 2000"
f1342600 ="Pop Two or more Races Male > 84 2000"
f1342700 ="Pop Two or more Races Fmle > 84 2000"
f1342800 ="Pop White Non-Hisp Male < 5 2000"
f1342900 ="Pop White Non-Hisp Fmle < 5 2000"
f1343000 ="Pop White Non-Hisp Male 5-9 2000"
f1343100 ="Pop White Non-Hisp Fmle 5-9 2000"
f1343200 ="Pop White Non-Hisp Male 10-14 2000"
f1343300 ="Pop White Non-Hisp Fmle 10-14 2000"
f1343400 ="Pop White Non-Hisp Male 15-19 2000"
f1343500 ="Pop White Non-Hisp Fmle 15-19 2000"
f1343600 ="Pop White Non-Hisp Male 20-24 2000"
f1343700 ="Pop White Non-Hisp Fmle 20-24 2000"
f1343800 ="Pop White Non-Hisp Male 25-29 2000"
f1343900 ="Pop White Non-Hisp Fmle 25-29 2000"
f1344000 ="Pop White Non-Hisp Male 30-34 2000"
f1344100 ="Pop White Non-Hisp Fmle 30-34 2000"
f1344200 ="Pop White Non-Hisp Male 35-44 2000"
f1344300 ="Pop White Non-Hisp Fmle 35-44 2000"
f1344400 ="Pop White Non-Hisp Male 45-54 2000"
f1344500 ="Pop White Non-Hisp Fmle 45-54 2000"
f1344600 ="Pop White Non-Hisp Male 55-59 2000"
f1344700 ="Pop White Non-Hisp Fmle 55-59 2000"
f1344800 ="Pop White Non-Hisp Male 60-64 2000"
f1344900 ="Pop White Non-Hisp Fmle 60-64 2000"
f1345000 ="Pop White Non-Hisp Male 65-74 2000"
f1345100 ="Pop White Non-Hisp Fmle 65-74 2000"
f1345200 ="Pop White Non-Hisp Male 75-84 2000"
f1345300 ="Pop White Non-Hisp Fmle 75-84 2000"
f1345400 ="Pop White Non-Hisp Male > 84 2000"
f1345500 ="Pop White Non-Hisp Fmle > 84 2000"
f1157100 ="Pop Hispanic/Latino Male < 5 2000"
f1157190 ="Pop Hispanic Origin Male < 5 1990"
f1157200 ="Pop Hispanic/Latino Fmle < 5 2000"
f1157290 ="Pop Hispanic Origin Fmle < 5 1990"
f1157300 ="Pop Hispanic/Latino Male 5-9 2000"
f1157390 ="Pop Hispanic Origin Male 5-9 1990"
f1157400 ="Pop Hispanic/Latino Fmle 5-9 2000"
f1157490 ="Pop Hispanic Origin Fmle 5-9 1990"
f1157500 ="Pop Hispanic/Latino Male 10-14 2000"
f1157590 ="Pop Hispanic Origin Male 10-14 1990"
f1157600 ="Pop Hispanic/Latino Fmle 10-14 2000"
f1157690 ="Pop Hispanic Origin Fmle 10-14 1990"
f1157700 ="Pop Hispanic/Latino Male 15-19 2000"
f1157790 ="Pop Hispanic Origin Male 15-19 1990"
f1157800 ="Pop Hispanic/Latino Fmle 15-19 2000"
f1157890 ="Pop Hispanic Origin Fmle 15-19 1990"
f1157900 ="Pop Hispanic/Latino Male 20-24 2000"
f1157990 ="Pop Hispanic Origin Male 20-24 1990"
f1158000 ="Pop Hispanic/Latino Fmle 20-24 2000"
f1158090 ="Pop Hispanic Origin Fmle 20-24 1990"
f1158100 ="Pop Hispanic/Latino Male 25-29 2000"
f1158190 ="Pop Hispanic Origin Male 25-29 1990"
f1158200 ="Pop Hispanic/Latino Fmle 25-29 2000"
f1158290 ="Pop Hispanic Origin Fmle 25-29 1990"
f1158300 ="Pop Hispanic/Latino Male 30-34 2000"
f1158390 ="Pop Hispanic Origin Male 30-34 1990"
f1158400 ="Pop Hispanic/Latino Fmle 30-34 2000"
f1158490 ="Pop Hispanic Origin Fmle 30-34 1990"
f1158500 ="Pop Hispanic/Latino Male 35-44 2000"
f1158590 ="Pop Hispanic Origin Male 35-44 1990"
f1158600 ="Pop Hispanic/Latino Fmle 35-44 2000"
f1158690 ="Pop Hispanic Origin Fmle 35-44 1990"
f1158700 ="Pop Hispanic/Latino Male 45-54 2000"
f1158790 ="Pop Hispanic Origin Male 45-54 1990"
f1158800 ="Pop Hispanic/Latino Fmle 45-54 2000"
f1158890 ="Pop Hispanic Origin Fmle 45-54 1990"
f1158900 ="Pop Hispanic/Latino Male 55-59 2000"
f1158990 ="Pop Hispanic Origin Male 55-59 1990"
f1159000 ="Pop Hispanic/Latino Fmle 55-59 2000"
f1159090 ="Pop Hispanic Origin Fmle 55-59 1990"
f1159100 ="Pop Hispanic/Latino Male 60-64 2000"
f1159190 ="Pop Hispanic Origin Male 60-64 1990"
f1159200 ="Pop Hispanic/Latino Fmle 60-64 2000"
f1159290 ="Pop Hispanic Origin Fmle 60-64 1990"
f1159300 ="Pop Hispanic/Latino Male 65-74 2000"
f1159390 ="Pop Hispanic Origin Male 65-74 1990"
f1159400 ="Pop Hispanic/Latino Fmle 65-74 2000"
f1159490 ="Pop Hispanic Origin Fmle 65-74 1990"
f1159500 ="Pop Hispanic/Latino Male 75-84 2000"
f1159590 ="Pop Hispanic Origin Male 75-84 1990"
f1159600 ="Pop Hispanic/Latino Fmle 75-84 2000"
f1159690 ="Pop Hispanic Origin Fmle 75-84 1990"
f1165400 ="Pop Hispanic/Latino Male > 84 2000"
f1165490 ="Pop Hispanic Origin Male > 84 1990"
f1165500 ="Pop Hispanic/Latino Fmle > 84 2000"
f1165590 ="Pop Hispanic Origin Fmle > 84 1990"
f0874700 ="# Females Over 15 Yrs 2000"
f0874790 ="# Females Over 15 Yrs 1990"
f0874780 ="# Females Over 15 Yrs 1980"
f1408309 ="Population Estimate 65+ 2009"
f1408308 ="Population Estimate 65+ 2008"
f1408307 ="Population Estimate 65+ 2007"
f1408306 ="Population Estimate 65+ 2006"
f1408305 ="Population Estimate 65+ 2005"
f1408304 ="Population Estimate 65+ 2004"
f1408303 ="Population Estimate 65+ 2003"
f1214302 ="Population Estimate 65+ 2002"
f1214301 ="Population Estimate 65+ 2001"
f1214395 ="Population Estimate 65+ 1995"
f1348300 ="Median Age 2000"
f1348400 ="Median Age, Male 2000"
f1348500 ="Median Age, Female 2000"
f1348600 ="Median Age, White 2000"
f1348700 ="Median Age, White Male 2000"
f1348800 ="Median Age, White Female 2000"
f1348900 ="Median Age, Black/African Amer 2000"
f1349000 ="Median Age, Black/Afr Am Male 2000"
f1349100 ="Median Age, Black/Afr Am Female 2000"
f1349200 ="Median Age, Am Ind/Alaska Natve 2000"
f1349300 ="Median Age, Am Ind/Alaska Male 2000"
f1349400 ="Median Age, Am Ind/Alaska Fmale 2000"
f1349500 ="Median Age, Asian 2000"
f1349600 ="Median Age, Asian Male 2000"
f1349700 ="Median Age, Asian Female 2000"
f1349800 ="Median Age, Nat Hawaii/Oth PI 2000"
f1349900 ="Median Age, Nat Haw/Oth PI Male 2000"
f1350000 ="Median Age, Nat Haw/Oth PI Fmle 2000"
f1350100 ="Median Age, Other Race 2000"
f1350200 ="Median Age, Other Race Male 2000"
f1350300 ="Median Age, Other Race Fmle 2000"
f1350400 ="Median Age, Two or More Races 2000"
f1350500 ="Median Age, Two+ Races Male 2000"
f1350600 ="Median Age, Two+ Races Female 2000"
f1350700 ="Median Age, Hispanic/Latino 2000"
f1350800 ="Median Age, Hispanic/Lat Male 2000"
f1350900 ="Median Age, Hispanic/Lat Female 2000"
f1351000 ="Median Age, White Non-Hispanic 2000"
f1351100 ="Median Age, White Non-Hisp Male 2000"
f1351200 ="Median Age, White Non-Hisp Fmle 2000"
f1345610 ="Percent Tot Population,One Race 2010"
f1345600 ="Percent Tot Population,One Race 2000"
f0453710 ="Percent White Population 2010"
f0453700 ="Percent White Population 2000"
f0453790 ="Percent White Population 1990"
f0453780 ="Percent White Population 1980"
f0453810 ="Percent Black/African Am Pop 2010"
f0453800 ="Percent Black/African Am Pop 2000"
f0453890 ="Percent Black Population 1990"
f0453880 ="Percent Black Population 1980"
f0453910 ="Percent Am Ind/Alaska Natve Pop 2010"
f0453900 ="Percent Am Ind/Alaska Natve Pop 2000"
f0453990 ="Percent Am Ind/Esk/Aleut Pop 1990"
f0453980 ="Percent Am Ind/Esk/Aleut Pop 1980"
f1345710 ="Percent Asian Population 2010"
f1345700 ="Percent Asian Population 2000"
f1345810 ="Percent Nat Hawaii/Other PI Pop 2010"
f1345800 ="Percent Nat Hawaii/Other PI Pop 2000"
f0454090 ="Percent Asian/Pac Islnder Pop 1990"
f0454080 ="Percent Asian/Pac Islnder Pop 1980"
f0454110 ="Percent Some Other Population 2010"
f0454100 ="Percent Some Other Population 2000"
f0454190 ="Percent Other Population 1990"
f0454180 ="Percent Other Population 1980"
f1345910 ="Percent Two or more Race Pop 2010"
f1345900 ="Percent Two or more Race Pop 2000"
f0454210 ="Percent Hispanic/Latino Pop 2010"
f0454200 ="Percent Hispanic/Latino Pop 2000"
f0454290 ="Percent Hispanic Origin Pop 1990"
f0454280 ="Percent Spanish Descent Pop 1980"
f1463810 ="Percent Non-Hispanic/Latino Pop 2010"
f1463910 ="Pct White Non-Hisp/Latino Pop 2010"
f1464010 ="Pc Bl/Afr Am Non-Hisp/Lat Pop 2010"
f1465610 ="Pct Am Ind/Alska Nat NonHsp Pop 2010"
f1465710 ="Percent Asian Non-Hispanic Pop 2010"
f1465810 ="Pct Nat Hawai/Oth PI NonHsp Pop 2010"
f1465910 ="Pct Some Other Non-Hispanic Pop 2010"
f1466010 ="Percent Two+ Race Non-Hisp Pop 2010"
f1332510 ="Total Population, One Race 2010"
f1332500 ="Total Population, One Race 2000"
f0453110 ="White Population 2010"
f0453100 ="White Population 2000"
f0453190 ="White Population 1990"
f0453180 ="White Population 1980"
f0453210 ="Black/African American Pop 2010"
f0453200 ="Black/African American Pop 2000"
f0453290 ="Black Population 1990"
f0453280 ="Black Population 1980"
f0453310 ="Am Indian/Alaska Native Pop 2010"
f0453300 ="Am Indian/Alaska Native Pop 2000"
f0453390 ="Am Ind/Esk/Aleut Population 1990"
f0453380 ="Am Ind/Esk/Aleut Population 1980"
f1332610 ="Asian Population 2010"
f1332600 ="Asian Population 2000"
f1332710 ="Native Hawaii/Oth Pac Isl Pop 2010"
f1332700 ="Native Hawaii/Oth Pac Isl Pop 2000"
f0453490 ="Asian/Pac Islander Population 1990"
f0453480 ="Asian/Pac Islander Population 1980"
f0453510 ="Some Other Race Population 2010"
f0453500 ="Some Other Race Population 2000"
f0453590 ="Other Population 1990"
f0453580 ="Other Population 1980"
f1332810 ="Two or more Races Population 2010"
f1332800 ="Two or more Races Population 2000"
f0453610 ="Hispanic/Latino Population 2010"
f0453600 ="Hispanic/Latino Population 2000"
f0453690 ="Hispanic Origin Population 1990"
f0453680 ="Spanish Descent Population 1980"
f1358700 ="Hisp/Latin Origin-Mexican Pop 2000"
f1163690 ="Hispanic Origin-Mexican Pop 1990"
f1358800 ="Hisp/Latin Orig-Puerto Ricn Pop 2000"
f1163790 ="Hispanic Origin-Puerto Ricn Pop 1990"
f1358900 ="Hisp/Latino Origin-Cuban Pop 2000"
f1163890 ="Hispanic Origin-Cuban Pop 1990"
f1359100 ="Hisp/Latin Orig-Centrl Amer Pop 2000"
f1359200 ="Hisp/Latin Orig-South Amer Pop 2000"
f1359300 ="Hisp/Latin Orig-Oth Hispanc Pop 2000"
f1163990 ="Hispanic Origin-Oth Hispanc Pop 1990"
f1463510 ="Non-Hispanic/Latino Population 2010"
f1463610 ="White Non-Hispanic Population 2010"
f1463710 ="Black/Afr Amer Non-Hisp Pop 2010"
f1465110 ="Am Ind/Alska Nat Non-Hisp Pop 2010"
f1465210 ="Asian Non-Hispanic Population 2010"
f1465310 ="Nat Hawaii/Oth PI Non-Hisp Pop 2010"
f1465410 ="Some Other Race Non-Hisp Pop 2010"
f1465510 ="Two or more Races Non-Hisp Pop 2010"
f1433505 ="Percent Foreign Born Pop 2005-09"
f1244300 ="Percent Foreign Born Pop 2000"
f1244390 ="Percent Foreign Born Pop 1990"
f1433605 ="Foreign Born Population 2005-09"
f1244400 ="Foreign Born Population 2000"
f1244490 ="Foreign Born Population 1990"
f1433705 ="# Non-Eng Speaking Persons 5-17 2005-09"
f1181000 ="# Non-Eng Speaking Persons 5-17 2000"
f1181090 ="# Non-Eng Speaking Persons 5-17 1990"
f1433805 ="# Non-Eng Speaking Persons 18+ 2005-09"
f0874900 ="# Non-Eng Speaking Persons 18+ 2000"
f0874990 ="# Non-Eng Speaking Persons 18+ 1990"
f0851600 ="Percent Urban Population 2000"
f0851690 ="Percent Urban Population 1990"
f0851680 ="Percent Urban Population 1980"
f1367600 ="Census Urban Population 2000"
f0851590 ="Census Urban Population (100's) 1990"
f0851580 ="Census Urban Population (100's) 1980"
f1367700 ="Census Urbanized Areas Pop 2000"
f1367800 ="Census Urban Clusters Pop 2000"
f1367900 ="Census Rural Population 2000"
f1244200 ="Rural Farm Population 2000"
f1244290 ="Rural Farm Population 1990"
f0975580 ="Rural Farm Population 1980"
f1368000 ="Rural Nonfarm Population 2000"
f1139610 ="Veteran Population Estimate 2010"
f1139609 ="Veteran Population Estimate 2009"
f1139608 ="Veteran Population Estimate 2008"
f1139607 ="Veteran Population Estimate 2007"
f1139606 ="Veteran Population Estimate 2006"
f1139605 ="Veteran Population Estimate 2005"
f1139600 ="Veteran Population Estimate 2000"
f1139695 ="Veteran Population Estimate 1995"
f1139690 ="Veteran Population 1990"
f1359410 ="Veteran Pop Estimate, Male 2010"
f1359409 ="Veteran Pop Estimate, Male 2009"
f1359408 ="Veteran Pop Estimate, Male 2008"
f1359407 ="Veteran Pop Estimate, Male 2007"
f1359400 ="Veteran Pop Estimate, Male 2000"
f1359510 ="Veteran Pop Estimate, Female 2010"
f1359509 ="Veteran Pop Estimate, Female 2009"
f1359508 ="Veteran Pop Estimate, Female 2008"
f1359507 ="Veteran Pop Estimate, Female 2007"
f1359500 ="Veteran Pop Estimate, Female 2000"
f1319109 ="# Eligible for Medicare 2009"
f1319108 ="# Eligible for Medicare 2008"
f1319105 ="# Eligible for Medicare 2005"
f1319100 ="# Eligible for Medicare 2000"
f1319209 ="# Medicare Advantage Enrollees 2009"
f1319208 ="# Medicare Advantage Enrollees 2008"
f1319205 ="# Medicare Advantage Enrollees 2005"
f1319200 ="# Medicare Mangd Care Enrollees 2000"
f1319309 ="% Medcre Advantage Penetration 2009"
f1319308 ="% Medcre Advantage Penetration 2008"
f1319305 ="% Medcre Advantage Penetration 2005"
f1319300 ="% Medcre Mangd Care Penetration 2000"
f1420709 ="# Medicare Presc Drug Plan Enr 2009"
f1420708 ="# Medicare Presc Drug Plan Enr 2008"
f1420809 ="% Medcre Presc Drug Plan Penetr 2009"
f1420808 ="% Medcre Presc Drug Plan Penetr 2008"
f1324907 ="Medicare Enrollment, Aged Tot 2007"
f1324906 ="Medicare Enrollment, Aged Tot 2006"
f1324905 ="Medicare Enrollment, Aged Tot 2005"
f1324900 ="Medicare Enrollment, Aged Tot 2000"
f1325007 ="Medicare Enrollment, Aged HI 2007"
f1325006 ="Medicare Enrollment, Aged HI 2006"
f1325005 ="Medicare Enrollment, Aged HI 2005"
f1325000 ="Medicare Enrollment, Aged HI 2000"
f1325107 ="Medicare Enrollment, Aged SMI 2007"
f1325106 ="Medicare Enrollment, Aged SMI 2006"
f1325105 ="Medicare Enrollment, Aged SMI 2005"
f1325100 ="Medicare Enrollment, Aged SMI 2000"
f1332407 ="Medicre Enrollmnt, Disabled Tot 2007"
f1332406 ="Medicre Enrollmnt, Disabled Tot 2006"
f1332405 ="Medicre Enrollmnt, Disabled Tot 2005"
f1332400 ="Medicre Enrollmnt, Disabled Tot 2000"
f1325207 ="Medicre Enrollmnt, Disabled HI 2007"
f1325206 ="Medicre Enrollmnt, Disabled HI 2006"
f1325205 ="Medicre Enrollmnt, Disabled HI 2005"
f1325200 ="Medicre Enrollmnt, Disabled HI 2000"
f1325307 ="Medicre Enrollmnt, Disabled SMI 2007"
f1325306 ="Medicre Enrollmnt, Disabled SMI 2006"
f1325305 ="Medicre Enrollmnt, Disabled SMI 2005"
f1325300 ="Medicre Enrollmnt, Disabled SMI 2000"
f1325407 ="Mdcre Enrllmnt, Agd & Dsbld Tot 2007"
f1325406 ="Mdcre Enrllmnt, Agd & Dsbld Tot 2006"
f1325405 ="Mdcre Enrllmnt, Agd & Dsbld Tot 2005"
f1325400 ="Mdcre Enrllmnt, Agd & Dsbld Tot 2000"
f1325507 ="Mdcre Enrllmnt, Agd & Dsbld HI 2007"
f1325506 ="Mdcre Enrllmnt, Agd & Dsbld HI 2006"
f1325505 ="Mdcre Enrllmnt, Agd & Dsbld HI 2005"
f1325500 ="Mdcre Enrllmnt, Agd & Dsbld HI 2000"
f1325607 ="Mdcre Enrllmnt, Agd & Dsbld SMI 2007"
f1325606 ="Mdcre Enrllmnt, Agd & Dsbld SMI 2006"
f1325605 ="Mdcre Enrllmnt, Agd & Dsbld SMI 2005"
f1325600 ="Mdcre Enrllmnt, Agd & Dsbld SMI 2000"
f1419607 ="Medicaid Eligibles, Total 2007"
f1419606 ="Medicaid Eligibles, Total 2006"
f1419605 ="Medicaid Eligibles, Total 2005"
f1419604 ="Medicaid Eligibles, Total 2004"
f1419707 ="Medicaid Eligibles, Male 2007"
f1419706 ="Medicaid Eligibles, Male 2006"
f1419705 ="Medicaid Eligibles, Male 2005"
f1419704 ="Medicaid Eligibles, Male 2004"
f1419807 ="Medicaid Eligibles, Females 2007"
f1419806 ="Medicaid Eligibles, Females 2006"
f1419805 ="Medicaid Eligibles, Females 2005"
f1419804 ="Medicaid Eligibles, Females 2004"
f1419907 ="Medicaid Eligibles < 21 2007"
f1419906 ="Medicaid Eligibles < 21 2006"
f1419905 ="Medicaid Eligibles < 21 2005"
f1419904 ="Medicaid Eligibles < 21 2004"
f1420007 ="Medicaid Eligibles 21-64 2007"
f1420006 ="Medicaid Eligibles 21-64 2006"
f1420005 ="Medicaid Eligibles 21-64 2005"
f1420004 ="Medicaid Eligibles 21-64 2004"
f1420107 ="Medicaid Eligibles 65+ 2007"
f1420106 ="Medicaid Eligibles 65+ 2006"
f1420105 ="Medicaid Eligibles 65+ 2005"
f1420104 ="Medicaid Eligibles 65+ 2004"
f1420207 ="Medicaid Eligibles, Children 2007"
f1420206 ="Medicaid Eligibles, Children 2006"
f1420205 ="Medicaid Eligibles, Children 2005"
f1420204 ="Medicaid Eligibles, Children 2004"
f1420307 ="Medicaid Eligibles, Adults 2007"
f1420306 ="Medicaid Eligibles, Adults 2006"
f1420305 ="Medicaid Eligibles, Adults 2005"
f1420304 ="Medicaid Eligibles, Adults 2004"
f1420407 ="Medicaid Eligibles, Aged 2007"
f1420406 ="Medicaid Eligibles, Aged 2006"
f1420405 ="Medicaid Eligibles, Aged 2005"
f1420404 ="Medicaid Eligibles, Aged 2004"
f1420507 ="Medicaid Elig, Blind/Disabled 2007"
f1420506 ="Medicaid Elig, Blind/Disabled 2006"
f1420505 ="Medicaid Elig, Blind/Disabled 2005"
f1420504 ="Medicaid Elig, Blind/Disabled 2004"
f1420607 ="Medicare/Medicaid Dually Elig 2007"
f1420606 ="Medicare/Medicaid Dually Elig 2006"
f1420605 ="Medicare/Medicaid Dually Elig 2005"
f1420604 ="Medicare/Medicaid Dually Elig 2004"
f0874500 ="Number Households 2000"
f0874590 ="Number Households 1990"
f0874580 ="Number Households 1980"
f1351300 ="Average Household Size 2000"
f0873800 ="# Households w/1 Persons 2000"
f0873890 ="# Households w/1 Persons 1990"
f0873900 ="# Households w/2 Persons 2000"
f0873990 ="# Households w/2 Persons 1990"
f0874000 ="# Households w/3 Persons 2000"
f0874090 ="# Households w/3 Persons 1990"
f0874100 ="# Households w/4 Persons 2000"
f0874190 ="# Households w/4 Persons 1990"
f0874200 ="# Households w/5 Persons 2000"
f0874290 ="# Households w/5 Persons 1990"
f0874300 ="# Households w/6 or more Person 2000"
f0874390 ="# Households w/6 or more Person 1990"
f1166100 ="# White Households 2000"
f1166190 ="# White Households 1990"
f1166200 ="# Black/Afican American Hsehlds 2000"
f1166290 ="# Black Households 1990"
f1166300 ="# Am Ind/Alaska Native Hsehlds 2000"
f1166390 ="# Am Ind/Eskimo/Aleut Hsehlds 1990"
f1346000 ="# Asian Households 2000"
f1346100 ="# Nat Hawaii/Oth Pac Isl HHlds 2000"
f1166490 ="# Asian/Pac Islander Hsehlds 1990"
f1166500 ="# Some Other Race Households 2000"
f1166590 ="# Other Race Households 1990"
f1346200 ="# Two or more Races Households 2000"
f1166600 ="# Hispanic/Latino Households 2000"
f1166690 ="# Hispanic Origin Households 1990"
f1346300 ="# White HHld w/Married-Cple Fam 2000"
f1346400 ="# Bl/AA HHld w/Married-Cple Fam 2000"
f1346500 ="#AmInd/Al Nat w/Married-Cpl Fam 2000"
f1346600 ="# Asian w/Married-Couple Fam 2000"
f1346700 ="#Nat Haw/Oth PI w/Marrd-Cpl Fam 2000"
f1346800 ="#Some Oth Rc HHlds w/Mar-Cp Fam 2000"
f1346900 ="#Two + Races HHlds w/Mar-Cp Fam 2000"
f1347000 ="# Hisp/Lat HHld w/Marrd-Cpl Fam 2000"
f1166790 ="# White HHlds w/Trad'l Families 1990"
f1166890 ="# Black HHlds w/Trad'l Families 1990"
f1166990 ="# AmInd/Esk/Alt w/Trad Families 1990"
f1167090 ="# Asian/PacIslr w/Trad Families 1990"
f1167190 ="# Other HHlds w/Trad'l Families 1990"
f1167290 ="# Hisp Org HHlds w/Trad Famlies 1990"
f1160300 ="# Single Parent Households 2000"
f1160390 ="# Single Parent Households 1990"
f1160400 ="# Single Parent Hseholds-White 2000"
f1160490 ="# Single Parent Hseholds-White 1990"
f1160500 ="# Single Parent Hseholds-Bl/AA 2000"
f1160590 ="# Single Parent Hseholds-Black 1990"
f1160600 ="# Single Parent HHlds-AmInd/Al 2000"
f1160690 ="# Single Parent Hseholds-AmInd 1990"
f1347100 ="# Single Parent Hseholds-Asian 2000"
f1347200 ="# Single Parent HHld-Haw/Oth PI 2000"
f1160790 ="# Single Parent HHld-Asian/PI 1990"
f1347300 ="# Single Parent HHld-Other Race 2000"
f1347400 ="# Single Parent HHld-Two+ Races 2000"
f1160800 ="# Single Parent HHld-Hisp/Latin 2000"
f1160890 ="# Single Parent Hseholds-Hisp 1990"
f1348000 ="Unmarried-Partner HHld,Diff Sex 2000"
f1348100 ="Unmarried-Partner HHlds, Male 2000"
f1348200 ="Unmarried-Partner HHlds, Female 2000"
f0524100 ="Population in Households 2000"
f0524190 ="# Persons In Households 1990"
f0524180 ="# Persons In Households 1980"
f1399909 ="Pop Estimate in Group Quarters 2009"
f1399908 ="Pop Estimate in Group Quarters 2008"
f1399907 ="Pop Estimate in Group Quarters 2007"
f1399906 ="Pop Estimate in Group Quarters 2006"
f1399905 ="Pop Estimate in Group Quarters 2005"
f0524200 ="Population in Group Quarters 2000"
f0524290 ="# Persons In Group Quarters 1990"
f0524280 ="# Persons In Group Quarters 1980"
f1165600 ="Pop in Correctional Institutns 2000"
f1165690 ="Pop in Correctional Institutns 1990"
f1165700 ="Pop in Nursing Homes 2000"
f1165790 ="Pop in Nursing Homes 1990"
f1347500 ="Pop in Hsp/Ward,Hspce,Hndcp Sch 2000"
f1347600 ="Pop in Mental(Psych) Hosp/Wards 2000"
f1165890 ="Pop in Mental Institutions 1990"
f1347700 ="Pop in Juvenile Institutions 2000"
f1165990 ="Pop in Juvenile Institutions 1990"
f1347800 ="Pop in Noninstitional Group Qtr 2000"
f1347900 ="Pop in Group Homes 2000"
f1166090 ="Pop in Other Institutions 1990"
f1148890 ="Pop-Homeless Shltrs/Street Locs 1990"
f0873700 ="Number Families 2000"
f0873790 ="Number Families 1990"
f0873780 ="Number Families 1980"
f1351400 ="Average Family Size 2000"
f0972600 ="Married-Couple Families 2000"
f0972690 ="Married-Couple Families 1990"
f0972680 ="Married-Couple Families 1980"
f0874600 ="% Families w/Female Head 2000"
f0874690 ="% Families w/Female Head 1990"
f0874680 ="% Families w/Female Head 1980"
f0874400 ="Number Families w/Female Head 2000"
f0874490 ="Number Families w/Female Head 1990"
f0874480 ="Number Families w/Female Head 1980"
f1255708 ="Total Births 2008"
f1255707 ="Total Births 2007"
f1255706 ="Total Births 2006"
f1255705 ="Total Births 2005"
f1255700 ="Total Births 2000"
f1254604 ="3-Yr Total Births 2004-06"
f1254603 ="3-Yr Total Births 2003-05"
f1254698 ="3-Yr Total Births 1998-00"
f1360104 ="3-Yr White Births 2004-06"
f1360103 ="3-Yr White Births 2003-05"
f1360198 ="3-Yr White Births 1998-00"
f1360204 ="3-Yr Black Births 2004-06"
f1360203 ="3-Yr Black Births 2003-05"
f1360298 ="3-Yr Black Births 1998-00"
f1360304 ="3-Yr Other Births 2004-06"
f1360303 ="3-Yr Other Births 2003-05"
f1360398 ="3-Yr Other Births 1998-00"
f1360404 ="3-Yr Hispanic Births 2004-06"
f1360403 ="3-Yr Hispanic Births 2003-05"
f1360498 ="3-Yr Hispanic Births 1998-00"
f1254704 ="3-Yr White Male Births 2004-06"
f1254703 ="3-Yr White Male Births 2003-05"
f1254798 ="3-Yr White Male Births 1998-00"
f1254804 ="3-Yr White Female Births 2004-06"
f1254803 ="3-Yr White Female Births 2003-05"
f1254898 ="3-Yr White Female Births 1998-00"
f1254904 ="3-Yr Black Male Births 2004-06"
f1254903 ="3-Yr Black Male Births 2003-05"
f1254998 ="3-Yr Black Male Births 1998-00"
f1255004 ="3-Yr Black Female Births 2004-06"
f1255003 ="3-Yr Black Female Births 2003-05"
f1255098 ="3-Yr Black Female Births 1998-00"
f1255104 ="3-Yr Other Male Births 2004-06"
f1255103 ="3-Yr Other Male Births 2003-05"
f1255198 ="3-Yr Other Male Births 1998-00"
f1255204 ="3-Yr Other Female Births 2004-06"
f1255203 ="3-Yr Other Female Births 2003-05"
f1255298 ="3-Yr Other Female Births 1998-00"
f0961908 ="Total Births In ST Gen Hospitals 2008"
f0961907 ="Total Births In ST Gen Hospitals 2007"
f0961906 ="Total Births In ST Gen Hospitals 2006"
f0961905 ="Total Births In ST Gen Hospitals 2005"
f0961900 ="Total Births In ST Gen Hospitals 2000"
f1255304 ="3-Yr Tot Low Birth Weight Birth 2004-06"
f1255303 ="3-Yr Tot Low Birth Weight Birth 2003-05"
f1255398 ="3-Yr Tot Low Birth Weight Birth 1998-00"
f1360504 ="3-Yr Very Low Birth Wt Births 2004-06"
f1360503 ="3-Yr Very Low Birth Wt Births 2003-05"
f1360598 ="3-Yr Very Low Birth Wt Births 1998-00"
f1255404 ="3-Yr Wht Low Birth Weight Birth 2004-06"
f1255403 ="3-Yr Wht Low Birth Weight Birth 2003-05"
f1255498 ="3-Yr Wht Low Birth Weight Birth 1998-00"
f1255504 ="3-Yr Blk Low Birth Weight Birth 2004-06"
f1255503 ="3-Yr Blk Low Birth Weight Birth 2003-05"
f1255598 ="3-Yr Blk Low Birth Weight Birth 1998-00"
f1255604 ="3-Yr Oth Low Birth Weight Birth 2004-06"
f1255603 ="3-Yr Oth Low Birth Weight Birth 2003-05"
f1255698 ="3-Yr Oth Low Birth Weight Birth 1998-00"
f1360604 ="3-Yr Births to Teens < 18 yrs 2004-06"
f1360603 ="3-Yr Births to Teens < 18 yrs 2003-05"
f1360698 ="3-Yr Births to Teens < 18 yrs 1998-00"
f1387004 ="3-Yr Births to Unmarried Mother 2004-06"
f1387003 ="3-Yr Births to Unmarried Mother 2003-05"
f1387098 ="3-Yr Births to Unmarried Mother 1998-00"
f1360804 ="3-Yr Births - Preterm 2004-06"
f1360803 ="3-Yr Births - Preterm 2003-05"
f1360898 ="3-Yr Births - Preterm 1998-00"
f1361104 ="3-Yr Births - Vaginal Delivery 2004-06"
f1361103 ="3-Yr Births - Vaginal Delivery 2003-05"
f1361198 ="3-Yr Births - Vaginal Delivery 1998-00"
f1361204 ="3-Yr Births - C-Sect Delivery 2004-06"
f1361203 ="3-Yr Births - C-Sect Delivery 2003-05"
f1361298 ="3-Yr Births - C-Sect Delivery 1998-00"
f1266902 ="5-Yr Infant Mortality Rate-Tot 2002-06"
f1266901 ="5-Yr Infant Mortality Rate-Tot 2001-05"
f1266900 ="5-Yr Infant Mortality Rate-Tot 2000-04"
f1266999 ="5-Yr Infant Mortality Rate-Tot 1999-03"
f1266998 ="5-Yr Infant Mortality Rate-Tot 1998-02"
f1266997 ="5-Yr Infant Mortality Rate-Tot 1997-01"
f1266996 ="5-Yr Infant Mortality Rate-Tot 1996-00"
f1266995 ="5-Yr Infant Mortality Rate-Tot 1995-99"
f1266994 ="5-Yr Infant Mortality Rate-Tot 1994-98"
f1266993 ="5-Yr Infant Mortality Rate-Tot 1993-97"
f1266992 ="5-Yr Infant Mortality Rate-Tot 1992-96"
f1266991 ="5-Yr Infant Mortality Rate-Tot 1991-95"
f1266990 ="5-Yr Infant Mortality Rate-Tot 1990-94"
f1266989 ="5-Yr Infant Mortality Rate-Tot 1989-93"
f0849081 ="5-Yr Infant Mortality Rate-Tot 1981-85"
f1267002 ="5-Yr Infant Mortality Rate-Wh 2002-06"
f1267001 ="5-Yr Infant Mortality Rate-Wh 2001-05"
f1267000 ="5-Yr Infant Mortality Rate-Wh 2000-04"
f1267099 ="5-Yr Infant Mortality Rate-Wh 1999-03"
f1267098 ="5-Yr Infant Mortality Rate-Wh 1998-02"
f1267097 ="5-Yr Infant Mortality Rate-Wh 1997-01"
f1267096 ="5-Yr Infant Mortality Rate-Wh 1996-00"
f1267095 ="5-Yr Infant Mortality Rate-Wh 1995-99"
f1267094 ="5-Yr Infant Mortality Rate-Wh 1994-98"
f1267093 ="5-Yr Infant Mortality Rate-Wh 1993-97"
f1267092 ="5-Yr Infant Mortality Rate-Wh 1992-96"
f1267091 ="5-Yr Infant Mortality Rate-Wh 1991-95"
f1267090 ="5-Yr Infant Mortality Rate-Wh 1990-94"
f1267089 ="5-Yr Infant Mortality Rate-Wh 1989-93"
f0849181 ="5-Yr Infant Mortality Rate-Wh 1981-85"
f1267102 ="5-Yr Infant Mortal Rate-Nonwh 2002-06"
f1267101 ="5-Yr Infant Mortal Rate-Nonwh 2001-05"
f1267100 ="5-Yr Infant Mortal Rate-Nonwh 2000-04"
f1267199 ="5-Yr Infant Mortal Rate-Nonwh 1999-03"
f1267198 ="5-Yr Infant Mortal Rate-Nonwh 1998-02"
f1267197 ="5-Yr Infant Mortal Rate-Nonwh 1997-01"
f1267196 ="5-Yr Infant Mortal Rate-Nonwh 1996-00"
f1267195 ="5-Yr Infant Mortal Rate-Nonwh 1995-99"
f1267194 ="5-Yr Infant Mortal Rate-Nonwh 1994-98"
f1267193 ="5-Yr Infant Mortal Rate-Nonwh 1993-97"
f1267192 ="5-Yr Infant Mortal Rate-Nonwh 1992-96"
f1267191 ="5-Yr Infant Mortal Rate-Nonwh 1991-95"
f1267190 ="5-Yr Infant Mortal Rate-Nonwh 1990-94"
f1267189 ="5-Yr Infant Mortal Rate-Nonwh 1989-93"
f0849281 ="5-Yr Infant Mortal Rate-Nonwh 1981-85"
f1192404 ="3-Yr White Male Infant Deaths 2004-06"
f1192403 ="3-Yr White Male Infant Deaths 2003-05"
f1192498 ="3-Yr White Male Infant Deaths 1998-00"
f1192504 ="3-Yr White Fmle Infant Deaths 2004-06"
f1192503 ="3-Yr White Fmle Infant Deaths 2003-05"
f1192598 ="3-Yr White Fmle Infant Deaths 1998-00"
f1192604 ="3-Yr Black Male Infant Deaths 2004-06"
f1192603 ="3-Yr Black Male Infant Deaths 2003-05"
f1192698 ="3-Yr Black Male Infant Deaths 1998-00"
f1192704 ="3-Yr Black Fmle Infant Deaths 2004-06"
f1192703 ="3-Yr Black Fmle Infant Deaths 2003-05"
f1192798 ="3-Yr Black Fmle Infant Deaths 1998-00"
f1192804 ="3-Yr Other Male Infant Deaths 2004-06"
f1192803 ="3-Yr Other Male Infant Deaths 2003-05"
f1192898 ="3-Yr Other Male Infant Deaths 1998-00"
f1192904 ="3-Yr Other Fmle Infant Deaths 2004-06"
f1192903 ="3-Yr Other Fmle Infant Deaths 2003-05"
f1192998 ="3-Yr Other Fmle Infant Deaths 1998-00"
f1193004 ="3-Yr AIDS Deaths 2004-06"
f1193003 ="3-Yr AIDS Deaths 2003-05"
f1193098 ="3-Yr AIDS Deaths 1998-00"
f1193104 ="3-Yr Infectious & Para. Disease 2004-06"
f1193103 ="3-Yr Infectious & Para. Disease 2003-05"
f1193198 ="3-Yr Infectious & Para. Disease 1998-00"
f1193204 ="3-Yr Malignant Neoplasms 2004-06"
f1193203 ="3-Yr Malignant Neoplasms 2003-05"
f1193298 ="3-Yr Malignant Neoplasms 1998-00"
f1316404 ="3-Yr Cerebrovascular Disease 2004-06"
f1316403 ="3-Yr Cerebrovascular Disease 2003-05"
f1316498 ="3-Yr Cerebrovascular Disease 1998-00"
f1193304 ="3-Yr Ischemic Heart Disease 2004-06"
f1193303 ="3-Yr Ischemic Heart Disease 2003-05"
f1193398 ="3-Yr Ischemic Heart Disease 1998-00"
f1316504 ="3-Yr Other Cardiovas Disease 2004-06"
f1316503 ="3-Yr Other Cardiovas Disease 2003-05"
f1316598 ="3-Yr Other Cardiovas Disease 1998-00"
f1193504 ="3-Yr Influenza & Pneumonia 2004-06"
f1193503 ="3-Yr Influenza & Pneumonia 2003-05"
f1193598 ="3-Yr Influenza & Pneumonia 1998-00"
f1193604 ="3-Yr Chronic Lower Resp Dis 2004-06"
f1193603 ="3-Yr Chronic Lower Resp Dis 2003-05"
f1193698 ="3-Yr Chronic Lower Resp Dis 1998-00"
f1193704 ="3-Yr Chrnic Liver Dis & Cirrhosis 2004-06"
f1193703 ="3-Yr Chrnic Liver Dis & Cirrhosis 2003-05"
f1193798 ="3-Yr Chrnic Liver Dis & Cirrhosis 1998-00"
f1193804 ="3-Yr Motor Vehicle Accidents 2004-06"
f1193803 ="3-Yr Motor Vehicle Accidents 2003-05"
f1193898 ="3-Yr Motor Vehicle Accidents 1998-00"
f1316604 ="3-Yr Suicides 2004-06"
f1316603 ="3-Yr Suicides 2003-05"
f1316698 ="3-Yr Suicides 1998-00"
f1316704 ="3-Yr Homicides & Legal Interventn 2004-06"
f1316703 ="3-Yr Homicides & Legal Interventn 2003-05"
f1316798 ="3-Yr Homicides & Legal Interventn 1998-00"
f1316804 ="3-Yr Other External Causes 2004-06"
f1316803 ="3-Yr Other External Causes 2003-05"
f1316898 ="3-Yr Other External Causes 1998-00"
f1316904 ="3-Yr Diabetes 2004-06"
f1316903 ="3-Yr Diabetes 2003-05"
f1316998 ="3-Yr Diabetes 1998-00"
f1317004 ="3-Yr Deaths From Other Causes 2004-06"
f1317003 ="3-Yr Deaths From Other Causes 2003-05"
f1317098 ="3-Yr Deaths From Other Causes 1998-00"
f1255808 ="Total Deaths 2008"
f1255807 ="Total Deaths 2007"
f1255806 ="Total Deaths 2006"
f1255805 ="Total Deaths 2005"
f1255800 ="Total Deaths 2000"
f1194104 ="3-Yr Total Deaths 2004-06"
f1194103 ="3-Yr Total Deaths 2003-05"
f1194198 ="3-Yr Total Deaths 1998-00"
f1194204 ="3-Yr White Male Deaths 2004-06"
f1194203 ="3-Yr White Male Deaths 2003-05"
f1194298 ="3-Yr White Male Deaths 1998-00"
f1194304 ="3-Yr Black Male Deaths 2004-06"
f1194303 ="3-Yr Black Male Deaths 2003-05"
f1194398 ="3-Yr Black Male Deaths 1998-00"
f1194404 ="3-Yr Other Male Deaths 2004-06"
f1194403 ="3-Yr Other Male Deaths 2003-05"
f1194498 ="3-Yr Other Male Deaths 1998-00"
f1194504 ="3-Yr White Female Deaths 2004-06"
f1194503 ="3-Yr White Female Deaths 2003-05"
f1194598 ="3-Yr White Female Deaths 1998-00"
f1194604 ="3-Yr Black Female Deaths 2004-06"
f1194603 ="3-Yr Black Female Deaths 2003-05"
f1194698 ="3-Yr Black Female Deaths 1998-00"
f1194704 ="3-Yr Other Female Deaths 2004-06"
f1194703 ="3-Yr Other Female Deaths 2003-05"
f1194798 ="3-Yr Other Female Deaths 1998-00"
f1194804 ="3-Yr Mortality Age < 1 Year 2004-06"
f1194803 ="3-Yr Mortality Age < 1 Year 2003-05"
f1194898 ="3-Yr Mortality Age < 1 Year 1998-00"
f1194904 ="3-Yr Mortality Age 1-4 Years 2004-06"
f1194903 ="3-Yr Mortality Age 1-4 Years 2003-05"
f1194998 ="3-Yr Mortality Age 1-4 Years 1998-00"
f1195004 ="3-Yr Mortality Age 5-14 Years 2004-06"
f1195003 ="3-Yr Mortality Age 5-14 Years 2003-05"
f1195098 ="3-Yr Mortality Age 5-14 Years 1998-00"
f1195104 ="3-Yr Mortality Age 15-24 Years 2004-06"
f1195103 ="3-Yr Mortality Age 15-24 Years 2003-05"
f1195198 ="3-Yr Mortality Age 15-24 Years 1998-00"
f1195204 ="3-Yr Mortality Age 25-34 Years 2004-06"
f1195203 ="3-Yr Mortality Age 25-34 Years 2003-05"
f1195298 ="3-Yr Mortality Age 25-34 Years 1998-00"
f1195304 ="3-Yr Mortality Age 35-44 Years 2004-06"
f1195303 ="3-Yr Mortality Age 35-44 Years 2003-05"
f1195398 ="3-Yr Mortality Age 35-44 Years 1998-00"
f1195404 ="3-Yr Mortality Age 45-54 Years 2004-06"
f1195403 ="3-Yr Mortality Age 45-54 Years 2003-05"
f1195498 ="3-Yr Mortality Age 45-54 Years 1998-00"
f1195504 ="3-Yr Mortality Age 55-64 Years 2004-06"
f1195503 ="3-Yr Mortality Age 55-64 Years 2003-05"
f1195598 ="3-Yr Mortality Age 55-64 Years 1998-00"
f1195604 ="3-Yr Mortality Age 65-74 Years 2004-06"
f1195603 ="3-Yr Mortality Age 65-74 Years 2003-05"
f1195698 ="3-Yr Mortality Age 65-74 Years 1998-00"
f1195704 ="3-Yr Mortality Age 75-84 Years 2004-06"
f1195703 ="3-Yr Mortality Age 75-84 Years 2003-05"
f1195798 ="3-Yr Mortality Age 75-84 Years 1998-00"
f1195804 ="3-Yr Mortality Age 85+ Years 2004-06"
f1195803 ="3-Yr Mortality Age 85+ Years 2003-05"
f1195898 ="3-Yr Mortality Age 85+ Years 1998-00"
f1195904 ="3-Yr Mortality Age Unknown 2004-06"
f1195903 ="3-Yr Mortality Age Unknown 2003-05"
f1195998 ="3-Yr Mortality Age Unknown 1998-00"
f0978108 ="Per Capita Income 2008"
f0978107 ="Per Capita Income 2007"
f0978106 ="Per Capita Income 2006"
f0978105 ="Per Capita Income 2005"
f0978100 ="Per Capita Income 2000"
f0978195 ="Per Capita Income 1995"
f0978190 ="Per Capita Income 1990"
f0977808 ="Personal Inc (by res) (1000's) 2008"
f0977807 ="Personal Inc (by res) (1000's) 2007"
f0977806 ="Personal Inc (by res) (1000's) 2006"
f0977805 ="Personal Inc (by res) (1000's) 2005"
f0977800 ="Personal Inc (by res) (1000's) 2000"
f0977895 ="Personal Inc (by res) (1000's) 1995"
f0977890 ="Personal Inc (by res) (1000's) 1990"
f1433905 ="Household Income, Under $10000 2005-09"
f1366899 ="Household Income, Under $10000 1999"
f0859889 ="Household Income, Under $5000 1989"
f0859989 ="Household Income, $5000-9999 1989"
f1434005 ="Household Income, $10,000-14999 2005-09"
f0860099 ="Household Income, $10,000-14999 1999"
f0860089 ="Household Income, $10,000-14999 1989"
f1434105 ="Household Income, $15,000-24999 2005-09"
f0860199 ="Household Income, $15,000-24999 1999"
f0860189 ="Household Income, $15,000-24999 1989"
f1434205 ="Household Income, $25,000-49999 2005-09"
f0860299 ="Household Income, $25,000-49999 1999"
f0860289 ="Household Income, $25,000-49999 1989"
f1434305 ="Household Income, $50,000-99999 2005-09"
f1180399 ="Household Income, $50,000-99999 1999"
f1180389 ="Household Income, $50,000-99999 1989"
f1434405 ="Household Income, $100,000+ 2005-09"
f1180499 ="Household Income, $100,000+ 1999"
f1180489 ="Household Income, $100,000+ 1989"
f1434505 ="Median Household Income 2005-09"
f1245199 ="Median Household Income 1999"
f1245189 ="Median Household Income 1989"
f1322609 ="Median Household Income 2009"
f1322608 ="Median Household Income 2008"
f1322607 ="Median Household Income 2007"
f1322606 ="Median Household Income 2006"
f1322605 ="Median Household Income 2005"
f1322600 ="Median Household Income 2000"
f1322695 ="Median Household Income 1995"
f1434605 ="Median Family Income 2005-09"
f0859499 ="Median Family Income 1999"
f0859489 ="Median Family Income 1989"
f1434705 ="# Wh HHlds w/Income < $10,000 2005-09"
f1368199 ="# Wh HHlds w/Income < $10,000 1999"
f1181189 ="# Wh HHlds w/ Income < $5000 1989"
f1181289 ="# Wh HHlds w/Income $5000-9999 1989"
f1434805 ="# Wh HHlds Inc $10,000-14,999 2005-09"
f1181399 ="# Wh HHlds Inc $10,000-14,999 1999"
f1181389 ="# Wh HHlds Inc $10,000-14,999 1989"
f1434905 ="# Wh HHlds Inc $15,000-24,999 2005-09"
f1181499 ="# Wh HHlds Inc $15,000-24,999 1999"
f1181489 ="# Wh HHlds Inc $15,000-24,999 1989"
f1435005 ="# Wh HHlds Inc $25,000-49,999 2005-09"
f1181599 ="# Wh HHlds Inc $25,000-49,999 1999"
f1181589 ="# Wh HHlds Inc $25,000-49,999 1989"
f1435105 ="# Wh HHlds Inc $50,000-99,999 2005-09"
f1181699 ="# Wh HHlds Inc $50,000-99,999 1999"
f1181689 ="# Wh HHlds Inc $50,000-99,999 1989"
f1435205 ="# Wh HHlds Inc $100,000+ 2005-09"
f1181799 ="# Wh HHlds Inc $100,000+ 1999"
f1181789 ="# Wh HHlds Inc $100,000+ 1989"
f1435305 ="# Bl/AA HHld Income < $10,000 2005-09"
f1368299 ="# Bl/AA HHld Income < $10,000 1999"
f1181889 ="# Bl HHlds w/Income < $5000 1989"
f1181989 ="# Bl HHlds w/Income $5000-9999 1989"
f1435405 ="# Bl/AA HHld Inc $10,000-14,999 2005-09"
f1182099 ="# Bl/AA HHld Inc $10,000-14,999 1999"
f1182089 ="# Bl HHlds Inc $10,000-14,999 1989"
f1435505 ="# Bl/AA HHld Inc $15,000-24,999 2005-09"
f1182199 ="# Bl/AA HHld Inc $15,000-24,999 1999"
f1182189 ="# Bl HHlds Inc $15,000-24,999 1989"
f1435605 ="# Bl/AA HHld Inc $25,000-49,999 2005-09"
f1182299 ="# Bl/AA HHld Inc $25,000-49,999 1999"
f1182289 ="# Bl HHlds Inc $25,000-49,999 1989"
f1435705 ="# Bl/AA HHld Inc $50,000-99,999 2005-09"
f1182399 ="# Bl/AA HHld Inc $50,000-99,999 1999"
f1182389 ="# Bl HHlds Inc $50,000-99,999 1989"
f1435805 ="# Bl/AA HHld Income $100,000+ 2005-09"
f1182499 ="# Bl/AA HHld Income $100,000+ 1999"
f1182489 ="# Bl HHlds Inc $100,000+ 1989"
f1435905 ="# AIAN HHld Income < $10,000 2005-09"
f1368399 ="# AIAN HHld Income < $10,000 1999"
f1436005 ="#AIAN HHld Income$10,000-14,999 2005-09"
f1368499 ="#AIAN HHld Income$10,000-14,999 1999"
f1436105 ="#AIAN HHld Income$15,000-24,999 2005-09"
f1368599 ="#AIAN HHld Income$15,000-24,999 1999"
f1436205 ="#AIAN HHld Income$25,000-49,999 2005-09"
f1368699 ="#AIAN HHld Income$25,000-49,999 1999"
f1436305 ="#AIAN HHld Income$50,000-99,999 2005-09"
f1368799 ="#AIAN HHld Income$50,000-99,999 1999"
f1436405 ="# AIAN HHld Income $100,000+ 2005-09"
f1368899 ="# AIAN HHld Income $100,000+ 1999"
f1436505 ="# Asian HHld Income < $10,000 2005-09"
f1368999 ="# Asian HHld Income < $10,000 1999"
f1436605 ="# Asian HHld Inc $10,000-14,999 2005-09"
f1369099 ="# Asian HHld Inc $10,000-14,999 1999"
f1436705 ="# Asian HHld Inc $15,000-24,999 2005-09"
f1369199 ="# Asian HHld Inc $15,000-24,999 1999"
f1436805 ="# Asian HHld Inc $25,000-49,999 2005-09"
f1369299 ="# Asian HHld Inc $25,000-49,999 1999"
f1436905 ="# Asian HHld Inc $50,000-99,999 2005-09"
f1369399 ="# Asian HHld Inc $50,000-99,999 1999"
f1437005 ="# Asian HHld Income $100,000+ 2005-09"
f1369499 ="# Asian HHld Income $100,000+ 1999"
f1437105 ="# NHPI HHld Income < $10,000 2005-09"
f1369599 ="# NHPI HHld Income < $10,000 1999"
f1437205 ="# NHPI HHld Inc $10,000-14,999 2005-09"
f1369699 ="# NHPI HHld Inc $10,000-14,999 1999"
f1437305 ="# NHPI HHld Inc $15,000-24,999 2005-09"
f1369799 ="# NHPI HHld Inc $15,000-24,999 1999"
f1437405 ="# NHPI HHld Inc $25,000-49,999 2005-09"
f1369899 ="# NHPI HHld Inc $25,000-49,999 1999"
f1437505 ="# NHPI HHld Inc $50,000-99,999 2005-09"
f1369999 ="# NHPI HHld Inc $50,000-99,999 1999"
f1437605 ="# NHPI HHld Income $100,000+ 2005-09"
f1370099 ="# NHPI HHld Income $100,000+ 1999"
f1437705 ="# Oth Race HHld Inc < $10,000 2005-09"
f1380199 ="# Oth Race HHld Inc < $10,000 1999"
f1437805 ="#Oth Rce HHld Inc$10,000-14,999 2005-09"
f1380299 ="#Oth Rce HHld Inc$10,000-14,999 1999"
f1437905 ="#Oth Rce HHld Inc$15,000-24,999 2005-09"
f1380399 ="#Oth Rce HHld Inc$15,000-24,999 1999"
f1438005 ="#Oth Rce HHld Inc$25,000-49,999 2005-09"
f1380499 ="#Oth Rce HHld Inc$25,000-49,999 1999"
f1438105 ="#Oth Rce HHld Inc$50,000-99,999 2005-09"
f1380599 ="#Oth Rce HHld Inc$50,000-99,999 1999"
f1438205 ="#Oth Race HHld Income $100,000+ 2005-09"
f1380699 ="#Oth Race HHld Income $100,000+ 1999"
f1438305 ="#2+ Races HHld Income < $10,000 2005-09"
f1380799 ="#2+ Races HHld Income < $10,000 1999"
f1438405 ="#2+ Rce HHld Inc $10,000-14,999 2005-09"
f1380899 ="#2+ Rce HHld Inc $10,000-14,999 1999"
f1438505 ="#2+ Rce HHld Inc $15,000-24,999 2005-09"
f1380999 ="#2+ Rce HHld Inc $15,000-24,999 1999"
f1438605 ="#2+ Rce HHld Inc $25,000-49,999 2005-09"
f1381099 ="#2+ Rce HHld Inc $25,000-49,999 1999"
f1438705 ="#2+ Rce HHld Inc $50,000-99,999 2005-09"
f1381199 ="#2+ Rce HHld Inc $50,000-99,999 1999"
f1438805 ="#2+ Races HHld Income $100,000+ 2005-09"
f1381299 ="#2+ Races HHld Income $100,000+ 1999"
f1438905 ="# Hisp/Latino HHld Inc <$10,000 2005-09"
f1370199 ="# Hisp/Latino HHld Inc <$10,000 1999"
f1183289 ="# HO HHlds w/ Income < $5000 1989"
f1183389 ="# HO HHlds w/Income $5000-9999 1989"
f1439005 ="#Hsp/Lat HHld Inc$10,000-14,999 2005-09"
f1183499 ="#Hsp/Lat HHld Inc$10,000-14,999 1999"
f1183489 ="# HO HHlds Inc $10,000-14,999 1989"
f1439105 ="#Hsp/Lat HHld Inc$15,000-24,999 2005-09"
f1183599 ="#Hsp/Lat HHld Inc$15,000-24,999 1999"
f1183589 ="# HO HHlds Inc $15,000-24,999 1989"
f1439205 ="#Hsp/Lat HHld Inc$25,000-49,999 2005-09"
f1183699 ="#Hsp/Lat HHld Inc$25,000-49,999 1999"
f1183689 ="# HO HHlds Inc $25,000-49,999 1989"
f1439305 ="#Hsp/Lat HHld Inc$50,000-99,999 2005-09"
f1183799 ="#Hsp/Lat HHld Inc$50,000-99,999 1999"
f1183789 ="# HO HHlds Inc $50,000-99,999 1989"
f1439405 ="#Hisp/Latino HHld Inc $100,000+ 2005-09"
f1183899 ="#Hisp/Latino HHld Inc $100,000+ 1999"
f1183889 ="# HO HHlds Inc $100,000+ 1989"
f1439505 ="#Wh non/Hisp HHld Inc < $10,000 2005-09"
f1381399 ="#Wh non/Hisp HHld Inc < $10,000 1999"
f1439605 ="#Wh n/His HHd Inc$10,000-14,999 2005-09"
f1381499 ="#Wh n/His HHd Inc$10,000-14,999 1999"
f1439705 ="#Wh n/His HHd Inc$15,000-24,999 2005-09"
f1381599 ="#Wh n/His HHd Inc$15,000-24,999 1999"
f1439805 ="#Wh n/His HHd Inc$25,000-49,999 2005-09"
f1381699 ="#Wh n/His HHd Inc$25,000-49,999 1999"
f1439905 ="#Wh n/His HHd Inc$50,000-99,999 2005-09"
f1381799 ="#Wh n/His HHd Inc$50,000-99,999 1999"
f1440005 ="#Wh non/Hisp HHld Inc $100,000+ 2005-09"
f1381899 ="#Wh non/Hisp HHld Inc $100,000+ 1999"
f1182589 ="# NW HHlds w/Income < $5000 1989"
f1182689 ="# NW HHlds w/Income $5000-9999 1989"
f1182789 ="# NW HHlds Inc $10,000-14,999 1989"
f1182889 ="# NW HHlds Inc $15,000-24,999 1989"
f1182989 ="# NW HHlds Inc $25,000-49,999 1989"
f1183089 ="# NW HHlds Inc $50,000-99,999 1989"
f1183189 ="# NW HHlds Inc $100,000+ 1989"
f1440105 ="Ratio of Inc to Pov level < 0.5 2005-09"
f1389999 ="Ratio of Inc to Pov level < 0.5 1999"
f1440205 ="Ratio of Inc to Pov Lvl .5-.99 2005-09"
f1390099 ="Ratio of Inc to Pov Lvl .5-.99 1999"
f1440305 ="Rtio of Inc to Pov Lvl 1.0-1.24 2005-09"
f1390199 ="Rtio of Inc to Pov Lvl 1.0-1.24 1999"
f1440405 ="Rtio of Inc to Pov Lv 1.25-1.49 2005-09"
f1390299 ="Rtio of Inc to Pov Lv 1.25-1.49 1999"
f1440505 ="Rtio of Inc to Pov Lvl 1.5-1.84 2005-09"
f1390399 ="Rtio of Inc to Pov Lvl 1.5-1.74 1999"
f1440605 ="Rtio of Inc to Pov Lv 1.85-1.99 2005-09"
f1390499 ="Rtio of Inc to Pov Lv 1.75-1.99 1999"
f1440705 ="Ratio of Inc to Pov Level 2.0+ 2005-09"
f1390599 ="Ratio of Inc to Pov Level 2.0+ 1999"
f1322309 ="Persons in Poverty 2009"
f1322308 ="Persons in Poverty 2008"
f1322307 ="Persons in Poverty 2007"
f1322306 ="Persons in Poverty 2006"
f1322305 ="Persons in Poverty 2005"
f1322300 ="Persons in Poverty 2000"
f1322395 ="Persons in Poverty 1995"
f1332109 ="Percent Persons in Poverty 2009"
f1332108 ="Percent Persons in Poverty 2008"
f1332107 ="Percent Persons in Poverty 2007"
f1332106 ="Percent Persons in Poverty 2006"
f1332105 ="Percent Persons in Poverty 2005"
f1332100 ="Percent Persons in Poverty 2000"
f1322409 ="Persons Age 0-17 in Poverty 2009"
f1322408 ="Persons Age 0-17 in Poverty 2008"
f1322407 ="Persons Age 0-17 in Poverty 2007"
f1322406 ="Persons Age 0-17 in Poverty 2006"
f1322405 ="Persons Age 0-17 in Poverty 2005"
f1322400 ="Persons Age 0-17 in Poverty 2000"
f1322495 ="Persons Age 0-17 in Poverty 1995"
f1332209 ="Percent Persons Age 0-17 in Pov 2009"
f1332208 ="Percent Persons Age 0-17 in Pov 2008"
f1332207 ="Percent Persons Age 0-17 in Pov 2007"
f1332206 ="Percent Persons Age 0-17 in Pov 2006"
f1332205 ="Percent Persons Age 0-17 in Pov 2005"
f1332200 ="Percent Persons Age 0-17 in Pov 2000"
f1322509 ="Relat Chldrn 5-17 in Fam in Pov 2009"
f1322508 ="Relat Chldrn 5-17 in Fam in Pov 2008"
f1322507 ="Relat Chldrn 5-17 in Fam in Pov 2007"
f1322506 ="Relat Chldrn 5-17 in Fam in Pov 2006"
f1322505 ="Relat Chldrn 5-17 in Fam in Pov 2005"
f1322500 ="Relat Chldrn 5-17 in Fam in Pov 2000"
f1322595 ="Relat Chldrn 5-17 in Fam in Pov 1995"
f1332309 ="Pct Related Chldrn 5-17 in Pov 2009"
f1332308 ="Pct Related Chldrn 5-17 in Pov 2008"
f1332307 ="Pct Related Chldrn 5-17 in Pov 2007"
f1332306 ="Pct Related Chldrn 5-17 in Pov 2006"
f1332305 ="Pct Related Chldrn 5-17 in Pov 2005"
f1332300 ="Pct Related Chldrn 5-17 in Pov 2000"
f1440805 ="% Persons Below Poverty Level 2005-09"
f0860699 ="% Persons Below Poverty Level 1999"
f0860689 ="% Persons Below Poverty Level 1989"
f1440905 ="# Pers w/Pov Status Determined 2005-09"
f0883299 ="# Pers w/Pov Status Determined 1999"
f0883289 ="# Pers w/Pov Status Determined 1989"
f1441005 ="White w/Pov Status Determined 2005-09"
f0883499 ="White w/Pov Status Determined 1999"
f1441105 ="Black/Afr Am w/Pov Status Det 2005-09"
f1370299 ="Black/Afr Am w/Pov Status Det 1999"
f1441205 ="AIAN w/Pov Status Determined 2005-09"
f1370399 ="AIAN w/Pov Status Determined 1999"
f1441305 ="Asian w/Pov Status Determined 2005-09"
f1370499 ="Asian w/Pov Status Determined 1999"
f1441405 ="NHPI w/Pov Status Determined 2005-09"
f1370599 ="NHPI w/Pov Status Determined 1999"
f1441505 ="Some Oth Race w/Pov Status Det 2005-09"
f1381999 ="Some Oth Race w/Pov Status Det 1999"
f1441605 ="Two + Races w/Pov Status Det 2005-09"
f1382099 ="Two + Races w/Pov Status Det 1999"
f1441705 ="Hisp/Latino w/Pov Status Det 2005-09"
f1370699 ="Hisp/Latino w/Pov Status Det 1999"
f1441805 ="White non/Hisp w/Pov Status Det 2005-09"
f1382199 ="White non/Hisp w/Pov Status Det 1999"
f1441905 ="# Persons Below Poverty Level 2005-09"
f0883399 ="# Persons Below Poverty Level 1999"
f0883389 ="# Persons Below Poverty Level 1989"
f1442005 ="White Below Poverty Level 2005-09"
f0883599 ="White Below Poverty Level 1999"
f1442105 ="Black/Afr Am Below Poverty Lvl 2005-09"
f1370799 ="Black/Afr Am Below Poverty Lvl 1999"
f1442205 ="AIAN Below Poverty Level 2005-09"
f1370899 ="AIAN Below Poverty Level 1999"
f1442305 ="Asian Below Poverty Level 2005-09"
f1370999 ="Asian Below Poverty Level 1999"
f1442405 ="NHPI Below Poverty Level 2005-09"
f1371099 ="NHPI Below Poverty Level 1999"
f1442505 ="Some Oth Race Below Poverty Lvl 2005-09"
f1382299 ="Some Oth Race Below Poverty Lvl 1999"
f1442605 ="Two + Races Below Poverty Level 2005-09"
f1382399 ="Two + Races Below Poverty Level 1999"
f1442705 ="Hisp/Latino Below Poverty Level 2005-09"
f1371199 ="Hisp/Latino Below Poverty Level 1999"
f1442805 ="White non/Hisp Below Povrty Lvl 2005-09"
f1382499 ="White non/Hisp Below Povrty Lvl 1999"
f1442905 ="# Pers 65+ Below Poverty Level 2005-09"
f0883899 ="# Pers 65+ Below Poverty Level 1999"
f0883889 ="# Pers 65+ Below Poverty Level 1989"
f1443005 ="Related Child Below Poverty Lvl 2005-09"
f0975299 ="Related Child Below Poverty Lvl 1999"
f0975289 ="Related Child Below Poverty Lvl 1989"
f1443105 ="Relat Child w/Pov Status Determ 2005-09"
f0975399 ="Relat Child w/Pov Status Determ 1999"
f0975389 ="Relat Child w/Pov Status Determ 1989"
f1443205 ="% Families Below Poverty Level 2005-09"
f0860599 ="% Families Below Poverty Level 1999"
f0860589 ="% Families Below Poverty Level 1989"
f1443305 ="# Families Below Poverty Level 2005-09"
f0884899 ="# Families Below Poverty Level 1999"
f0884889 ="# Families Below Poverty Level 1989"
f1443405 ="# Fam w/Poverty Level Reported 2005-09"
f0884999 ="# Fam w/Poverty Level Reported 1999"
f0884989 ="# Fam w/Poverty Level Reported 1989"
f1443505 ="% Females Divorced 2005-09"
f0856300 ="% Females Divorced 2000"
f0856390 ="% Females Divorced 1990"
f0856380 ="% Females Divorced 1980"
f1443605 ="# Divorced Females 2005-09"
f0874800 ="# Divorced Females 2000"
f0874890 ="# Divorced Females 1990"
f0874880 ="# Divorced Females 1980"
f1408408 ="Food Stamp/SNAP Recipients 2008"
f1408407 ="Food Stamp/SNAP Recipients 2007"
f1408406 ="Food Stamp/SNAP Recipients 2006"
f1408405 ="Food Stamp/SNAP Recipients 2005"
f1408400 ="Food Stamp/SNAP Recipients 2000"
f1408495 ="Food Stamp/SNAP Recipients 1995"
f1474809 ="Persons <65 Yrs 2009"
f1474808 ="Persons <65 Yrs 2008"
f1415307 ="Persons <65 Yrs 2007"
f1415306 ="Persons <65 Yrs 2006"
f1474909 ="Pers <65 with Health Insurance 2009"
f1474908 ="Pers <65 with Health Insurance 2008"
f1415407 ="Pers <65 with Health Insurance 2007"
f1415406 ="Pers <65 with Health Insurance 2006"
f1475009 ="Pers <65 without Health Ins 2009"
f1475008 ="Pers <65 without Health Ins 2008"
f1415507 ="Pers <65 without Health Ins 2007"
f1415506 ="Pers <65 without Health Ins 2006"
f1475109 ="% <65 without Health Insurance 2009"
f1475108 ="% <65 without Health Insurance 2008"
f1415607 ="% <65 without Health Insurance 2007"
f1415606 ="% <65 without Health Insurance 2006"
f1475209 ="Males <65 Yrs 2009"
f1475208 ="Males <65 Yrs 2008"
f1415707 ="Males <65 Yrs 2007"
f1415706 ="Males <65 Yrs 2006"
f1475309 ="Males <65 with Health Insurance 2009"
f1475308 ="Males <65 with Health Insurance 2008"
f1415807 ="Males <65 with Health Insurance 2007"
f1415806 ="Males <65 with Health Insurance 2006"
f1475409 ="Males <65 without Health Ins 2009"
f1475408 ="Males <65 without Health Ins 2008"
f1415907 ="Males <65 without Health Ins 2007"
f1415906 ="Males <65 without Health Ins 2006"
f1475509 ="% Males <65 without Health Ins 2009"
f1475508 ="% Males <65 without Health Ins 2008"
f1416007 ="% Males <65 without Health Ins 2007"
f1416006 ="% Males <65 without Health Ins 2006"
f1475609 ="Females <65 Yrs 2009"
f1475608 ="Females <65 Yrs 2008"
f1416107 ="Females <65 Yrs 2007"
f1416106 ="Females <65 Yrs 2006"
f1475709 ="Females <65 with Health Ins 2009"
f1475708 ="Females <65 with Health Ins 2008"
f1416207 ="Females <65 with Health Ins 2007"
f1416206 ="Females <65 with Health Ins 2006"
f1475809 ="Females <65 without Health Ins 2009"
f1475808 ="Females <65 without Health Ins 2008"
f1416307 ="Females <65 without Health Ins 2007"
f1416306 ="Females <65 without Health Ins 2006"
f1475909 ="% Females <65 without Hlth Ins 2009"
f1475908 ="% Females <65 without Hlth Ins 2008"
f1416407 ="% Females <65 without Hlth Ins 2007"
f1416406 ="% Females <65 without Hlth Ins 2006"
f1476009 ="Persons 18-64 Yrs 2009"
f1476008 ="Persons 18-64 Yrs 2008"
f1416507 ="Persons 18-64 Yrs 2007"
f1416506 ="Persons 18-64 Yrs 2006"
f1476109 ="Pers 18-64 with Health Ins 2009"
f1476108 ="Pers 18-64 with Health Ins 2008"
f1416607 ="Pers 18-64 with Health Ins 2007"
f1416606 ="Pers 18-64 with Health Ins 2006"
f1476209 ="Pers 18-64 without Health Ins 2009"
f1476208 ="Pers 18-64 without Health Ins 2008"
f1416707 ="Pers 18-64 without Health Ins 2007"
f1416706 ="Pers 18-64 without Health Ins 2006"
f1476309 ="% 18-64 without Health Ins 2009"
f1476308 ="% 18-64 without Health Ins 2008"
f1416807 ="% 18-64 without Health Ins 2007"
f1416806 ="% 18-64 without Health Ins 2006"
f1476409 ="Males 18-64 Yrs 2009"
f1476408 ="Males 18-64 Yrs 2008"
f1416907 ="Males 18-64 Yrs 2007"
f1416906 ="Males 18-64 Yrs 2006"
f1476509 ="Males 18-64 with Health Ins 2009"
f1476508 ="Males 18-64 with Health Ins 2008"
f1417007 ="Males 18-64 with Health Ins 2007"
f1417006 ="Males 18-64 with Health Ins 2006"
f1476609 ="Males 18-64 without Health Ins 2009"
f1476608 ="Males 18-64 without Health Ins 2008"
f1417107 ="Males 18-64 without Health Ins 2007"
f1417106 ="Males 18-64 without Health Ins 2006"
f1476709 ="% Males 18-64 without Hlth Ins 2009"
f1476708 ="% Males 18-64 without Hlth Ins 2008"
f1417207 ="% Males 18-64 without Hlth Ins 2007"
f1417206 ="% Males 18-64 without Hlth Ins 2006"
f1476809 ="Females 18-64 Yrs 2009"
f1476808 ="Females 18-64 Yrs 2008"
f1417307 ="Females 18-64 Yrs 2007"
f1417306 ="Females 18-64 Yrs 2006"
f1476909 ="Females 18-64 with Health Ins 2009"
f1476908 ="Females 18-64 with Health Ins 2008"
f1417407 ="Females 18-64 with Health Ins 2007"
f1417406 ="Females 18-64 with Health Ins 2006"
f1477009 ="Females 18-64 without Hlth Ins 2009"
f1477008 ="Females 18-64 without Hlth Ins 2008"
f1417507 ="Females 18-64 without Hlth Ins 2007"
f1417506 ="Females 18-64 without Hlth Ins 2006"
f1477109 ="% Fmles 18-64 without Hlth Ins 2009"
f1477108 ="% Fmles 18-64 without Hlth Ins 2008"
f1417607 ="% Fmles 18-64 without Hlth Ins 2007"
f1417606 ="% Fmles 18-64 without Hlth Ins 2006"
f1477209 ="Persons 40-64 Yrs 2009"
f1477208 ="Persons 40-64 Yrs 2008"
f1417707 ="Persons 40-64 Yrs 2007"
f1417706 ="Persons 40-64 Yrs 2006"
f1477309 ="Pers 40-64 with Health Ins 2009"
f1477308 ="Pers 40-64 with Health Ins 2008"
f1417807 ="Pers 40-64 with Health Ins 2007"
f1417806 ="Pers 40-64 with Health Ins 2006"
f1477409 ="Pers 40-64 without Health Ins 2009"
f1477408 ="Pers 40-64 without Health Ins 2008"
f1417907 ="Pers 40-64 without Health Ins 2007"
f1417906 ="Pers 40-64 without Health Ins 2006"
f1477509 ="% 40-64 without Health Ins 2009"
f1477508 ="% 40-64 without Health Ins 2008"
f1418007 ="% 40-64 without Health Ins 2007"
f1418006 ="% 40-64 without Health Ins 2006"
f1477609 ="Males 40-64 Yrs 2009"
f1477608 ="Males 40-64 Yrs 2008"
f1418107 ="Males 40-64 Yrs 2007"
f1418106 ="Males 40-64 Yrs 2006"
f1477709 ="Males 40-64 with Health Ins 2009"
f1477708 ="Males 40-64 with Health Ins 2008"
f1418207 ="Males 40-64 with Health Ins 2007"
f1418206 ="Males 40-64 with Health Ins 2006"
f1477809 ="Males 40-64 without Health Ins 2009"
f1477808 ="Males 40-64 without Health Ins 2008"
f1418307 ="Males 40-64 without Health Ins 2007"
f1418306 ="Males 40-64 without Health Ins 2006"
f1477909 ="% Males 40-64 without Hlth Ins 2009"
f1477908 ="% Males 40-64 without Hlth Ins 2008"
f1418407 ="% Males 40-64 without Hlth Ins 2007"
f1418406 ="% Males 40-64 without Hlth Ins 2006"
f1478009 ="Females 40-64 Yrs 2009"
f1478008 ="Females 40-64 Yrs 2008"
f1418507 ="Females 40-64 Yrs 2007"
f1418506 ="Females 40-64 Yrs 2006"
f1478109 ="Females 40-64 with Health Ins 2009"
f1478108 ="Females 40-64 with Health Ins 2008"
f1418607 ="Females 40-64 with Health Ins 2007"
f1418606 ="Females 40-64 with Health Ins 2006"
f1478209 ="Females 40-64 without Hlth Ins 2009"
f1478208 ="Females 40-64 without Hlth Ins 2008"
f1418707 ="Females 40-64 without Hlth Ins 2007"
f1418706 ="Females 40-64 without Hlth Ins 2006"
f1478309 ="% Fmles 40-64 without Hlth Ins 2009"
f1478308 ="% Fmles 40-64 without Hlth Ins 2008"
f1418807 ="% Fmles 40-64 without Hlth Ins 2007"
f1418806 ="% Fmles 40-64 without Hlth Ins 2006"
f1478409 ="Persons <19 Yrs 2009"
f1478408 ="Persons <19 Yrs 2008"
f1418907 ="Persons <19 Yrs 2007"
f1418906 ="Persons <19 Yrs 2006"
f1478509 ="Pers <19 with Health Insurance 2009"
f1478508 ="Pers <19 with Health Insurance 2008"
f1423307 ="Pers <19 with Health Insurance 2007"
f1423306 ="Pers <19 with Health Insurance 2006"
f1478609 ="Pers <19 without Health Ins 2009"
f1478608 ="Pers <19 without Health Ins 2008"
f1423407 ="Pers <19 without Health Ins 2007"
f1423406 ="Pers <19 without Health Ins 2006"
f1478709 ="% <19 without Health Insurance 2009"
f1478708 ="% <19 without Health Insurance 2008"
f1423507 ="% <19 without Health Insurance 2007"
f1423506 ="% <19 without Health Insurance 2006"
f1406000 ="Persons with Health Insurance 2000"
f1406100 ="Person without Health Insurance 2000"
f1406200 ="% without Health Insurance 2000"
f1406300 ="Pers <18 with Health Insurance 2000"
f1406400 ="Pers <18 without Hlth Insurance 2000"
f1406500 ="% <18 without Health Insurance 2000"
f1443705 ="Hhlds w/Social Security Inc 2005-09"
f1389699 ="Hhlds w/Social Security Inc 1999"
f1443805 ="Hhlds w/Suppl Security Inc(SSI) 2005-09"
f1389799 ="Hhlds w/Suppl Security Inc(SSI) 1999"
f1443905 ="Hhlds w/Public Assistance Inc 2005-09"
f1389899 ="Hhlds w/Public Assistance Inc 1999"
f1244505 ="# Social Security Beneficiaries 2005"
f1244590 ="# Social Security Beneficiaries 1990"
f1433205 ="Social Security Benefic Rate 2005"
f1244690 ="Social Security Benefic Rate 1990"
f1244705 ="# Suppl Security Inc Recipients 2005"
f1244791 ="# Suppl Security Inc Recipients 1991"
f1444005 ="Persons 25+ Yrs 2005-09"
f0856700 ="Persons 25+ Yrs 2000"
f0856790 ="Persons 25+ Yrs 1990"
f1444105 ="Persons 25+ Yrs-White 2005-09"
f0856800 ="Persons 25+ Yrs-White 2000"
f0856890 ="Persons 25+ Yrs-White 1990"
f1444205 ="Persons 25+ Yrs-Black/Afr Am 2005-09"
f1371200 ="Persons 25+ Yrs-Black/Afr Am 2000"
f1444305 ="Persons 25+ Yrs-AIAN 2005-09"
f1371300 ="Persons 25+ Yrs-AIAN 2000"
f1444405 ="Persons 25+ Yrs-Asian 2005-09"
f1371400 ="Persons 25+ Yrs-Asian 2000"
f1444505 ="Persons 25+ Yrs-NHPI 2005-09"
f1371500 ="Persons 25+ Yrs-NHPI 2000"
f1444605 ="Persons 25+ Yrs-Some Other Race 2005-09"
f1382500 ="Persons 25+ Yrs-Some Other Race 2000"
f1444705 ="Persons 25+ Yrs-Two + Races 2005-09"
f1382600 ="Persons 25+ Yrs-Two + Races 2000"
f1444805 ="Persons 25+ Yrs-Hispanic/Latino 2005-09"
f1371600 ="Persons 25+ Yrs-Hispanic/Latino 2000"
f1444905 ="Persons 25+ Yrs-White non/Hisp 2005-09"
f1382700 ="Persons 25+ Yrs-White non/Hisp 2000"
f0856990 ="Persons 25+ Yrs-Nonwhite 1990"
f1445005 ="Persons 25+ Yrs w/<HS Diploma 2005-09"
f0856400 ="Persons 25+ Yrs w/<9 Yrs School 2000"
f0856490 ="Persons 25+ Yrs w/<9 Yrs School 1990"
f1445105 ="Persons 25+ w/HS Dipl or More 2005-09"
f0857000 ="Persons 25+ w/HS Dipl or More 2000"
f0857090 ="Persons 25+ w/HS Dipl or More 1990"
f1445205 ="Persons 25+ w/4+ Yrs College 2005-09"
f0857300 ="Persons 25+ w/4+ Yrs College 2000"
f0857390 ="Persons 25+ w/4+ Yrs College 1990"
f1445305 ="Pers 25+ w/<HS Diploma-White 2005-09"
f0856500 ="Pers 25+ w/<9 Yrs School-White 2000"
f0856590 ="Pers 25+ w/<9 Yrs School-White 1990"
f1445405 ="Pers 25+ w/<HS Diploma-Bl/AA 2005-09"
f1371700 ="Pers 25+ w/<9 Yrs School-Bl/AA 2000"
f1445505 ="Pers 25+ w/<HS Diploma-AIAN 2005-09"
f1371800 ="Pers 25+ w/<9 Yrs School-AIAN 2000"
f1445605 ="Pers 25+ w/<HS Diploma-Asian 2005-09"
f1371900 ="Pers 25+ w/<9 Yrs School-Asian 2000"
f1445705 ="Pers 25+ w/<HS Diploma-NHPI 2005-09"
f1372000 ="Pers 25+ w/<9 Yrs School-NHPI 2000"
f1445805 ="Pers 25+ w/<HS Diploma-Oth Race 2005-09"
f1382800 ="Pers 25+ w/<9 Yrs School-Oth Rc 2000"
f1445905 ="Pers 25+ w/<HS Diploma-2+ Races 2005-09"
f1382900 ="Pers 25+ w/<9 Yrs School-2+ Rce 2000"
f1446005 ="Pers 25+ w/<HS Diploma-Hisp/Lat 2005-09"
f1372100 ="Pers 25+ w/<9 Yrs School-Hisp/L 2000"
f1446105 ="Pers 25+ w/<HS Dipl-Wh non/Hisp 2005-09"
f1383000 ="Pers 25+ w/<9 Yrs Sch-Wh n/Hisp 2000"
f0856690 ="Pers 25+ w/<9 Yrs School-Nonwh 1990"
f1446205 ="Pers 25+ w/HS Dipl or more-Wh 2005-09"
f0857100 ="Pers 25+ w/HS Dipl or more-Wh 2000"
f0857190 ="Pers 25+ w/HS Dipl or more-Wh 1990"
f1446305 ="Pers 25+ w/HS Dipl/more-Bl/AA 2005-09"
f1372200 ="Pers 25+ w/HS Dipl/more-Bl/AA 2000"
f1446405 ="Pers 25+ w/HS Dipl or more-AIAN 2005-09"
f1372300 ="Pers 25+ w/HS Dipl or more-AIAN 2000"
f1446505 ="Pers 25+ w/HS Dipl or more-Asia 2005-09"
f1372400 ="Pers 25+ w/HS Dipl or more-Asia 2000"
f1446605 ="Pers 25+ w/HS Dipl or more-NHPI 2005-09"
f1372500 ="Pers 25+ w/HS Dipl or more-NHPI 2000"
f1446705 ="Pers 25+ w/HS Dipl/more-Oth Rce 2005-09"
f1383100 ="Pers 25+ w/HS Dipl/more-Oth Rce 2000"
f1446805 ="Pers 25+ w/HS Dipl/more-2+ Race 2005-09"
f1383200 ="Pers 25+ w/HS Dipl/more-2+ Race 2000"
f1446905 ="Pers 25+ w/HS Dipl/more-Hisp/L 2005-09"
f1372600 ="Pers 25+ w/HS Dipl/more-Hisp/L 2000"
f1447005 ="Per 25+ w/HS Dipl/more Wh n/His 2005-09"
f1383300 ="Per 25+ w/HS Dipl/more Wh n/His 2000"
f0857290 ="Per 25+ w/HS Dipl or more-Nonwh 1990"
f1447105 ="Pers 25+ w/4+ Yrs College-White 2005-09"
f0857400 ="Pers 25+ w/4+ Yrs College-White 2000"
f0857490 ="Pers 25+ w/4+ Yrs College-White 1990"
f1447205 ="Pers 25+ w/4+ Yrs College-Bl/AA 2005-09"
f1372700 ="Pers 25+ w/4+ Yrs College-Bl/AA 2000"
f1447305 ="Pers 25+ w/4+ Yrs College-AIAN 2005-09"
f1372800 ="Pers 25+ w/4+ Yrs College-AIAN 2000"
f1447405 ="Pers 25+ w/4+ Yrs College-Asia 2005-09"
f1372900 ="Pers 25+ w/4+ Yrs College-Asia 2000"
f1447505 ="Pers 25+ w/4+ Yrs College-NHPI 2005-09"
f1373000 ="Pers 25+ w/4+ Yrs College-NHPI 2000"
f1447605 ="Per 25+ w/4+ Yrs College-Oth Rc 2005-09"
f1383400 ="Per 25+ w/4+ Yrs College-Oth Rc 2000"
f1447705 ="Per 25+ w/4+ Yrs College-2+ Rce 2005-09"
f1383500 ="Per 25+ w/4+ Yrs College-2+ Rce 2000"
f1447805 ="Per 25+ w/4+ Yrs College-Hisp/L 2005-09"
f1373100 ="Per 25+ w/4+ Yrs College-Hisp/L 2000"
f1447905 ="Per 25+ w/4+ Yr Collge-Wh n/His 2005-09"
f1383600 ="Per 25+ w/4+ Yr Collge-Wh n/His 2000"
f0857590 ="Pers 25+ w/4+ Yrs College-Nonwh 1990"
f1448005 ="% Persons 25+ w/<HS Diploma 2005-09"
f0857600 ="% Persons 25+ w/<9 Yrs Sch 2000"
f0857690 ="% Persons 25+ w/<9 Yrs Sch 1990"
f1448105 ="% Persons 25+ w/HS Dipl or more 2005-09"
f0857900 ="% Persons 25+ w/HS Dipl or more 2000"
f0857990 ="% Persons 25+ w/HS Dipl or more 1990"
f1448205 ="% Persons 25+ w/4+ Yrs College 2005-09"
f0858200 ="% Persons 25+ w/4+ Yrs College 2000"
f0858290 ="% Persons 25+ w/4+ Yrs College 1990"
f1448305 ="% Pers 25+ w/<HS Diploma-White 2005-09"
f0857700 ="% Pers 25+ w/<9 Yrs Sch-White 2000"
f0857790 ="% Pers 25+ w/<9 Yrs Sch-White 1990"
f1448405 ="% Pers 25+ w/<HS Diploma-Bl/AA 2005-09"
f1373200 ="% Pers 25+ w/<9 Yrs Sch-Bl/AA 2000"
f1448505 ="% Pers 25+ w/<HS Diploma-AIAN 2005-09"
f1373300 ="% Pers 25+ w/<9 Yrs Sch-AIAN 2000"
f1448605 ="% Pers 25+ w/<HS Diploma-Asian 2005-09"
f1373400 ="% Pers 25+ w/<9 Yrs Sch-Asian 2000"
f1448705 ="% Pers 25+ w/<HS Diploma-NHPI 2005-09"
f1373500 ="% Pers 25+ w/<9 Yrs Sch-NHPI 2000"
f1448805 ="% Pers 25+ w/<HS Dipl-Oth Race 2005-09"
f1383700 ="% Per 25+ w/<9 Yrs Sch-Oth Race 2000"
f1448905 ="% Pers 25+ w/<HS Dipl-2+ Races 2005-09"
f1383800 ="% Per 25+ w/<9 Yrs Sch-2+ Races 2000"
f1449005 ="% Pers 25+ w/<HS Dipl-Hisp/Lat 2005-09"
f1373600 ="% Per 25+ w/<9 Yrs Sch-Hisp/Lat 2000"
f1449105 ="% Pers 25+ w/<HS Dipl-Wh n/Hisp 2005-09"
f1383900 ="% Per 25+ w/<9 Yrs Sch-Wh n/Hisp 2000"
f0857890 ="% Pers 25+ w/<9 Yrs Sch-Nonwh 1990"
f1449205 ="% Pers 25+ w/HS Dipl or more-Wh 2005-09"
f0858000 ="% Pers 25+ w/HS Dipl or more-Wh 2000"
f0858090 ="% Pers 25+ w/HS Dipl or more-Wh 1990"
f1449305 ="% Per 25+ w/HS Dip or more-Bl/AA 2005-09"
f1373700 ="% Per 25+ w/HS Dip or more-Bl/AA 2000"
f1449405 ="% Per 25+ w/HS Dipl or more-AIAN 2005-09"
f1373800 ="% Per 25+ w/HS Dipl or more-AIAN 2000"
f1449505 ="% Per 25+ w/HS Dip or more-Asian 2005-09"
f1373900 ="% Per 25+ w/HS Dip or more-Asian 2000"
f1449605 ="% Per 25+ w/HS Dipl or more-NHPI 2005-09"
f1374000 ="% Per 25+ w/HS Dipl or more-NHPI 2000"
f1449705 ="% Pers 25+ w/HS Dipl+ -Oth Race 2005-09"
f1384000 ="% Pers 25+ w/HS Dipl+ -Oth Race 2000"
f1449805 ="% Pers 25+ w/HS Dipl+ -2+ Races 2005-09"
f1384100 ="% Pers 25+ w/HS Dipl+ -2+ Races 2000"
f1449905 ="% Pers 25+ w/HS Dipl+ -Hisp/Lat 2005-09"
f1374100 ="% Pers 25+ w/HS Dipl+ -Hisp/Lat 2000"
f1450005 ="% Pers 25+ w/HS Dipl+ -Wh n/His 2005-09"
f1384200 ="% Pers 25+ w/HS Dipl+ -Wh n/His 2000"
f0858190 ="% Pers 25+ w/HS Dipl or more-NW 1990"
f1450105 ="% Pers 25+ w/4+ Yrs Coll-White 2005-09"
f0858300 ="% Pers 25+ w/4+ Yrs Coll-White 2000"
f0858390 ="% Pers 25+ w/4+ Yrs Coll-White 1990"
f1450205 ="% Pers 25+ w/4+ Yrs Coll-Bl/AA 2005-09"
f1374200 ="% Pers 25+ w/4+ Yrs Coll-Bl/AA 2000"
f1450305 ="% Pers 25+ w/4+ Yrs Coll-AIAN 2005-09"
f1374300 ="% Pers 25+ w/4+ Yrs Coll-AIAN 2000"
f1450405 ="% Pers 25+ w/4+ Yrs Coll-Asian 2005-09"
f1374400 ="% Pers 25+ w/4+ Yrs Coll-Asian 2000"
f1450505 ="% Pers 25+ w/4+ Yrs Coll-NHPI 2005-09"
f1374500 ="% Pers 25+ w/4+ Yrs Coll-NHPI 2000"
f1450605 ="% Per 25+ w/4+ Yrs Coll-Oth Race 2005-09"
f1384300 ="% Per 25+ w/4+ Yrs Coll-Oth Race 2000"
f1450705 ="% Per 25+ w/4+ Yrs Coll-2+ Races 2005-09"
f1384400 ="% Per 25+ w/4+ Yrs Coll-2+ Races 2000"
f1450805 ="% Per 25+ w/4+ Yrs Coll-Hisp/Lat 2005-09"
f1374600 ="% Per 25+ w/4+ Yrs Coll-Hisp/Lat 2000"
f1450905 ="% Per 25+ w/4+ Yrs Coll-WH n/His 2005-09"
f1384500 ="% Per 25+ w/4+ Yrs Coll-WH n/His 2000"
f0858490 ="% Pers 25+ w/4+ Yrs Coll-Nonwh 1990"
f1451005 ="Total Civilian Labor Force 2005-09"
f1387200 ="Total Civilian Labor Force 2000"
f1451105 ="Employed in Civil Labor Force 2005-09"
f1374700 ="Employed in Civil Labor Force 2000"
f1451205 ="Unemployed in Civil Labor Force 2005-09"
f0878400 ="Unemployed in Civil Labor Force 2000"
f0878490 ="Unemployed in Civil Labor Force 1990"
f1451305 ="Females in Civilian Labor Force 2005-09"
f1387300 ="Females in Civilian Labor Force 2000"
f1451405 ="Employed Fem in Civ Labor Force 2005-09"
f1374800 ="Employed Fem in Civ Labor Force 2000"
f1451505 ="Unemplyd Fem in Civ Labor Force 2005-09"
f1374900 ="Unemplyd Fem in Civ Labor Force 2000"
f1451605 ="White Civilian Labor Force 2005-09"
f1375000 ="White Civilian Labor Force 2000"
f1451705 ="Wh Employed Civilian Lab Force 2005-09"
f1375100 ="Wh Employed Civilian Lab Force 2000"
f1451805 ="Wh Unemplyd Civilian Lab Force 2005-09"
f1375200 ="Wh Unemplyd Civilian Lab Force 2000"
f1451905 ="Wh Female Civilian Labor Force 2005-09"
f1375300 ="Wh Female Civilian Labor Force 2000"
f1452005 ="Wh Employed Fmle Civ Lab Force 2005-09"
f1375400 ="Wh Employed Fmle Civ Lab Force 2000"
f1452105 ="Wh Unemplyd Fmle Civ Lab Force 2005-09"
f1375500 ="Wh Unemplyd Fmle Civ Lab Force 2000"
f1452205 ="Black/AA Civilian Labor Force 2005-09"
f1375600 ="Black/AA Civilian Labor Force 2000"
f1452305 ="Bl/AA Employed Civil Lab Force 2005-09"
f1375700 ="Bl/AA Employed Civil Lab Force 2000"
f1452405 ="Bl/AA Unemplyd Civil Lab Force 2005-09"
f1375800 ="Bl/AA Unemplyd Civil Lab Force 2000"
f1452505 ="Bl/AA Fmle Civilian Lab Force 2005-09"
f1375900 ="Bl/AA Fmle Civilian Lab Force 2000"
f1452605 ="Bl/AA Emplyd Fmle Civ Lab Force 2005-09"
f1376000 ="Bl/AA Emplyd Fmle Civ Lab Force 2000"
f1452705 ="Bl/AA Unmplyd Fmle Civ Lab Frce 2005-09"
f1376100 ="Bl/AA Unmplyd Fmle Civ Lab Frce 2000"
f1452805 ="AIAN Civilian Labor Force 2005-09"
f1376200 ="AIAN Civilian Labor Force 2000"
f1452905 ="AIAN Employed Civil Labor Force 2005-09"
f1376300 ="AIAN Employed Civil Labor Force 2000"
f1453005 ="AIAN Unemplyd Civil Labor Force 2005-09"
f1376400 ="AIAN Unemplyd Civil Labor Force 2000"
f1453105 ="AIAN Fmle Civilian Labor Force 2005-09"
f1376500 ="AIAN Fmle Civilian Labor Force 2000"
f1453205 ="AIAN Employd Fmle Civ Lab Force 2005-09"
f1376600 ="AIAN Employd Fmle Civ Lab Force 2000"
f1453305 ="AIAN Unmplyd Fmle Civ Lab Force 2005-09"
f1376700 ="AIAN Unmplyd Fmle Civ Lab Force 2000"
f1453405 ="Asian Civilian Labor Force 2005-09"
f1376800 ="Asian Civilian Labor Force 2000"
f1453505 ="Asian Employed Civil Lab Force 2005-09"
f1376900 ="Asian Employed Civil Lab Force 2000"
f1453605 ="Asian Unemplyd Civil Lab Force 2005-09"
f1377000 ="Asian Unemplyd Civil Lab Force 2000"
f1453705 ="Asian Fmle Civilian Lab Force 2005-09"
f1377100 ="Asian Fmle Civilian Lab Force 2000"
f1453805 ="Asian Emplyd Fmle Civ Lab Force 2005-09"
f1377200 ="Asian Emplyd Fmle Civ Lab Force 2000"
f1453905 ="Asian Unmplyd Fmle Civ Lab Frce 2005-09"
f1377300 ="Asian Unmplyd Fmle Civ Lab Frce 2000"
f1454005 ="NHPI Civilian Labor Force 2005-09"
f1377400 ="NHPI Civilian Labor Force 2000"
f1454105 ="NHPI Employed Civil Labor Force 2005-09"
f1377500 ="NHPI Employed Civil Labor Force 2000"
f1454205 ="NHPI Unemplyd Civil Labor Force 2005-09"
f1377600 ="NHPI Unemplyd Civil Labor Force 2000"
f1454305 ="NHPI Fmle Civilian Labor Force 2005-09"
f1377700 ="NHPI Fmle Civilian Labor Force 2000"
f1454405 ="NHPI Employd Fmle Civ Lab Force 2005-09"
f1377800 ="NHPI Employd Fmle Civ Lab Force 2000"
f1454505 ="NHPI Unmplyd Fmle Civ Lab Force 2005-09"
f1377900 ="NHPI Unmplyd Fmle Civ Lab Force 2000"
f1454605 ="Other Race Civilian Lab Force 2005-09"
f1384600 ="Other Race Civilian Lab Force 2000"
f1454705 ="Oth Race Emplyd Civil Lab Force 2005-09"
f1384700 ="Oth Race Emplyd Civil Lab Force 2000"
f1454805 ="Oth Race Unmplyd Civil Lab Frce 2005-09"
f1384800 ="Oth Race Unmplyd Civil Lab Frce 2000"
f1454905 ="Oth Race Fmle Civil Labor Force 2005-09"
f1384900 ="Oth Race Fmle Civil Labor Force 2000"
f1455005 ="Oth Rc Emplyd Fmle Civ Lab Frce 2005-09"
f1385000 ="Oth Rc Emplyd Fmle Civ Lab Frce 2000"
f1455105 ="Oth Rc Unmplyd Fml Civ Lab Frce 2005-09"
f1385100 ="Oth Rc Unmplyd Fml Civ Lab Frce 2000"
f1455205 ="2+ Races Civilian Labor Force 2005-09"
f1385200 ="2+ Races Civilian Labor Force 2000"
f1455305 ="2+ Race Employd Civil Lab Force 2005-09"
f1385300 ="2+ Race Employd Civil Lab Force 2000"
f1455405 ="2+ Race Unemplyd Civil Lab Frce 2005-09"
f1385400 ="2+ Race Unemplyd Civil Lab Frce 2000"
f1455505 ="2+ Race Fmle Civilian Lab Force 2005-09"
f1385500 ="2+ Race Fmle Civilian Lab Force 2000"
f1455605 ="2+ Race Emplyd Fml Civ Lab Frce 2005-09"
f1385600 ="2+ Race Emplyd Fml Civ Lab Frce 2000"
f1455705 ="2+ Race Unmplyd Fml Civ Lab Frc 2005-09"
f1385700 ="2+ Race Unmplyd Fml Civ Lab Frc 2000"
f1455805 ="Hisp/Latino Civil Labor Force 2005-09"
f1378000 ="Hisp/Latino Civil Labor Force 2000"
f1455905 ="Hisp Employed Civil Labor Force 2005-09"
f1378100 ="Hisp Employed Civil Labor Force 2000"
f1456005 ="Hisp Unemplyd Civil Labor Force 2005-09"
f1378200 ="Hisp Unemplyd Civil Labor Force 2000"
f1456105 ="Hisp/Lat Fmle Civil Labor Force 2005-09"
f1378300 ="Hisp/Lat Fmle Civil Labor Force 2000"
f1456205 ="Hisp Employd Fmle Civ Lab Force 2005-09"
f1378400 ="Hisp Employd Fmle Civ Lab Force 2000"
f1456305 ="Hisp Unmplyd Fmle Civ Lab Force 2005-09"
f1378500 ="Hisp Unmplyd Fmle Civ Lab Force 2000"
f1456405 ="Wh non/Hisp Civil Labor Force 2005-09"
f1385800 ="Wh non/Hisp Civil Labor Force 2000"
f1456505 ="Wh n/His Employed Civ Lab Force 2005-09"
f1385900 ="Wh n/His Employed Civ Lab Force 2000"
f1456605 ="Wh n/His Unemplyd Civ Lab Force 2005-09"
f1386000 ="Wh n/His Unemplyd Civ Lab Force 2000"
f1456705 ="Wh n/Hisp Fmle Civil Lab Force 2005-09"
f1386100 ="Wh n/Hisp Fmle Civil Lab Force 2000"
f1456805 ="Wh n/His Emplyd Fml Civ Lab Frc 2005-09"
f1386200 ="Wh n/His Emplyd Fml Civ Lab Frc 2000"
f1456905 ="Wh n/His Unmplyd Fml Civ Lab Fr 2005-09"
f1386300 ="Wh n/His Unmplyd Fml Civ Lab Fr 2000"
f1184690 ="# 16+ White Males Unemployed 1990"
f1184790 ="# 16+ White Females Unemployed 1990"
f1184890 ="# 16+ Black Males Unemployed 1990"
f1184990 ="# 16+ Black Females Unemployed 1990"
f1185090 ="# 16+ Nonwhite Males Unemployed 1990"
f1185190 ="# 16+ Nonwhite Females Unemplyd 1990"
f1185290 ="# 16+ Hisp Orig Males Unemployd 1990"
f1185390 ="# 16+ Hisp Orig Female Unemplyd 1990"
f1378699 ="# 16+ Pop Did Not Work in '99 1999"
f0878899 ="# 16+ Males Did Not Work in '99 1999"
f0878889 ="# 16+ Males Did Not Work in '89 1989"
f0878999 ="#16+ Fmales Did Not Work in '99 1999"
f0878989 ="#16+ Fmales Did Not Work in '89 1989"
f1457005 ="# Pop Did Not Work 16-64 2005-09"
f1457105 ="% Pop Did Not Work 16-64 2005-09"
f1378799 ="% 16+ Pop Did Not Work in '99 1999"
f1378899 ="% 16+ Males Did Not Work in '99 1999"
f1378999 ="% 16+ Fmales Did Not Work in '99 1999"
f1388599 ="White Males Did Not Work in '99 1999"
f1388699 ="White Fmles Did Not Work in '99 1999"
f1388799 ="BL/AA Males Did Not Work in '99 1999"
f1388899 ="BL/AA Fmals Did Not Work in '99 1999"
f1379099 ="AIAN Males Did Not Work in '99 1999"
f1379199 ="AIAN Fmles Did Not Work in '99 1999"
f1379299 ="Asian Males Did Not Work in '99 1999"
f1379399 ="Asian Fmles Did Not Work in '99 1999"
f1379499 ="NHPI Males Did Not Work in '99 1999"
f1379599 ="NHPI Fmles Did Not Work in '99 1999"
f1386499 ="Oth Rc Male Did Not Work in '99 1999"
f1386599 ="Oth Rc Fmle Did Not Work in '99 1999"
f1386699 ="2+ Rc Males Did Not Work in '99 1999"
f1386799 ="2+ Rc Fmles Did Not Work in '99 1999"
f1388999 ="Hisp Males Did Not Work in '99 1999"
f1389099 ="Hisp Fmles Did Not Work in '99 1999"
f1386899 ="WH n/His Male Did Not Wrk in'99 1999"
f1386999 ="WH n/His Fmle Did Not Wrk in'99 1999"
f1457205 ="# Workers 16 and Over 2005-09"
f0875800 ="# Workers 16 and Over 2000"
f0875890 ="# Workers 16 and Over 1990"
f1457305 ="# 16+ Workers Priv/Salaried 2005-09"
f0880200 ="# 16+ Workers Priv/Salaried 2000"
f0880290 ="# 16+ Workers Priv/Salaried 1990"
f1457405 ="# 16+ Workers Govt. 2005-09"
f1366900 ="# 16+ Workers Govt. 2000"
f1457505 ="# 16+ Workers Federal Govt. 2005-09"
f0880300 ="# 16+ Workers Federal Govt. 2000"
f0880390 ="# 16+ Workers Federal Govt. 1990"
f1457605 ="# 16+ Workers State Govt. 2005-09"
f0880400 ="# 16+ Workers State Govt. 2000"
f0880490 ="# 16+ Workers State Govt. 1990"
f1457705 ="# 16+ Workers Local Govt. 2005-09"
f0880500 ="# 16+ Workers Local Govt. 2000"
f0880590 ="# 16+ Workers Local Govt. 1990"
f1457805 ="# 16+ Workers Self-Employed 2005-09"
f0880600 ="# 16+ Workers Self-Employed 2000"
f0880690 ="# 16+ Workers Self-Employed 1990"
f1457905 ="# 16+ Unpaid Family Workers 2005-09"
f0880700 ="# 16+ Unpaid Family Workers 2000"
f0880790 ="# 16+ Unpaid Family Workers 1990"
f0679209 ="Civilian Labor Force, 16+ 2009"
f0679208 ="Civilian Labor Force, 16+ 2008"
f0679207 ="Civilian Labor Force, 16+ 2007"
f0679206 ="Civilian Labor Force, 16+ 2006"
f0679205 ="Civilian Labor Force, 16+ 2005"
f0679200 ="Civilian Labor Force, 16+ 2000"
f0679295 ="Civilian Labor Force, 16+ 1995"
f0679290 ="Civilian Labor Force, 16+ 1990"
f0679309 ="Number Employed, 16+ 2009"
f0679308 ="Number Employed, 16+ 2008"
f0679307 ="Number Employed, 16+ 2007"
f0679306 ="Number Employed, 16+ 2006"
f0679305 ="Number Employed, 16+ 2005"
f0679300 ="Number Employed, 16+ 2000"
f0679395 ="Number Employed, 16+ 1995"
f0679390 ="Number Employed, 16+ 1990"
f0679409 ="Number Unemployed, 16+ 2009"
f0679408 ="Number Unemployed, 16+ 2008"
f0679407 ="Number Unemployed, 16+ 2007"
f0679406 ="Number Unemployed, 16+ 2006"
f0679405 ="Number Unemployed, 16+ 2005"
f0679400 ="Number Unemployed, 16+ 2000"
f0679495 ="Number Unemployed, 16+ 1995"
f0679490 ="Number Unemployed, 16+ 1990"
f0679509 ="Unemployment Rate, 16+ 2009"
f0679508 ="Unemployment Rate, 16+ 2008"
f0679507 ="Unemployment Rate, 16+ 2007"
f0679506 ="Unemployment Rate, 16+ 2006"
f0679505 ="Unemployment Rate, 16+ 2005"
f0679500 ="Unemployment Rate, 16+ 2000"
f0679595 ="Unemployment Rate, 16+ 1995"
f0679590 ="Unemployment Rate, 16+ 1990"
f1458005 ="# Agr/Frst/Fish/Hunt/Mine Work 2005-09"
f1367000 ="# Agr/Frst/Fish/Hunt/Mine Work 2000"
f1184090 ="# Agric/Forestry/Fishiers Work 1990"
f1458105 ="# Construction Workers 2005-09"
f0879800 ="# Construction Workers 2000"
f0879890 ="# Construction Workers 1990"
f1458205 ="# Educ/HlthCare/Soc Assist Work 2005-09"
f1367100 ="# Health/Social Service Workers 2000"
f0879990 ="# Health Service Workers 1990"
f1458305 ="# Manufacturing Workers 2005-09"
f0858900 ="# Manufacturing Workers 2000"
f0858990 ="# Manufacturing Workers 1990"
f1458405 ="# Workers in Other Industries 2005-09"
f1462205 ="# Mangmt/Prof/Related Occ Wrker 2005-09"
f0859000 ="# White Collar Workers 2000"
f0859090 ="# White Collar Workers 1990"
f1462305 ="Community/Soc Serv Workers,male 2005-09"
f1462405 ="Community/Soc Serv Workers,fmle 2005-09"
f1462505 ="HlthDiag & Treat Prct/OthTch,male 2005-09"
f1462605 ="HlthDiag & Treat Prct/OthTch,fmle 2005-09"
f1462705 ="Health Technol/Technician,male 2005-09"
f1462805 ="Health Technol/Technician,fmle 2005-09"
f1462905 ="Healthcare Support Workers,male 2005-09"
f1463005 ="Healthcare Support Workers,fmle 2005-09"
f1462105 ="Percent Agr/Frst/Fish/Hunt/Mine 2005-09"
f1367200 ="Percent Agr/Frst/Fish/Hunt/Mine 2000"
f1184190 ="Percent Agric/Forestry/Fishiers 1990"
f1458505 ="Percent Construction 2005-09"
f0880000 ="Percent Construction 2000"
f0880090 ="Percent Construction 1990"
f1458605 ="Percent Educ/HlthCare/Soc Asst 2005-09"
f1367300 ="Percent Health/Social Services 2000"
f0880190 ="Percent Health Services 1990"
f1458705 ="Percent Manufacturing 2005-09"
f0859200 ="Percent Manufacturing 2000"
f0859290 ="Percent Manufacturing 1990"
f1458805 ="Percent Workers in Oth Industr 2005-09"
f0859300 ="Percent White Collar 2000"
f0859390 ="Percent White Collar 1990"
f1458905 ="# 16+ Workers,Drive Alone 2005-09"
f0876000 ="# 16+ Workers,Drive Alone 2000"
f0876090 ="# 16+ Workers,Drive Alone 1990"
f1459005 ="# 16+ Workers,Carpool 2005-09"
f0876100 ="# 16+ Workers,Carpool 2000"
f0876190 ="# 16+ Workers,Carpool 1990"
f1459105 ="# 16+ Workers,Public Trans 2005-09"
f0876200 ="# 16+ Workers,Public Trans 2000"
f0876290 ="# 16+ Workers,Public Trans 1990"
f1459205 ="# 16+ Workers,Walk to Work 2005-09"
f0876300 ="# 16+ Workers,Walk to Work 2000"
f0876390 ="# 16+ Workers,Walk to Work 1990"
f1459305 ="# 16+ Wrkrs,Other Means of Tran 2005-09"
f0876400 ="# 16+ Wrkrs,Other Means of Tran 2000"
f0876490 ="# 16+ Wrkrs,Other Means of Tran 1990"
f1459405 ="# 16+ Workers,Work at Home 2005-09"
f0876500 ="# 16+ Workers,Work at Home 2000"
f0876590 ="# 16+ Workers,Work at Home 1990"
f1459505 ="# 16+ Workers,Mean Travel Time 2005-09"
f1367400 ="# 16+ Workers,Mean Travel Time 2000"
f1459605 ="# 16+ Workers < 5 min to Work 2005-09"
f0876600 ="# 16+ Workers < 5 min to Work 2000"
f0876690 ="# 16+ Workers < 5 min to Work 1990"
f1459705 ="# 16+ Workers 5-9 min to Work 2005-09"
f0876700 ="# 16+ Workers 5-9 min to Work 2000"
f0876790 ="# 16+ Workers 5-9 min to Work 1990"
f1459805 ="# 16+ Workers 10-14 min to Work 2005-09"
f0876800 ="# 16+ Workers 10-14 min to Work 2000"
f0876890 ="# 16+ Workers 10-14 min to Work 1990"
f1459905 ="# 16+ Workers 15-19 min to Work 2005-09"
f0876900 ="# 16+ Workers 15-19 min to Work 2000"
f0876990 ="# 16+ Workers 15-19 min to Work 1990"
f1460005 ="# 16+ Workers 20-29 min to Work 2005-09"
f0877000 ="# 16+ Workers 20-29 min to Work 2000"
f0877090 ="# 16+ Workers 20-29 min to Work 1990"
f1460105 ="# 16+ Workers 30-44 min to Work 2005-09"
f0877100 ="# 16+ Workers 30-44 min to Work 2000"
f0877190 ="# 16+ Workers 30-44 min to Work 1990"
f1460205 ="# 16+ Workers 45-59 min to Work 2005-09"
f0877200 ="# 16+ Workers 45-59 min to Work 2000"
f0877290 ="# 16+ Workers 45-59 min to Work 1990"
f1460305 ="# 16+ Workers 60-89 min to Work 2005-09"
f1379600 ="# 16+ Workers 60-89 min to Work 2000"
f1460405 ="# 16+ Workers 90+ min to Work 2005-09"
f1379700 ="# 16+ Workers 90+ min to Work 2000"
f0877390 ="# 16+ Workers 60+ min to Work 1990"
f1379800 ="# 16+ Workers Worked at home 2000"
f0877400 ="# Employed w/Disability 2000"
f0877490 ="# Disabled in Labor Force 1990"
f0877500 ="# Not Employed w/Disability 2000"
f0877590 ="# Disab Prevented from Wrkng 1990"
f0877600 ="# Employed no/disability 2000"
f0877690 ="# Disab Not Wrkng/Not Preventd 1990"
f0877700 ="# Not employed/no disability 2000"
f0877790 ="# w/no Work Disability 1990"
f1389503 ="% Worker Commuting to Metro Area 2003"
f1460605 ="% Working State/County of Res 2005-09"
f0875500 ="% Working State/County of Res 2000"
f0875590 ="% Working State/County of Res 1990"
f1460705 ="% Working State/Not Cnty of Res 2005-09"
f0875600 ="% Working State/Not Cnty of Res 2000"
f0875690 ="% Working State/Not Cnty of Res 1990"
f1460805 ="% Working Outside State of Res 2005-09"
f0875700 ="% Working Outside State of Res 2000"
f0875790 ="% Working Outside State of Res 1990"
f1460905 ="# Working State/County of Resid 2005-09"
f0875100 ="# Working State/County of Resid 2000"
f0875190 ="# Working State/County of Resid 1990"
f1461005 ="# Working State/Not Cnty of Res 2005-09"
f0875200 ="# Working State/Not Cnty of Res 2000"
f0875290 ="# Working State/Not Cnty of Res 1990"
f1461105 ="# Working Outside State of Res 2005-09"
f0875300 ="# Working Outside State of Res 2000"
f0875390 ="# Working Outside State of Res 1990"
f1461205 ="# Reporting Place of Work 2005-09"
f0875400 ="# Reporting Place of Work 2000"
f0875490 ="# Reporting Place Of Work 1990"
f1463105 ="Live in Same Metro Area 1Yr Ago 2005-09"
f1463205 ="Live in Same Micro Area 1Yr Ago 2005-09"
f1185800 ="# Living in Same PMSA 95 & 00 2000"
f1185890 ="# Living In Same PMSA 85 & 90 1990"
f1463305 ="Work in PrinCity of MetroAr Res 2005-09"
f1463405 ="Work in PrinCity of MicroAr Res 2005-09"
f0875900 ="# Wrkng In Cent Cty Of PMSA Res 2000"
f0875990 ="# Wrkng In Cent Cty Of PMSA Res 1990"
f0884310 ="# Occupied Housing Units 2010"
f1467405 ="# Occupied Housing Units 2005-09"
f0884300 ="# Occupied Housing Units 2000"
f1167300 ="% Owner-Occupied Housing Units 2000"
f0974000 ="% Units W/More Than 1 Person/Rm 2000"
f1461305 ="Median Home Value 2005-09"
f0973800 ="Median Home Value 2000"
f1461405 ="Median Gross Rent 2005-09"
f0884500 ="Median Gross Rent 2000"
f1351510 ="Housing Units 2010"
f1351500 ="Housing Units 2000"
f1409109 ="Housing Units Estimates 2009"
f1409108 ="Housing Units Estimates 2008"
f1409107 ="Housing Units Estimates 2007"
f1409106 ="Housing Units Estimates 2006"
f1409105 ="Housing Units Estimates 2005"
f1409100 ="Housing Units Estimates 2000"
f1461505 ="# Occ Hous Unit w/no Fuel Used 2005-09"
f0884000 ="# Occ Hous Unit w/no Fuel Used 2000"
f1461605 ="# Occ Hous Unit w/Phone Service 2005-09"
f0884400 ="# Occ Hous Unit w/Telephone 2000"
f1461705 ="# Occ Hous Unit w/out Plumbing 2005-09"
f1324800 ="# Occ Hous Unit w/out Plumbing 2000"
f1461805 ="% Occ Hous Unit w/no Fuel Used 2005-09"
f0860900 ="% Occ Hous Unit w/no Fuel Used 2000"
f1461905 ="% Occ Hous Unit w/Phone Service 2005-09"
f0861100 ="% Occ Hous Unit w/Telephone 2000"
f1462005 ="% Occ Hous Unit w/out Plumbing 2005-09"
f1379900 ="% Occ Hous Unit w/out Plumbing 2000"
f1387410 ="Total Area in Square Miles 2010"
f1387400 ="Total Area in Square Miles 2000"
f0972110 ="Land Area in Square Miles 2010"
f0972100 ="Land Area in Square Miles 2000"
f1387510 ="Water Area in Square Miles 2010"
f1387500 ="Water Area in Square Miles 2000"
f1387610 ="Population Density per Sq Mile 2010"
f1387600 ="Population Density per Sq Mile 2000"
f1387710 ="Housing Unit Density per Sq Mle 2010"
f1387700 ="Housing Unit Density per Sq Mle 2000"
f0081176 ="Elevation Feet 1976"
;

run;

