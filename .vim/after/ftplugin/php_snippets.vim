if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

"dateiname OHNE dateiendung
let base_name = expand('%:t:r')

exec "Snippet elseif elseif (".st."condition".et.") {<CR>".st.et."<CR>}".st.et
exec "Snippet do do<CR>{<CR>".st.et."<CR><CR>} while (".st.et.");<CR>".st.et
exec "Snippet reql require_once( '".st."file".et."' );<CR>".st.et
exec "Snippet if? $".st."retVal".et." = ( ".st."condition".et." ) ? ".st."a".et." : ".st."b".et." ;<CR>".st.et
exec "Snippet phpp <?php<CR>//$Id$<CR>".st.et."<CR><CR>?>"
exec "Snippet switch switch (".st."variable".et.") {<CR>case '".st."value".et."':<CR>".st.et."<CR>break;<CR><CR>".st.et."<CR><CR>default:<CR>".st.et."<CR>break;<CR>}<CR>".st.et
exec "Snippet class #doc<CR>#classname:".st."ClassName".et."<CR>#scope:".st."PUBLIC".et."<CR>#<CR>#/doc<CR><CR>class ".st."ClassName".et." ".st."extendsAnotherClass".et."<CR>{<CR>#internal variables<CR><CR>#Constructor<CR>function __construct ( ".st."argument".et.")<CR>{<CR>".st.et."<CR>}<CR>###<CR><CR>}<CR>###".st.et
exec "Snippet incll include_once( '".st."file".et."' );".st.et
exec "Snippet incl include( '".st."file".et."' );".st.et
exec "Snippet foreach foreach($".st."variable".et." as $".st."key".et." => $".st."value".et.") {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet ifelse if ( ".st."condition".et." )<CR>{<CR>".st.et."<CR>}<CR>else<CR>{<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet $_ $_REQUEST['".st."variable".et."']<CR>".st.et
exec "Snippet case case '".st."variable".et."':<CR>".st.et."<CR>break;<CR>".st.et
exec "Snippet print print \"".st."string".et."\"".st.et.";".st.et."<CR>".st.et
exec "Snippet function ".st."public".et."function ".st."FunctionName".et." (".st.et.")<CR>{<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet if if ( ".st."condition".et." )<CR>{<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet else else<CR>{<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet array $".st."arrayName".et." = array( '".st.et."',".st.et." );".st.et
exec "Snippet -globals $GLOBALS['".st."variable".et."']".st.et.st."something".et.st.et.";<CR>".st.et
exec "Snippet req require( '".st."file".et."' );<CR>".st.et
exec "Snippet for for ($".st."i".et." = ".st.et."; $".st."i".et." < ".st.et."; $".st."i".et."++) { <CR>".st.et."<CR>}<CR>".st.et
exec "Snippet while while (".st.et.") {<CR>".st.et."<CR>}<CR>".st.et

" Drupal stuff
exec "Snippet impl /**<CR>* Implementation of hook_".st."hook".et."()<CR>*/ <CR>function ". base_name ."_".st."hook".et."(".st."vars".et."){<CR>".st.et."<CR>}".st.et
exec "Snippet menuitem6 $items[\'".st."path".et."\'] = array(<CR>\'title\' => ". st."$title".et.")".st.et
exec "Snippet menuitem5 $items[] = array(\'path\' => \'". st.'url'. et. "\',<CR>\'title\' => ". st."$title".et.")".st.et

exec "Snippet query $result = db_query($sql". st.et .");<CR>while($item = db_fetch_object($result){<CR>". st.et. "<CR>}<CR>".st.et

"form elements
exec "Snippet #action '#action' => 'url(\'".st."admin/settings/". base_name .et. "),".st.et
exec "Snippet #after_build '#after_build' => array('".st.base_name."_after_build_callback".et."'),".st.et
exec "Snippet #attributes '#attributes' => array('".st."class".et." => ". st.et ."'),".st.et
exec "Snippet #button_type '#button_type' => ".st."submit".et.",".st.et
exec "Snippet #autocomplete_path '#autocomplete_path' => '".st."path".et."',".st.et
exec "Snippet #collapsed '#collapsed' => ".st."TRUE".et.",".st.et
exec "Snippet #collapsible '#collapsible' => ".st."TRUE".et.",".st.et
exec "Snippet #cols '#cols' => ".st."10" .et.",<CR>".st.et
exec "Snippet #default_value '#default_value' => ". st ."default_value". et.",<CR>". st.et
exec "Snippet #description '#description' => t('".st."elementdescription" .et."'),<CR>".st.et
exec "Snippet #delta '#delta' => ".st."10".et.",".st.et
exec "Snippet #field_prefix '#field_prefix' => ".st.et.",".st.et
exec "Snippet #field_suffix '#field_suffix' => ".st.et.",".st.et
exec "Snippet #maxlength 'maxlength' => ".st."255".et.",".st.et
exec "Snippet #method '#method' => '".st."GET".et."',".st.et
exec "Snippet #multiple => '#multiple' => ".st."TRUE".et.",".st.et
exec "Snippet #options '#options' => array(".st."options" .et."),<CR>".st.et
exec "Snippet #parents => '#parents' => array('".st.et."'),".st.et
exec "Snippet #prefix '#prefix' => '".st.et."',".st.et
exec "Snippet #redirect '#redirect' => '".st.et."',".st.et
exec "Snippet #required '#required' => ".st."TRUE".et.",".st.et
exec "Snippet #return_value '#return_value' => ".st.et.",".st.et
exec "Snippet #rows '#rows' => ".st."10" .et.",<CR>".st.et
exec "Snippet #size '#size' => ".st."40" .et.",<CR>".st.et
exec "Snippet #submit '#submit' => ".st.et.",".st.et
exec "Snippet #suffix '#suffix' => '".st.et."',".st.et
exec "Snippet #prefix '#prefix' => '".st.et."',".st.et
exec "Snippet #theme '#theme' => '".st.base_name.et."',".st.et
exec "Snippet #title '#title' => t('".st."title" .et."'),".st.et
exec "Snippet #tree '#tree' => ".st."TRUE".et.",".st.et
exec "Snippet #type '#type' => '". st."type".et ."',<CR>".st.et
exec "Snippet #validate '#validate#' => array('". st.base_name."_validate".et."'),".st.et
exec "Snippet #value '#value' => ". st ."value". et.",<CR>". st.et


"form api snippets
exec "Snippet textarea array(<CR>'#type' => 'textarea',<CR>'#title' => t('".st."Textarea".et."'),<CR>'#description' => t('".st."description".et."'),<CR>'#cols' => ".st."60".et.",<CR>'#rows' => ".st."5".et.",".st.et."<CR>);<CR>". st.et

exec "Snippet textfield array(<CR>'#type' => 'textfield',<CR>'#title' => t('".st."Textfield".et."'),<CR>'#description' => t('".st."description".et."'),<CR>'#size' => ".st."40".et.",<CR>'#maxlength' => ".st."255".et.",".st.et."<CR>);<CR>". st.et

exec "Snippet value array(<CR>'#type' => 'value',<CR>'#value' => '". st."value".et ."',".st.et."<CR>);<CR>". st.et

exec "Snippet submit array(<CR>'#type' => 'submit',<CR>'#value' => t('". st."submit".et ."'),".st.et."<CR>);<CR>". st.et

exec "Snippet weight array(<CR>'#type' => 'weight',<CR>'#title' => t('".st."title".et."'),<CR>'#description' => t('".st."description".et."'),<CR>'#size' => ".st."40".et.",<CR>'#maxlength' => ".st."255".et.",".st.et."<CR>);<CR>". st.et

exec "Snippet select array(<CR>'#type' => 'select',<CR>'#title' => t('".st."Select".et."'),<CR>'#description' => t('".st."description".et."'),<CR>'#options' => array(". st.et ."),<CR>'#default_value' => ". st."0".et .",".st.et."<CR>);<CR>". st.et

exec "Snippet radios array(<CR>'#type' => 'radios',<CR>'#title' => t('".st."radios".et."'),<CR>'#description' => t('".st."description".et."'),<CR>'#options' => array(". st.et ."),<CR>'#default_value' => ". st."0".et .",".st.et."<CR>);<CR>". st.et

exec "Snippet radio array(<CR>'#type' => 'radio',<CR>'#title' => t('".st."radio".et."'),<CR>'#description' => t('".st."description".et."'),<CR>'#return_value' => ". st."0".et .",".st.et."<CR>);<CR>". st.et

exec "Snippet password array(<CR>'#type' => 'password',<CR>'#title' => t('".st."password".et."'),<CR>'#description' => t('".st."description".et."'),<CR>'#size' => ".st."40".et.",<CR>'#maxlength' => ".st."255".et.",".st.et."<CR>);<CR>". st.et

exec "Snippet markup array(<CR>'#value' => '".st."value".et."',<CR>'#prefix' => ".st."<div>".et.",<CR>'#suffix' => ". st."</div>".et .",".st.et."<CR>);<CR>". st.et

exec "Snippet item array(<CR>'#type' => '".st."item".et."',<CR>'#title' => '".st."Item".et."',<CR>'#value' => ". st."value".et .",".st.et."<CR>);<CR>". st.et

exec "Snippet hidden array(<CR>'#type' => 'hidden',<CR>'#value' => ". st."value".et .",".st.et."<CR>);<CR>". st.et

exec "Snippet file array(<CR>'#type' => 'file',<CR>'#title' => t('".st."File".et."'),<CR>'#description' => t('". st."Description".et ."'),<CR>'#type' => "st."40".et.",".st.et."<CR>);<CR>". st.et

exec "Snippet fieldset array(<CR>'#type' => 'fieldset',<CR>'#title' => t('". st."Fieldset".et ."'),<CR>'#description' => t('". st."Description".et ."'),<CR>'#collapsible' => ". st."TRUE".et.",<CR>'#collapsed' => ". st."_RUE".et.",<CR>'#access' => user_access('administer ". st. base_name .et ."),". st.et. "<CR>);". st.et

exec "Snippet checkboxes array(<CR>'#type' => 'checkboxes',<CR>'#title' => t('".st."checkboxes".et."'),<CR>'#description' => t('".st."description".et."'),<CR>'#options' => array(". st.et ."),<CR>'#default_value' => ". st."0".et .",".st.et."<CR>);<CR>". st.et

exec "Snippet checkbox array(<CR>'#type' => 'checkbox',<CR>'#title' => t('".st."Enable".et."'),".st.et."<CR>);<CR>". st.et

exec "Snippet button array(<CR>'#type' => 'button',<CR>'#value' => t('". st."Button".et ."'),".st.et."<CR>);<CR>". st.et

exec "Snippet hook_view /**<CR>* Implementation of hook_view()<CR>*/<CR>function ". base_name ."_view(&$node, $teaser = FALSE, $page = FALSE){<CR>".st.et."<CR>}".st.et

exec "Snippet hook_perm /**<CR>* Implementation of hook_perm()<CR>*/<CR>function ". base_name ."_perm(){<CR>return array('administer ". base_name ."'". st.et.");<CR>}".st.et

exec "Snippet hook_nodeapi /**<CR>* Implementation of hook_nodeapi()<CR>*/ CR>function ". base_name ."_nodeapi($node, $op, $teaser = NULL, $page = NULL){<CR>case 'load':<CR>". st.et."<CR>break;<CR>case 'view':<CR>". st.et."<CR>break;<CR>case 'alter':<CR>". st.et."<CR>break;<CR>case 'insert':<CR>". st.et."<CR>break;<CR>case 'update':<CR>". st.et."<CR>break;<CR>case 'validate':<CR>". st.et."<CR>break;<CR>case 'submit':<CR>". st.et."<CR>break;<CR>case 'delete':<CR>". st.et."<CR>break;<CR>}".st.et

exec "Snippet hook_block /**<CR>* Implementation of hook_block()<CR>*/<CR>function ". base_name ."_block($op = 'list', $delta) {<CR>switch($op) {<CR>case 'list':<CR>". "$block[0] = array(<CR>". st.et ."<CR>);<CR>". st.et ."}"
