select distinct v.id_vehiculo, m.modelo , m2.marca , ge.grupo_empresarial , v.fecha_compra , v.matricula , c.color , v.total_kilometros , a.compania_aseguradora , v.n_poliza 
from flotakc2.modelo m , flotakc2.marca m2 , flotakc2.grupo_empresarial ge , flotakc2.color c , flotakc2.vehiculo v , flotakc2.aseguradora a 
where m.id_marca =m2.id_marca and ge.id_grupo_empresarial =m2.id_grupo_empresarial and c.id_color = v.id_color and a.id_compania_aseguradora =v.id_compania_aseguradora and v.id_modelo =m.id_modelo 