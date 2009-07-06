module PedidosHelper

  def data_por_extenso(data)
    dia = data.day.to_s
    mes = case data.month 
            when 1: 'JANEIRO'  
            when 2: 'FEVEREIRO'
            when 3: 'MARCO'
            when 4: 'ABRIL'
            when 5: 'MAIO'
            when 6: 'JUNHO'
            when 7: 'JULHO'
            when 8: 'AGOSTO'
            when 9: 'SETEMBRO'
            when 10: 'OUTUBRO'
            when 11: 'NOVEMBRO'
            when 12: 'DEZEMBRO'
          end
   ano = data.year.to_s
   data = dia + ' DE ' + mes + ' DE ' + ano
  end

end
