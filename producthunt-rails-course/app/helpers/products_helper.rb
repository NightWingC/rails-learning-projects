module ProductsHelper
  def simple_description(description)
    description.truncate(100)
  end

  def date_format(date)
    meses = [ "enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre" ]
    mes = meses[date.strftime("%-m").to_i - 1]
    dia = date.strftime("%d")
    year = date.strftime("%Y")

    "#{ dia } del #{ mes } del #{ year }"
  end
end
