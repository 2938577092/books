package toolbean;

import java.util.ArrayList;
import valuebean.BookSingle;

public class ShopCar {
	private ArrayList buylist = new ArrayList();

	public ArrayList getBuylist() {
		return buylist;
	}

	/*
	 * @���� ���ﳵ�������Ʒ
	 * @���� singleΪGoodsSingle����󣬷�װ��Ҫ��ӵ���Ʒ��Ϣ
	 */
	public void addItem(BookSingle single) {
		if (single != null) {
			if (buylist.size() == 0) { // ���buylist�в������κ���Ʒ
				BookSingle temp = new BookSingle();
				temp.setBookId(single.getBookId());
				temp.setBookType(single.getBookType());
				temp.setBookName(single.getBookName());
				temp.setBookAuthor(single.getBookAuthor());
				temp.setBookPublish(single.getBookPublish());
				temp.setBookImg(single.getBookImg());
				temp.setBookPrice(single.getBookPrice());
				temp.setBookNum(single.getBookNum());
				buylist.add(temp); // �洢��Ʒ
			} else { // ���buylist�д�����Ʒ
				int i = 0;
				for (; i < buylist.size(); i++) { // ����buylist���϶����жϸü������Ƿ��Ѿ����ڵ�ǰҪ��ӵ���Ʒ
					BookSingle temp = (BookSingle) buylist.get(i); // ��ȡbuylist�����е�ǰԪ��
					if (temp.getBookId().equals(single.getBookId())) { // �жϴ�buylist�����л�ȡ�ĵ�ǰ��Ʒ�������Ƿ���Ҫ��ӵ���Ʒ��������ͬ
						temp.setBookNum(temp.getBookNum() + 1); // �����ͬ��˵���Ѿ������˸���Ʒ��ֻ��Ҫ����Ʒ�Ĺ���������1
						break; // ����forѭ��
					}
				}
				if (i >= buylist.size()) { // ˵��buylist�в�����Ҫ��ӵ���Ʒ
					BookSingle temp = new BookSingle();
					temp.setBookId(single.getBookId());
					temp.setBookType(single.getBookType());
					temp.setBookName(single.getBookName());
					temp.setBookAuthor(single.getBookAuthor());
					temp.setBookPublish(single.getBookPublish());
					temp.setBookImg(single.getBookImg());
					temp.setBookPrice(single.getBookPrice());
					temp.setBookNum(single.getBookNum());
					buylist.add(temp); // �洢��Ʒ
				}
			}
		}
	}

	/**
	 * @���� �ӹ��ﳵ���Ƴ�ָ�����Ƶ���Ʒ
	 * @���� name��ʾ��Ʒ����
	 */
	public void removeItem(String id) {
		for (int i = 0; i < buylist.size(); i++) { // ����buylist���ϣ�����ָ�����Ƶ���Ʒ
			BookSingle temp = (BookSingle) buylist.get(i); // ��ȡ�����е�ǰλ�õ���Ʒ
			// �����Ʒ������Ϊname����ָ��������
			if (temp.getBookId().equals(MyTools.toChinese(id))) {
				if (temp.getBookNum() > 1) { // �����Ʒ�Ĺ�����������1
					temp.setBookNum(temp.getBookNum() - 1); // �򽫹���������1
					break; // ����forѭ��
				} else if (temp.getBookNum() == 1) { // �����Ʒ�Ĺ�������Ϊ1
					buylist.remove(i); // ��buylist���϶������Ƴ�����Ʒ
				}
			}
		}
	}

	/**
	 * @���� ��չ��ﳵ
	 */
	public void clearCar() {
		buylist.clear(); // ���buylist���϶���
	}
}
