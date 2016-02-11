<?php
class Quantity {
	private $quantities = array();

	public function __construct($registry) {
		$this->db = $registry->get('db');
		$this->config = $registry->get('config');

		$quantity_class_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quantity_class qc LEFT JOIN " . DB_PREFIX . "quantity_class_description qcd ON (qc.quantity_class_id = qcd.quantity_class_id) WHERE qcd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($quantity_class_query->rows as $result) {
			$this->quantities[$result['quantity_class_id']] = array(
				'quantity_class_id' => $result['quantity_class_id'],
				'title'           => $result['title'],
				'unit'            => $result['unit'],
				'value'           => $result['value']
			);
		}
	}

	public function format($value, $quantity_class_id, $decimal_point = '.', $thousand_point = ',') {
		if (isset($this->quantities[$quantity_class_id])) {
			return number_format($value, 2, $decimal_point, $thousand_point) . $this->quantities[$quantity_class_id]['unit'];
		} else {
			return number_format($value, 2, $decimal_point, $thousand_point);
		}
	}

	public function getUnit($quantity_class_id) {
		if (isset($this->quantities[$quantity_class_id])) {
			return $this->quantities[$quantity_class_id]['unit'];
		} else {
			return '';
		}
	}
}