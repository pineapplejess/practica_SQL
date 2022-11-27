select v.id_vehiculo, m."nombre", ma."nombre", ge."nombre", v.fecha_compra ,v.matricula ,v.total_km ,a."nombre",a.id_poliza 
from flotakc.vehiculos v , flotakc.revisiones r , flotakc.modelo m , flotakc.marca ma, flotakc.grupo_empresarial ge , flotakc.aseguradora a 
