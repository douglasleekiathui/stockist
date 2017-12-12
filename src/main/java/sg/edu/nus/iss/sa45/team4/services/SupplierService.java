package sg.edu.nus.iss.sa45.team4.services;

import java.util.ArrayList;


import sg.edu.nus.iss.sa45.team4.model.Supplier;

public interface SupplierService {

	ArrayList<Supplier> findAllSuppliers();

	Supplier findSupplier(String ceid);

	Supplier createSupplier(Supplier supplier);

	Supplier changeSupplier(Supplier supplier);

	void removeSupplier(Supplier supplier);

}