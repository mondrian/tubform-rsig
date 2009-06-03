function mascara(o,f){
 v_obj=o
 v_fun=f
 setTimeout("execmascara()",1)
}

function execmascara(){
 v_obj.value=v_fun(v_obj.value)
}

function leech(v){
 v=v.replace(/o/gi,"0")
 v=v.replace(/i/gi,"1")
 v=v.replace(/z/gi,"2")
 v=v.replace(/e/gi,"3")
 v=v.replace(/a/gi,"4")
 v=v.replace(/s/gi,"5")
 v=v.replace(/t/gi,"7")
 return v
}

function soNumeros(v){
 return v.replace(/\D/g,"")
}

function telefone(v){
 v=v.replace(/\D/g,"") //Remove tudo o que não é dígito
 v=v.replace(/^(\d\d)(\d)/g,"($1) $2") //Coloca parênteses em volta dos dois primeiros dígitos
 v=v.replace(/(\d{4})(\d)/,"$1-$2") //Coloca hífen entre o quarto e o quinto dígitos
 return v
}

function data(v){
  v=v.replace(/\D/g,"") 
  v=v.replace(/(\d{2})(\d)/,"$1/$2") 
  v=v.replace(/(\d{2})(\d)/,"$1/$2") 
  return v
}

function valor(v){
  v=v.replace(/\D/g,"") //Remove tudo o que não é dígito
  v=v.replace(/^([0-9]{3}\.?){3}-[0-9]{2}$/,"$1,$2");
  //v=v.replace(/(\d{3})(\d)/g,"$1,$2")
  v=v.replace(/(\d)(\d{2})$/,"$1,$2") //Coloca ponto antes dos 2 últimos digitos
  return v
}



function cpf_cnpj(v) {
  if (v.length > 14) {
    return cnpj(v);
  } else {
    return cpf(v);   
  }
}

function cpf(v){
 v=v.replace(/\D/g,"") //Remove tudo o que não é dígito
 v=v.replace(/(\d{3})(\d)/,"$1.$2") //Coloca um ponto entre o terceiro e o quarto dígitos
 v=v.replace(/(\d{3})(\d)/,"$1.$2") //Coloca um ponto entre o terceiro e o quarto dígitos
 //de novo (para o segundo bloco de números)
 v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2") //Coloca um hífen entre o terceiro e o quarto dígitos
 return v
}


function cnpj(v){
 v=v.replace(/\D/g,"") //Remove tudo o que não é dígito
 v=v.replace(/(\d{2})(\d)/,"$1.$2") //Coloca um ponto entre o terceiro e o quarto dígitos
 v=v.replace(/(\d{3})(\d)/,"$1.$2") //Coloca um ponto entre o terceiro e o quarto dígitos
 v=v.replace(/(\d{3})(\d)/,"$1/$2") //Coloca um ponto entre o terceiro e o quarto dígitos
 //de novo (para o segundo bloco de números)
 v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2") //Coloca um hífen entre o terceiro e o quarto dígitos
 return v
}

function cep(v){
 v=v.replace(/D/g,"") //Remove tudo o que não é dígito
 v=v.replace(/^(\d{5})(\d)/,"$1-$2") //Esse é tão fácil que não merece explicações
 return v
}

function cnpj(v){
 v=v.replace(/\D/g,"") //Remove tudo o que não é dígito
 v=v.replace(/^(\d{2})(\d)/,"$1.$2") //Coloca ponto entre o segundo e o terceiro dígitos
 v=v.replace(/^(\d{2})\.(\d{3})(\d)/,"$1.$2.$3") //Coloca ponto entre o quinto e o sexto dígitos
 v=v.replace(/\.(\d{3})(\d)/,".$1/$2") //Coloca uma barra entre o oitavo e o nono dígitos
 v=v.replace(/(\d{4})(\d)/,"$1-$2") //Coloca um hífen depois do bloco de quatro dígitos
 return v
}

function romanos(v){
 v=v.toUpperCase() //Maiúsculas
 v=v.replace(/[^IVXLCDM]/g,"") //Remove tudo o que não for I, V, X, L, C, D ou M
 //Essa é complicada! Copiei daqui: http://www.diveintopython.org/refactoring/refactoring.html
 while(v.replace(/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/,"")!="")
 v=v.replace(/.$/,"")
 return v
}

function upcase(v) {
  return v.toUpperCase()
}

function site(v){
 //Esse sem comentarios para que você entenda sozinho ;-)
 v=v.replace(/^http:\/\/?/,"")
 dominio=v
 caminho=""
 if(v.indexOf("/")>-1)
 dominio=v.split("/")[0]
 caminho=v.replace(/[^\/]*/,"")
 dominio=dominio.replace(/[^\w\.\+-:@]/g,"")
 caminho=caminho.replace(/[^\w\d\+-@:\?&=%\(\)\.]/g,"")
 caminho=caminho.replace(/([\?&])=/,"$1")
 if(caminho!="")dominio=dominio.replace(/\.+$/,"")
 v="http://"+dominio+caminho
 return v
}