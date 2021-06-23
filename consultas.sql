/*				CONSULTAS			*/
--	Por cada cantón cuantas parejas se han reunido
SELECT 
  lugar_cita.nom_lugar,
  lugar_cita.ciudad_lugar,
  count(id_lugar)/2 as cantidad_de_cita
FROM public.cita
	INNER JOIN public.pareja_de_cita on pareja_de_cita.id_cita_cita = cita.id_cita
	INNER JOIN public.lugar_cita on lugar_cita.id_lugar = cita.id_lugar_lugar_cita
	INNER JOIN public.usuario on pareja_de_cita.id_usuario_usuario = usuario.id_usuario
WHERE estado_cita != 'false' 		--muestra solo las citas efectuadas 
group by (id_lugar)
order by id_lugar


--Por cada lugar con convenio cuantas citas han sido atendidas.
SELECT 
  lugar_cita.nom_lugar,
  lugar_cita.ciudad_lugar,
  count(id_lugar)/2 as cantidad_de_cita, 
  lugar_cita.convenio_lugar
FROM public.cita
	INNER JOIN public.pareja_de_cita on pareja_de_cita.id_cita_cita = cita.id_cita
	INNER JOIN public.lugar_cita on lugar_cita.id_lugar = cita.id_lugar_lugar_cita
	INNER JOIN public.usuario on pareja_de_cita.id_usuario_usuario = usuario.id_usuario
	--muestra solo las citas efectuadas y lugares con convenio
WHERE estado_cita != 'false' and convenio_lugar != 'false'	 
group by (id_lugar)
order by id_lugar


-- Cantidad de aprobación que han tenido las citas de los usuarios:(excelente, buena, mala)
SELECT 
  cita.calificacion_cita,
  count(cita.calificacion_cita)/2 as cantidad
FROM public.pareja_de_cita 
  INNER JOIN public.cita on cita.id_cita = pareja_de_cita.id_cita_cita
  INNER JOIN public.usuario on pareja_de_cita.id_usuario_usuario = usuario.id_usuario
	GROUP BY calificacion_cita
	ORDER BY calificacion_cita asc
 


-- Cantidad de citas que han sido canceladas por cantones.
SELECT 
  lugar_cita.ciudad_lugar,
  count(id_lugar)/2 as cantidad_de_cita_cancelada, 
  lugar_cita.convenio_lugar
FROM public.cita
	INNER JOIN public.pareja_de_cita on pareja_de_cita.id_cita_cita = cita.id_cita
	INNER JOIN public.lugar_cita on lugar_cita.id_lugar = cita.id_lugar_lugar_cita
	INNER JOIN public.usuario on pareja_de_cita.id_usuario_usuario = usuario.id_usuario
WHERE estado_cita = 'false'	 --muestra solo las citas canceladas 
group by (id_lugar)
order by id_lugar