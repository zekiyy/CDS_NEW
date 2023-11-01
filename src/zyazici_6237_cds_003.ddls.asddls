@AbapCatalog.sqlViewName: 'ZB_6236_V003'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Zekeriya YAZICI 3. Ödev'
define view ZYAZICI_6237_CDS_003 as select from zmbr_lesson_cds2
{
  vbeln,
  sum(conversion_netwr)                                                                           as toplam_net_deger,
  kunnrAd,
  count(*)                                                                                        as toplam_fatura_miktari,
  division(cast( sum(conversion_netwr) as abap.curr( 10, 3 ) ), cast( count(*) as abap.int1 ), 3) as ortalama_miktar,
  left(fkdat,4)                                                                                   as faturalama_yili,
  substring(fkdat,5,2)                                                                            as faturalama_ayi,
  substring(fkdat,7,2)                                                                            as faturalama_gunu,
  substring(inco2_l,1,3)                                                                          as incoterm_yeri,
  fkdat
}
group by
  vbeln,
  kunnrAd,
  fkdat,
  inco2_l
