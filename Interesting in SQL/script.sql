
/*Нужно написать функцию, которая добавляет иконки в формате bytea из заданного каталога пользователем*/

create or replace function bytea_import(p_catalog text,p_nameFile int, p_result out bytea) /*Возврат файла в формате bytea*/
language plpgsql as $$
declare
  p_path text;
  l_oid oid;
  r record;
begin
  p_result := '';
  p_path = CONCAT(p_catalog , p_nameFile);
  select lo_import(p_path) into l_oid;
  for r in ( select data 
             from pg_largeobject 
             where loid = l_oid 
             order by pageno ) loop
    p_result = p_result || r.data;
  end loop;
  perform lo_unlink(l_oid);
end;$$;


create or replace function get_maxId(max_id out int) /*возврат свободногоо id*/
language plpgsql as $$
declare
  
  begin
  max_id = (SELECT MAX(id) from toparrefbyte)+1;
  end;$$;
  

/*Перебор файлов из каталога Первый параметр - путь к каталогу(напр. 'D:\\'), второй - расширение картинки(.png)*/
CREATE OR REPLACE FUNCTION nosecurity_ls(text, text) RETURNS setof text AS $$		
  opendir(my $d, $_[0]) or die $!;
  while (my $f=readdir($d)) {
  
  if ($f=~m/$_[1]/)
	{	
    return_next($f);
	
	}
  }
  return undef; 
$$ language plperlu;


		INSERT INTO public.toparrefbyte(id, value) VALUES (get_maxId(), bytea_import('D:\\',nosecurity_ls('D:\\')));

	
	select* from public.toparrefbyte;

						
	
	
