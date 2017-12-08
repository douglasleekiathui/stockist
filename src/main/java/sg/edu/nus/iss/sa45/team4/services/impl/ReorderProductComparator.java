package sg.edu.nus.iss.sa45.team4.services.impl;

import java.util.Comparator;

import sg.edu.nus.iss.sa45.team4.model.Product;

/*
 * Purpose of this class is to contain logic to sort reorder parts by priority
 */
public class ReorderProductComparator implements Comparator<Product>{

	@Override
	public int compare(Product arg0, Product arg1) {
		return ((arg1.getMinQty()-arg1.getOnhandQty())/arg1.getReorderQty())
				-((arg0.getMinQty()-arg0.getOnhandQty())/arg0.getReorderQty());
	}

}
