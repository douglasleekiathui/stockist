package sg.edu.nus.iss.sa45.team4.reports;

import java.util.Comparator;

import sg.edu.nus.iss.sa45.team4.model.Product;

public class ReorderComparatorImpl implements Comparator<Product>{

	@Override
	public int compare(Product o1, Product o2) {
		int o1OrderQty= o1.getReorderQty()+o1.getMinQty()-o1.getOnhandQty();
		int o2OrderQty= o2.getReorderQty()+o2.getMinQty()-o2.getOnhandQty();
		return o2OrderQty-o1OrderQty;
	}



}
