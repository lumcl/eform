class Saprfc::BapiSalesOrderChange
  require 'java'
  java_import 'java.io.File'
  java_import 'java.io.FileOutputStream'
  java_import 'java.util.Properties'
  java_import 'com.sap.conn.jco.JCoDestination'
  java_import 'com.sap.conn.jco.JCoDestinationManager'
  java_import 'com.sap.conn.jco.ext.DestinationDataEventListener'
  java_import 'com.sap.conn.jco.ext.DestinationDataProvider'
  java_import 'com.sap.conn.jco.JCoContext'

  def self.reason_code(vbeln, reason_code)
    dest = JCoDestinationManager.getDestination('sap_prd')
    repos = dest.getRepository

    commit = repos.getFunction('BAPI_TRANSACTION_COMMIT')
    commit.getImportParameterList().setValue('WAIT', 'X')

    function = repos.getFunction('BAPI_SALESORDER_CHANGE')
    function.getImportParameterList.setValue('SALESDOCUMENT', vbeln)
    header_inx = function.getImportParameterList().getStructure('ORDER_HEADER_INX')
    header_inx.setValue('UPDATEFLAG', 'U')
    #header_inx.setValue('ORD_REASON', 'X')

    item_in = function.getTableParameterList.getTable('ORDER_ITEM_IN')
    item_inx = function.getTableParameterList.getTable('ORDER_ITEM_INX')

    sql = "select posnr from d034l where vbeln=?"
    Imes::D034l.find_by_sql([sql, vbeln]).each do |row|
      item_in.appendRow
      item_in.setValue('ITM_NUMBER', row.posnr.to_i)
      item_in.setValue('REASON_REJ', reason_code)

      item_inx.appendRow
      item_inx.setValue('ITM_NUMBER', row.posnr.to_i)
      item_inx.setValue('UPDATEFLAG', 'X')
      item_inx.setValue('REASON_REJ', 'X')
    end

    com.sap.conn.jco.JCoContext.begin(dest)
    function.execute(dest)
    commit.execute(dest)
    com.sap.conn.jco.JCoContext.end(dest)

    rfc_messages = []
    returnMessage = function.getTableParameterList().getTable("RETURN")
    (1..returnMessage.getNumRows).each do |i|
      msg = "#{i} Type:#{returnMessage.getString('TYPE')}, MSG:#{returnMessage.getString('MESSAGE')}"
      puts msg
      rfc_messages.append({
                              type: returnMessage.getString('TYPE'),
                              id: returnMessage.getString('ID'),
                              number: returnMessage.getString('NUMBER'),
                              message: returnMessage.getString('MESSAGE')
                          })
      returnMessage.nextRow
    end
    return rfc_messages
  end

end