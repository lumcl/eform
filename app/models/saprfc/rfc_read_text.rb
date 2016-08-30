class Saprfc::RfcReadText
  require 'java'
  java_import 'java.io.File'
  java_import 'java.io.FileOutputStream'
  java_import 'java.util.Properties'
  java_import 'com.sap.conn.jco.JCoDestination'
  java_import 'com.sap.conn.jco.JCoDestinationManager'
  java_import 'com.sap.conn.jco.ext.DestinationDataEventListener'
  java_import 'com.sap.conn.jco.ext.DestinationDataProvider'
  java_import 'com.sap.conn.jco.JCoContext'

  def self.shipping_mark(vbeln,posnr,tdid)
    #Saprfc::RfcReadText.shipping_mark('1400022699','000010','Z001')
    dest  = JCoDestinationManager.getDestination('sap_prd')
    repos = dest.getRepository
    function = repos.getFunction('RFC_READ_TEXT')
    text_lines = function.getTableParameterList.getTable('TEXT_LINES')
    text_lines.appendRow()
    text_lines.setValue('MANDT', '168')
    text_lines.setValue('TDOBJECT', 'VBBP')
    text_lines.setValue('TDNAME', "#{vbeln}#{posnr}")
    text_lines.setValue('TDID', tdid)
    text_lines.setValue('TDSPRAS', 'M')
    function.execute(dest)

    tdline = ''
    (1..text_lines.getNumRows).each do |i|
      tdline = "#{tdline}#{text_lines.getString('TDLINE')}\n"
      text_lines.nextRow
    end

    return tdline
  end

end