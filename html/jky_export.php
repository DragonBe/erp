<?
/**
 *   JKY Export
 *   This controller will be used to interface client to mysql using Ajax
 *   @author: Pat Jan

 *   http://jky/jky_export.php?table=X...x

 *   status = 'ok'
 *   status = 'error'

 *   message = 'table name [X...x] is undefined'
 *   message = 'method name [ X...x ] is undefined'
 *   message = 'error on server'             (only for no support)
 *   message = 'error on mysql: x...x'       (only for support)
 *   message = 'duplicate id'

 */
require_once 'jky_constant.php';

class jky_class {
     var  $table    ;
     var  $order_by ;
     var  $filter   ;
     var  $cols     ;
     var  $rows     ;

     var  $response ;
     var  $content  ;

     public function __construct() {
          define( 'HOST', $_SERVER[ 'SERVER_NAME' ] . $_SERVER[ 'PHP_SELF' ]);
     }

     public function close() {
          unlink( session_id() );
          session_destroy();
          header( 'Location: /' );
     }

     public function log_proxy( $message ) {
          $date = date( 'Y-m-d' );
          $time = date( 'H:i:s' );
          $logFile = fopen( '../proxy//' . $date . '.txt', 'a' ) or die( 'cannot open proxy file' );
          fwrite( $logFile, $time . ' ' . $message . "\n" );
          fclose( $logFile );
     }
/*
 *   query - proxy using curl to run AjaxController.php
 */
public function query( $domain, $postvars ) {
$this->log_proxy( '  domain: ' . $domain   );
$this->log_proxy( 'POSTVARS: ' . $postvars );

     $ch  = curl_init( $domain );

     curl_setopt( $ch, CURLOPT_POST          , 0 );
     curl_setopt( $ch, CURLOPT_VERBOSE       , 0 );
//   curl_setopt( $ch, CURLOPT_USERAGENT     , isset( $_SERVER[ 'User-Agent' ]) ? $_SERVER[ 'User-Agent' ] : '' );
     curl_setopt( $ch, CURLOPT_POSTFIELDS    , $postvars );
//   curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, 1 );
     curl_setopt( $ch, CURLOPT_BINARYTRANSFER, 1 );
     curl_setopt( $ch, CURLOPT_SSL_VERIFYPEER, 0 );
     curl_setopt( $ch, CURLOPT_SSL_VERIFYHOST, 0 );
     curl_setopt( $ch, CURLOPT_REFERER       , $domain );
     curl_setopt( $ch, CURLOPT_CONNECTTIMEOUT, 0 );
     curl_setopt( $ch, CURLOPT_AUTOREFERER   , 0 );
     curl_setopt( $ch, CURLOPT_COOKIEJAR     , 'ses_' . session_id() );
     curl_setopt( $ch, CURLOPT_COOKIEFILE    , 'ses_' . session_id() );
//   curl_setopt( $ch, CURLOPT_COOKIE        , $COOKIE );
     curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
     curl_setopt( $ch, CURLOPT_FAILONERROR   , 1 );

     $content  = curl_exec   ( $ch );
     $response = curl_getinfo( $ch );

     curl_close( $ch );
     return $content;
}

/*
 *   run - generate Excel file
 */
public function run( $table, $cols, $rows ) {
     function is_internal( $field ) {
          if(  $field == 'id'
          or   $field == 'created_by'
          or   $field == 'created_at'
          or   $field == 'updated_by'
          or   $field == 'updated_at'
          or   $field == 'counter'
          or   $field == 'parent_id'
          or   $field == 'company_id'
          or   $field == 'member_id'
          or   $field == 'owner_id'
          or   $field == 'contact_id'
          or   $field == 'support_id'
          or   $field == 'opened_by'
          or   $field == 'closed_by'
          or   $field == 'assigned_to' )
               return true ;
          else return false;
     }

     $count_cols = count( $cols );
     $dropped    = 0;
     $count_rows = count( $rows );

$this->log_proxy('count_cols: ' . $count_cols);
$this->log_proxy('count_rows: ' . $count_rows);

     $widths = '';
     foreach( $cols as $col ) {
          $field = $col[ 'Field' ];
          if(  is_internal( $field )) {
               $dropped++;
               continue;
          }

          switch( $field ) {
               case 'country'      : $width =  40; break;
               case 'description'  : $width = 200; break;
               case 'resolution'   : $width = 200; break;
               case 'sequence'     : $width =  60; break;
               case 'state'        : $width =  40; break;
               case 'status'       : $width =  40; break;
               case 'value'        : $width = 200; break;
               case 'zip'          : $width =  40; break;
               default : {
                    $types = explode( '(', $col[ 'Type' ]);
                    $type  = $types[ 0 ];
                    switch( $type ) {
                         case 'bigint'  : $width =  60; break;
                         case 'char'    : $width =  60; break;
                         case 'date'    : $width =  60; break;
                         case 'datetime': $width = 100; break;
                         case 'decimal' : $width =  60; break;
                         case 'int'     : $width =  40; break;
                         default        : $width = 100; break;
                    }
               }
          }
//          $width = $col['Width'];
          $widths .= "\n" . '  <Column ss:AutoFitWidth="0" ss:Width="' . $width . '"/>';
     }

     $tops = "\n" . '<Row ss:StyleID="s22">'
           . "\n" . '<Cell><Data ss:Type="String"> Table:  ' . $table . '</Data></Cell>'
           . "\n" . '</Row>'
           . "\n" . '<Row ss:StyleID="s22">'
           . "\n" . '<Cell><Data ss:Type="String">  Time:  ' . date( 'Y-m-d H:m:s' ) . '</Data></Cell>'
           . "\n" . '</Row>'
           . "\n" . '<Row>'
           . "\n" . '</Row>'
           ;
     $head1 = '';
     $head2 = '';
     foreach( $cols as $col ) {
          $field = $col[ 'Field' ];
          if(  is_internal( $field  )) {
               continue;
          } else {
               $names = explode( '_', $field );
               if(  count( $names ) == 1 ) {
                    $name1 = ' '        ; $name2 = $names[ 0 ];
               } else {
                    $name1 = $names[ 0 ]; $name2 = $names[ 1 ];
               }
               $head1 .= "\n" . '    <Cell ss:StyleID="s65"><Data ss:Type="String">' . $name1 . '</Data></Cell>';
               $head2 .= "\n" . '    <Cell ss:StyleID="s65"><Data ss:Type="String">' . $name2 . '</Data></Cell>';
          }
     }

     $body = '';
     foreach( $rows as $row ) {
          $body .= "\n" . '<Row>';
          for( $c=0; $c<$count_cols; $c++ ) {
               $col = $cols[ $c ];
               $field = $col[ 'Field' ];
               if(  is_internal( $field  )) {
                    continue;
               } else {
                    $types = explode( '(', $col[ 'Type' ]);
                    $type  = $types[ 0 ];
                    switch( $type ) {
                         case 'bigint'  : $ssStyle = ''          ; $ssType = 'Number'  ; break;
                         case 'date'    : $ssStyle = 'shortDate' ; $ssType = 'DateTime'; break;
                         case 'datetime': $ssStyle = 'dateTime'  ; $ssType = 'DateTime'; break;
                         case 'decimal' : $ssStyle = ''          ; $ssType = 'Number'  ; break;
                         case 'int'     : $ssStyle = ''          ; $ssType = 'Number'  ; break;
                         case 'char'    : $ssStyle = 'char'      ; $ssType = 'String'  ; break;
                         default        : $ssStyle = ''          ; $ssType = 'String'  ; break;
                    }
                    $value = $row[ $col[ 'Field' ]];
                    if(  $value  == '' )               $ssType   = 'String';
                    if(  $ssType == 'DateTime' )       $value    = str_replace( ' ', 'T', $value );

                    if(  $field == 'country'
                    or   $field == 'fax'
                    or   $field == 'mobile'
                    or   $field == 'parent_name'
                    or   $field == 'phone'
                    or   $field == 'state'
                    or   $field == 'zip' )
                         $ssStyle  = 'center';

                    if(  $ssStyle != '' )              $ssStyle  = ' ss:StyleID="' . $ssStyle . '"';

                    $value = htmlspecialchars( $value );
                    $body .= "\n" . '<Cell' . $ssStyle . '><Data ss:Type="' . $ssType . '">' . $value . '</Data></Cell>';
               }
          }
          $body .= "\n" . '</Row>';
     }
     $body .= "\n" . ' </Table>';

     $names = ''
            . "\n" . ' <Worksheet ss:Name="Names">'
            . "\n" . '  <Table ss:ExpandedColumnCount="' . ( $count_cols-$dropped ) . '" ss:ExpandedRowCount="' . ( $count_rows+6 ) . '" x:FullColumns="1" x:FullRows="1">'
            . $widths
            . $tops
            . "\n" . '   <Row ss:StyleID="s22">' . $head1 . "\n" . '   </Row>'
            . "\n" . '   <Row ss:StyleID="s22">' . $head2 . "\n" . '   </Row>'
            . "\n" . '   <Row>'
            . "\n" . '   </Row>'
            ;

     $fileName = 'excel/Header.txt';
     $inpFile  = fopen( $fileName, 'r' );
     $header   = fread( $inpFile, filesize( $fileName ));
     fclose( $inpFile );

     $fileName = 'excel/Footer.txt';
     $inpFile  = fopen( $fileName, 'r' );
     $footer   = fread( $inpFile, filesize( $fileName ));
     fclose( $inpFile );

     header( 'Pragma: ' );
     header( 'Cache-Control: ' );
     header( 'Content-Type: application/x-msexcel' );
//     header( 'Content-Disposition: attachment; filename="' . $table . '.xlm"' );          //   generate *.xlm.xls
//     header( 'Content-Disposition: inline; filename="' . $table . '.xlm"' );              //   generate *.xls
     header( 'Content-Disposition: inline; filename="' . $table . '.xls"' );              //   generate *.xls
     echo( $header );
     echo( $names  );
     echo( $body   );
     echo( $footer );
}

}

session_start();
$domain = SERVER_NAME . 'index.php/ajax?';
$table  = $_REQUEST[ 'table' ];
$program  = new jky_class();
/*
$args = '&table='        . $_REQUEST[ 'table'     ]
      . '&filter='       . $_REQUEST[ 'filter'    ]
      . '&select='       . $_REQUEST[ 'select'    ]
      . '&display='      . $_REQUEST[ 'display'   ]
      . '&order_by='     . $_REQUEST[ 'order_by'  ]
      . '&specific='     . $_REQUEST[ 'specific'  ]
      ;
 */
$args = ',"table":"'	. $_REQUEST[ 'table'     ] . '"'
      . ',"filter":"'	. $_REQUEST[ 'filter'    ] . '"'
//      . ',"select":"'	. $_REQUEST[ 'select'    ] . '"'
//      . ',"select":"'	. 'All' . '"'
//      . ',"display":"'	. $_REQUEST[ 'display'   ] . '"'
      . ',"display":"'	. '99999' . '"'
      . ',"order_by":"'	. $_REQUEST[ 'order_by'  ] . '"'
      . ',"specific":"'	. $_REQUEST[ 'specific'  ] . '"'
      ;

$select = $_REQUEST['select'];
$args .= ',"select":"' . ($select == '' ? 'All' : $select) . '"';


$program->log_proxy( 'args: ' . $args );

$arrays   = json_decode( $program->query( $domain, 'data={"method":"get_columns"' . $args . '}' ), true );
$cols     = $arrays[ 'columns' ];
//foreach( $cols as $col ) { echo '<br>'; var_dump( $col ); }

$arrays   = json_decode( $program->query( $domain, 'data={"method":"export"'      . $args . '}' ), true );
$rows     = $arrays[ 'rows' ];
//foreach( $rows as $row ) { echo '<br>'; var_dump( $row ); }

$program->run( $table, $cols, $rows );
?>